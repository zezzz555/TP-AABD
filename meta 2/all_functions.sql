--------------------------------------------------------
--  File created - Sexta-feira-Maio-14-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CK2_MEDIAIDADES
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_mediaidades" (nomeregiao varchar)
return number
is
    somaidades number:=0;
    conta number :=0;
    cursor c1 is
        select regiao,data_nascimento
        from pessoas
        where regiao=nomeregiao;
begin
    for r in c1
    loop
    conta:=conta+1;
    somaidades:=somaidades+floor((sysdate - r.data_nascimento)/365);
    end loop;
    return somaidades/conta;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_NRECUSAS_CONCELHO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_nrecusas_concelho" (nomelocal varchar) 
return number
is 
    nrecusas number :=0;
begin
    select distinct nvl(count( distinct id_convocatoria) ,0) into nrecusas
    from convocatorias,centros_vacinacao,pessoas
    where centros_vacinacao.concelho=nomelocal and
          convocatorias.resposta='n'

    group by centros_vacinacao.concelho,convocatorias.resposta;
    return (nrecusas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_NRECUSAS_REG
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_nrecusas_reg" (nomeregiao varchar) 
return number
is 
    nrecusas number:=0;
begin
    select  count(id_convocatoria) into nrecusas
    from convocatorias,centros_vacinacao,turnos_de_vacinacao,slots
    where centros_vacinacao.regiao=nomeregiao and
          convocatorias.resposta='n' and
          centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          turnos_de_vacinacao.id_turno=slots.id_turno and
          slots.id_slot=convocatorias.id_slot
    group by centros_vacinacao.regiao;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_CONC
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_convocadas_conc" (nomelocal varchar2)
return number
is
    pessoasconvocadas number(5);
begin
    select distinct count(distinct convocatorias.id_convocatoria) into pessoasconvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and

          centros_vacinacao.concelho=nomelocal and
          convocatorias.id_slot =slots.id_slot and
          pessoas.cc=convocatorias.cc 
    group by pessoas.cc;
    return (pessoasconvocadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_REG
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_convocadas_reg" (nomeregiao varchar2)
return number
is
    pessoasconvocadas number(5);
begin
    select distinct count(distinct convocatorias.id_convocatoria) into pessoasconvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.regiao=nomeregiao and
          convocatorias.id_slot =slots.id_slot and
          pessoas.cc=convocatorias.cc 
    group by pessoas.cc;
    return pessoasconvocadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_REGIAO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_convocadas_regiao" (nomeregiao varchar2)
return number
is
    pessoasconvocadas number(5);
begin
    select distinct count(distinct convocatorias.id_convocatoria) into pessoasconvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.regiao=nomeregiao and
          convocatorias.id_slot =slots.id_slot and
          pessoas.cc=convocatorias.cc 
    group by pessoas.cc;
    return pessoasconvocadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_FASES
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_fases" (idfase number)
return number
is
    pessoasfases number(5);
begin
    select distinct count(distinct pessoas.cc) into pessoasfases

    from pessoas, fases, convocatorias, criterios

    where fases.id_fase= idfase
    and   fases.id_fase = criterios.id_fase
    and   fases.id_fase = convocatorias.id_fase
    and   pessoas.cc = convocatorias.cc
    group by fases.id_fase;

    return pessoasfases;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_FASE
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_imunizadas_fase" (idfase number)
return number
is 
    pessoasimunizadas number(5);
begin
    select distinct count(distinct pessoas.cc) into pessoasimunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,fases, slots, turnos_de_vacinacao, centros_vacinacao
    where fases.id_fase=idfase and
          fases.id_fase = convocatorias.id_fase and
          pessoas.cc=convocatorias.cc and
          convocatorias.id_toma=tomas_da_vacina.id_toma and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose        
    group by fases.id_fase;
    return (pessoasimunizadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_MORADA
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_imunizadas_morada" (nomelocal varchar)
return number
is 
    pessoasimunizadas number(5);
begin
    select count(  tomas_da_vacina.id_toma) into pessoasimunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where pessoas.cc=convocatorias.cc and
          centros_vacinacao.morada=nomelocal and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          convocatorias.id_toma=tomas_da_vacina.id_toma and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose 

 group by centros_vacinacao.morada,pessoas.cc,tomas_da_vacina.dose,vacinas.num_doses;
    return (pessoasimunizadas);

end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_INSCRITAS_REGIAO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_inscritas_regiao" (reg varchar)
return number
is
    pessoasincritas number(5);
begin
    select  distinct count( distinct pessoas.cc) into pessoasincritas

    from centros_vacinacao,turnos_de_vacinacao,convocatorias,slots,pessoas

    where centros_vacinacao.regiao=reg
    and   centros_vacinacao.id_centro= turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno= slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and   convocatorias.cc = pessoas.cc

    group by pessoas.cc,centros_vacinacao.regiao;

    return (pessoasincritas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_FASE
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_vacinadas_fase" (idfase number)
return number
is
    pessoasvacinadas number(5);
begin
    select  distinct count( distinct pessoas.cc) into pessoasvacinadas

    from fases, convocatorias, pessoas, tomas_da_vacina,doses, frascos, lotes_das_vacinas, vacinas

    where fases.id_fase = idfase 
    and   fases.id_fase = convocatorias.id_fase
    and   convocatorias.cc = pessoas.cc
    and   convocatorias.id_toma = tomas_da_vacina.id_toma
    and   tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina      

    group by fases.id_fase;

    return pessoasvacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_MORADA
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_vacinadas_morada" (nomelocal varchar)
return number
is
    pessoasvacinadas number;
begin
    select distinct count(distinct tomas_da_vacina.id_toma) into pessoasvacinadas
    from centros_vacinacao ,tomas_da_vacina,slots,turnos_de_vacinacao,convocatorias
    where convocatorias.id_toma=tomas_da_vacina.id_toma and
        centros_vacinacao.morada=nomelocal and
      convocatorias.id_slot=slots.id_slot and
      turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro

    group by centros_vacinacao.morada,tomas_da_vacina.id_toma;

    return pessoasvacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_REGIAO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_pessoas_vacinadas_regiao" (nomelocal varchar)
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
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_MES
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_vacinas_dadas_mes" (nomelocal varchar,mes number)
return number 
is
    vacinasdadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into vacinasdadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias
    where tomas_da_vacina.id_toma=convocatorias.id_toma and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.morada=nomelocal and
          mes=to_char(tomas_da_vacina.datatoma, 'mm')
    group by mes;
    return vacinasdadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_MORADA
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_vacinas_dadas_morada" (nomelocal varchar,mes number)
return number 
is
    vacinasdadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into vacinasdadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias
    where tomas_da_vacina.id_toma=convocatorias.id_toma and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.morada=nomelocal and
          mes=to_char(tomas_da_vacina.datatoma, 'mm')
    group by mes;
    return vacinasdadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_REGIAO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_vacinas_dadas_regiao" (regiao varchar2,mes varchar2)
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
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_ENTREGUES_REGIAO
--------------------------------------------------------

  create or replace function "leiaabdg10"."ck2_vacinas_entregues_regiao" (regiao varchar2, mes varchar2)
return number 
is
    vacinasentregues number(5);
begin
    select count(frascos.id_frasco) into vacinasentregues
    from frascos,centros_vacinacao,transportes 
    where frascos.id_transporte= transportes.id_transporte
    and   transportes.id_centro = centros_vacinacao.id_centro
    and   regiao = centros_vacinacao.regiao
    and   mes=to_char(transportes.data, 'mm')
    group by mes;
    return vacinasentregues;
end;

/
