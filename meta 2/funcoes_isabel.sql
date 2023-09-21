create or replace function ck2_pessoas_imunizadas_regiao(nomeLocal varchar)
return number
is 
    pessoasImunizadas number(5);
begin
    select count(distinct tomas_da_vacina.id_toma) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where pessoas.cc=convocatorias.cc and
          centros_vacinacao.regiao=nomeLocal and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          convocatorias.id_toma=tomas_da_vacina.id_toma and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose 

 group by centros_vacinacao.regiao,tomas_da_vacina.dose ;
    return (pessoasImunizadas);

end;
/
select ck2_pessoas_imunizadas_fase(1) from dual;
select ck2_pessoas_imunizadas_regiao('Sul') from dual;

/
create or replace function ck2_pessoas_vacinadas_regiao (nomelocal varchar)
return number
is
    pessoasvacinadas number(5);

begin
   select  distinct count( tomas_da_vacina.id_toma) into pessoasvacinadas
    from centros_vacinacao ,tomas_da_vacina,slots,turnos_de_vacinacao,convocatorias
    where convocatorias.id_toma=tomas_da_vacina.id_toma and
          convocatorias.id_slot=slots.id_slot and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.regiao=nomelocal

    group by centros_vacinacao.regiao,tomas_da_vacina.id_toma;
   -- order by tomas_da_vacina.id_toma,centros_vacinacao.regiao;

    return (pessoasvacinadas);
end;
/
select ck2_pessoas_vacinadas_regiao('Sul') from dual;
/
drop function ck2_vacinas_dadas_regiao;
/
create or replace function ck2_vacinas_dadas_regiao (regiao varchar2,mes varchar2)
return number 
is
    vacinasdadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into vacinasdadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias, slots
    where tomas_da_vacina.id_toma=convocatorias.id_toma and
          convocatorias.id_slot = slots.id_slot and
          slots.id_turno = turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.regiao=regiao and
          mes=to_char(tomas_da_vacina.datatoma, 'mm')
    group by mes;
    return vacinasdadas;
end;
/
create or replace function ck2_nRecusas_Reg(nomeRegiao varchar) 
return number
is 
    nRecusas number:=0;
begin
    select  count(id_convocatoria) into nRecusas
    from convocatorias,centros_vacinacao,turnos_de_vacinacao,slots
    where centros_vacinacao.regiao=nomeRegiao and
          convocatorias.resposta='n' and
          centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          turnos_de_vacinacao.id_turno=slots.id_turno and
          slots.id_slot=convocatorias.id_slot
    group by centros_vacinacao.regiao;
    
    return nRecusas;
end;

/
create or replace function ck2_pessoas_imunizadas_regiao(nomeLocal varchar,mes date)
return number
is 
    pessoasImunizadas number(5);
begin
    select count( tomas_da_vacina.id_toma) into pessoasImunizadas
    from convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where  
          centros_vacinacao.regiao=nomeLocal and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          convocatorias.id_toma=tomas_da_vacina.id_toma and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose and
          mes=ck2_mes_ano(tomas_da_vacina.datatoma)

 group by centros_vacinacao.regiao,tomas_da_vacina.dose,mes ;
    return (pessoasImunizadas);

end;
/
CREATE OR REPLACE FORCE VIEW "LEIAABDG11"."VIEW_J_A2019134328" ("NOMEVACINA", "LOTE", "NOMELOCAL", "NUMFRASCOS") AS 
  select distinct vacinas.nome as NomeVacina, lote_vacinas.id_lote as Lote, local.nome NomeLocal,sum(transporte.quantidade*lote_vacinas.quantidade_frasco) as NumFrascos 
        from vacinas,lote_vacinas, armazem, feito, transporte, para, local
        where lote_vacinas.id_vacina=vacinas.id_vacina and armazem.id_armazem=lote_vacinas.id_armazem and armazem.id_armazem=feito.id_armazem and transporte.id_transporte=feito.id_transporte
        and transporte.id_transporte=para.id_transporte and local.id_local=para.id_local
        group by vacinas.nome,local.nome, lote_vacinas.id_lote
        order by vacinas.nome;
/


UPDATE "LEIAABDG10"."SLOTS" SET HORA_ESCOLHIDA = TO_TIMESTAMP('2021-05-01 12:00', 'YYYY-MM-DD HH24:MI');
