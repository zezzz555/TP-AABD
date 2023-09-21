create or replace view view_0_nao_convocados as
select cc, nome, data_nascimento, concelho from pessoas
where cc not in (select cc from convocatorias);
/

--funcao B funciona
create or replace function ck3_b_ordem_vacinacao (vIDUtente number)
return number
is
    cursor c1 is 
        select view_0_nao_convocados.cc as CC,view_0_nao_convocados.nome as Nome,view_0_nao_convocados.data_nascimento, fases.id_fase 
        from view_0_nao_convocados, trabalham, locais_de_trabalho,incluem,criterios,fases
        where view_0_nao_convocados.cc=trabalham.cc
        and trabalham.id_localprof=locais_de_trabalho.id_localprof
        and locais_de_trabalho.id_localprof=incluem.id_localprof
        and incluem.id_criterios=criterios.id_criterios
        and criterios.id_fase=fases.id_fase
        order by fases.id_fase asc,view_0_nao_convocados.data_nascimento asc;
    conta number:=0;
    n number;
begin
    select count(pessoas.cc) into n
    from pessoas
    where pessoas.cc=vIdUtente;
    if n=0 then
        raise_application_error(-20501,'Utente inexistente');
    end if;

    for r in c1
    loop
        if r.cc=vIDUtente then
            conta:=conta+1;
            return conta;
        else
            conta:=conta+1;
        end if;
    end loop;
    if c1%rowcount=0 then
        raise_application_error(-20522,'Nao existem Utentes sem convocatorias');
    end if;
end;
/

--funcao E funciona
create or replace function ck3_e_data_ultima_convocatoria (vIDUtente number)
return date
is
    dataD date;
    nP number;
    nC number;
begin
    select count(pessoas.cc) into nP from pessoas where pessoas.cc=vIdUtente;
    if nP=0 then
        raise_application_error(-20501,'Utente inexistente');
    end if;
    select count(convocatorias.id_convocatoria) into nC from convocatorias where convocatorias.cc=vIDUtente;
    if nC=0 then
        raise_application_error(-20523,'Utente nao possui convocatorias');
    end if;
    select recente.Max into dataD
    from (select pessoas.cc as CC,max(convocatorias.dataconvocatoria) as Max 
                    from convocatorias,pessoas
                    where pessoas.cc=convocatorias.cc
                    group by pessoas.cc)recente
    where recente.CC=vIDUtente;
    return dataD;
end;
/


--procedimento F funciona

create or replace procedure ck3_f_convoca_utentes(vidfase number, vidturnovacinacao number)
is
    nF number;
    nT number;
    concelhoC pessoas.concelho%type;
    
    cursor c1 is --nao convocados desta fase
        select view_0_nao_convocados.cc,view_0_nao_convocados.nome,view_0_nao_convocados.concelho
        from view_0_nao_convocados,trabalham,locais_de_trabalho,incluem,criterios,fases
        where view_0_nao_convocados.cc=trabalham.cc
        and trabalham.id_localprof=locais_de_trabalho.id_localprof
        and locais_de_trabalho.id_localprof=incluem.id_localprof
        and incluem.id_criterios=criterios.id_criterios
        and criterios.id_fase=fases.id_fase
        and fases.id_fase=vidfase;
        
    cursor c2 is
        select id_slot
        from slots
        where slots.id_turno=vidturnovacinacao and id_slot not in (select id_slot from convocatorias); --slots livres
begin
    select count(fases.id_fase) into nF from fases where fases.id_fase=vidfase;
    if nF=0 then
        raise_application_error(-20509,'Fase inexistente');
    end if;
    select count(turnos_de_vacinacao.id_turno) into nT from turnos_de_vacinacao where turnos_de_vacinacao.id_turno=vidturnovacinacao;
    if nT=0 then
        raise_application_error(-20510,'Turno de vacinacao inexistente');
    end if;
    select centros_vacinacao.concelho into concelhoC 
    from centros_vacinacao,turnos_de_vacinacao
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and turnos_de_vacinacao.id_turno=vidturnovacinacao; --concelho do turno
    
    for i in c2
    loop
        for r in c1
        loop
            if r.concelho=concelhoC then
            insert into convocatorias values(SEQUENCE_CONVOCATORIAID.nextval,vidfase,i.id_slot,r.cc,null,sysdate,null);--registar convocatória
            exit;
            end if;
        end loop;
    end loop;
end;
/

--trigger L nao funciona (mutacao)
create or replace trigger ck3_l_tg_convoca_proximo
before insert or update on convocatorias
for each row
declare
    nSlot number;
    pessoaid number;
    faseid number;
begin
    if (:new.resposta='n') then
        nSlot:=:new.id_slot;
        update convocatorias set id_slot=null where id_convocatoria=:new.id_convocatoria;
        select cc into pessoaid from view_0_nao_convocados where rownum = 1;
        select fases.id_fase into faseid 
            from trabalham,locais_de_trabalho,incluem,criterios,fases
            where pessoaid=trabalham.cc
            and trabalham.id_localprof=locais_de_trabalho.id_localprof
            and locais_de_trabalho.id_localprof=incluem.id_localprof
            and incluem.id_criterios=criterios.id_criterios
            and criterios.id_fase=fases.id_fase;
        insert into convocatorias values(SEQUENCE_CONVOCATORIAID.nextval,faseid,nSlot,pessoaID,null,sysdate,null);
    end if;
end;
/


--funcao Andre funciona
create or replace function chk3_func_a2018018279(centroID number,faseID number)
--recebe o id de um determinado centro de vacinacao e devolve o numero de utentes vacinados nesse centro que obteram imunidade numa determinada fase
return number
is
    nimunes number;
    nF number;
    nC number;
begin
    select count(fases.id_fase) into nF from fases where fases.id_fase=faseID;
    if nF=0 then
        raise_application_error(-20509,'Fase inexistente');
    end if;
    select count(centros_vacinacao.id_centro) into nC from centros_vacinacao where centros_vacinacao.id_centro=centroID;
    if nC=0 then
        raise_application_error(-20502,'Local de vacinacao inexistente');
    end if;
    select count(distinct view_0_pessoas_imunes.cc_pessoa) into nimunes
    from view_0_pessoas_imunes,convocatorias,slots,turnos_de_vacinacao,centros_vacinacao,fases
    where view_0_pessoas_imunes.cc_pessoa=convocatorias.cc
    and convocatorias.id_fase=fases.id_fase
    and fases.id_fase=faseID
    and convocatorias.id_slot=slots.id_slot
    and slots.id_turno=turnos_de_vacinacao.id_turno
    and turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro
    and centros_vacinacao.id_centro=centroID;
    return nimunes;
end;
/


--procedimento Andre funciona
create or replace procedure chk3_proc_a2018018279(turnoID number)
--recebe o id de um turno e consoante a sua duracao e tempo medio para administrar uma vacina cria n slots para esse turno
--tendo em conta eventuais slots ja existentes
is
    dataI date;
    dataF date;
    tempoM number;
    nslotsTotal number;
    slotsExist number;
    nslots number;
    ultSlot date;
    i number:=0;
    nT number;
begin
    select count(turnos_de_vacinacao.id_turno) into nT from turnos_de_vacinacao where turnos_de_vacinacao.id_turno=turnoID;
    if nT=0 then
        raise_application_error(-20510,'Turno de vacinacao inexistente');
    end if;
    select data_inicio,data_fim,tempo_medio into dataI,dataF,tempoM
    from turnos_de_vacinacao
    where turnos_de_vacinacao.id_turno=turnoID;

    nslotsTotal:=floor(((dataF-dataI)*1440)/tempoM);
    
    select count(id_slot) into slotsExist 
    from slots
    where slots.id_turno=turnoID;
    
    nslots:=nslotsTotal-slotsExist;
    select max(hora_escolhida) into ultSlot from slots where slots.id_turno=turnoID;
    while (i<nslots)
    loop
        insert into slots values (SEQ_SLOTSID.nextval,turnoID,ultSlot+((i+1)*tempoM/1440));
        i:=i+1;
    end loop;
end;
/


--trigger Andre nao funciona(mutacao)
create or replace trigger chk3_trig_a2018018279
--so permite guardar um lote num armazem caso este ainda tenha capacidade disponivel para o armazenar
before insert or update on lotes_das_vacinas
for each row
declare
    PRAGMA AUTONOMOUS_TRANSACTION;
    nFrascos number;
    capArmazem number;
    lotArmazem number;
begin
    select count(frascos.id_frasco) into nFrascos 
    from frascos, lotes_das_vacinas
    where frascos.id_lote=:new.id_lote;
    
    select armazens.capacidade_maxima into capArmazem
    from armazens,lotes_das_vacinas
    where armazens.id_armazem=:new.id_armazem;
    
    select sum(lotes_das_vacinas.quantidade) into lotArmazem
    from lotes_das_vacinas,armazens
    where armazens.id_armazem=lotes_das_vacinas.id_armazem
    and armazens.id_armazem=:new.id_armazem;

    if nFrascos>(capArmazem-lotArmazem) then
        raise_application_error(-20524,'Armazem nao tem capacidade suficiente para guardar o lote');
    end if;
end;
/

