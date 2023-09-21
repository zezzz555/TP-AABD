/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 17                          */
/* Created on:     11/05/2021 18:27:19                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ABRANGID_ABRANGIDA_PROFISSO') then
    alter table ABRANGIDAS
       delete foreign key FK_ABRANGID_ABRANGIDA_PROFISSO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ABRANGID_ABRANGIDA_CRITERIO') then
    alter table ABRANGIDAS
       delete foreign key FK_ABRANGID_ABRANGIDA_CRITERIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ARMAZENA_ARMAZENAM_ARMAZENS2') then
    alter table ARMAZENAMENTO_ILHAS
       delete foreign key FK_ARMAZENA_ARMAZENAM_ARMAZENS2
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ARMAZENA_ARMAZENAM_ARMAZENS') then
    alter table ARMAZENAMENTO_ILHAS
       delete foreign key FK_ARMAZENA_ARMAZENAM_ARMAZENS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAUSAM_CAUSAM_TOMAS_DA') then
    alter table CAUSAM
       delete foreign key FK_CAUSAM_CAUSAM_TOMAS_DA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAUSAM_CAUSAM2_REACOES') then
    alter table CAUSAM
       delete foreign key FK_CAUSAM_CAUSAM2_REACOES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CENTRO_S_COMUNICA_CONVOCAT') then
    alter table CENTRO_SAUDE
       delete foreign key FK_CENTRO_S_COMUNICA_CONVOCAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONVOCAT_ENVIAM_PESSOAS') then
    alter table CONVOCATORIAS
       delete foreign key FK_CONVOCAT_ENVIAM_PESSOAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONVOCAT_PARA_TOMAS_DA') then
    alter table CONVOCATORIAS
       delete foreign key FK_CONVOCAT_PARA_TOMAS_DA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONVOCAT_RESULTAM_FASES') then
    alter table CONVOCATORIAS
       delete foreign key FK_CONVOCAT_RESULTAM_FASES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CONVOCAT_TEM_SLOTS') then
    alter table CONVOCATORIAS
       delete foreign key FK_CONVOCAT_TEM_SLOTS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CRITERIO_PERTENCEM_FASES') then
    alter table CRITERIOS
       delete foreign key FK_CRITERIO_PERTENCEM_FASES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOENCAS_PROVEM_CRITERIO') then
    alter table DOENCAS
       delete foreign key FK_DOENCAS_PROVEM_CRITERIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSES_RETIRADAS_FRASCOS') then
    alter table DOSES
       delete foreign key FK_DOSES_RETIRADAS_FRASCOS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DOSES_TOMADAS2_TOMAS_DA') then
    alter table DOSES
       delete foreign key FK_DOSES_TOMADAS2_TOMAS_DA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ENFERMEI_PODEM_SER_PESSOAS') then
    alter table ENFERMEIROS
       delete foreign key FK_ENFERMEI_PODEM_SER_PESSOAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EXERCEM_EXERCEM_PROFISSO') then
    alter table EXERCEM
       delete foreign key FK_EXERCEM_EXERCEM_PROFISSO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EXERCEM_EXERCEM2_PESSOAS') then
    alter table EXERCEM
       delete foreign key FK_EXERCEM_EXERCEM2_PESSOAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FRASCOS_LEVAM_TRANSPOR') then
    alter table FRASCOS
       delete foreign key FK_FRASCOS_LEVAM_TRANSPOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FRASCOS_PERTENCEN_LOTES_DA') then
    alter table FRASCOS
       delete foreign key FK_FRASCOS_PERTENCEN_LOTES_DA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INCLUEM_INCLUEM_CRITERIO') then
    alter table INCLUEM
       delete foreign key FK_INCLUEM_INCLUEM_CRITERIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INCLUEM_INCLUEM2_LOCAIS_D') then
    alter table INCLUEM
       delete foreign key FK_INCLUEM_INCLUEM2_LOCAIS_D
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LOTES_DA_DAS_VACINAS') then
    alter table LOTES_DAS_VACINAS
       delete foreign key FK_LOTES_DA_DAS_VACINAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LOTES_DA_GUARDADOS_ARMAZENS') then
    alter table LOTES_DAS_VACINAS
       delete foreign key FK_LOTES_DA_GUARDADOS_ARMAZENS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORIGINAR_ORIGINARA_REACOES') then
    alter table ORIGINARAM
       delete foreign key FK_ORIGINAR_ORIGINARA_REACOES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ORIGINAR_ORIGINARA_VACINAS') then
    alter table ORIGINARAM
       delete foreign key FK_ORIGINAR_ORIGINARA_VACINAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PESSOAS_REGISTRAD_CENTRO_S') then
    alter table PESSOAS
       delete foreign key FK_PESSOAS_REGISTRAD_CENTRO_S
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PODEM_GU_PODEM_GUA_VACINAS') then
    alter table PODEM_GUARDAR
       delete foreign key FK_PODEM_GU_PODEM_GUA_VACINAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PODEM_GU_PODEM_GUA_ARMAZENS') then
    alter table PODEM_GUARDAR
       delete foreign key FK_PODEM_GU_PODEM_GUA_ARMAZENS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PODEM_TE_PODEM_TER_DOENCAS') then
    alter table PODEM_TER
       delete foreign key FK_PODEM_TE_PODEM_TER_DOENCAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PODEM_TE_PODEM_TER_PESSOAS') then
    alter table PODEM_TER
       delete foreign key FK_PODEM_TE_PODEM_TER_PESSOAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESPONSA_RESPONSAV_TURNOS_D') then
    alter table RESPONSAVEIS
       delete foreign key FK_RESPONSA_RESPONSAV_TURNOS_D
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESPONSA_RESPONSAV_ENFERMEI') then
    alter table RESPONSAVEIS
       delete foreign key FK_RESPONSA_RESPONSAV_ENFERMEI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SLOTS_ESTAO_TURNOS_D') then
    alter table SLOTS
       delete foreign key FK_SLOTS_ESTAO_TURNOS_D
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TOMAS_DA_PARA2_CONVOCAT') then
    alter table TOMAS_DA_VACINA
       delete foreign key FK_TOMAS_DA_PARA2_CONVOCAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TOMAS_DA_TOMADAS_DOSES') then
    alter table TOMAS_DA_VACINA
       delete foreign key FK_TOMAS_DA_TOMADAS_DOSES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRABALHA_TRABALHAM_LOCAIS_D') then
    alter table TRABALHAM
       delete foreign key FK_TRABALHA_TRABALHAM_LOCAIS_D
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRABALHA_TRABALHAM_PESSOAS') then
    alter table TRABALHAM
       delete foreign key FK_TRABALHA_TRABALHAM_PESSOAS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRANSPOR_DOS_ARMAZENS') then
    alter table TRANSPORTES
       delete foreign key FK_TRANSPOR_DOS_ARMAZENS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TRANSPOR_PEDE_CENTROS_') then
    alter table TRANSPORTES
       delete foreign key FK_TRANSPOR_PEDE_CENTROS_
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TURNOS_D_LOCALIZA__CENTROS_') then
    alter table TURNOS_DE_VACINACAO
       delete foreign key FK_TURNOS_D_LOCALIZA__CENTROS_
end if;

drop index if exists ABRANGIDAS.ABRANGIDAS2_FK;

drop index if exists ABRANGIDAS.ABRANGIDAS_FK;

drop index if exists ABRANGIDAS.ABRANGIDAS_PK;

drop table if exists ABRANGIDAS;

drop index if exists ARMAZENAMENTO_ILHAS.ARMAZENAMENTO_ILHAS2_FK;

drop index if exists ARMAZENAMENTO_ILHAS.ARMAZENAMENTO_ILHAS_FK;

drop index if exists ARMAZENAMENTO_ILHAS.ARMAZENAMENTO_ILHAS_PK;

drop table if exists ARMAZENAMENTO_ILHAS;

drop index if exists ARMAZENS.ARMAZENS_PK;

drop table if exists ARMAZENS;

drop index if exists CAUSAM.CAUSAM2_FK;

drop index if exists CAUSAM.CAUSAM_FK;

drop index if exists CAUSAM.CAUSAM_PK;

drop table if exists CAUSAM;

drop index if exists CENTROS_VACINACAO.CENTROS_VACINACAO_PK;

drop table if exists CENTROS_VACINACAO;

drop index if exists CENTRO_SAUDE.COMUNICA_FK;

drop index if exists CENTRO_SAUDE.CENTRO_SAUDE_PK;

drop table if exists CENTRO_SAUDE;

drop index if exists CONVOCATORIAS.TEM_FK;

drop index if exists CONVOCATORIAS.RESULTAM_FK;

drop index if exists CONVOCATORIAS.PARA_FK;

drop index if exists CONVOCATORIAS.ENVIAM_FK;

drop index if exists CONVOCATORIAS.CONVOCATORIAS_PK;

drop table if exists CONVOCATORIAS;

drop index if exists CRITERIOS.PERTENCEM_FK;

drop index if exists CRITERIOS.CRITERIOS_PK;

drop table if exists CRITERIOS;

drop index if exists DOENCAS.PROVEM_FK;

drop index if exists DOENCAS.DOENCAS_PK;

drop table if exists DOENCAS;

drop index if exists DOSES.TOMADAS2_FK;

drop index if exists DOSES.RETIRADAS_FK;

drop index if exists DOSES.DOSES_PK;

drop table if exists DOSES;

drop index if exists ENFERMEIROS.PODEM_SER_FK;

drop index if exists ENFERMEIROS.ENFERMEIROS_PK;

drop table if exists ENFERMEIROS;

drop index if exists EXERCEM.EXERCEM2_FK;

drop index if exists EXERCEM.EXERCEM_FK;

drop index if exists EXERCEM.EXERCEM_PK;

drop table if exists EXERCEM;

drop index if exists FASES.FASES_PK;

drop table if exists FASES;

drop index if exists FRASCOS.LEVAM_FK;

drop index if exists FRASCOS.PERTENCENTES_FK;

drop index if exists FRASCOS.FRASCOS_PK;

drop table if exists FRASCOS;

drop index if exists INCLUEM.INCLUEM2_FK;

drop index if exists INCLUEM.INCLUEM_FK;

drop index if exists INCLUEM.INCLUEM_PK;

drop table if exists INCLUEM;

drop index if exists LOCAIS_DE_TRABALHO.LOCAIS_DE_TRABALHO_PK;

drop table if exists LOCAIS_DE_TRABALHO;

drop index if exists LOTES_DAS_VACINAS.GUARDADOS_FK;

drop index if exists LOTES_DAS_VACINAS.DAS_FK;

drop index if exists LOTES_DAS_VACINAS.LOTES_DAS_VACINAS_PK;

drop table if exists LOTES_DAS_VACINAS;

drop index if exists ORIGINARAM.ORIGINARAM2_FK;

drop index if exists ORIGINARAM.ORIGINARAM_FK;

drop index if exists ORIGINARAM.ORIGINARAM_PK;

drop table if exists ORIGINARAM;

drop index if exists PESSOAS.REGISTRADA_FK;

drop index if exists PESSOAS.PESSOAS_PK;

drop table if exists PESSOAS;

drop index if exists PODEM_GUARDAR.PODEM_GUARDAR2_FK;

drop index if exists PODEM_GUARDAR.PODEM_GUARDAR_FK;

drop index if exists PODEM_GUARDAR.PODEM_GUARDAR_PK;

drop table if exists PODEM_GUARDAR;

drop index if exists PODEM_TER.PODEM_TER2_FK;

drop index if exists PODEM_TER.PODEM_TER_FK;

drop index if exists PODEM_TER.PODEM_TER_PK;

drop table if exists PODEM_TER;

drop index if exists PROFISSOES.PROFISSOES_PK;

drop table if exists PROFISSOES;

drop index if exists REACOES.REACOES_PK;

drop table if exists REACOES;

drop index if exists RESPONSAVEIS.RESPONSAVEIS2_FK;

drop index if exists RESPONSAVEIS.RESPONSAVEIS_FK;

drop index if exists RESPONSAVEIS.RESPONSAVEIS_PK;

drop table if exists RESPONSAVEIS;

drop index if exists SLOTS.ESTAO_FK;

drop index if exists SLOTS.SLOTS_PK;

drop table if exists SLOTS;

drop index if exists TOMAS_DA_VACINA.PARA2_FK;

drop index if exists TOMAS_DA_VACINA.TOMADAS_FK;

drop index if exists TOMAS_DA_VACINA.TOMAS_DA_VACINA_PK;

drop table if exists TOMAS_DA_VACINA;

drop index if exists TRABALHAM.TRABALHAM2_FK;

drop index if exists TRABALHAM.TRABALHAM_FK;

drop index if exists TRABALHAM.TRABALHAM_PK;

drop table if exists TRABALHAM;

drop index if exists TRANSPORTES.PEDE_FK;

drop index if exists TRANSPORTES.DOS_FK;

drop index if exists TRANSPORTES.TRANSPORTES_PK;

drop table if exists TRANSPORTES;

drop index if exists TURNOS_DE_VACINACAO.LOCALIZA_SE_FK;

drop index if exists TURNOS_DE_VACINACAO.TURNOS_DE_VACINACAO_PK;

drop table if exists TURNOS_DE_VACINACAO;

drop index if exists VACINAS.VACINAS_PK;

drop table if exists VACINAS;

/*==============================================================*/
/* Table: ABRANGIDAS                                            */
/*==============================================================*/
create or replace table ABRANGIDAS 
(
   ID_PROFISSAO         integer                        not null,
   ID_CRITERIOS         integer                        not null,
   constraint PK_ABRANGIDAS primary key clustered (ID_PROFISSAO, ID_CRITERIOS)
);

/*==============================================================*/
/* Index: ABRANGIDAS_PK                                         */
/*==============================================================*/
create unique clustered index ABRANGIDAS_PK on ABRANGIDAS (
ID_PROFISSAO ASC,
ID_CRITERIOS ASC
);

/*==============================================================*/
/* Index: ABRANGIDAS_FK                                         */
/*==============================================================*/
create index ABRANGIDAS_FK on ABRANGIDAS (
ID_PROFISSAO ASC
);

/*==============================================================*/
/* Index: ABRANGIDAS2_FK                                        */
/*==============================================================*/
create index ABRANGIDAS2_FK on ABRANGIDAS (
ID_CRITERIOS ASC
);

/*==============================================================*/
/* Table: ARMAZENAMENTO_ILHAS                                   */
/*==============================================================*/
create or replace table ARMAZENAMENTO_ILHAS 
(
   ID_ARMAZEM_LHAS      integer                        not null,
   ARM_ID_ARMAZEM       integer                        not null,
   constraint PK_ARMAZENAMENTO_ILHAS primary key clustered (ID_ARMAZEM_LHAS, ARM_ID_ARMAZEM)
);

/*==============================================================*/
/* Index: ARMAZENAMENTO_ILHAS_PK                                */
/*==============================================================*/
create unique clustered index ARMAZENAMENTO_ILHAS_PK on ARMAZENAMENTO_ILHAS (
ID_ARMAZEM_LHAS ASC,
ARM_ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: ARMAZENAMENTO_ILHAS_FK                                */
/*==============================================================*/
create index ARMAZENAMENTO_ILHAS_FK on ARMAZENAMENTO_ILHAS (
ID_ARMAZEM_LHAS ASC
);

/*==============================================================*/
/* Index: ARMAZENAMENTO_ILHAS2_FK                               */
/*==============================================================*/
create index ARMAZENAMENTO_ILHAS2_FK on ARMAZENAMENTO_ILHAS (
ARM_ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: ARMAZENS                                              */
/*==============================================================*/
create or replace table ARMAZENS 
(
   ID_ARMAZEM           integer                        not null,
   MORADA               varchar(1024)                  not null,
   DISTRITO             varchar(1024)                  not null,
   REGIAO               varchar(1024)                  not null,
   CAPACIDADE_MAXIMA    numeric                        not null,
   constraint PK_ARMAZENS primary key clustered (ID_ARMAZEM)
);

/*==============================================================*/
/* Index: ARMAZENS_PK                                           */
/*==============================================================*/
create unique clustered index ARMAZENS_PK on ARMAZENS (
ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: CAUSAM                                                */
/*==============================================================*/
create or replace table CAUSAM 
(
   ID_TOMA              integer                        not null,
   ID_REACOES           integer                        not null,
   constraint PK_CAUSAM primary key clustered (ID_TOMA, ID_REACOES)
);

/*==============================================================*/
/* Index: CAUSAM_PK                                             */
/*==============================================================*/
create unique clustered index CAUSAM_PK on CAUSAM (
ID_TOMA ASC,
ID_REACOES ASC
);

/*==============================================================*/
/* Index: CAUSAM_FK                                             */
/*==============================================================*/
create index CAUSAM_FK on CAUSAM (
ID_TOMA ASC
);

/*==============================================================*/
/* Index: CAUSAM2_FK                                            */
/*==============================================================*/
create index CAUSAM2_FK on CAUSAM (
ID_REACOES ASC
);

/*==============================================================*/
/* Table: CENTROS_VACINACAO                                     */
/*==============================================================*/
create or replace table CENTROS_VACINACAO 
(
   ID_CENTRO            integer                        not null,
   MORADA               varchar(1024)                  not null,
   REGIAO               varchar(1024)                  not null,
   constraint PK_CENTROS_VACINACAO primary key clustered (ID_CENTRO)
);

/*==============================================================*/
/* Index: CENTROS_VACINACAO_PK                                  */
/*==============================================================*/
create unique clustered index CENTROS_VACINACAO_PK on CENTROS_VACINACAO (
ID_CENTRO ASC
);

/*==============================================================*/
/* Table: CENTRO_SAUDE                                          */
/*==============================================================*/
create or replace table CENTRO_SAUDE 
(
   ID_CENTROSAUDE       integer                        not null,
   ID_CONVOCATORIA      integer                        null,
   NOME                 varchar(1024)                  not null,
   MORADA               varchar(1024)                  not null,
   CONCELHO             varchar(1024)                  not null,
   TELEMOVEL            integer                        not null,
   REGIAO               varchar(1024)                  not null,
   CODIGO_POSTAL        integer                        not null,
   CIDADE               varchar(1024)                  not null,
   constraint PK_CENTRO_SAUDE primary key clustered (ID_CENTROSAUDE)
);

/*==============================================================*/
/* Index: CENTRO_SAUDE_PK                                       */
/*==============================================================*/
create unique clustered index CENTRO_SAUDE_PK on CENTRO_SAUDE (
ID_CENTROSAUDE ASC
);

/*==============================================================*/
/* Index: COMUNICA_FK                                           */
/*==============================================================*/
create index COMUNICA_FK on CENTRO_SAUDE (
ID_CONVOCATORIA ASC
);

/*==============================================================*/
/* Table: CONVOCATORIAS                                         */
/*==============================================================*/
create or replace table CONVOCATORIAS 
(
   ID_CONVOCATORIA      integer                        not null,
   ID_TOMA              integer                        null,
   ID_FASE              integer                        not null,
   ID_SLOT              integer                        not null,
   CC                   integer                        not null,
   JUSTIFICACAO         varchar(1024)                  not null,
   DATACONVOCATORIA     date                           not null,
   RESPOSTA             varchar(1024)                  not null,
   constraint PK_CONVOCATORIAS primary key clustered (ID_CONVOCATORIA)
);

/*==============================================================*/
/* Index: CONVOCATORIAS_PK                                      */
/*==============================================================*/
create unique clustered index CONVOCATORIAS_PK on CONVOCATORIAS (
ID_CONVOCATORIA ASC
);

/*==============================================================*/
/* Index: ENVIAM_FK                                             */
/*==============================================================*/
create index ENVIAM_FK on CONVOCATORIAS (
CC ASC
);

/*==============================================================*/
/* Index: PARA_FK                                               */
/*==============================================================*/
create index PARA_FK on CONVOCATORIAS (
ID_TOMA ASC
);

/*==============================================================*/
/* Index: RESULTAM_FK                                           */
/*==============================================================*/
create index RESULTAM_FK on CONVOCATORIAS (
ID_FASE ASC
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on CONVOCATORIAS (
ID_SLOT ASC
);

/*==============================================================*/
/* Table: CRITERIOS                                             */
/*==============================================================*/
create or replace table CRITERIOS 
(
   ID_CRITERIOS         integer                        not null,
   ID_FASE              integer                        null,
   INTERVALO_IDADE_INF  integer                        not null,
   INTERVALO_IDADE_SUP  integer                        not null,
   constraint PK_CRITERIOS primary key clustered (ID_CRITERIOS)
);

/*==============================================================*/
/* Index: CRITERIOS_PK                                          */
/*==============================================================*/
create unique clustered index CRITERIOS_PK on CRITERIOS (
ID_CRITERIOS ASC
);

/*==============================================================*/
/* Index: PERTENCEM_FK                                          */
/*==============================================================*/
create index PERTENCEM_FK on CRITERIOS (
ID_FASE ASC
);

/*==============================================================*/
/* Table: DOENCAS                                               */
/*==============================================================*/
create or replace table DOENCAS 
(
   ID_DOENCAS           integer                        not null,
   ID_CRITERIOS         integer                        null,
   NOME                 varchar(1024)                  not null,
   constraint PK_DOENCAS primary key clustered (ID_DOENCAS)
);

/*==============================================================*/
/* Index: DOENCAS_PK                                            */
/*==============================================================*/
create unique clustered index DOENCAS_PK on DOENCAS (
ID_DOENCAS ASC
);

/*==============================================================*/
/* Index: PROVEM_FK                                             */
/*==============================================================*/
create index PROVEM_FK on DOENCAS (
ID_CRITERIOS ASC
);

/*==============================================================*/
/* Table: DOSES                                                 */
/*==============================================================*/
create or replace table DOSES 
(
   ID_DOSE              integer                        not null,
   ID_FRASCO            integer                        not null,
   ID_TOMA              integer                        null,
   ESTADO               varchar(1024)                  not null,
   DATA_DA_DOSE         timestamp                      not null,
   constraint PK_DOSES primary key clustered (ID_DOSE)
);

/*==============================================================*/
/* Index: DOSES_PK                                              */
/*==============================================================*/
create unique clustered index DOSES_PK on DOSES (
ID_DOSE ASC
);

/*==============================================================*/
/* Index: RETIRADAS_FK                                          */
/*==============================================================*/
create index RETIRADAS_FK on DOSES (
ID_FRASCO ASC
);

/*==============================================================*/
/* Index: TOMADAS2_FK                                           */
/*==============================================================*/
create index TOMADAS2_FK on DOSES (
ID_TOMA ASC
);

/*==============================================================*/
/* Table: ENFERMEIROS                                           */
/*==============================================================*/
create or replace table ENFERMEIROS 
(
   CC                   integer                        not null,
   ID_ENFERMEIRO        integer                        not null,
   ID_CENTROSAUDE       integer                        null,
   NOME                 varchar(1024)                  not null,
   DATA_NASCIMENTO      date                           not null,
   MORADA               varchar(1024)                  not null,
   CODIGO_POSTAL        integer                        not null,
   CONCELHO             varchar(1024)                  null,
   CIDADE               varchar(1024)                  not null,
   REGIAO               varchar(1024)                  not null,
   TELEMOVEL            integer                        not null,
   EMAIL                varchar(1024)                  not null,
   constraint PK_ENFERMEIROS primary key clustered (CC, ID_ENFERMEIRO)
);

/*==============================================================*/
/* Index: ENFERMEIROS_PK                                        */
/*==============================================================*/
create unique clustered index ENFERMEIROS_PK on ENFERMEIROS (
CC ASC,
ID_ENFERMEIRO ASC
);

/*==============================================================*/
/* Index: PODEM_SER_FK                                          */
/*==============================================================*/
create index PODEM_SER_FK on ENFERMEIROS (
CC ASC
);

/*==============================================================*/
/* Table: EXERCEM                                               */
/*==============================================================*/
create or replace table EXERCEM 
(
   ID_PROFISSAO         integer                        not null,
   CC                   integer                        not null,
   constraint PK_EXERCEM primary key clustered (ID_PROFISSAO, CC)
);

/*==============================================================*/
/* Index: EXERCEM_PK                                            */
/*==============================================================*/
create unique clustered index EXERCEM_PK on EXERCEM (
ID_PROFISSAO ASC,
CC ASC
);

/*==============================================================*/
/* Index: EXERCEM_FK                                            */
/*==============================================================*/
create index EXERCEM_FK on EXERCEM (
ID_PROFISSAO ASC
);

/*==============================================================*/
/* Index: EXERCEM2_FK                                           */
/*==============================================================*/
create index EXERCEM2_FK on EXERCEM (
CC ASC
);

/*==============================================================*/
/* Table: FASES                                                 */
/*==============================================================*/
create or replace table FASES 
(
   ID_FASE              integer                        not null,
   DATA_INICIO          timestamp                      not null,
   DATA_FIM             timestamp                      not null,
   constraint PK_FASES primary key clustered (ID_FASE)
);

/*==============================================================*/
/* Index: FASES_PK                                              */
/*==============================================================*/
create unique clustered index FASES_PK on FASES (
ID_FASE ASC
);

/*==============================================================*/
/* Table: FRASCOS                                               */
/*==============================================================*/
create or replace table FRASCOS 
(
   ID_FRASCO            integer                        not null,
   ID_TRANSPORTE        integer                        not null,
   ID_LOTE              integer                        not null,
   LOCALIZACAO          varchar(1024)                  not null,
   DATA_DE_ABERTURA     timestamp                      not null,
   ESTADO               varchar(1024)                  not null,
   DATA_PRODUCAO        timestamp                      not null,
   VALIDADE             timestamp                      not null,
   constraint PK_FRASCOS primary key clustered (ID_FRASCO)
);

/*==============================================================*/
/* Index: FRASCOS_PK                                            */
/*==============================================================*/
create unique clustered index FRASCOS_PK on FRASCOS (
ID_FRASCO ASC
);

/*==============================================================*/
/* Index: PERTENCENTES_FK                                       */
/*==============================================================*/
create index PERTENCENTES_FK on FRASCOS (
ID_LOTE ASC
);

/*==============================================================*/
/* Index: LEVAM_FK                                              */
/*==============================================================*/
create index LEVAM_FK on FRASCOS (
ID_TRANSPORTE ASC
);

/*==============================================================*/
/* Table: INCLUEM                                               */
/*==============================================================*/
create or replace table INCLUEM 
(
   ID_CRITERIOS         integer                        not null,
   ID_LOCALPROF         integer                        not null,
   constraint PK_INCLUEM primary key clustered (ID_CRITERIOS, ID_LOCALPROF)
);

/*==============================================================*/
/* Index: INCLUEM_PK                                            */
/*==============================================================*/
create unique clustered index INCLUEM_PK on INCLUEM (
ID_CRITERIOS ASC,
ID_LOCALPROF ASC
);

/*==============================================================*/
/* Index: INCLUEM_FK                                            */
/*==============================================================*/
create index INCLUEM_FK on INCLUEM (
ID_CRITERIOS ASC
);

/*==============================================================*/
/* Index: INCLUEM2_FK                                           */
/*==============================================================*/
create index INCLUEM2_FK on INCLUEM (
ID_LOCALPROF ASC
);

/*==============================================================*/
/* Table: LOCAIS_DE_TRABALHO                                    */
/*==============================================================*/
create or replace table LOCAIS_DE_TRABALHO 
(
   ID_LOCALPROF         integer                        not null,
   LOCAL_TRABALHO       varchar(1024)                  not null,
   constraint PK_LOCAIS_DE_TRABALHO primary key clustered (ID_LOCALPROF)
);

/*==============================================================*/
/* Index: LOCAIS_DE_TRABALHO_PK                                 */
/*==============================================================*/
create unique clustered index LOCAIS_DE_TRABALHO_PK on LOCAIS_DE_TRABALHO (
ID_LOCALPROF ASC
);

/*==============================================================*/
/* Table: LOTES_DAS_VACINAS                                     */
/*==============================================================*/
create or replace table LOTES_DAS_VACINAS 
(
   ID_LOTE              integer                        not null,
   ID_VACINA            integer                        not null,
   ID_ARMAZEM           integer                        null,
   QUANTIDADE           integer                        not null,
   DATA_PRODUCAO        timestamp                      not null,
   constraint PK_LOTES_DAS_VACINAS primary key clustered (ID_LOTE)
);

/*==============================================================*/
/* Index: LOTES_DAS_VACINAS_PK                                  */
/*==============================================================*/
create unique clustered index LOTES_DAS_VACINAS_PK on LOTES_DAS_VACINAS (
ID_LOTE ASC
);

/*==============================================================*/
/* Index: DAS_FK                                                */
/*==============================================================*/
create index DAS_FK on LOTES_DAS_VACINAS (
ID_VACINA ASC
);

/*==============================================================*/
/* Index: GUARDADOS_FK                                          */
/*==============================================================*/
create index GUARDADOS_FK on LOTES_DAS_VACINAS (
ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: ORIGINARAM                                            */
/*==============================================================*/
create or replace table ORIGINARAM 
(
   ID_REACOES           integer                        not null,
   ID_VACINA            integer                        not null,
   constraint PK_ORIGINARAM primary key clustered (ID_REACOES, ID_VACINA)
);

/*==============================================================*/
/* Index: ORIGINARAM_PK                                         */
/*==============================================================*/
create unique clustered index ORIGINARAM_PK on ORIGINARAM (
ID_REACOES ASC,
ID_VACINA ASC
);

/*==============================================================*/
/* Index: ORIGINARAM_FK                                         */
/*==============================================================*/
create index ORIGINARAM_FK on ORIGINARAM (
ID_REACOES ASC
);

/*==============================================================*/
/* Index: ORIGINARAM2_FK                                        */
/*==============================================================*/
create index ORIGINARAM2_FK on ORIGINARAM (
ID_VACINA ASC
);

/*==============================================================*/
/* Table: PESSOAS                                               */
/*==============================================================*/
create or replace table PESSOAS 
(
   CC                   integer                        not null,
   ID_CENTROSAUDE       integer                        not null,
   NOME                 varchar(1024)                  not null,
   DATA_NASCIMENTO      date                           not null,
   MORADA               varchar(1024)                  not null,
   CODIGO_POSTAL        integer                        not null,
   CONCELHO             varchar(1024)                  null,
   CIDADE               varchar(1024)                  not null,
   REGIAO               varchar(1024)                  not null,
   TELEMOVEL            integer                        not null,
   EMAIL                varchar(1024)                  not null,
   constraint PK_PESSOAS primary key clustered (CC)
);

/*==============================================================*/
/* Index: PESSOAS_PK                                            */
/*==============================================================*/
create unique clustered index PESSOAS_PK on PESSOAS (
CC ASC
);

/*==============================================================*/
/* Index: REGISTRADA_FK                                         */
/*==============================================================*/
create index REGISTRADA_FK on PESSOAS (
ID_CENTROSAUDE ASC
);

/*==============================================================*/
/* Table: PODEM_GUARDAR                                         */
/*==============================================================*/
create or replace table PODEM_GUARDAR 
(
   ID_VACINA            integer                        not null,
   ID_ARMAZEM           integer                        not null,
   constraint PK_PODEM_GUARDAR primary key clustered (ID_VACINA, ID_ARMAZEM)
);

/*==============================================================*/
/* Index: PODEM_GUARDAR_PK                                      */
/*==============================================================*/
create unique clustered index PODEM_GUARDAR_PK on PODEM_GUARDAR (
ID_VACINA ASC,
ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: PODEM_GUARDAR_FK                                      */
/*==============================================================*/
create index PODEM_GUARDAR_FK on PODEM_GUARDAR (
ID_VACINA ASC
);

/*==============================================================*/
/* Index: PODEM_GUARDAR2_FK                                     */
/*==============================================================*/
create index PODEM_GUARDAR2_FK on PODEM_GUARDAR (
ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: PODEM_TER                                             */
/*==============================================================*/
create or replace table PODEM_TER 
(
   ID_DOENCAS           integer                        not null,
   CC                   integer                        not null,
   constraint PK_PODEM_TER primary key clustered (ID_DOENCAS, CC)
);

/*==============================================================*/
/* Index: PODEM_TER_PK                                          */
/*==============================================================*/
create unique clustered index PODEM_TER_PK on PODEM_TER (
ID_DOENCAS ASC,
CC ASC
);

/*==============================================================*/
/* Index: PODEM_TER_FK                                          */
/*==============================================================*/
create index PODEM_TER_FK on PODEM_TER (
ID_DOENCAS ASC
);

/*==============================================================*/
/* Index: PODEM_TER2_FK                                         */
/*==============================================================*/
create index PODEM_TER2_FK on PODEM_TER (
CC ASC
);

/*==============================================================*/
/* Table: PROFISSOES                                            */
/*==============================================================*/
create or replace table PROFISSOES 
(
   ID_PROFISSAO         integer                        not null,
   PROFISSAO            varchar(1024)                  not null,
   constraint PK_PROFISSOES primary key clustered (ID_PROFISSAO)
);

/*==============================================================*/
/* Index: PROFISSOES_PK                                         */
/*==============================================================*/
create unique clustered index PROFISSOES_PK on PROFISSOES (
ID_PROFISSAO ASC
);

/*==============================================================*/
/* Table: REACOES                                               */
/*==============================================================*/
create or replace table REACOES 
(
   ID_REACOES           integer                        not null,
   AVALIACAO            varchar(1024)                  not null,
   constraint PK_REACOES primary key clustered (ID_REACOES)
);

/*==============================================================*/
/* Index: REACOES_PK                                            */
/*==============================================================*/
create unique clustered index REACOES_PK on REACOES (
ID_REACOES ASC
);

/*==============================================================*/
/* Table: RESPONSAVEIS                                          */
/*==============================================================*/
create or replace table RESPONSAVEIS 
(
   ID_TURNO             integer                        not null,
   CC                   integer                        not null,
   ID_ENFERMEIRO        integer                        not null,
   constraint PK_RESPONSAVEIS primary key clustered (ID_TURNO, CC, ID_ENFERMEIRO)
);

/*==============================================================*/
/* Index: RESPONSAVEIS_PK                                       */
/*==============================================================*/
create unique clustered index RESPONSAVEIS_PK on RESPONSAVEIS (
ID_TURNO ASC,
CC ASC,
ID_ENFERMEIRO ASC
);

/*==============================================================*/
/* Index: RESPONSAVEIS_FK                                       */
/*==============================================================*/
create index RESPONSAVEIS_FK on RESPONSAVEIS (
ID_TURNO ASC
);

/*==============================================================*/
/* Index: RESPONSAVEIS2_FK                                      */
/*==============================================================*/
create index RESPONSAVEIS2_FK on RESPONSAVEIS (
CC ASC,
ID_ENFERMEIRO ASC
);

/*==============================================================*/
/* Table: SLOTS                                                 */
/*==============================================================*/
create or replace table SLOTS 
(
   ID_SLOT              integer                        not null,
   ID_TURNO             integer                        not null,
   HORA_ESCOLHIDA       time                           not null,
   constraint PK_SLOTS primary key clustered (ID_SLOT)
);

/*==============================================================*/
/* Index: SLOTS_PK                                              */
/*==============================================================*/
create unique clustered index SLOTS_PK on SLOTS (
ID_SLOT ASC
);

/*==============================================================*/
/* Index: ESTAO_FK                                              */
/*==============================================================*/
create index ESTAO_FK on SLOTS (
ID_TURNO ASC
);

/*==============================================================*/
/* Table: TOMAS_DA_VACINA                                       */
/*==============================================================*/
create or replace table TOMAS_DA_VACINA 
(
   ID_TOMA              integer                        not null,
   ID_CONVOCATORIA      integer                        not null,
   ID_DOSE              integer                        not null,
   DATATOMA             timestamp                      not null,
   DOSE                 integer                        not null,
   constraint PK_TOMAS_DA_VACINA primary key clustered (ID_TOMA)
);

/*==============================================================*/
/* Index: TOMAS_DA_VACINA_PK                                    */
/*==============================================================*/
create unique clustered index TOMAS_DA_VACINA_PK on TOMAS_DA_VACINA (
ID_TOMA ASC
);

/*==============================================================*/
/* Index: TOMADAS_FK                                            */
/*==============================================================*/
create index TOMADAS_FK on TOMAS_DA_VACINA (
ID_DOSE ASC
);

/*==============================================================*/
/* Index: PARA2_FK                                              */
/*==============================================================*/
create index PARA2_FK on TOMAS_DA_VACINA (
ID_CONVOCATORIA ASC
);

/*==============================================================*/
/* Table: TRABALHAM                                             */
/*==============================================================*/
create or replace table TRABALHAM 
(
   ID_LOCALPROF         integer                        not null,
   CC                   integer                        not null,
   constraint PK_TRABALHAM primary key clustered (ID_LOCALPROF, CC)
);

/*==============================================================*/
/* Index: TRABALHAM_PK                                          */
/*==============================================================*/
create unique clustered index TRABALHAM_PK on TRABALHAM (
ID_LOCALPROF ASC,
CC ASC
);

/*==============================================================*/
/* Index: TRABALHAM_FK                                          */
/*==============================================================*/
create index TRABALHAM_FK on TRABALHAM (
ID_LOCALPROF ASC
);

/*==============================================================*/
/* Index: TRABALHAM2_FK                                         */
/*==============================================================*/
create index TRABALHAM2_FK on TRABALHAM (
CC ASC
);

/*==============================================================*/
/* Table: TRANSPORTES                                           */
/*==============================================================*/
create or replace table TRANSPORTES 
(
   ID_TRANSPORTE        integer                        not null,
   ID_CENTRO            integer                        not null,
   ID_ARMAZEM           integer                        not null,
   DATA                 date                           not null,
   constraint PK_TRANSPORTES primary key clustered (ID_TRANSPORTE)
);

/*==============================================================*/
/* Index: TRANSPORTES_PK                                        */
/*==============================================================*/
create unique clustered index TRANSPORTES_PK on TRANSPORTES (
ID_TRANSPORTE ASC
);

/*==============================================================*/
/* Index: DOS_FK                                                */
/*==============================================================*/
create index DOS_FK on TRANSPORTES (
ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: PEDE_FK                                               */
/*==============================================================*/
create index PEDE_FK on TRANSPORTES (
ID_CENTRO ASC
);

/*==============================================================*/
/* Table: TURNOS_DE_VACINACAO                                   */
/*==============================================================*/
create or replace table TURNOS_DE_VACINACAO 
(
   ID_TURNO             integer                        not null,
   ID_CENTRO            integer                        not null,
   DATA_INICIO          timestamp                      not null,
   DATA_FIM             timestamp                      not null,
   TEMPO_MEDIO          numeric                        not null,
   constraint PK_TURNOS_DE_VACINACAO primary key clustered (ID_TURNO)
);

/*==============================================================*/
/* Index: TURNOS_DE_VACINACAO_PK                                */
/*==============================================================*/
create unique clustered index TURNOS_DE_VACINACAO_PK on TURNOS_DE_VACINACAO (
ID_TURNO ASC
);

/*==============================================================*/
/* Index: LOCALIZA_SE_FK                                        */
/*==============================================================*/
create index LOCALIZA_SE_FK on TURNOS_DE_VACINACAO (
ID_CENTRO ASC
);

/*==============================================================*/
/* Table: VACINAS                                               */
/*==============================================================*/
create or replace table VACINAS 
(
   ID_VACINA            integer                        not null,
   MARCA                varchar(1024)                  not null,
   INTERVALODOSE        timestamp                      not null,
   TEMPO_APOS_ABERTURA  integer                        not null,
   NOME                 varchar(1024)                  not null,
   LABORATORIO          varchar(1024)                  not null,
   DATA_APROVACAO       date                           not null,
   NUM_DOSES            integer                        not null,
   constraint PK_VACINAS primary key clustered (ID_VACINA)
);

/*==============================================================*/
/* Index: VACINAS_PK                                            */
/*==============================================================*/
create unique clustered index VACINAS_PK on VACINAS (
ID_VACINA ASC
);

alter table ABRANGIDAS
   add constraint FK_ABRANGID_ABRANGIDA_PROFISSO foreign key (ID_PROFISSAO)
      references PROFISSOES (ID_PROFISSAO)
      on update restrict
      on delete restrict;

alter table ABRANGIDAS
   add constraint FK_ABRANGID_ABRANGIDA_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS)
      on update restrict
      on delete restrict;

alter table ARMAZENAMENTO_ILHAS
   add constraint FK_ARMAZENA_ARMAZENAM_ARMAZENS2 foreign key (ID_ARMAZEM_LHAS)
      references ARMAZENS (ID_ARMAZEM)
      on update restrict
      on delete restrict;

alter table ARMAZENAMENTO_ILHAS
   add constraint FK_ARMAZENA_ARMAZENAM_ARMAZENS foreign key (ARM_ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM)
      on update restrict
      on delete restrict;

alter table CAUSAM
   add constraint FK_CAUSAM_CAUSAM_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA)
      on update restrict
      on delete restrict;

alter table CAUSAM
   add constraint FK_CAUSAM_CAUSAM2_REACOES foreign key (ID_REACOES)
      references REACOES (ID_REACOES)
      on update restrict
      on delete restrict;

alter table CENTRO_SAUDE
   add constraint FK_CENTRO_S_COMUNICA_CONVOCAT foreign key (ID_CONVOCATORIA)
      references CONVOCATORIAS (ID_CONVOCATORIA)
      on update restrict
      on delete restrict;

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_ENVIAM_PESSOAS foreign key (CC)
      references PESSOAS (CC)
      on update restrict
      on delete restrict;

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_PARA_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA)
      on update restrict
      on delete restrict;

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_RESULTAM_FASES foreign key (ID_FASE)
      references FASES (ID_FASE)
      on update restrict
      on delete restrict;

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_TEM_SLOTS foreign key (ID_SLOT)
      references SLOTS (ID_SLOT)
      on update restrict
      on delete restrict;

alter table CRITERIOS
   add constraint FK_CRITERIO_PERTENCEM_FASES foreign key (ID_FASE)
      references FASES (ID_FASE)
      on update restrict
      on delete restrict;

alter table DOENCAS
   add constraint FK_DOENCAS_PROVEM_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS)
      on update restrict
      on delete restrict;

alter table DOSES
   add constraint FK_DOSES_RETIRADAS_FRASCOS foreign key (ID_FRASCO)
      references FRASCOS (ID_FRASCO)
      on update restrict
      on delete restrict;

alter table DOSES
   add constraint FK_DOSES_TOMADAS2_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA)
      on update restrict
      on delete restrict;

alter table ENFERMEIROS
   add constraint FK_ENFERMEI_PODEM_SER_PESSOAS foreign key (CC)
      references PESSOAS (CC)
      on update restrict
      on delete restrict;

alter table EXERCEM
   add constraint FK_EXERCEM_EXERCEM_PROFISSO foreign key (ID_PROFISSAO)
      references PROFISSOES (ID_PROFISSAO)
      on update restrict
      on delete restrict;

alter table EXERCEM
   add constraint FK_EXERCEM_EXERCEM2_PESSOAS foreign key (CC)
      references PESSOAS (CC)
      on update restrict
      on delete restrict;

alter table FRASCOS
   add constraint FK_FRASCOS_LEVAM_TRANSPOR foreign key (ID_TRANSPORTE)
      references TRANSPORTES (ID_TRANSPORTE)
      on update restrict
      on delete restrict;

alter table FRASCOS
   add constraint FK_FRASCOS_PERTENCEN_LOTES_DA foreign key (ID_LOTE)
      references LOTES_DAS_VACINAS (ID_LOTE)
      on update restrict
      on delete restrict;

alter table INCLUEM
   add constraint FK_INCLUEM_INCLUEM_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS)
      on update restrict
      on delete restrict;

alter table INCLUEM
   add constraint FK_INCLUEM_INCLUEM2_LOCAIS_D foreign key (ID_LOCALPROF)
      references LOCAIS_DE_TRABALHO (ID_LOCALPROF)
      on update restrict
      on delete restrict;

alter table LOTES_DAS_VACINAS
   add constraint FK_LOTES_DA_DAS_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA)
      on update restrict
      on delete restrict;

alter table LOTES_DAS_VACINAS
   add constraint FK_LOTES_DA_GUARDADOS_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM)
      on update restrict
      on delete restrict;

alter table ORIGINARAM
   add constraint FK_ORIGINAR_ORIGINARA_REACOES foreign key (ID_REACOES)
      references REACOES (ID_REACOES)
      on update restrict
      on delete restrict;

alter table ORIGINARAM
   add constraint FK_ORIGINAR_ORIGINARA_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA)
      on update restrict
      on delete restrict;

alter table PESSOAS
   add constraint FK_PESSOAS_REGISTRAD_CENTRO_S foreign key (ID_CENTROSAUDE)
      references CENTRO_SAUDE (ID_CENTROSAUDE)
      on update restrict
      on delete restrict;

alter table PODEM_GUARDAR
   add constraint FK_PODEM_GU_PODEM_GUA_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA)
      on update restrict
      on delete restrict;

alter table PODEM_GUARDAR
   add constraint FK_PODEM_GU_PODEM_GUA_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM)
      on update restrict
      on delete restrict;

alter table PODEM_TER
   add constraint FK_PODEM_TE_PODEM_TER_DOENCAS foreign key (ID_DOENCAS)
      references DOENCAS (ID_DOENCAS)
      on update restrict
      on delete restrict;

alter table PODEM_TER
   add constraint FK_PODEM_TE_PODEM_TER_PESSOAS foreign key (CC)
      references PESSOAS (CC)
      on update restrict
      on delete restrict;

alter table RESPONSAVEIS
   add constraint FK_RESPONSA_RESPONSAV_TURNOS_D foreign key (ID_TURNO)
      references TURNOS_DE_VACINACAO (ID_TURNO)
      on update restrict
      on delete restrict;

alter table RESPONSAVEIS
   add constraint FK_RESPONSA_RESPONSAV_ENFERMEI foreign key (CC, ID_ENFERMEIRO)
      references ENFERMEIROS (CC, ID_ENFERMEIRO)
      on update restrict
      on delete restrict;

alter table SLOTS
   add constraint FK_SLOTS_ESTAO_TURNOS_D foreign key (ID_TURNO)
      references TURNOS_DE_VACINACAO (ID_TURNO)
      on update restrict
      on delete restrict;

alter table TOMAS_DA_VACINA
   add constraint FK_TOMAS_DA_PARA2_CONVOCAT foreign key (ID_CONVOCATORIA)
      references CONVOCATORIAS (ID_CONVOCATORIA)
      on update restrict
      on delete restrict;

alter table TOMAS_DA_VACINA
   add constraint FK_TOMAS_DA_TOMADAS_DOSES foreign key (ID_DOSE)
      references DOSES (ID_DOSE)
      on update restrict
      on delete restrict;

alter table TRABALHAM
   add constraint FK_TRABALHA_TRABALHAM_LOCAIS_D foreign key (ID_LOCALPROF)
      references LOCAIS_DE_TRABALHO (ID_LOCALPROF)
      on update restrict
      on delete restrict;

alter table TRABALHAM
   add constraint FK_TRABALHA_TRABALHAM_PESSOAS foreign key (CC)
      references PESSOAS (CC)
      on update restrict
      on delete restrict;

alter table TRANSPORTES
   add constraint FK_TRANSPOR_DOS_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM)
      on update restrict
      on delete restrict;

alter table TRANSPORTES
   add constraint FK_TRANSPOR_PEDE_CENTROS_ foreign key (ID_CENTRO)
      references CENTROS_VACINACAO (ID_CENTRO)
      on update restrict
      on delete restrict;

alter table TURNOS_DE_VACINACAO
   add constraint FK_TURNOS_D_LOCALIZA__CENTROS_ foreign key (ID_CENTRO)
      references CENTROS_VACINACAO (ID_CENTRO)
      on update restrict
      on delete restrict;

