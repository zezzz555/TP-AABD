--Funcao a
create or replace function ck3_a_fase_vacinacao(vIUDtente number)
return date
is
    data_in date;
    ntomas number(5);
    exc1 exception;
    pragma exception_init(exc1, -20501);
    exc2 exception;
    pragma exception_init(exc2, -20505);
begin 

    select fases.data_Inicio into data_in
    from  pessoas, exercem, profissoes, abrangidas, criterios, fases
    where pessoas.cc = exercem.cc 
    and exercem.id_profissao = profissoes.id_profissao
    and profissoes.id_profissao = abrangidas.id_profissao 
    and abrangidas.id_criterios = criterios.id_criterios
    and criterios.id_fase = fases.id_fase
    and pessoas.cc= vIUDtente;
                    
    if (data_in = NULL) then
        raise exc1;
    end if;
    return data_in;

exception
    when exc1 then
           RAISE_APPLICATION_ERROR(-20501,'UTENTE INEXISTENTE!');
    when exc2 then
           RAISE_APPLICATION_ERROR(-20505,'UTENTE JA TOMOU A VACINA!');
end;
/
--teste
select pessoas.nome, ck3_a_fase_vacinacao(pessoas.cc) data
from pessoas;

--funcao d
create or replace function  ck3_d_vacinas_disponiveis(nomeLocal varchar, vIdVacina number)
return number
is
    vacinasDisponiveis number;
    localC varchar2(50);
    exc1 exception;
    pragma exception_init(exc1, -20502);
    exc2 exception;
    pragma exception_init(exc2, -20503);
begin
    select centros_vacinacao.morada into localC
    from centros_vacinacao
    where centros_vacinacao.morada = nomeLocal;       
    if localC is null then
        raise exc1;
    end if;
    begin
        select count(frascos.id_frasco) into vacinasDisponiveis
        from frascos, centros_vacinacao, transportes, lotes_das_vacinas, vacinas
        where frascos.id_transporte= transportes.id_transporte
        and   transportes.id_centro = centros_vacinacao.id_centro
        and   frascos.id_lote = lotes_das_vacinas.id_lote
        and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
        and vacinas.id_vacina = vIdVacina
        and lower(frascos.estado) != 'estragado'
        and centros_vacinacao.morada = localC;
        
        if vacinasDisponiveis is null then
            raise exc2;
        end if;
    exception
        when exc2 then
           RAISE_APPLICATION_ERROR(-20503,'Vacina inexistente'); 
    end;
    return vacinasDisponiveis; 
exception
    when exc1 then
           RAISE_APPLICATION_ERROR(-20502,'Local de vacinação inexistente');
end;
/

--teste
select vacinas.id_vacina, centros_vacinacao.morada as nome_local, vacinas.nome as vacina, ck3_d_vacinas_disponiveis(centros_vacinacao.morada, vacinas.id_vacina) as vacinas_disponiveis
from centros_vacinacao, vacinas
order by 1,2;


  
--procediemnto f
create or replace PROCEDURE chk3_f_transporta_frascos( vidlocalArmazena number, vidlocalVacina number ,vidvacina NUMBER, quantidade NUMBER, DATAtransporte DATE)
is
    cursor c1 is
            select frascos.id_frasco as idFrasco
            from frascos, vacinas, lotes_das_vacinas
            where vacinas.id_vacina = vidvacina
            and vacinas.id_vacina = lotes_das_vacinas.id_vacina
            and lotes_das_vacinas.id_lote = frascos.id_lote
            and lower(frascos.estado) = 'fechado'
            and to_char(DATAtransporte) between to_char(frascos.data_producao) and to_char(frascos.validade);
    idArmazem number;
    idVacina number;
    localVacina number;
    localTransportar varchar2(50);
    transporteID number;
    idFrasco number;
    aux number;
begin
    
    -- ver se local de armazenamento existe 
    begin
        select armazens.id_armazem into idArmazem
        from armazens
        where armazens.id_armazem = vidlocalArmazena;
    exception
        when no_data_found then
            raise_application_error(-20508, 'Local de Armazenamento inexistente');
    end;
    -- ver se a vacina existe
    begin
        select vacinas.id_vacina into idVacina
        from vacinas
        where vacinas.id_vacina = vidvacina;
    exception
        when no_data_found then
            raise_application_error(-20503, 'Vacina inexistente');
    end;
    -- ver se a localizacao do centro de vacinacao existe
    begin
        select centros_vacinacao.id_centro into localVacina
        from centros_vacinacao
        where centros_vacinacao.id_centro = vidlocalVacina;
    exception
        when no_data_found then
            raise_application_error(-20502, 'Local de vacinacao inexistente');
    end;
    
    select seq_transportesid.NEXTVAL into transporteID from dual;
    aux := quantidade;
    
    while aux>0
    loop
        for r in c1
        loop            
            if transporteID is not null then
                insert into transportes values(transporteID, localVacina, idArmazem, DataTransporte);
            end if;
            
            if r.idFrasco is not null then
                update frascos
                set id_transporte = transporteID
                where frascos.id_frasco = r.idFrasco;
            end if;
            aux := aux -1;
        end loop;
    end loop;
end;
/
--executar
execute chk3_f_transporta_frascos(2,5,2,1,'21.06.10');

rollback;


--trigger k que assim que uma toma de uma vacina é administrada,
-- atualiza a informação relativamente à dose utilizada e ao número de doses disponíveis nesse local
create or replace TRIGGER chk3_k_tg_apos_toma
after insert on tomas_da_vacina
for each row
declare
begin
    update frascos
    set frascos.doses_disponiveis = doses_disponiveis - 1
    where  id_frasco = :new.id_frasco;
end;
/

--
create or replace view view_0_pessoas_informacao as
    select pessoas.cc as idPessoa,
            pessoas.concelho as concelhoPessoa,
            pessoas.cidade as cidadePessoa,
            pessoas.regiao as regiaoPessoa
    from pessoas;
/


--
create or replace trigger chk3_trig_2018018386 
before update of concelho on pessoas
for each row
declare
begin
    
    update pessoas p
    set id_centroSaude = (  select CHK3_FUNC_A2018018386(v.idPessoa) 
                            from view_0_pessoas_informacao v
                            where v.concelhopessoa = p.concelho);
    
    
end;
/
 
-- procedimento que recebendo o id de um utente aceita uma convocatória caso exista um slot disponivel no centro de vacinacao no concelho do utente
create or replace procedure chk3_proc_2018018386(idUtente number)
is
    moradaUtente varchar2(1024);
    idSlotUtente number;
    utenteNaoImune number;
    idConvocatoria number;
    exc1 exception;
    pragma exception_init(exc1, -20520);
begin

    begin
        select pessoas.concelho into moradaUtente
        from pessoas
        where pessoas.cc = idUtente;

    exception
        when no_data_found then
            raise_application_error(-20501, 'Utente inexistente');
    end;
    
    begin
        select v.ccp into utenteNaoImune
        from VIEW_0_PESSOAS_NAO_IMUNES v
        where idUtente = v.ccp;
    exception
        when no_data_found then
            raise_application_error(-20506, 'Utente totalmente imunizado.');
    end;

    select convocatorias.id_convocatoria into idConvocatoria
    from convocatorias
    where convocatorias.cc = idUtente;

    begin
        select slots.id_slot into idSlotUtente
        from slots, turnos_de_vacinacao, centros_vacinacao, convocatorias
        where convocatorias.id_slot = slots.id_slot
        and slots.id_turno = turnos_de_vacinacao.id_turno
        and turnos_de_vacinacao.id_centro = centros_vacinacao.id_centro
        and lower(centros_vacinacao.concelho) = lower(moradaUtente);
    exception
    when no_data_found then
        raise_application_error(-20520, 'Nao existe nehum slot disponivel no local de vacinacao perto do utente na data escolhida');
    end;
   
    update convocatorias
    set id_slot = idSlotUtente, justificacao = 'aceite', resposta =  's'
    where convocatorias.id_convocatoria = idConvocatoria;
 
end;
/

SAVEPOINT sp_sptest;
execute chk3_proc_2018018386(15799169);
ROLLBACK to sp_sptest;

--funcao que de acordo com a cidade do utente retorna o id do centro de saude da mesma cidade, 
-- caso nao exista nenhum, retorna de um centro da mesma regiao
create or replace FUNCTION CHK3_FUNC_A2018018386(idUtente number)
return number
is
    concelhoUtente varchar2(1024);
    cidadeUtente varchar2(1024);
    regiaoUtente varchar2(1024);
    idCentro number;
    idPessoa number;
begin
    begin 
        select v.cidadePessoa into cidadeUtente
        from view_0_pessoas_informacao v
        where v.idPessoa = idUtente;
    exception
        when no_data_found then
            raise_application_error(-20501, 'Utente inexistente');
    end;
    
    select v.concelhoPessoa into concelhoUtente
    from view_0_pessoas_informacao v 
    where v.idPessoa = idUtente;
    
    select v.regiaoPessoa into regiaoUtente
    from view_0_pessoas_informacao v 
    where v.idPessoa = idUtente;
    
    select MIN(centro_saude.id_centrosaude) into idCentro
    from centro_saude
    where lower(centro_saude.concelho) = lower(concelhoUtente);
    
    if idCentro is null then
        select MIN(centro_saude.id_centrosaude) into idCentro
        from centro_saude
        where lower(centro_saude.cidade) = lower(cidadeUtente);
    end if;
    
    if idCentro is null then
        select MIN(centro_saude.id_centrosaude) into idCentro
        from centro_saude
        where lower(centro_saude.regiao) = lower(regiaoUtente);
    end if;
    
    return idCentro;
exception
    when no_data_found then
        RAISE_APPLICATION_ERROR(-20520, 'Nao existe centro de saude na regiao do utente');   
end;
/
 
select pessoas.cc, CHK3_FUNC_A2018018386(pessoas.cc) as CentroSuposto, pessoas.id_centrosaude as CentroAtual
from pessoas;

---triger antigo
/*create or replace trigger chk3_trig_2018018386 
after insert on pessoas
for each row
declare 
    idadeUtente number;
    criterioProfUtente number;
    criterioDoenUtente number;
    criterioLocalTrabaUtente number;
begin
    select to_number(to_char(sysdate,'yyyy') - to_char(pessoas.data_nascimento,'yyyy')) into idadeUtente
    from pessoas
    where pessoas.cc = :new.cc;

    select abrangidas.id_criterios into criterioProfUtente
    from pessoas, exercem, profissoes, abrangidas, criterios
    where pessoas.cc = :new.cc
    and pessoas.cc=exercem.cc
    and exercem.id_profissao = profissoes.id_profissao
    and profissoes.id_profissao = abrangidas.id_profissao
    and abrangidas.id_criterios = criterios.id_criterios;

    select doencas.id_criterios into criterioDoenUtente
    from pessoas, podem_ter, doencas, criterios
    where pessoas.cc = :new.cc
    and pessoas.cc = podem_ter.cc
    and podem_ter.id_doencas = doencas.id_doencas
    and doencas.id_criterios = criterios.id_criterios;

    select incluem.id_criterios into criterioLocalTrabaUtente
    from pessoas, trabalham, locais_de_trabalho, incluem, criterios
    where pessoas.cc = :new.cc
    and pessoas.cc = trabalham.cc
    and trabalham.id_localprof = locais_de_trabalho.id_localprof
    and locais_de_trabalho.id_localprof = incluem.id_localprof
    and incluem.id_criterios = criterios.id_criterios;

    if ((criterioProfUtente = 1) or (criterioDoenUtente = 1) or (criterioLocalTrabaUtente = 1) and (idadeUtente BETWEEN 21 and 95)) then
        insert into convocatorias(id_convocatoria,id_fase, cc, dataconvocatoria) 
        values (sequence_convocatoriaID.nextVal, 1 , :new.cc , sysdate);
    elsif ((criterioProfUtente = 2) or (criterioDoenUtente = 2) or (criterioLocalTrabaUtente = 2) and (idadeUtente between 50 and 74)) then
       insert into convocatorias(id_convocatoria,id_fase, cc, dataconvocatoria) 
        values (sequence_convocatoriaID.nextVal, 2 , :new.cc , sysdate);
    elsif ((criterioProfUtente = 2) or (criterioDoenUtente = 2) or (criterioLocalTrabaUtente = 3) and (idadeUtente between 18 and 49)) then
        insert into convocatorias(id_convocatoria,id_fase, cc, dataconvocatoria) 
        values (sequence_convocatoriaID.nextVal, 3 , :new.cc , sysdate);
    end if;

end;

---
*/
