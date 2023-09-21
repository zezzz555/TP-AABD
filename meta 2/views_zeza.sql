-- VIEW B

CREATE OR REPLACE  VIEW VIEW_B  AS
    select  distinct centros_vacinacao.regiao as Regiao, 
            vacinas.nome as NomeVacina, 
            toma.mes as Mes, 
            ck2_vacinas_entregues_regiao(vacinas.nome, centros_vacinacao.regiao, toma.mes) as NEntregues,
            ck2_vacinas_dadas_regiaov(vacinas.nome, centros_vacinacao.regiao, toma.mes) as NVacinasDadas,
            ck2_pessoas_vacinadas_vacina(vacinas.nome,centros_vacinacao.regiao, toma.mes) as NVacinados, 
            ck2_pessoas_inscritas_regiao(centros_vacinacao.regiao) as NInscritos
    from  centros_vacinacao, vacinas, (select ck2_mes_ano(tomas_da_vacina.dataToma) mes from tomas_da_vacina) toma
    order by 1,2,3;
/

SELECT * from view_b;
--VIEW E
CREATE OR REPLACE  VIEW VIEW_E AS
    select  fases.id_fase as fase,
            ck2_pessoas_fases(fases.id_fase) as NUtentesPrevistos,
            ck2_pessoas_vacinadas_fase(fases.id_fase) as NVacinados,
            nvl(ck2_pessoas_imunizadas_fase(fases.id_fase),0) as NImunizados,
            nvl(round(cast((ck2_pessoas_imunizadas_fase(fases.id_fase) * 100.0 /ck2_pessoas_fases(fases.id_fase )) as float), 2),0) as NPrecent_Imunizados
    from fases
    group by fases.id_fase
    order by fases.id_fase;
/
select * from view_e;

-- view H
CREATE OR REPLACE  VIEW VIEW_H AS
     select centros_vacinacao.morada as LocalVacinacao,
            ck2_turnos_morada(centros_vacinacao.morada) as NumTurnos,
            ck2_pessoas_convocadas_morada(centros_vacinacao.morada) as NumConvocados,
            nvl(ck2_pessoas_vacinadas_morada(centros_vacinacao.morada),0) as NumVacinados,
            nvl(ck2_vacinas_dadas_moradaSemMes(centros_vacinacao.morada),0) as NumVacinasDadas
    from centros_vacinacao
    group by centros_vacinacao.morada
    order by NumVacinasDadas desc;

/

select * from view_h; 

-- Vista que para cada enfermeiro e por cada regiao, mostre os turnos pelo que é/foi responsável(NTurnos_Realizados,
-- a sua media de tempo da administração da vacina(TempoMedio_Administracao), e o numero total de pessoas que vacinou(NPessoas_Vacinou)
CREATE OR REPLACE  VIEW VIEW_J_A2018018386 AS
select enfermeiros.nome, enfermeiros.regiao, count(responsaveis.id_enfermeiro) as NTurnos_Realizados, 
        round(sum(turnos_de_vacinacao.tempo_medio)/count(responsaveis.id_enfermeiro),3) as TempoMedio_Administracao,
        ck2_nvacinados_enfermeiro(enfermeiros.id_enfermeiro) as NPessoas_Vacinou
from enfermeiros, responsaveis, turnos_de_vacinacao, centros_vacinacao
where enfermeiros.id_enfermeiro = responsaveis.id_enfermeiro
and responsaveis.id_turno = turnos_de_vacinacao.id_turno
and turnos_de_vacinacao.id_centro = centros_vacinacao.id_centro

group by enfermeiros.nome,enfermeiros.regiao, ck2_nvacinados_enfermeiro(enfermeiros.id_enfermeiro)
order by enfermeiros.nome;
/
select * from VIEW_J_A2018018386; 


-- view que para cada pessoa que obteve uma reação, mesmo que considerada normal, apresente o nome do utente, a dose correspondente(Ndose),
-- a data da toma dessa dose, a data em que essa dose foi retirada, a validade do frasco, a data de producao do lote proveniente
-- e o laboratório onde a vacina foi criada
CREATE OR REPLACE  VIEW VIEW_K_A2018018386 AS
select distinct pessoas.nome as NomeUtente,tomas_Da_vacina.dose as Ndose, tomas_Da_vacina.dataToma,
    doses.data_da_dose,frascos.validade as ValidadeFrasco,lotes_das_vacinas.data_producao as DataProducaoLote, vacinas.laboratorio as LabVacina
from pessoas, convocatorias, tomas_da_vacina, doses, frascos, lotes_das_vacinas, vacinas
where pessoas.cc=convocatorias.cc 
and convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria
and tomas_da_vacina.id_dose = doses.id_dose
and doses.id_frasco = frascos.id_frasco
and frascos.id_lote = lotes_das_vacinas.id_lote
and lotes_das_vacinas.id_vacina = vacinas.id_vacina
and pessoas.cc = ANY
                (select distinct pessoas.cc from causam, tomas_da_vacina, convocatorias, pessoas
               where causam.id_toma = tomas_da_vacina.id_toma and tomas_da_vacina.id_convocatoria = convocatorias.id_convocatoria 
               and pessoas.cc = convocatorias.cc )
order by pessoas.nome;            
/
 
select * from VIEW_K_A2018018386; 
