/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     11/05/2021 19:23:45                          */
/*==============================================================*/


alter table ABRANGIDAS
   drop constraint FK_ABRANGID_ABRANGIDA_PROFISSO;

alter table ABRANGIDAS
   drop constraint FK_ABRANGID_ABRANGIDA_CRITERIO;

alter table ARMAZENAMENTO_ILHAS
   drop constraint FK_ARMAZENA_ARMAZENAM_ARMAZEN2;

alter table ARMAZENAMENTO_ILHAS
   drop constraint FK_ARMAZENA_ARMAZENAM_ARMAZENS;

alter table CAUSAM
   drop constraint FK_CAUSAM_CAUSAM_TOMAS_DA;

alter table CAUSAM
   drop constraint FK_CAUSAM_CAUSAM2_REACOES;

alter table CENTRO_SAUDE
   drop constraint FK_CENTRO_S_COMUNICA_CONVOCAT;

alter table CONVOCATORIAS
   drop constraint FK_CONVOCAT_ENVIAM_PESSOAS;

alter table CONVOCATORIAS
   drop constraint FK_CONVOCAT_PARA_TOMAS_DA;

alter table CONVOCATORIAS
   drop constraint FK_CONVOCAT_RESULTAM_FASES;

alter table CONVOCATORIAS
   drop constraint FK_CONVOCAT_TEM_SLOTS;

alter table CRITERIOS
   drop constraint FK_CRITERIO_PERTENCEM_FASES;

alter table DOENCAS
   drop constraint FK_DOENCAS_PROVEM_CRITERIO;

alter table DOSES
   drop constraint FK_DOSES_RETIRADAS_FRASCOS;

alter table DOSES
   drop constraint FK_DOSES_TOMADAS2_TOMAS_DA;

alter table ENFERMEIROS
   drop constraint FK_ENFERMEI_PODEM_SER_PESSOAS;

alter table EXERCEM
   drop constraint FK_EXERCEM_EXERCEM_PROFISSO;

alter table EXERCEM
   drop constraint FK_EXERCEM_EXERCEM2_PESSOAS;

alter table FRASCOS
   drop constraint FK_FRASCOS_LEVAM_TRANSPOR;

alter table FRASCOS
   drop constraint FK_FRASCOS_PERTENCEN_LOTES_DA;

alter table INCLUEM
   drop constraint FK_INCLUEM_INCLUEM_CRITERIO;

alter table INCLUEM
   drop constraint FK_INCLUEM_INCLUEM2_LOCAIS_D;

alter table LOTES_DAS_VACINAS
   drop constraint FK_LOTES_DA_DAS_VACINAS;

alter table LOTES_DAS_VACINAS
   drop constraint FK_LOTES_DA_GUARDADOS_ARMAZENS;

alter table ORIGINARAM
   drop constraint FK_ORIGINAR_ORIGINARA_REACOES;

alter table ORIGINARAM
   drop constraint FK_ORIGINAR_ORIGINARA_VACINAS;

alter table PESSOAS
   drop constraint FK_PESSOAS_REGISTRAD_CENTRO_S;

alter table PODEM_GUARDAR
   drop constraint FK_PODEM_GU_PODEM_GUA_VACINAS;

alter table PODEM_GUARDAR
   drop constraint FK_PODEM_GU_PODEM_GUA_ARMAZENS;

alter table PODEM_TER
   drop constraint FK_PODEM_TE_PODEM_TER_DOENCAS;

alter table PODEM_TER
   drop constraint FK_PODEM_TE_PODEM_TER_PESSOAS;

alter table RESPONSAVEIS
   drop constraint FK_RESPONSA_RESPONSAV_TURNOS_D;

alter table RESPONSAVEIS
   drop constraint FK_RESPONSA_RESPONSAV_ENFERMEI;

alter table SLOTS
   drop constraint FK_SLOTS_ESTAO_TURNOS_D;

alter table TOMAS_DA_VACINA
   drop constraint FK_TOMAS_DA_PARA2_CONVOCAT;

alter table TOMAS_DA_VACINA
   drop constraint FK_TOMAS_DA_TOMADAS_DOSES;

alter table TRABALHAM
   drop constraint FK_TRABALHA_TRABALHAM_LOCAIS_D;

alter table TRABALHAM
   drop constraint FK_TRABALHA_TRABALHAM_PESSOAS;

alter table TRANSPORTES
   drop constraint FK_TRANSPOR_DOS_ARMAZENS;

alter table TRANSPORTES
   drop constraint FK_TRANSPOR_PEDE_CENTROS_;

alter table TURNOS_DE_VACINACAO
   drop constraint FK_TURNOS_D_LOCALIZA__CENTROS_;

drop index ABRANGIDAS2_FK;

drop index ABRANGIDAS_FK;

drop table ABRANGIDAS cascade constraints;

drop index ARMAZENAMENTO_ILHAS2_FK;

drop index ARMAZENAMENTO_ILHAS_FK;

drop table ARMAZENAMENTO_ILHAS cascade constraints;

drop table ARMAZENS cascade constraints;

drop index CAUSAM2_FK;

drop index CAUSAM_FK;

drop table CAUSAM cascade constraints;

drop table CENTROS_VACINACAO cascade constraints;

drop index COMUNICA_FK;

drop table CENTRO_SAUDE cascade constraints;

drop index TEM_FK;

drop index RESULTAM_FK;

drop index PARA_FK;

drop index ENVIAM_FK;

drop table CONVOCATORIAS cascade constraints;

drop index PERTENCEM_FK;

drop table CRITERIOS cascade constraints;

drop index PROVEM_FK;

drop table DOENCAS cascade constraints;

drop index TOMADAS2_FK;

drop index RETIRADAS_FK;

drop table DOSES cascade constraints;

drop index PODEM_SER_FK;

drop table ENFERMEIROS cascade constraints;

drop index EXERCEM2_FK;

drop index EXERCEM_FK;

drop table EXERCEM cascade constraints;

drop table FASES cascade constraints;

drop index LEVAM_FK;

drop index PERTENCENTES_FK;

drop table FRASCOS cascade constraints;

drop index INCLUEM2_FK;

drop index INCLUEM_FK;

drop table INCLUEM cascade constraints;

drop table LOCAIS_DE_TRABALHO cascade constraints;

drop index GUARDADOS_FK;

drop index DAS_FK;

drop table LOTES_DAS_VACINAS cascade constraints;

drop index ORIGINARAM2_FK;

drop index ORIGINARAM_FK;

drop table ORIGINARAM cascade constraints;

drop index REGISTRADA_FK;

drop table PESSOAS cascade constraints;

drop index PODEM_GUARDAR2_FK;

drop index PODEM_GUARDAR_FK;

drop table PODEM_GUARDAR cascade constraints;

drop index PODEM_TER2_FK;

drop index PODEM_TER_FK;

drop table PODEM_TER cascade constraints;

drop table PROFISSOES cascade constraints;

drop table REACOES cascade constraints;

drop index RESPONSAVEIS2_FK;

drop index RESPONSAVEIS_FK;

drop table RESPONSAVEIS cascade constraints;

drop index ESTAO_FK;

drop table SLOTS cascade constraints;

drop index PARA2_FK;

drop index TOMADAS_FK;

drop table TOMAS_DA_VACINA cascade constraints;

drop index TRABALHAM2_FK;

drop index TRABALHAM_FK;

drop table TRABALHAM cascade constraints;

drop index PEDE_FK;

drop index DOS_FK;

drop table TRANSPORTES cascade constraints;

drop index LOCALIZA_SE_FK;

drop table TURNOS_DE_VACINACAO cascade constraints;

drop table VACINAS cascade constraints;

/*==============================================================*/
/* Table: ABRANGIDAS                                            */
/*==============================================================*/
create table ABRANGIDAS 
(
   ID_PROFISSAO         INTEGER              not null,
   ID_CRITERIOS         INTEGER              not null,
   constraint PK_ABRANGIDAS primary key (ID_PROFISSAO, ID_CRITERIOS)
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
create table ARMAZENAMENTO_ILHAS 
(
   ID_ARMAZEM_ILHAS     INTEGER              not null,
   ARM_ID_ARMAZEM       INTEGER              not null,
   constraint PK_ARMAZENAMENTO_ILHAS primary key (ID_ARMAZEM_ILHAS, ARM_ID_ARMAZEM)
);

/*==============================================================*/
/* Index: ARMAZENAMENTO_ILHAS_FK                                */
/*==============================================================*/
create index ARMAZENAMENTO_ILHAS_FK on ARMAZENAMENTO_ILHAS (
   ID_ARMAZEM_ILHAS ASC
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
create table ARMAZENS 
(
   ID_ARMAZEM           INTEGER              not null,
   MORADA               VARCHAR2(1024)       not null,
   DISTRITO             VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   CAPACIDADE_MAXIMA    NUMBER               not null,
   constraint PK_ARMAZENS primary key (ID_ARMAZEM)
);

/*==============================================================*/
/* Table: CAUSAM                                                */
/*==============================================================*/
create table CAUSAM 
(
   ID_TOMA              INTEGER              not null,
   ID_REACOES           INTEGER              not null,
   constraint PK_CAUSAM primary key (ID_TOMA, ID_REACOES)
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
create table CENTROS_VACINACAO 
(
   ID_CENTRO            INTEGER              not null,
   MORADA               VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   constraint PK_CENTROS_VACINACAO primary key (ID_CENTRO)
);

/*==============================================================*/
/* Table: CENTRO_SAUDE                                          */
/*==============================================================*/
create table CENTRO_SAUDE 
(
   ID_CENTROSAUDE       INTEGER              not null,
   ID_CONVOCATORIA      INTEGER,
   NOME                 VARCHAR2(1024)       not null,
   MORADA               VARCHAR2(1024)       not null,
   CONCELHO             VARCHAR2(1024)       not null,
   TELEMOVEL            INTEGER              not null,
   REGIAO               VARCHAR2(1024)       not null,
   CODIGO_POSTAL        INTEGER              not null,
   CIDADE               VARCHAR2(1024)       not null,
   constraint PK_CENTRO_SAUDE primary key (ID_CENTROSAUDE)
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
create table CONVOCATORIAS 
(
   ID_CONVOCATORIA      INTEGER              not null,
   ID_TOMA              INTEGER,
   ID_FASE              INTEGER              not null,
   ID_SLOT              INTEGER              not null,
   CC                   INTEGER              not null,
   JUSTIFICACAO         VARCHAR2(1024)       not null,
   DATACONVOCATORIA     DATE                 not null,
   RESPOSTA             VARCHAR2(1024)       not null,
   constraint PK_CONVOCATORIAS primary key (ID_CONVOCATORIA)
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
create table CRITERIOS 
(
   ID_CRITERIOS         INTEGER              not null,
   ID_FASE              INTEGER,
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
   ID_CRITERIOS         INTEGER,
   NOME                 VARCHAR2(1024)       not null,
   constraint PK_DOENCAS primary key (ID_DOENCAS)
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
create table DOSES 
(
   ID_DOSE              INTEGER              not null,
   ID_FRASCO            INTEGER              not null,
   ID_TOMA              INTEGER,
   ESTADO               VARCHAR2(1024)       not null,
   DATA_DA_DOSE         DATE                 not null,
   constraint PK_DOSES primary key (ID_DOSE)
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
create table ENFERMEIROS 
(
   CC                   INTEGER              not null,
   ID_ENFERMEIRO        INTEGER              not null,
   ID_CENTROSAUDE       INTEGER,
   NOME                 VARCHAR2(1024)       not null,
   DATA_NASCIMENTO      DATE                 not null,
   MORADA               VARCHAR2(1024)       not null,
   CODIGO_POSTAL        INTEGER              not null,
   CONCELHO             VARCHAR2(1024),
   CIDADE               VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   TELEMOVEL            INTEGER              not null,
   EMAIL                VARCHAR2(1024)       not null,
   constraint PK_ENFERMEIROS primary key (CC, ID_ENFERMEIRO)
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
create table EXERCEM 
(
   ID_PROFISSAO         INTEGER              not null,
   CC                   INTEGER              not null,
   constraint PK_EXERCEM primary key (ID_PROFISSAO, CC)
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
create table FASES 
(
   ID_FASE              INTEGER              not null,
   DATA_INICIO          DATE                 not null,
   DATA_FIM             DATE                 not null,
   constraint PK_FASES primary key (ID_FASE)
);

/*==============================================================*/
/* Table: FRASCOS                                               */
/*==============================================================*/
create table FRASCOS 
(
   ID_FRASCO            INTEGER              not null,
   ID_TRANSPORTE        INTEGER              not null,
   ID_LOTE              INTEGER              not null,
   LOCALIZACAO          VARCHAR2(1024)       not null,
   DATA_DE_ABERTURA     DATE                 not null,
   ESTADO               VARCHAR2(1024)       not null,
   DATA_PRODUCAO        DATE                 not null,
   VALIDADE             DATE                 not null,
   constraint PK_FRASCOS primary key (ID_FRASCO)
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
create table INCLUEM 
(
   ID_CRITERIOS         INTEGER              not null,
   ID_LOCALPROF         INTEGER              not null,
   constraint PK_INCLUEM primary key (ID_CRITERIOS, ID_LOCALPROF)
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
create table LOCAIS_DE_TRABALHO 
(
   ID_LOCALPROF         INTEGER              not null,
   LOCAL_TRABALHO       VARCHAR2(1024)       not null,
   constraint PK_LOCAIS_DE_TRABALHO primary key (ID_LOCALPROF)
);

/*==============================================================*/
/* Table: LOTES_DAS_VACINAS                                     */
/*==============================================================*/
create table LOTES_DAS_VACINAS 
(
   ID_LOTE              INTEGER              not null,
   ID_VACINA            INTEGER              not null,
   ID_ARMAZEM           INTEGER,
   QUANTIDADE           INTEGER              not null,
   DATA_PRODUCAO        DATE                 not null,
   constraint PK_LOTES_DAS_VACINAS primary key (ID_LOTE)
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
create table ORIGINARAM 
(
   ID_REACOES           INTEGER              not null,
   ID_VACINA            INTEGER              not null,
   constraint PK_ORIGINARAM primary key (ID_REACOES, ID_VACINA)
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
create table PESSOAS 
(
   CC                   INTEGER              not null,
   ID_CENTROSAUDE       INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   DATA_NASCIMENTO      DATE                 not null,
   MORADA               VARCHAR2(1024)       not null,
   CODIGO_POSTAL        INTEGER              not null,
   CONCELHO             VARCHAR2(1024),
   CIDADE               VARCHAR2(1024)       not null,
   REGIAO               VARCHAR2(1024)       not null,
   TELEMOVEL            INTEGER              not null,
   EMAIL                VARCHAR2(1024)       not null,
   constraint PK_PESSOAS primary key (CC)
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
create table PODEM_GUARDAR 
(
   ID_VACINA            INTEGER              not null,
   ID_ARMAZEM           INTEGER              not null,
   constraint PK_PODEM_GUARDAR primary key (ID_VACINA, ID_ARMAZEM)
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
create table PODEM_TER 
(
   ID_DOENCAS           INTEGER              not null,
   CC                   INTEGER              not null,
   constraint PK_PODEM_TER primary key (ID_DOENCAS, CC)
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
create table PROFISSOES 
(
   ID_PROFISSAO         INTEGER              not null,
   PROFISSAO            VARCHAR2(1024)       not null,
   constraint PK_PROFISSOES primary key (ID_PROFISSAO)
);

/*==============================================================*/
/* Table: REACOES                                               */
/*==============================================================*/
create table REACOES 
(
   ID_REACOES           INTEGER              not null,
   AVALIACAO            VARCHAR2(1024)       not null,
   constraint PK_REACOES primary key (ID_REACOES)
);

/*==============================================================*/
/* Table: RESPONSAVEIS                                          */
/*==============================================================*/
create table RESPONSAVEIS 
(
   ID_TURNO             INTEGER              not null,
   CC                   INTEGER              not null,
   ID_ENFERMEIRO        INTEGER              not null,
   constraint PK_RESPONSAVEIS primary key (ID_TURNO, CC, ID_ENFERMEIRO)
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
create table SLOTS 
(
   ID_SLOT              INTEGER              not null,
   ID_TURNO             INTEGER              not null,
   HORA_ESCOLHIDA       DATE                 not null,
   constraint PK_SLOTS primary key (ID_SLOT)
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
create table TOMAS_DA_VACINA 
(
   ID_TOMA              INTEGER              not null,
   ID_CONVOCATORIA      INTEGER              not null,
   ID_DOSE              INTEGER              not null,
   DATATOMA             DATE                 not null,
   DOSE                 INTEGER              not null,
   constraint PK_TOMAS_DA_VACINA primary key (ID_TOMA)
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
create table TRABALHAM 
(
   ID_LOCALPROF         INTEGER              not null,
   CC                   INTEGER              not null,
   constraint PK_TRABALHAM primary key (ID_LOCALPROF, CC)
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
create table TRANSPORTES 
(
   ID_TRANSPORTE        INTEGER              not null,
   ID_CENTRO            INTEGER              not null,
   ID_ARMAZEM           INTEGER              not null,
   DATA                 DATE                 not null,
   constraint PK_TRANSPORTES primary key (ID_TRANSPORTE)
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
create table TURNOS_DE_VACINACAO 
(
   ID_TURNO             INTEGER              not null,
   ID_CENTRO            INTEGER              not null,
   DATA_INICIO          DATE                 not null,
   DATA_FIM             DATE                 not null,
   TEMPO_MEDIO          NUMBER               not null,
   constraint PK_TURNOS_DE_VACINACAO primary key (ID_TURNO)
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
create table VACINAS 
(
   ID_VACINA            INTEGER              not null,
   MARCA                VARCHAR2(1024)       not null,
   INTERVALODOSE        DATE                 not null,
   TEMPO_APOS_ABERTURA  INTEGER              not null,
   NOME                 VARCHAR2(1024)       not null,
   LABORATORIO          VARCHAR2(1024)       not null,
   DATA_APROVACAO       DATE                 not null,
   NUM_DOSES            INTEGER              not null,
   constraint PK_VACINAS primary key (ID_VACINA)
);

alter table ABRANGIDAS
   add constraint FK_ABRANGID_ABRANGIDA_PROFISSO foreign key (ID_PROFISSAO)
      references PROFISSOES (ID_PROFISSAO);

alter table ABRANGIDAS
   add constraint FK_ABRANGID_ABRANGIDA_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS);

alter table ARMAZENAMENTO_ILHAS
   add constraint FK_ARMAZENA_ARMAZENAM_ARMAZEN2 foreign key (ID_ARMAZEM_ILHAS)
      references ARMAZENS (ID_ARMAZEM);

alter table ARMAZENAMENTO_ILHAS
   add constraint FK_ARMAZENA_ARMAZENAM_ARMAZENS foreign key (ARM_ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM);

alter table CAUSAM
   add constraint FK_CAUSAM_CAUSAM_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA);

alter table CAUSAM
   add constraint FK_CAUSAM_CAUSAM2_REACOES foreign key (ID_REACOES)
      references REACOES (ID_REACOES);

alter table CENTRO_SAUDE
   add constraint FK_CENTRO_S_COMUNICA_CONVOCAT foreign key (ID_CONVOCATORIA)
      references CONVOCATORIAS (ID_CONVOCATORIA);

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_ENVIAM_PESSOAS foreign key (CC)
      references PESSOAS (CC);

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_PARA_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA);

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_RESULTAM_FASES foreign key (ID_FASE)
      references FASES (ID_FASE);

alter table CONVOCATORIAS
   add constraint FK_CONVOCAT_TEM_SLOTS foreign key (ID_SLOT)
      references SLOTS (ID_SLOT);

alter table CRITERIOS
   add constraint FK_CRITERIO_PERTENCEM_FASES foreign key (ID_FASE)
      references FASES (ID_FASE);

alter table DOENCAS
   add constraint FK_DOENCAS_PROVEM_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS);

alter table DOSES
   add constraint FK_DOSES_RETIRADAS_FRASCOS foreign key (ID_FRASCO)
      references FRASCOS (ID_FRASCO);

alter table DOSES
   add constraint FK_DOSES_TOMADAS2_TOMAS_DA foreign key (ID_TOMA)
      references TOMAS_DA_VACINA (ID_TOMA);

alter table ENFERMEIROS
   add constraint FK_ENFERMEI_PODEM_SER_PESSOAS foreign key (CC)
      references PESSOAS (CC);

alter table EXERCEM
   add constraint FK_EXERCEM_EXERCEM_PROFISSO foreign key (ID_PROFISSAO)
      references PROFISSOES (ID_PROFISSAO);

alter table EXERCEM
   add constraint FK_EXERCEM_EXERCEM2_PESSOAS foreign key (CC)
      references PESSOAS (CC);

alter table FRASCOS
   add constraint FK_FRASCOS_LEVAM_TRANSPOR foreign key (ID_TRANSPORTE)
      references TRANSPORTES (ID_TRANSPORTE);

alter table FRASCOS
   add constraint FK_FRASCOS_PERTENCEN_LOTES_DA foreign key (ID_LOTE)
      references LOTES_DAS_VACINAS (ID_LOTE);

alter table INCLUEM
   add constraint FK_INCLUEM_INCLUEM_CRITERIO foreign key (ID_CRITERIOS)
      references CRITERIOS (ID_CRITERIOS);

alter table INCLUEM
   add constraint FK_INCLUEM_INCLUEM2_LOCAIS_D foreign key (ID_LOCALPROF)
      references LOCAIS_DE_TRABALHO (ID_LOCALPROF);

alter table LOTES_DAS_VACINAS
   add constraint FK_LOTES_DA_DAS_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA);

alter table LOTES_DAS_VACINAS
   add constraint FK_LOTES_DA_GUARDADOS_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM);

alter table ORIGINARAM
   add constraint FK_ORIGINAR_ORIGINARA_REACOES foreign key (ID_REACOES)
      references REACOES (ID_REACOES);

alter table ORIGINARAM
   add constraint FK_ORIGINAR_ORIGINARA_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA);

alter table PESSOAS
   add constraint FK_PESSOAS_REGISTRAD_CENTRO_S foreign key (ID_CENTROSAUDE)
      references CENTRO_SAUDE (ID_CENTROSAUDE);

alter table PODEM_GUARDAR
   add constraint FK_PODEM_GU_PODEM_GUA_VACINAS foreign key (ID_VACINA)
      references VACINAS (ID_VACINA);

alter table PODEM_GUARDAR
   add constraint FK_PODEM_GU_PODEM_GUA_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM);

alter table PODEM_TER
   add constraint FK_PODEM_TE_PODEM_TER_DOENCAS foreign key (ID_DOENCAS)
      references DOENCAS (ID_DOENCAS);

alter table PODEM_TER
   add constraint FK_PODEM_TE_PODEM_TER_PESSOAS foreign key (CC)
      references PESSOAS (CC);

alter table RESPONSAVEIS
   add constraint FK_RESPONSA_RESPONSAV_TURNOS_D foreign key (ID_TURNO)
      references TURNOS_DE_VACINACAO (ID_TURNO);

alter table RESPONSAVEIS
   add constraint FK_RESPONSA_RESPONSAV_ENFERMEI foreign key (CC, ID_ENFERMEIRO)
      references ENFERMEIROS (CC, ID_ENFERMEIRO);

alter table SLOTS
   add constraint FK_SLOTS_ESTAO_TURNOS_D foreign key (ID_TURNO)
      references TURNOS_DE_VACINACAO (ID_TURNO);

alter table TOMAS_DA_VACINA
   add constraint FK_TOMAS_DA_PARA2_CONVOCAT foreign key (ID_CONVOCATORIA)
      references CONVOCATORIAS (ID_CONVOCATORIA);

alter table TOMAS_DA_VACINA
   add constraint FK_TOMAS_DA_TOMADAS_DOSES foreign key (ID_DOSE)
      references DOSES (ID_DOSE);

alter table TRABALHAM
   add constraint FK_TRABALHA_TRABALHAM_LOCAIS_D foreign key (ID_LOCALPROF)
      references LOCAIS_DE_TRABALHO (ID_LOCALPROF);

alter table TRABALHAM
   add constraint FK_TRABALHA_TRABALHAM_PESSOAS foreign key (CC)
      references PESSOAS (CC);

alter table TRANSPORTES
   add constraint FK_TRANSPOR_DOS_ARMAZENS foreign key (ID_ARMAZEM)
      references ARMAZENS (ID_ARMAZEM);

alter table TRANSPORTES
   add constraint FK_TRANSPOR_PEDE_CENTROS_ foreign key (ID_CENTRO)
      references CENTROS_VACINACAO (ID_CENTRO);

alter table TURNOS_DE_VACINACAO
   add constraint FK_TURNOS_D_LOCALIZA__CENTROS_ foreign key (ID_CENTRO)
      references CENTROS_VACINACAO (ID_CENTRO);

