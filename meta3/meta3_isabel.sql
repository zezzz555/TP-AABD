--------------------------------------------------------
--TRIGGERS
--------------------------------------------------------

create or replace trigger chk3_q_trig_a2018013160
--cria um trigger que só permita fazer uma convocatoria se a pessoa nao esta imune
 before insert  on convocatorias
 for each row
declare
    PRAGMA AUTONOMOUS_TRANSACTION;

    n number;
begin
    select count(cc_pessoa)
    into n
    from view_0_pessoas_imunes
    where cc_pessoa = :new.cc;

    if ( n = 1 ) then
        raise_application_error(-20506, 'Utente totalmente imunizado');
    end if;

end;
create or replace trigger chk3_m_tg_suspende_vacinacao
before insert on causam
for each row
declare
    frasco_id number;
    lote number;
begin
    select loteid, frascoid into lote,frasco_id
    from view_0_reacoes_vacina_dif
    where idreacao=:new.id_reacoes;     
    
    update frascos set estado='suspenso'
    where frascos.id_frasco=frasco_id and frascos.id_lote=lote;
 
end;
create or replace trigger chk3_diminui_doses_frasco
before insert on doses
for each row
declare
ndose number;
begin
    update frascos
    set frascos.doses_disponiveis=frascos.doses_disponiveis-1
    where frascos.id_frasco=:new.id_frasco;
    
end;

--------------------------------------------------------
--FUNCOES
--------------------------------------------------------
create or replace function chk3_func_a2018013160(idT number) 
--retorna o numero de pessoas poderiam ter sido vacinadas se houvesse mais doses consoante o tempo medio e a duracao do turno
return number is 

n number;
tMedio number;
nPessoas number;
minutos number;
t number;
dosedisp number;
begin
    select count(doses.id_dose),tempmedio,(dataf-datai)*24*60 into dosedisp,tMedio,minutos
    from doses,view_0_turnos_vacinacao
    where doses.id_frasco=idf and idturno=idT 
    group by tempmedio, datai, dataf;
    
    nPessoas:=round(minutos/tmedio,0);
    n:=nPessoas-dosedisp;
    return n;
    
    
end;
create or replace function ck3_vacina_existe ( vidvacina number) 
return number is
nVacina number;
begin
    select count(vacinas.id_vacina) into nVacina
    from vacinas
    where vacinas.id_vacina = vidvacina;

    return nVacina;
end ck3_vacina_existe;
create or replace function ck3_utente_existe ( vIdUtente number) 
return number is
n number;
begin
    select count(pessoas.n_utente) into n
    from pessoas
    where pessoas.n_utente=vIdUtente;

    return n;
end;
create or replace function ck3_pessoa_imunizada(idUtente number)
return number is
imune number;
begin 
    select count(tomas_da_vacina.id_toma) into imune
    from tomas_da_vacina,vacinas,doses,frascos,lotes_das_vacinas,convocatorias,pessoas
    where tomas_da_vacina.dose=doses.id_dose and
          doses.id_frasco = frascos.id_frasco and
          frascos.id_lote = lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina = vacinas.id_vacina and
          tomas_da_vacina.dose=vacinas.num_doses and 
          convocatorias.cc=pessoas.cc and
          pessoas.n_utente=idUtente and
          tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria;

    return imune;
end;
create or replace function ck3_i_data_proxima_dose(vIdUtente number)
return date is
    diaUtil date;
    nUtente number;
    nTomas number;
begin
    nUtente:=ck3_utente_existe(vIdUtente);
    if nUtente=0 then
        raise_application_error(-20501, 'Utente inexistente');
    end if;

    nTomas:= ck3_pessoa_imunizada(vIdUtente);
    if nTomas>0 then
        raise_application_error(-20505, 'Utente já tomou a vacina');
    end if;

    select distinct dataT + vacinas.intervalodose into diaUtil
    from vacinas,view_0_pessoas_nao_imunes
    where vIdUtente=utentep and vacinas.nome=view_0_pessoas_nao_imunes.vacp;
          
    return diaUtil;
end;
create or replace function ck3_c_vacinas_dadas (nomeLocal varchar, vIdVacina number) 
return number is 
    vacinasDadas number;
    localV number;  
    vacinaID number;
begin
    select count(centros_vacinacao.morada) into localV
    from centros_vacinacao
    where nomeLocal=centros_vacinacao.morada;
    
    if localV=0 then raise_application_error(-20502,'Local de vacinação inexistente');
    end if;
    
    vacinaID := ck3_vacina_existe(vIdVacina);
    if vacinaID =0 then raise_application_error(-20503, 'Vacina inexistente');
    end if;
    
    select tomasv into vacinasDadas
    from view_0_centro_vacinacao
    where nomeLocal=moradac and vidvacina=idv;
    return vacinasDadas;       
end;

--------------------------------------------------------
--PROCEDIMENTOS
--------------------------------------------------------
create or replace procedure CHK3_PROC_A2018013160(nLote number)is
cursor c1 is
        select lotef , idcentro as centroID,
        concelhoC as localz, armazemid as idA,
        vacid as idV
        from  view_0_c_frascos_c_vacinacao
        where lotef=nLote;

frascoID number; transporteID number;
loteID number; quant number; n number;
begin

begin
    select count(id_lote),quantidade into n,quant --da a quantidade de frascos no lote
    from lotes_das_vacinas
    where lotes_das_vacinas.id_lote=nLote 
    group by quantidade;
    exception
        when no_data_found then raise_application_error(-20540,'Lote inexistente');
end;

    select seq_frascosid.nextval into frascoID from dual;
    select seq_transportesid.nextval into transporteID from dual;
    select seq_lotesid.nextval into loteID from dual;

for i in c1
    loop
        if(quant<15) then
            insert into lotes_das_vacinas values (loteID,i.idV,i.idA,30,sysdate);    
            insert into frascos values (frascoID,transporteID,loteID,i.localz,null,'fechado',add_months(sysdate,-3),add_months(sysdate,4),2);
            insert into transportes values (transporteID,i.centroID,i.idA,sysdate-2);
        end if;
    end loop;
end;
create or replace procedure chk3_h_abre_frasco(vidfrasco number)is
cursor c1 is
        select turnos_de_vacinacao.data_inicio as dataD,dosesdisponiveis as dosesd
        from turnos_de_vacinacao,view_0_c_frascos_c_vacinacao
        where turnos_de_vacinacao.id_centro=idcentro and
              turnos_de_vacinacao.data_fim > sysdate and 
              estadof='fechado' and
              frascoid=vidfrasco;

turnoID number; centroID number; frascoID number;
frascoAbertura number; doseID number;
begin

begin
    select count(*) into centroid from view_0_c_frascos_c_vacinacao where frascoid=vidfrasco;
    exception
        when no_data_found then raise_application_error(-20512,'Frasco não está no local de armazenamento');
end;

    select count(id_frasco) into frascoID from frascos where frascos.id_frasco=vidfrasco;
    if frascoID=0 then
        raise_application_error(-20511,'Frasco inexistente');
    end if;

    select count(frascos.id_frasco) into frascoAbertura from frascos where frascos.id_frasco=vidfrasco and frascos.estado='fechado';
    if frascoAbertura=0 then
        raise_application_error(-20513,'Frasco já foi aberto');
    end if;
    
    select count(idturno) into turnoid from view_0_turnos_vacinacao where dataf > sysdate and idf=vidfrasco;
    if turnoID=0 then
        raise_application_error(-20514,'Não existe um turno de vacinação ativo');
    end if;
 
    select seq_frascosid.nextval into doseID from dual;

for i in c1
    loop
        if(i.dosesd>0) then
        insert into doses(id_dose,id_frasco,estado,data_da_dose) values (doseID,vidfrasco,'Bom',i.dataD);
        end if;
    end loop;
end;