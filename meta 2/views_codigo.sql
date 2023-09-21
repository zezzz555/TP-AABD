--------------------------------------------------------
--  File created - Domingo-Maio-16-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View VIEW_A
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_A" ("LOCAL_VACINACAO", "MES", "NUMERO_VACINAS_DADAS", "NUMERO_VACINADOS", "NUMERO_IMUNIZADOS") AS 
  select    centros_vacinacao.morada as local_vacinacao,
              ck2_mes_ano(tomas_da_vacina.datatoma) as mes ,
              count(tomas_da_vacina.id_toma) as numero_vacinas_dadas,
              ck2_pessoas_vacinadas_morada(centros_vacinacao.morada) as numero_vacinados,
              nvl(ck2_pessoas_imunizadas_morada(centros_vacinacao.morada),0)  as numero_imunizados
              
    from centros_vacinacao,turnos_de_vacinacao,convocatorias,tomas_da_vacina,slots
    
    where centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro and
          turnos_de_vacinacao.id_turno=slots.id_turno and
          convocatorias.id_slot= slots.id_slot and
          convocatorias.id_convocatoria=tomas_da_vacina.id_convocatoria
          
    group by  centros_vacinacao.morada, tomas_da_vacina.datatoma
    order by   to_char(tomas_da_vacina.datatoma, 'mm') desc,centros_vacinacao.morada
;
--------------------------------------------------------
--  DDL for View VIEW_B
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_B" ("REGIAO", "NOMEVACINA", "MES", "NENTREGUES", "NVACINASDADAS", "NVACINADOS", "NINSCRITOS") AS 
  select  centros_vacinacao.regiao as Regiao, 
            vacinas.nome as NomeVacina, 
            ck2_mes_ano(tomas_da_vacina.dataToma) as Mes, 
            nvl(ck2_vacinas_entregues_regiao(vacinas.nome, centros_vacinacao.regiao, ck2_mes_ano(transportes.data)),0) as NEntregues,
            nvl(ck2_vacinas_dadas_regiaov(vacinas.nome, centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.dataToma)),0) as NVacinasDadas,
            nvl(ck2_pessoas_vacinadas_vacina(vacinas.nome, centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.dataToma)),0) as NVacinados, 
            nvl(ck2_pessoas_inscritas_regiao(centros_vacinacao.regiao, ck2_mes_ano(tomas_da_vacina.dataToma)),0) as NInscritos
    from  centros_vacinacao, transportes, frascos, lotes_das_vacinas, vacinas, turnos_de_vacinacao, convocatorias, tomas_da_vacina, slots
    where centros_vacinacao.id_centro = transportes.id_centro
    and   transportes.id_transporte = frascos.id_transporte
    and   frascos.id_lote = lotes_das_vacinas.id_lote
    and   lotes_das_vacinas.id_vacina = vacinas.id_vacina
    and   centros_vacinacao.id_centro = turnos_de_vacinacao.id_centro
    and   turnos_de_vacinacao.id_turno = slots.id_turno
    and   slots.id_slot = convocatorias.id_slot
    and   convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria
    order by 1,2,3
;
--------------------------------------------------------
--  DDL for View VIEW_C
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_C" ("REGIAO", "IDADE_MEDIA", "NUM_UTENTES", "NUM_CONVOCADOS", "NUM_REJEITARAM") AS 
  select Regiao,
        floor(avg(floor((sysdate - data_nascimento)/365))) as idade_media,
        count(cc) as Num_utentes,
        ck2_pessoas_convocadas_reg(regiao) as Num_Convocados,
        nvl(ck2_nRecusas_Reg(regiao),0) as Num_rejeitaram
from pessoas
group by regiao
;
--------------------------------------------------------
--  DDL for View VIEW_D
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_D" ("REGIÃO", "N_DE_UTENTES", "N_VACINAS_DADAS", "PERCENTAGEM_IMUNES") AS 
  select pessoas.regiao as Região, 
    x.nPessoas as N_de_Utentes, 
    count( tomas_da_vacina.id_toma) as N_Vacinas_Dadas,
    round((nvl(ck2_pessoas_imunizadas_regiao(x.regiaoPessoas),0)/x.nPessoas),2)*100  as Percentagem_Imunes     

    from pessoas, convocatorias, tomas_da_vacina,
        (select count( pessoas.cc) as nPessoas, regiao as regiaoPessoas
        from pessoas
        group by regiao) x

    where pessoas.cc=convocatorias.cc 
    and tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria
    and x.regiaoPessoas = pessoas.regiao group by pessoas.regiao, x.nPessoas, round((nvl(ck2_pessoas_imunizadas_regiao(x.regiaoPessoas),0)/x.nPessoas),2)*100 

    order by regiao
;
--------------------------------------------------------
--  DDL for View VIEW_E
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_E" ("FASE", "NUTENTESPREVISTOS", "NVACINADOS", "NIMUNIZADOS", "NPRECENT_IMUNIZADOS") AS 
  select  fases.id_fase as fase,
            ck2_pessoas_fases(fases.id_fase) as NUtentesPrevistos,
            ck2_pessoas_vacinadas_fase(fases.id_fase) as NVacinados,
            nvl(ck2_pessoas_imunizadas_fase(fases.id_fase),0) as NImunizados,
            nvl(round(cast((ck2_pessoas_imunizadas_fase(fases.id_fase) * 100.0 /ck2_pessoas_fases(fases.id_fase )) as float), 2),0) as NPrecent_Imunizados
    from pessoas, fases, convocatorias
    where pessoas.cc = convocatorias.cc
    and convocatorias.id_fase = fases.id_fase
    group by fases.id_fase
    order by fases.id_fase
;
--------------------------------------------------------
--  DDL for View VIEW_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_F" ("VACINA", "MES", "NUM_DOSES_FORNECIDAS", "NUM_DOSES_UTILIZADAS", "PERCENT_UTILIZACAO") AS 
  select vacinas.nome as Vacina, 
        ck2_mes(tomas_da_vacina.datatoma) as Mes, 
        count(doses.id_dose) as Num_doses_fornecidas, 
        y.conta as Num_doses_utilizadas,
        ((y.conta/count(distinct doses.id_dose))*100) as Percent_utilizacao
from vacinas, lotes_das_vacinas,frascos,doses,tomas_da_vacina,(select count(tomas_da_vacina.id_toma) as conta, 
                                                                        vacinas.nome as NomeVac,
                                                                        ck2_mes(tomas_da_vacina.datatoma) as M
                                                                from vacinas,lotes_das_vacinas,frascos,doses,tomas_da_vacina
                                                                where tomas_da_vacina.id_dose=doses.id_dose
                                                                and doses.id_frasco=frascos.id_frasco
                                                                and frascos.id_lote=lotes_das_vacinas.id_lote
                                                                and lotes_das_vacinas.id_vacina=vacinas.id_vacina
                                                                group by vacinas.nome, ck2_mes(tomas_da_vacina.datatoma), tomas_da_vacina.id_toma) y
where tomas_da_vacina.id_dose=doses.id_dose
and doses.id_frasco=frascos.id_frasco
and frascos.id_lote=lotes_das_vacinas.id_lote
and lotes_das_vacinas.id_vacina=vacinas.id_vacina
and y.NomeVac=vacinas.nome
and ck2_mes(tomas_da_vacina.datatoma)=y.M
group by vacinas.nome,ck2_mes(tomas_da_vacina.datatoma),y.conta
order by Num_doses_fornecidas
;
--------------------------------------------------------
--  DDL for View VIEW_G
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_G" ("NOME_CONCELHO", "LOCAL_VACINACAO", "NUMERO_CONVOCADOS", "NUMERO_RECUSAS", "PERCENTAGEM_RECUSADOS") AS 
  select centros_vacinacao.concelho  as Nome_Concelho,
          centros_vacinacao.morada as Local_Vacinacao,
          nvl(ck2_pessoas_convocadas_conc(centros_vacinacao.concelho),0) as Numero_Convocados,
          nvl(ck2_nRecusas_concelho(centros_vacinacao.concelho),0) as Numero_Recusas ,
          nvl(max(round((ck2_nRecusas_concelho(centros_vacinacao.concelho) *100.0 /ck2_pessoas_convocadas_conc(centros_vacinacao.concelho)),2)),0) 
          as Percentagem_Recusados

    from centros_vacinacao
    group by  centros_vacinacao.concelho, centros_vacinacao.morada
    order by Percentagem_Recusados desc
;
--------------------------------------------------------
--  DDL for View VIEW_H
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_H" ("LOCALVACINACAO", "NUMTURNOS", "NUMCONVOCADOS", "NUMVACINADOS", "NUMVACINASDADAS") AS 
  select centros_vacinacao.morada as LocalVacinacao,
            ck2_turnos_morada(centros_vacinacao.morada) as NumTurnos,
            ck2_pessoas_convocadas_morada(centros_vacinacao.morada) as NumConvocados,
            nvl(ck2_pessoas_vacinadas_morada(centros_vacinacao.morada),0) as NumVacinados,
            nvl(ck2_vacinas_dadas_moradaSemMes(centros_vacinacao.morada),0) as NumVacinasDadas
    from centros_vacinacao
    group by centros_vacinacao.morada
    order by NumVacinasDadas desc
;
--------------------------------------------------------
--  DDL for View VIEW_I
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_I" ("NOMECONCELHO", "NUM_UTENTES", "NUM_IMUNIZADOS", "PERCENT_IMUNIZADOS") AS 
  select concelho as NomeConcelho,
        count(cc) as Num_utentes,
        nvl(ck2_pessoas_imunizadas_conc(concelho),0) as Num_Imunizados,
        nvl(ck2_pessoas_imunizadas_conc(concelho),0)*100/count(cc) as Percent_Imunizados
from pessoas
where rownum <= 10
group by concelho
;
--------------------------------------------------------
--  DDL for View VIEW_J_A2018013160
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_J_A2018013160" ("NUMERO_VACINAS_TOMADAS", "VACINA", "LABORATORIO", "NOME", "CENTRO_VACINACAO", "FASE", "PROFISSAO", "PUBLICO_PRIVADO") AS 
  select  count( tomas_da_vacina.id_dose) as Numero_Vacinas_Tomadas,
                    vacinas.nome as Vacina,
                    vacinas.laboratorio as Laboratorio,
                    pessoas.nome as Nome,
                    centros_vacinacao.morada as Centro_Vacinacao,
                    fases.numero_fase as Fase,
                    profissoes.profissao as Profissao,
                    locais_de_trabalho.tipo as Publico_Privado

    from profissoes,tomas_da_vacina,centros_vacinacao,pessoas,frascos,exercem,slots,convocatorias,turnos_de_vacinacao,
    fases,locais_de_trabalho,doses,trabalham,vacinas,lotes_das_vacinas
    
    where pessoas.cc=exercem.cc and exercem.id_profissao=profissoes.id_profissao and profissoes.profissao='Enfermeiro' 
    and locais_de_trabalho.tipo='Publico'and centros_vacinacao.id_centro=turnos_de_vacinacao.id_centro 
    and turnos_de_vacinacao.id_turno=slots.id_turno and convocatorias.id_slot =slots.id_slot and convocatorias.cc=pessoas.cc
    and tomas_da_vacina.id_convocatoria=convocatorias.id_convocatoria and doses.id_dose=tomas_da_vacina.id_dose
    and convocatorias.id_fase=fases.id_fase and trabalham.cc=pessoas.cc and trabalham.id_localprof=locais_de_trabalho.id_localprof
    and doses.id_frasco=frascos.id_frasco and frascos.id_lote=lotes_das_vacinas.id_lote and lotes_das_vacinas.id_vacina =vacinas.id_vacina 
    group by vacinas.nome, pessoas.nome, centros_vacinacao.morada, centros_vacinacao.concelho, fases.numero_fase, 
profissoes.profissao, locais_de_trabalho.tipo, vacinas.laboratorio
    
    
    
    order by pessoas.nome asc
;
--------------------------------------------------------
--  DDL for View VIEW_J_A2018018279
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_J_A2018018279" ("ID_CENTRO", "ID_ARMAZEM", "NUM_TRANSPORTES") AS 
  select centros_vacinacao.id_centro,
        armazens.id_armazem,
        count(transportes.id_transporte) as Num_transportes
from centros_vacinacao,armazens,transportes
where centros_vacinacao.id_centro=transportes.id_centro
and transportes.id_armazem=armazens.id_armazem
group by centros_vacinacao.id_centro, armazens.id_armazem
;
--------------------------------------------------------
--  DDL for View VIEW_J_A2018018386
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_J_A2018018386" ("NOME", "NTURNOS_REALIZADOS", "TEMPOMEDIO_ADMINISTRACAO", "NPESSOAS_VACINOU") AS 
  select enfermeiros.nome, count(responsaveis.id_enfermeiro) as NTurnos_Realizados, 
        sum(turnos_de_vacinacao.tempo_medio)/count(responsaveis.id_enfermeiro) as TempoMedio_Administracao,
        count(tomas_da_vacina.id_toma) as NPessoas_Vacinou
from pessoas, enfermeiros, responsaveis, turnos_de_vacinacao, centros_vacinacao, tomas_da_vacina, slots, convocatorias
where pessoas.cc = enfermeiros.cc
and enfermeiros.id_enfermeiro = responsaveis.id_enfermeiro
and responsaveis.id_turno = turnos_de_vacinacao.id_turno
and turnos_de_vacinacao.id_centro = centros_vacinacao.id_centro
and turnos_de_vacinacao.id_turno = slots.id_turno
and slots.id_slot = convocatorias.id_slot
and convocatorias.id_convocatoria = tomas_da_vacina.id_convocatoria

group by enfermeiros.nome
order by enfermeiros.nome
;
--------------------------------------------------------
--  DDL for View VIEW_K_A2018013160
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "LEIAABDG10"."VIEW_K_A2018013160" ("ARMAZEM_ID", "DISTRITO", "REGIAO", "NOME_VACINA", "LABORATORIO", "LOTE_VACINA", "NUMERO_DOSES_POR_LOTE", "ESPACO_LIVRE_ARMAZEM") AS 
  select  armazens.id_armazem as Armazem_Id,
        x.distrito as Distrito,
        armazens.regiao as Regiao, 
        vacinas.nome as Nome_Vacina, 
        vacinas.laboratorio as Laboratorio,
        y.lote as Lote_Vacina,
        y.dose as Numero_Doses_Por_Lote,
        x.quant as Espaco_Livre_Armazem
        
        from vacinas,lotes_das_vacinas, armazens,frascos,doses,
        (select (armazens.capacidade_maxima-sum(lotes_das_vacinas.quantidade)) as quant , armazens.distrito as distrito, armazens.morada as morada
                from armazens,lotes_das_vacinas,vacinas
                where armazens.id_armazem=lotes_das_vacinas.id_armazem 
                and lotes_das_vacinas.id_vacina=vacinas.id_vacina 
                group by armazens.capacidade_maxima, armazens.distrito, armazens.morada) x,
        
        (select count(doses.id_dose) as dose,lotes_das_vacinas.id_lote as lote
        from doses,frascos,lotes_das_vacinas,armazens
        where doses.id_frasco=frascos.id_frasco
        and doses.estado='Bom'
        and   frascos.id_lote = lotes_das_vacinas.id_lote 
        and   armazens.id_armazem=lotes_das_vacinas.id_armazem 
        group by lotes_das_vacinas.id_lote
        order by lotes_das_vacinas.id_lote asc)y
                
        where lotes_das_vacinas.id_vacina=vacinas.id_vacina 
        and   lotes_das_vacinas.id_lote=y.lote and   x.distrito=armazens.distrito
        and   armazens.id_armazem=lotes_das_vacinas.id_armazem and   armazens.morada=x.morada 
        group by armazens.id_armazem, x.distrito, armazens.regiao, vacinas.nome, vacinas.laboratorio,lotes_das_vacinas.id_lote, x.quant, x.morada, y.dose, y.lote
        order by armazens.id_armazem asc
;
