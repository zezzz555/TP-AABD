create or replace function ck2_mes_ano(dataX date)
return varchar2
is
    mes varchar2(30);
begin
    select to_char(dataX,'YYYY-MM') into mes from dual;
    return mes;
end;

-- Funcao que retorna o numero de vacinas entregues numa dada região
create or replace function ck2_vacinas_entregues_regiao(vac varchar2, reg varchar2, mes varchar2)
return number 
is
    vacinasEntregues number(5);
begin
    select count(frascos.id_frasco) into vacinasEntregues
    from frascos, centros_vacinacao, transportes, lotes_das_vacinas, vacinas, (select dataToma from tomas_da_vacina) toma
    where frascos.id_transporte= transportes.id_transporte
    and   transportes.id_centro = centros_vacinacao.id_centro
    and   frascos.id_lote = lotes_das_vacinas.id_lote
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   reg = centros_vacinacao.regiao
    and   vac = vacinas.nome
    and   mes = ck2_mes_ano(toma.dataToma);
    return vacinasEntregues;
end;

--Funcao que retorna o numero de vacinas dadas numa dada regiao e num dado mes
create or replace function ck2_vacinas_dadas_regiaov(vacina varchar2,regiao varchar2,mes varchar2)
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
          mes=ck2_mes_ano(tomas_da_vacina.dataToma);
    return vacinasDadas;
end;
/

create or replace function ck2_pessoas_vacinadas_vacina(vacina varchar2,regiao varchar2,mes varchar2)
return number
is
    pessoasVacinadas number(5);

begin
    select count(tomas_da_vacina.id_toma) into pessoasVacinadas
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
    return pessoasVacinadas;
end;
/

--Funcao que retorna o numero de pessoas incritas nos centro de vacinacao de numa dada regiao
create or replace function ck2_pessoas_inscritas_regiao(reg varchar2)
return number
is 
    pessoasIncritas number(5);
begin
    select count(pessoas.cc) into pessoasIncritas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,slots,pessoas
    where centros_vacinacao.regiao=reg
    and   centros_vacinacao.id_centro= turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno= slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and    convocatorias.cc = pessoas.cc;
    return pessoasIncritas;
end;
/

-- Funcao que devolve o numero de pessoas previstas para cada fase de vacinacao
create or replace function ck2_pessoas_fases(idfase number)
return number
is
    pessoasFases number(5);
begin
    select count(pessoas.cc) into pessoasFases
    
    from pessoas, fases, criterios, abrangidas, profissoes, exercem
    
    where fases.id_fase= idfase
    and   fases.id_fase = criterios.id_fase
    and criterios.id_Criterios = abrangidas.id_criterios
    and abrangidas.id_profissao = profissoes.id_profissao
    and profissoes.id_profissao = exercem.id_profissao
    and exercem.cc = pessoas.cc;

    return pessoasFases;
end;
/

--funcao que devolve o numero de pessoas vacinados por cada fase de vacinacao
create or replace function ck2_pessoas_vacinadas_fase(idfase number)
return number
is
    pessoasVacinadas number(5);
begin
    select count( pessoas.cc) into pessoasVacinadas
    
    from fases, convocatorias, pessoas, tomas_da_vacina
    
    where fases.id_fase = idfase 
    and   fases.id_fase = convocatorias.id_fase
    and   convocatorias.cc = pessoas.cc
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria;
    
    return pessoasVacinadas;
end;

-- Funcao que devolve o numero de pessoas imunizadas p cada fase de vacinacao
create or replace function ck2_pessoas_imunizadas_fase(idfase number)
return number
is 
    pessoasImunizadas number(5);
begin
    select count(pessoas.cc) into pessoasImunizadas
    from pessoas,convocatorias,tomas_da_vacina,doses,frascos,lotes_das_vacinas,vacinas,fases 
    where fases.id_fase=idfase and
          fases.id_fase=convocatorias.id_fase and
          convocatorias.cc = pessoas.cc and
          tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria and
          tomas_da_vacina.id_dose=doses.id_dose and
          doses.id_frasco=frascos.id_frasco and
          frascos.id_lote=lotes_das_vacinas.id_lote and
          lotes_das_vacinas.id_vacina=vacinas.id_vacina and
          vacinas.num_doses=tomas_da_vacina.dose;
    return pessoasImunizadas;
end;
/

--funcao que devolve o numero de vacinas administradas num dado centro de vacinacao, sem mes!
create or replace function ck2_vacinas_dadas_moradaSemMes(nomeLocal varchar)
return number 
is
    vacinasDadas number(5);
begin
    select count( tomas_da_vacina.id_toma) into vacinasDadas
    from tomas_da_vacina,centros_vacinacao,turnos_de_vacinacao,convocatorias, slots
    where centros_vacinacao.morada=nomeLocal
    and   centros_vacinacao.id_centro = turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno = slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria;
    return vacinasDadas;
end;

--funcao que devolve o numero de pessoas convocdas por dado centro de vacinacao
create or replace function ck2_pessoas_convocadas_morada(nomeLocal varchar2)
return number
is
    pessoasConvocadas number(5);
begin
    select count(pessoas.cc) into pessoasConvocadas
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,pessoas,slots
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          slots.id_turno=turnos_de_vacinacao.id_turno and
          centros_vacinacao.morada=nomeLocal and
          convocatorias.id_slot =slots.id_slot and
          convocatorias.cc = pessoas.cc;
    return pessoasConvocadas;
end;
/

--funcao que devolve o numero de trunos num dado centro de vacinacao
create or replace function ck2_turnos_morada(nomeLocal varchar2)
return number
is
    numTurnos number(5);
begin
    select count(turnos_de_vacinacao.id_turno) into numTurnos
    from centros_vacinacao,turnos_de_vacinacao
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          centros_vacinacao.morada=nomeLocal;
    return (numTurnos);
end;
/

create or replace function ck2_nvacinados_enfermeiro(id_enf number)
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


-- TESTES

--Teste funcao  ck2_c_vacinas_entregues_regiao
select centros_vacinacao.regiao as Regiao, 
       vacinas.nome as NomeVacina, 
       to_char(transportes.data, 'mm') as Mes, 
       ck2_vacinas_entregues_regiao(vacinas.nome,centros_vacinacao.regiao,transportes.data) as NEntregues
from vacinas, centros_vacinacao, transportes, frascos, lotes_das_vacinas
where transportes.id_centro = centros_vacinacao.id_centro
and   frascos.id_transporte=transportes.id_transporte
and   frascos.id_lote = lotes_das_vacinas.id_lote
and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
/

--teste funcao ck2_c_pessoas_inscritas_regiao
select centros_vacinacao.regiao as Regiao, 
       vacinas.nome as NomeVacina, 
       to_char(transportes.data, 'mm') as Mes, 
       ck2_c_pessoas_inscritas_regiao(centros_vacinacao.regiao) as NInscritos
from vacinas, centros_vacinacao, transportes, frascos, lotes_das_vacinas, doses, tomas_da_vacina
where transportes.id_centro = centros_vacinacao.id_centro
and   frascos.id_transporte=transportes.id_transporte
and   frascos.id_lote = lotes_das_vacinas.id_lote
and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   doses.id_frasco=frascos.id_frasco
    and   tomas_da_vacina.id_toma = doses.id_toma
    
group by centros_vacinacao.regiao, vacinas.nome,to_char(transportes.data, 'mm')
order by to_char(transportes.data, 'mm');
/

--teste funcao ck2_c_pessoas_vacinadas_regiao
select centros_vacinacao.regiao as Regiao, 
       vacinas.nome as NomeVacina, 
       to_char(tomas_da_vacina.dataToma, 'mm') as Mes, 
       ck2_c_pessoas_vacinadas_regiao(centros_vacinacao.regiao) as NVacinados
from vacinas, centros_vacinacao, transportes, frascos, lotes_das_vacinas, doses, tomas_da_vacina
where transportes.id_centro = centros_vacinacao.id_centro
and   frascos.id_transporte=transportes.id_transporte
and   frascos.id_lote = lotes_das_vacinas.id_lote
and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   doses.id_frasco=frascos.id_frasco
    and   tomas_da_vacina.id_toma = doses.id_toma
    
order by to_char(tomas_da_vacina.dataToma, 'mm');
/

--ck2_c_vacinas_dadas_regiao
select centros_vacinacao.regiao as Regiao, 
       vacinas.nome as NomeVacina, 
       to_char(tomas_da_vacina.dataToma, 'mm') as Mes, 
       ck2_c_vacinas_dadas_regiao(centros_vacinacao.regiao, to_char(tomas_da_vacina.dataToma, 'mm')) as NVacinados
from vacinas, centros_vacinacao, transportes, frascos, lotes_das_vacinas, doses, tomas_da_vacina
where transportes.id_centro = centros_vacinacao.id_centro
and   frascos.id_transporte=transportes.id_transporte
and   frascos.id_lote = lotes_das_vacinas.id_lote
and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   doses.id_frasco=frascos.id_frasco
    and   tomas_da_vacina.id_toma = doses.id_toma
    
order by to_char(tomas_da_vacina.dataToma, 'mm');
/

-- teste funcao ck2_pessoas_fases
select fases.id_fase, ck2_pessoas_fases(fases.id_fase) as NUtentesPrevistos
from pessoas, fases, convocatorias
    where pessoas.cc = convocatorias.cc
    and convocatorias.id_fase = fases.id_fase
    group by fases.id_fase
    order by fases.id_fase;
/
-- teste funcao ck2_c_pessoas_vacinadas_fase
select fases.id_fase, ck2_pessoas_vacinadas_fase(fases.id_fase) as NVacinados
from pessoas, fases, convocatorias
    where pessoas.cc = convocatorias.cc
    and convocatorias.id_fase = fases.id_fase
    group by fases.id_fase
    order by fases.id_fase;
/ 

--teste funcao CK2_C_PESSOAS_IMUNIZADAS_FASE
select fases.id_fase, CK2_PESSOAS_IMUNIZADAS_FASE(fases.id_fase) as NImunizados
from pessoas, fases, convocatorias
    where pessoas.cc = convocatorias.cc
    and convocatorias.id_fase = fases.id_fase
    group by fases.id_fase
    order by fases.id_fase;
/

