/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     09/04/2021 19:40:54                          */
/*==============================================================*/
alter table CONVOCATORIA
   drop constraint FK_CONVOCAT_ENVIA_PESSOA;

alter table CONVOCATORIA
   drop constraint FK_CONVOCAT_PARA_TOMADAVA;

alter table CONVOCATORIA
   drop constraint FK_CONVOCAT_RESULTA_FASE;

alter table CONVOCATORIA
   drop constraint FK_CONVOCAT_TEM_SLOTS;

alter table CRITERIOS
   drop constraint FK_CRITERIO_PERTENCEM_FASE;

alter table DOSE
   drop constraint FK_DOSE_RETIRADA_FRASCO;

alter table DOSE
   drop constraint FK_DOSE_TOMADA2_TOMADAVA;

alter table ENFERMEIRO
   drop constraint FK_ENFERMEI_PODE_SER_PESSOA;

alter table ENSAIOS_CLINICOS
   drop constraint FK_ENSAIOS__TESTADA_VACINA;

alter table ESTAO
   drop constraint FK_ESTAO_ESTAO_SLOTS;

alter table ESTAO
   drop constraint FK_ESTAO_ESTAO2_TURNO_DE;

alter table FRASCO
   drop constraint FK_FRASCO_LEVA_TRANSPOR;

alter table FRASCO
   drop constraint FK_FRASCO_PERTENCEN_LOTE_DA_;

alter table GUARDADA
   drop constraint FK_GUARDADA_GUARDADA_VACINA;

alter table GUARDADA
   drop constraint FK_GUARDADA_GUARDADA2_ARMAZEM;

alter table LOTE_DA_VACINA
   drop constraint FK_LOTE_DA__PERTENCE_VACINA;

alter table PODE_LEVAR
   drop constraint FK_PODE_LEV_PODE_LEVA_ARMAZEM;

alter table PODE_LEVAR
   drop constraint FK_PODE_LEV_PODE_LEVA_ARMAZEM_;

alter table PODE_TER
   drop constraint FK_PODE_TER_PODE_TER_DOENCAS;

alter table PODE_TER
   drop constraint FK_PODE_TER_PODE_TER2_PESSOA;

alter table PROVEM
   drop constraint FK_PROVEM_PROVEM_DOENCAS;

alter table PROVEM
   drop constraint FK_PROVEM_PROVEM2_CRITERIO;

alter table REACOES
   drop constraint FK_REACOES_CAUSA_TOMADAVA;

alter table RESPONSAVEL
   drop constraint FK_RESPONSA_RESPONSAV_TURNO_DE;

alter table RESPONSAVEL
   drop constraint FK_RESPONSA_RESPONSAV_ENFERMEI;

alter table TOMADAVACINA
   drop constraint FK_TOMADAVA_PARA2_CONVOCAT;

alter table TOMADAVACINA
   drop constraint FK_TOMADAVA_TOMADA_DOSE;

alter table TRANSPORTE
   drop constraint FK_TRANSPOR_DO_ARMAZEM;

alter table TRANSPORTE
   drop constraint FK_TRANSPOR_PEDE_CENTRO_V;

alter table TURNO_DE_VACINACAO
   drop constraint FK_TURNO_DE_LOCALIZA__CENTRO_V;

drop table ARMAZEM cascade constraints;

drop table ARMAZEM_ILHAS cascade constraints;

drop table CENTRO_VACINACAO cascade constraints;

drop index TEM_FK;

drop index RESULTA_FK;

drop index PARA_FK;

drop index ENVIA_FK;

drop table CONVOCATORIA cascade constraints;

drop index PERTENCEM_FK;

drop table CRITERIOS cascade constraints;

drop index PROVEM_FK;

drop table DOENCAS cascade constraints;

drop index TOMADA2_FK;

drop index RETIRADA_FK;

drop table DOSE cascade constraints;

drop index PODE_SER_FK;

drop table ENFERMEIRO cascade constraints;

drop index TESTADA_FK;

drop table ENSAIOS_CLINICOS cascade constraints;

drop index ESTAO2_FK;

drop index ESTAO_FK;

drop table ESTAO cascade constraints;

drop table FASE cascade constraints;

drop index LEVA_FK;

drop index PERTENCENTE_FK;

drop table FRASCO cascade constraints;

drop index GUARDADA2_FK;

drop index GUARDADA_FK;

drop table GUARDADA cascade constraints;

drop index PERTENCE_FK;

drop table LOTE_DA_VACINA cascade constraints;

drop table PESSOA cascade constraints;

drop index PODE_LEVAR2_FK;

drop index PODE_LEVAR_FK;

drop table PODE_LEVAR cascade constraints;

drop index PODE_TER2_FK;

drop index PODE_TER_FK;

drop table PODE_TER cascade constraints;

drop table PROVEM cascade constraints;

drop index CAUSA_FK;

drop table REACOES cascade constraints;

drop index RESPONSAVEL2_FK;

drop index RESPONSAVEL_FK;

drop table RESPONSAVEL cascade constraints;

drop table SLOTS cascade constraints;

drop index PARA2_FK;

drop index TOMADA_FK;

drop table TOMADAVACINA cascade constraints;

drop index PEDE_FK;

drop index DO_FK;

drop table TRANSPORTE cascade constraints;

drop index LOCALIZA_SE_FK;

drop table TURNO_DE_VACINACAO cascade constraints;

drop table VACINA cascade constraints;

/*==============================================================*/
/* Table: ARMAZEM                                               */
/*==============================================================*/
create table ARMAZEM 
(
   ID_ARMAZEM           INTEGER              not null,
   MORADA               VARCHAR2(1024)       not null,
   DISTRITO             VARCHAR2(1024)       not null,
   constraint PK_ARMAZEM primary key (ID_ARMAZEM)
);

/*==============================================================*/
/* Table: ARMAZEM_ILHAS                                         */
/*==============================================================*/
create table ARMAZEM_ILHAS 
(
   ID_ILHAS             INTEGER              not null,
   MORADA               VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   constraint PK_ARMAZEM_ILHAS primary key (ID_ILHAS)
);

/*==============================================================*/
/* Table: CENTRO_VACINACAO                                      */
/*==============================================================*/
create table CENTRO_VACINACAO 
(
   ID_CENTRO            INTEGER              not null,
   MORADA               VARCHAR2(1024)       not null,
   CONCELHO             VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   constraint PK_CENTRO_VACINACAO primary key (ID_CENTRO)
);

/*==============================================================*/
/* Table: CONVOCATORIA                                          */
/*==============================================================*/
create table CONVOCATORIA 
(
   ID_CONVOCATORIA      INTEGER              not null,
   ID_TOMA              INTEGER,
   ID_FASE              INTEGER              not null,
   ID_SLOT              INTEGER              not null,
   CC                   INTEGER              not null,
   JUSTIFICACAO         VARCHAR2(1024)       not null,
   DATACONVOCATORIA     DATE                 not null,
   RESPOSTA             SMALLINT             not null,
   constraint PK_CONVOCATORIA primary key (ID_CONVOCATORIA)
);

/*==============================================================*/
/* Index: ENVIA_FK                                              */
/*==============================================================*/
create index ENVIA_FK on CONVOCATORIA (
   CC ASC
);

/*==============================================================*/
/* Index: PARA_FK                                               */
/*==============================================================*/
create index PARA_FK on CONVOCATORIA (
   ID_TOMA ASC
);

/*==============================================================*/
/* Index: RESULTA_FK                                            */
/*==============================================================*/
create index RESULTA_FK on CONVOCATORIA (
   ID_FASE ASC
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on CONVOCATORIA (
   ID_SLOT ASC
);

/*==============================================================*/
/* Table: CRITERIOS                                             */
/*==============================================================*/
create table CRITERIOS 
(
   ID_CRITERIOS         INTEGER              not null,
   ID_FASE              INTEGER,
   DOENCAS              CLOB                 not null,
   PROFISSAO            VARCHAR2(1024)       not null,
   INTERVALO_IDADE_INF  INTEGER              not null,
   INTERVALO_IDADE_SUP  INTEGER              not null,
   constraint PK_CRITERIOS primary key (ID_CRITERIOS)
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
create table DOENCAS 
(
   ID_DOENCAS           INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   constraint PK_DOENCAS primary key (ID_DOENCAS)
);

/*==============================================================*/
/* Index: PROVEM_FK                                             */
/*==============================================================*/
create index PROVEM_FK on DOENCAS (
   PROVEM_PK ASC,
   PROVEM_FK ASC,
   PROVEM2_FK ASC
);

/*==============================================================*/
/* Table: DOSE                                                  */
/*==============================================================*/
create table DOSE 
(
   ID_DOSE              INTEGER              not null,
   ID_FRASCO            INTEGER              not null,
   ID_TOMA              INTEGER,
   ESTADO               VARCHAR2(1024)       not null,
   constraint PK_DOSE primary key (ID_DOSE)
);

/*==============================================================*/
/* Index: RETIRADA_FK                                           */
/*==============================================================*/
create index RETIRADA_FK on DOSE (
   ID_FRASCO ASC
);

/*==============================================================*/
/* Index: TOMADA2_FK                                            */
/*==============================================================*/
create index TOMADA2_FK on DOSE (
   ID_TOMA ASC
);

/*==============================================================*/
/* Table: ENFERMEIRO                                            */
/*==============================================================*/
create table ENFERMEIRO 
(
   CC                   INTEGER              not null,
   ID_ENFERMEIRO        INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   DATA_NASCIMENTO      DATE                 not null,
   PROFISSAO            VARCHAR2(1024)       not null,
   MORADA               VARCHAR2(1024)       not null,
   CODIGO_POSTAL        INTEGER              not null,
   CIDADE               VARCHAR2(1024)       not null,
   TELEMOVEL            INTEGER              not null,
   EMAIL                VARCHAR2(1024)       not null,
   LOCAL_TRABALHO       VARCHAR2(1024)       not null,
   constraint PK_ENFERMEIRO primary key (CC, ID_ENFERMEIRO)
);

/*==============================================================*/
/* Index: PODE_SER_FK                                           */
/*==============================================================*/
create index PODE_SER_FK on ENFERMEIRO (
   CC ASC
);

/*==============================================================*/
/* Table: ENSAIOS_CLINICOS                                      */
/*==============================================================*/
create table ENSAIOS_CLINICOS 
(
   ID_ENSAIO            INTEGER              not null,
   ID_VACINA            INTEGER              not null,
   RECOES               VARCHAR2(1024)       not null,
   constraint PK_ENSAIOS_CLINICOS primary key (ID_ENSAIO)
);

/*==============================================================*/
/* Index: TESTADA_FK                                            */
/*==============================================================*/
create index TESTADA_FK on ENSAIOS_CLINICOS (
   ID_VACINA ASC
);

/*==============================================================*/
/* Table: ESTAO                                                 */
/*==============================================================*/
create table ESTAO 
(
   ID_SLOT              INTEGER              not null,
   ID_TURNO             INTEGER              not null,
   constraint PK_ESTAO primary key (ID_SLOT, ID_TURNO)
);

/*==============================================================*/
/* Index: ESTAO_FK                                              */
/*==============================================================*/
create index ESTAO_FK on ESTAO (
   ID_SLOT ASC
);

/*==============================================================*/
/* Index: ESTAO2_FK                                             */
/*==============================================================*/
create index ESTAO2_FK on ESTAO (
   ID_TURNO ASC
);

/*==============================================================*/
/* Table: FASE                                                  */
/*==============================================================*/
create table FASE 
(
   ID_FASE              INTEGER              not null,
   DATA_INICIO          DATE                 not null,
   DATA_FIM             DATE                 not null,
   constraint PK_FASE primary key (ID_FASE)
);

/*==============================================================*/
/* Table: FRASCO                                                */
/*==============================================================*/
create table FRASCO 
(
   ID_FRASCO            INTEGER              not null,
   ID_TRANSPORTE        INTEGER              not null,
   ID_LOTE              INTEGER              not null,
   LOCALIZACAO          VARCHAR2(1024)       not null,
   DATA_DE_ABERTURA     DATE                 not null,
   ESTADO               VARCHAR2(1024)       not null,
   constraint PK_FRASCO primary key (ID_FRASCO)
);

/*==============================================================*/
/* Index: PERTENCENTE_FK                                        */
/*==============================================================*/
create index PERTENCENTE_FK on FRASCO (
   ID_LOTE ASC
);

/*==============================================================*/
/* Index: LEVA_FK                                               */
/*==============================================================*/
create index LEVA_FK on FRASCO (
   ID_TRANSPORTE ASC
);

/*==============================================================*/
/* Table: GUARDADA                                              */
/*==============================================================*/
create table GUARDADA 
(
   ID_VACINA            INTEGER              not null,
   ID_ARMAZEM           INTEGER              not null,
   constraint PK_GUARDADA primary key (ID_VACINA, ID_ARMAZEM)
);

/*==============================================================*/
/* Index: GUARDADA_FK                                           */
/*==============================================================*/
create index GUARDADA_FK on GUARDADA (
   ID_VACINA ASC
);

/*==============================================================*/
/* Index: GUARDADA2_FK                                          */
/*==============================================================*/
create index GUARDADA2_FK on GUARDADA (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Table: LOTE_DA_VACINA                                        */
/*==============================================================*/
create table LOTE_DA_VACINA 
(
   ID_LOTE              INTEGER              not null,
   ID_VACINA            INTEGER              not null,
   QUANTIDADE           INTEGER              not null,
   constraint PK_LOTE_DA_VACINA primary key (ID_LOTE)
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create index PERTENCE_FK on LOTE_DA_VACINA (
   ID_VACINA ASC
);

/*==============================================================*/
/* Table: PESSOA                                                */
/*==============================================================*/
create table PESSOA 
(
   CC                   INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   DATA_NASCIMENTO      DATE                 not null,
   PROFISSAO            VARCHAR2(1024)       not null,
   MORADA               VARCHAR2(1024)       not null,
   CODIGO_POSTAL        INTEGER              not null,
   CIDADE               VARCHAR2(1024)       not null,
   TELEMOVEL            INTEGER              not null,
   EMAIL                VARCHAR2(1024)       not null,
   LOCAL_TRABALHO       VARCHAR2(1024)       not null,
   constraint PK_PESSOA primary key (CC)
);

/*==============================================================*/
/* Table: PODE_LEVAR                                            */
/*==============================================================*/
create table PODE_LEVAR 
(
   ID_ARMAZEM           INTEGER              not null,
   ID_ILHAS             INTEGER              not null,
   constraint PK_PODE_LEVAR primary key (ID_ARMAZEM, ID_ILHAS)
);

/*==============================================================*/
/* Index: PODE_LEVAR_FK                                         */
/*==============================================================*/
create index PODE_LEVAR_FK on PODE_LEVAR (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: PODE_LEVAR2_FK                                        */
/*==============================================================*/
create index PODE_LEVAR2_FK on PODE_LEVAR (
   ID_ILHAS ASC
);

/*==============================================================*/
/* Table: PODE_TER                                              */
/*==============================================================*/
create table PODE_TER 
(
   ID_DOENCAS           INTEGER              not null,
   CC                   INTEGER              not null,
   constraint PK_PODE_TER primary key (ID_DOENCAS, CC)
);

/*==============================================================*/
/* Index: PODE_TER_FK                                           */
/*==============================================================*/
create index PODE_TER_FK on PODE_TER (
   ID_DOENCAS ASC
);

/*==============================================================*/
/* Index: PODE_TER2_FK                                          */
/*==============================================================*/
create index PODE_TER2_FK on PODE_TER (
   CC ASC
);

/*==============================================================*/
/* Table: PROVEM                                                */
/*==============================================================*/
create table PROVEM 
(
   ID_DOENCAS           INTEGER              not null,
   ID_CRITERIOS         INTEGER              not null,
   constraint PK_PROVEM primary key (ID_DOENCAS, ID_CRITERIOS)
);

/*==============================================================*/
/* Table: REACOES                                               */
/*==============================================================*/
create table REACOES 
(
   ID_REACOES           INTEGER              not null,
   ID_TOMA              INTEGER              not null,
   AVALIACAO            VARCHAR2(1024)       not null,
   constraint PK_REACOES primary key (ID_REACOES)
);

/*==============================================================*/
/* Index: CAUSA_FK                                              */
/*==============================================================*/
create index CAUSA_FK on REACOES (
   ID_TOMA ASC
);

/*==============================================================*/
/* Table: RESPONSAVEL                                           */
/*==============================================================*/
create table RESPONSAVEL 
(
   ID_TURNO             INTEGER              not null,
   CC                   INTEGER              not null,
   ID_ENFERMEIRO        INTEGER              not null,
   constraint PK_RESPONSAVEL primary key (ID_TURNO, CC, ID_ENFERMEIRO)
);

/*==============================================================*/
/* Index: RESPONSAVEL_FK                                        */
/*==============================================================*/
create index RESPONSAVEL_FK on RESPONSAVEL (
   ID_TURNO ASC
);

/*==============================================================*/
/* Index: RESPONSAVEL2_FK                                       */
/*==============================================================*/
create index RESPONSAVEL2_FK on RESPONSAVEL (
   CC ASC,
   ID_ENFERMEIRO ASC
);

/*==============================================================*/
/* Table: SLOTS                                                 */
/*==============================================================*/
create table SLOTS 
(
   ID_SLOT              INTEGER              not null,
   HORA_ESCOLHIDA       DATE                 not null,
   constraint PK_SLOTS primary key (ID_SLOT)
);

/*==============================================================*/
/* Table: TOMADAVACINA                                          */
/*==============================================================*/
create table TOMADAVACINA 
(
   ID_TOMA              INTEGER              not null,
   ID_CONVOCATORIA      INTEGER              not null,
   ID_DOSE              INTEGER              not null,
   DATATOMA             DATE                 not null,
   DOSE                 INTEGER              not null,
   constraint PK_TOMADAVACINA primary key (ID_TOMA)
);

/*==============================================================*/
/* Index: TOMADA_FK                                             */
/*==============================================================*/
create index TOMADA_FK on TOMADAVACINA (
   ID_DOSE ASC
);

/*==============================================================*/
/* Index: PARA2_FK                                              */
/*==============================================================*/
create index PARA2_FK on TOMADAVACINA (
   ID_CONVOCATORIA ASC
);

/*==============================================================*/
/* Table: TRANSPORTE                                            */
/*==============================================================*/
create table TRANSPORTE 
(
   ID_TRANSPORTE        INTEGER              not null,
   ID_CENTRO            INTEGER              not null,
   ID_ARMAZEM           INTEGER              not null,
   DATA                 DATE                 not null,
   constraint PK_TRANSPORTE primary key (ID_TRANSPORTE)
);

/*==============================================================*/
/* Index: DO_FK                                                 */
/*==============================================================*/
create index DO_FK on TRANSPORTE (
   ID_ARMAZEM ASC
);

/*==============================================================*/
/* Index: PEDE_FK                                               */
/*==============================================================*/
create index PEDE_FK on TRANSPORTE (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: TURNO_DE_VACINACAO                                    */
/*==============================================================*/
create table TURNO_DE_VACINACAO 
(
   ID_TURNO             INTEGER              not null,
   ID_CENTRO            INTEGER              not null,
   DATA_INICIO          DATE                 not null,
   DATA_FIM             DATE                 not null,
   TEMPO_MEDIO          FLOAT                not null,
   constraint PK_TURNO_DE_VACINACAO primary key (ID_TURNO)
);

/*==============================================================*/
/* Index: LOCALIZA_SE_FK                                        */
/*==============================================================*/
create index LOCALIZA_SE_FK on TURNO_DE_VACINACAO (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: VACINA                                                */
/*==============================================================*/
create table VACINA 
(
   ID_VACINA            INTEGER              not null,
   MARCA                VARCHAR2(1024)       not null,
   INTERVALODOSE        DATE                 not null,
   TEMPOABERTURA        INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   LABORATORIO          VARCHAR2(1024)       not null,
   DATA_APROVACAO       DATE                 not null,
   NUM_DOSES            INTEGER              not null,
   constraint PK_VACINA primary key (ID_VACINA)
);

alter table CONVOCATORIA
   add constraint FK_CONVOCAT_ENVIA_PESSOA foreign key (CC)
      references PESSOA (CC);

alter table CONVOCATORIA
   add constraint FK_CONVOCAT_PARA_TOMADAVA foreign key (ID_TOMA)
      references TOMADAVACINA (ID_TOMA);

alter table CONVOCATORIA
   add constraint FK_CONVOCAT_RESULTA_FASE foreign key (ID_FASE)
      references FASE (ID_FASE);

alter table CONVOCATORIA
   add constraint FK_CONVOCAT_TEM_SLOTS foreign key (ID_SLOT)
      references SLOTS (ID_SLOT);

alter table CRITERIOS
   add constraint FK_CRITERIO_PERTENCEM_FASE foreign key (ID_FASE)
      references FASE (ID_FASE);

alter table DOSE
   add constraint FK_DOSE_RETIRADA_FRASCO foreign key (ID_FRASCO)
      references FRASCO (ID_FRASCO);

alter table DOSE
   add constraint FK_DOSE_TOMADA2_TOMADAVA foreign key (ID_TOMA)
      references TOMADAVACINA (ID_TOMA);

alter table ENFERMEIRO
   add constraint FK_ENFERMEI_PODE_SER_PESSOA foreign key (CC)
      references PESSOA (CC);

alter table ENSAIOS_CLINICOS
   add constraint FK_ENSAIOS__TESTADA_VACINA foreign key (ID_VACINA)
      references VACINA (ID_VACINA);

alter table ESTAO
   add constraint FK_ESTAO_ESTAO_SLOTS foreign key (ID_SLOT)
      references SLOTS (ID_SLOT);

alter table ESTAO
   add constraint FK_ESTAO_ESTAO2_TURNO_DE foreign key (ID_TURNO)
      references TURNO_DE_VACINACAO (ID_TURNO);

alter table FRASCO
   add constraint FK_FRASCO_LEVA_TRANSPOR foreign key (ID_TRANSPORTE)
      references TRANSPORTE (ID_TRANSPORTE);

alter table FRASCO
   add constraint FK_FRASCO_PERTENCEN_LOTE_DA_ foreign key (ID_LOTE)
      references LOTE_DA_VACINA (ID_LOTE);

alter table GUARDADA
   add constraint FK_GUARDADA_GUARDADA_VACINA foreign key (ID_VACINA)
      references VACINA (ID_VACINA);

alter table GUARDADA
   add constraint FK_GUARDADA_GUARDADA2_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table LOTE_DA_VACINA
   add constraint FK_LOTE_DA__PERTENCE_VACINA foreign key (ID_VACINA)
      references VACINA (ID_VACINA);

alter table PODE_LEVAR
   add constraint FK_PODE_LEV_PODE_LEVA_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table PODE_LEVAR
   add constraint FK_PODE_LEV_PODE_LEVA_ARMAZEM_ foreign key (ID_ILHAS)
      references ARMAZEM_ILHAS (ID_ILHAS);

alter table PODE_TER
   add constraint FK_PODE_TER_PODE_TER_DOENCAS foreign key (ID_DOENCAS)
      references DOENCAS (ID_DOENCAS);

alter table PODE_TER
   add constraint FK_PODE_TER_PODE_TER2_PESSOA foreign key (CC)
      references PESSOA (CC);

alter table PROVEM
   add constraint FK_PROVEM_PROVEM_DOENCAS foreign key (ID_DOENCAS)
      references DOENCAS (ID_DOENCAS);

alter table PROVEM
   add constraint FK_PROVEM_PROVEM2_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS);

alter table REACOES
   add constraint FK_REACOES_CAUSA_TOMADAVA foreign key (ID_TOMA)
      references TOMADAVACINA (ID_TOMA);

alter table RESPONSAVEL
   add constraint FK_RESPONSA_RESPONSAV_TURNO_DE foreign key (ID_TURNO)
      references TURNO_DE_VACINACAO (ID_TURNO);

alter table RESPONSAVEL
   add constraint FK_RESPONSA_RESPONSAV_ENFERMEI foreign key (CC, ID_ENFERMEIRO)
      references ENFERMEIRO (CC, ID_ENFERMEIRO);

alter table TOMADAVACINA
   add constraint FK_TOMADAVA_PARA2_CONVOCAT foreign key (ID_CONVOCATORIA)
      references CONVOCATORIA (ID_CONVOCATORIA);

alter table TOMADAVACINA
   add constraint FK_TOMADAVA_TOMADA_DOSE foreign key (ID_DOSE)
      references DOSE (ID_DOSE);

alter table TRANSPORTE
   add constraint FK_TRANSPOR_DO_ARMAZEM foreign key (ID_ARMAZEM)
      references ARMAZEM (ID_ARMAZEM);

alter table TRANSPORTE
   add constraint FK_TRANSPOR_PEDE_CENTRO_V foreign key (ID_CENTRO)
      references CENTRO_VACINACAO (ID_CENTRO);

alter table TURNO_DE_VACINACAO
   add constraint FK_TURNO_DE_LOCALIZA__CENTRO_V foreign key (ID_CENTRO)
      references CENTRO_VACINACAO (ID_CENTRO);







