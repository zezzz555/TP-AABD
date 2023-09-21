--------------------------------------------------------
--  File created - Segunda-feira-Maio-17-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CK2_MES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_MES" (dataX date)
return number
is
    mes number(5);
begin
    select to_char(dataX,'MM') into mes from dual;
    return mes;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_MES_ANO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_MES_ANO" (dataX date)
return varchar2
is
    mes varchar2(30);
begin
    select to_char(dataX,'YYYY-MM') into mes from dual;
    return mes;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_NRECUSAS_CONCELHO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_NRECUSAS_CONCELHO" (nomeLocal varchar) 
return number
is 
    nRecusas number :=0;
begin
    select NVL(count( convocatorias.id_convocatoria) ,0) into nRecusas
    from convocatorias,centros_vacinacao,turnos_de_vacinacao,slots
    where centros_vacinacao.concelho=nomeLocal and
          convocatorias.resposta='n' and
          centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          turnos_de_vacinacao.id_turno=slots.id_turno and
          slots.id_slot=convocatorias.id_slot

    group by centros_vacinacao.concelho;
    return (nRecusas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_NRECUSAS_REG
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_NRECUSAS_REG" (nomeRegiao varchar) 
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
--------------------------------------------------------
--  DDL for Function CK2_NVACINADOS_ENFERMEIRO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_NVACINADOS_ENFERMEIRO" (id_enf number)
return number
is 
    pesssoasVacinadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into pesssoasVacinadas
        from turnos_de_vacinacao, slots, convocatorias, tomas_da_vacina, responsaveis, enfermeiros
        where enfermeiros.id_enfermeiro = id_enf
        and enfermeiros.id_enfermeiro = responsaveis.id_enfermeiro
        and responsaveis.id_turno = turnos_de_vacinacao.id_turno
        and turnos_de_vacinacao.id_turno = slots.id_turno
        and slots.id_slot = convocatorias.id_slot
        and convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria;
    return pesssoasVacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_CONC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_CONVOCADAS_CONC" (nomeLocal varchar2)
return number
is
    pessoasConvocadas number(5);
begin
    select  distinct count( convocatorias.id_convocatoria) into pessoasConvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and

          centros_vacinacao.concelho=nomeLocal and
          convocatorias.id_slot =slots.id_slot and
          pessoas.cc=convocatorias.cc 
    group by centros_vacinacao.concelho;
    return (pessoasConvocadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_MORADA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_CONVOCADAS_MORADA" (nomeLocal varchar2)
return number
is
    pessoasConvocadas number(5);
begin
    select distinct count(distinct convocatorias.id_convocatoria) into pessoasConvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.morada=nomeLocal and
          convocatorias.id_slot =slots.id_slot;
    return pessoasConvocadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_REG
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_CONVOCADAS_REG" (nomeRegiao varchar2)
return number
is
    pessoasConvocadas number(5);
begin
    select  count( convocatorias.id_convocatoria) into pessoasConvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.regiao=nomeRegiao and
          convocatorias.id_slot =slots.id_slot;
    return pessoasConvocadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_CONVOCADAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_CONVOCADAS_REGIAO" (nomeRegiao varchar2)
return number
is
    pessoasConvocadas number(5);
begin
    select distinct count(distinct convocatorias.id_convocatoria) into pessoasConvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.regiao=nomeRegiao and
          convocatorias.id_slot =slots.id_slot and
          pessoas.cc=convocatorias.cc 
    group by pessoas.cc;
    return pessoasConvocadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_FASES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_FASES" (idfase number)
return number
is
    pessoasFases number(5);
begin
    select distinct count(distinct pessoas.cc) into pessoasFases

    from pessoas, fases, convocatorias, criterios

    where fases.id_fase= idfase
    and   fases.id_fase = criterios.id_fase
    and   fases.id_fase = convocatorias.id_fase
    and   pessoas.cc = convocatorias.cc
    group by fases.id_fase;

    return pessoasFases;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_CONC
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_IMUNIZADAS_CONC" (nomeConcelho varchar)
return number
is 
    pessoasImunizadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where pessoas.cc=convocatorias.cc and
          pessoas.concelho=nomeConcelho and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose 
    group by centros_vacinacao.concelho;--,pessoas.cc,tomas_da_vacina.dose,vacinas.num_doses;
    return (pessoasImunizadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_FASE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_IMUNIZADAS_FASE" (idfase number)
return number
is 
    pessoasImunizadas number(5);
begin
    select distinct count(distinct pessoas.cc) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,fases, slots, turnos_de_vacinacao, centros_vacinacao
    where fases.id_fase=idfase and
          fases.id_fase = convocatorias.id_fase and
          pessoas.cc=convocatorias.cc and
          convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose        
    group by fases.id_fase;
    return (pessoasImunizadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_MORADA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_IMUNIZADAS_MORADA" (nomeLocal varchar)
return number
is 
    pessoasImunizadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where pessoas.cc=convocatorias.cc and
          centros_vacinacao.morada=nomeLocal and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose 

 group by centros_vacinacao.morada,pessoas.cc,tomas_da_vacina.dose,vacinas.num_doses;
    return (pessoasImunizadas);

end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_IMUNIZADAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_IMUNIZADAS_REGIAO" (nomeLocal varchar)
return number
is 
    pessoasImunizadas number(5);
begin
    select count( tomas_da_vacina.id_toma) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,centros_vacinacao,turnos_de_vacinacao,slots
    where pessoas.cc=convocatorias.cc and
          centros_vacinacao.regiao=nomeLocal and
          convocatorias.id_slot=slots.id_slot and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose
          group by centros_vacinacao.regiao;

 
    return (pessoasImunizadas);

end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_INSCRITAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_INSCRITAS_REGIAO" (reg varchar2, mes varchar2)
return number
is
    pessoasIncritas number(5);
begin
    select  distinct count( distinct pessoas.cc) into pessoasIncritas

    from centros_vacinacao,turnos_de_vacinacao,convocatorias,slots,pessoas, tomas_da_vacina

    where centros_vacinacao.regiao=reg
    and   centros_vacinacao.id_centro= turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno= slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and   convocatorias.cc = pessoas.cc
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria
    and    mes=ck2_mes_ano(tomas_da_vacina.datatoma);

    --group by centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.datatoma);

    return pessoasIncritas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_REGIAO" (nomeLocal varchar) 
return number
is 
    pessoasRegiao number;
begin
    select count(pessoas.cc) into pessoasRegiao
    from pessoas,centro_saude
    where pessoas.id_centrosaude=centro_saude.id_centrosaude and 
          centro_saude.regiao=nomeLocal
    group by centro_saude.regiao;

    return pessoasRegiao;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_FASE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_VACINADAS_FASE" (idfase number)
return number
is
    pessoasVacinadas number(5);
begin
    select  distinct count( distinct pessoas.cc) into pessoasVacinadas

    from fases, convocatorias, pessoas, tomas_da_vacina,doses, frascos, lotes_das_vacinas, vacinas

    where fases.id_fase = idfase 
    and   fases.id_fase = convocatorias.id_fase
    and   convocatorias.cc = pessoas.cc
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria
    and   tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina      

    group by fases.id_fase;

    return pessoasVacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_MORADA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_VACINADAS_MORADA" (nomeLocal varchar)
return number
is
    pessoasVacinadas number;
begin
    select count(tomas_da_vacina.id_toma) into pessoasVacinadas
    from centros_vacinacao ,tomas_da_vacina,slots,turnos_de_vacinacao,convocatorias
    where convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria 
    and   centros_vacinacao.morada=nomeLocal 
    and  convocatorias.id_slot=slots.id_slot 
    and  slots.id_turno = turnos_de_vacinacao.id_turno 
    and  turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro

    group by centros_vacinacao.morada;

    return pessoasVacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_VACINADAS_REGIAO" (nomelocal varchar)
return number
is
    pessoasvacinadas number(5);

begin
   select  distinct count( tomas_da_vacina.id_toma) into pessoasvacinadas
    from centros_vacinacao ,tomas_da_vacina,slots,turnos_de_vacinacao,convocatorias
    where convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          convocatorias.id_slot=slots.id_slot and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.regiao=nomelocal

    group by centros_vacinacao.regiao,tomas_da_vacina.id_toma;

    return (pessoasvacinadas);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_PESSOAS_VACINADAS_VACINA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_PESSOAS_VACINADAS_VACINA" (vacina varchar2,regiao varchar2,mes varchar2)
return number
is
    pessoasVacinadas number(5);

begin
    select distinct count(distinct tomas_da_vacina.id_toma) into pessoasVacinadas
    from centros_vacinacao ,tomas_da_vacina,slots,turnos_de_vacinacao,convocatorias, vacinas, doses, frascos, lotes_das_vacinas
    where convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          convocatorias.id_slot=slots.id_slot and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          tomas_da_vacina.id_dose = doses.id_dose and
          doses.id_frasco = frascos.id_frasco and
          frascos.id_lote = lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina = vacinas.id_vacina and
          centros_vacinacao.regiao=regiao and
          vacinas.nome = vacina and
          mes=ck2_mes_ano(tomas_da_vacina.datatoma);
    --group by vacinas.nome,centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.datatoma);

    return pessoasVacinadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_TURNOS_MORADA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_TURNOS_MORADA" (nomeLocal varchar2)
return number
is
    numTurnos number(5);
begin
    select distinct count(distinct turnos_de_vacinacao.id_turno) into numTurnos
    from centros_vacinacao,turnos_de_vacinacao
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          centros_vacinacao.morada=nomeLocal 
    group by centros_vacinacao.morada;
    return (numTurnos);
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_MES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_VACINAS_DADAS_MES" (nomeLocal varchar,mes number)
return number 
is
    vacinasDadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into vacinasDadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias
    where convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.morada=nomeLocal and
          mes=to_char(tomas_da_vacina.datatoma, 'mm')
    group by mes;
    return vacinasDadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_MORADASEMMES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_VACINAS_DADAS_MORADASEMMES" (nomeLocal varchar)
return number 
is
    vacinasDadas number(5);
begin
    select distinct count(distinct tomas_da_vacina.id_toma) into vacinasDadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias, slots
    where centros_vacinacao.morada=nomeLocal
    and   centros_vacinacao.id_centro = turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno = slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria
    group by centros_vacinacao.morada;
    return vacinasDadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_VACINAS_DADAS_REGIAO" (regiao varchar2)
return number 
is
    vacinasdadas number(5);
begin
    select distinct count(tomas_da_vacina.id_toma) into vacinasdadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias, slots
    where convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria and
          convocatorias.id_slot = slots.id_slot and
          slots.id_turno = turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          centros_vacinacao.regiao=regiao 
    group by regiao;
    return vacinasdadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_DADAS_REGIAOV
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_VACINAS_DADAS_REGIAOV" (vacina varchar2,regiao varchar2,mes varchar2)
return number 
is
    vacinasDadas number(5);
begin
    select count(tomas_da_vacina.id_toma) into vacinasDadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias, slots, vacinas, doses, frascos, lotes_das_vacinas
    where tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria and
          convocatorias.id_slot = slots.id_slot and
          slots.id_turno = turnos_de_vacinacao.id_turno and
          turnos_de_vacinacao.id_centro=centros_vacinacao.id_centro and
          tomas_da_vacina.id_dose = doses.id_dose and
          doses.id_frasco = frascos.id_frasco and
          frascos.id_lote = lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina = vacinas.id_vacina and
          vacinas.nome = vacina and
          centros_vacinacao.regiao=regiao and
          mes=ck2_mes_ano(tomas_da_vacina.datatoma);
    --group by vacinas.nome,centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.datatoma);
    return vacinasDadas;
end;

/
--------------------------------------------------------
--  DDL for Function CK2_VACINAS_ENTREGUES_REGIAO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "LEIAABDG10"."CK2_VACINAS_ENTREGUES_REGIAO" (vac varchar2, reg varchar2, mes varchar2)
return number 
is
    vacinasEntregues number(5);
begin
    select distinct count(distinct frascos.id_frasco) into vacinasEntregues
    from frascos, centros_vacinacao, transportes, lotes_das_vacinas, vacinas
    where frascos.id_transporte= transportes.id_transporte
    and   transportes.id_centro = centros_vacinacao.id_centro
    and   frascos.id_lote = lotes_das_vacinas.id_lote
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   reg = centros_vacinacao.regiao
    and   vac = vacinas.nome
    and   mes = ck2_mes_ano(transportes.data);
    --group by centros_vacinacao.regiao,vacinas.nome,ck2_mes_ano(transportes.data);
    return vacinasEntregues;
end;

/
