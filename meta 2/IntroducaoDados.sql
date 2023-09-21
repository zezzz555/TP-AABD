--Vacinas
insert into vacinas(id_vacina,pais,intervalodose,nome,laboratorio,data_aprovacao,num_doses,tempo_apos_abertura) values (01,'EUA/Alemanha',2,'Comirnaty','Pfizer/BioNTech', to_date('18-12-2020', 'dd-mm-yyyy'),2, 4);
insert into vacinas(id_vacina,pais,intervalodose,nome,laboratorio,data_aprovacao,num_doses,tempo_apos_abertura) values (02,'Reino Unido',3,'Vaxzevria','Oxford / AstraZeneca',to_date('02-01-2021', 'dd-mm-yyyy'),2,3);
insert into vacinas(id_vacina,pais,intervalodose,nome,laboratorio,data_aprovacao,num_doses,tempo_apos_abertura) values (03, 'EUA',2,'Moderna COVID-19','Moderna',to_date('24-12-2020', 'dd-mm-yyyy'),2,4);
insert into vacinas(id_vacina,pais,intervalodose,nome,laboratorio,data_aprovacao,num_doses,tempo_apos_abertura) values (04,'Belgica',6,'Janssen COVID-19','Johnson Johnson / Janssenh',to_date('02-01-2021', 'dd-mm-yyyy'),1,6);
/
--pessoas que são enfermeiros
insert into pessoas values (13219152,  2361, 'Tomás Telinhos Dutra', to_date('01/04/1981','dd-mm-yyyy'), 'Travessa Marcelo Macedo, 1778', '2630-015', 'Arouca', 'Aveiro', 'Centro', '2674921406', 'lbenoit0@slate.com');
insert into pessoas values (15668707, 40712, 'Rodrigo Carvalhal Barroso', to_date('25/09/1978','dd-mm-yyyy'), 'Alameda Henrique Barros, 918', '2430-482', 'Olhão', 'Faro', 'Sul', '1072055927', 'amillion1@merriam-webster.com');
insert into pessoas values (27716898, 23, 'Adriana Fiúza Fraga',to_date( '15/03/1965','dd-mm-yyyy'), 'Avenida Norberto Xavier, 597', '3080-570', 'Serra de Santa Marinha', 'Lisboa', 'Centro', '4804049390', 'rpabel2@elegantthemes.com');
insert into pessoas values (27724218, 178, 'Áurea Vidal Sodré',to_date( '12/02/1996','dd-mm-yyyy'), 'Rua Melissa Costa, 21', '2645-456', 'Vila Chã', 'Viseu', 'Centro', '4393451653', 'aunderhill3@i2i.jp');
insert into pessoas values (84649472, 04279, 'Mariana Pinhal Mendonça', to_date('01/08/1956','dd-mm-yyyy'), 'Rua Rafael Melo, 8942', '3505-209', 'Maia', 'Porto', 'Norte', '5969919076', 'mskullet4@theguardian.com');
/


--Pessoas
insert into pessoas values (388175065,236164,'Celina Covilhã Peseiro',to_date('14/09/1979', 'dd/mm/yyyy'),'Avenida Leonardo Melo, 958', '7302-755','Espinho','Aveiro','Centro','289938894','celina@gmail.com');
insert into pessoas values (300357621,407124,'Amaro Salgueiro Dâmaso',to_date('04/05/1961', 'dd/mm/yyyy'),'Marginal Maria Alice Pereira, 95','0268-4936','Olhão', 'Faro', 'Sul',289313812,'Amaro@gmail.com');
insert into pessoas values (88071310,235614,'Teresa Baião Macena',to_date('28/06/1989', 'dd/mm/yyyy'),'Travessa Leonardo Reis, 76','2052-5552','Mafra','Lisboa','Centro',289571975,'teresaM@gmail.com');
insert into pessoas values (89192206,04279,'Valentim Quina Pires',to_date('30/05/1953', 'dd/mm/yyyy'),'Marginal João Lucas Nogueira, 548',79447449,'Porto',289515496,'valentimP@gmail.com','Porto');


--centro_saude 

insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('236164','280','Centro de Saude de Aveiro','Rua Doutor Alberto Souto Bonsucesso','Aveiro','960182127','Centro','4004-400','Aveiro');
insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('407124','2609','Centro de Saude de Faro','Rua Frei Lourenço de Santa Maria','Faro','925676469','Sul','2340-231','Faro');
insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('235614','4','Centro de Saude de Lisboa','Rua dos Anjos','Lisboa','965869673','Centro','1230-231','Lisboa');
insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('42792','9','Centro de Saude da Maia','Rua do Maia Shopping','Maia','968930881','Norte','4545-123','Porto');
insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('178256','34672','Centro de Saude de Viseu','Largo da Lameira','Antas','963513315','Centro','1234-132','Viseu');
insert into centro_saude (id_centrosaude,id_convocatoria,nome,morada,concelho,telemovel,regiao,codigo_postal,cidade) values ('427123','9','Centro de Saude de Gondomar','Rua do Lavrador','Gondomar','968930323','Norte','4545-430','Porto');
--exercem
insert into exercem values(1,13219152);--enfermeiros
insert into exercem values(1,15668707);
insert into exercem values(1,27716898);
insert into exercem values(1,27724218);
insert into exercem values(1,84649472);
/


--Centro de Vacinação
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('1','Rua Doutor José Neves Júnior 8000-332 ','Sul','Faro');
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('2','Rua 25 de Abril Mataduços 3800-002 ','Centro','Aveiro');
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('3','Praça Francisco Sá Carneiro 1049-004 ','Centro','Lisboa');
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('4','Rua Joaquim António de Aguiar 4049-005 ','Norte','Porto');
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('5','Largo do Tabolado 3624-001 ','Centro','Moimenta da Beira');
insert into centros_vacinacao (id_centro,morada,regiao,concelho) values ('6','Largo do Souto 3624-001 ','Norte','Gondomar');

--Turno de vacinação
insert into turnos_de_vacinacao values (1, 1, to_date('2020-12-04 09:29:36', 'yyyy-mm-dd hh24:mi:ss'), to_date('2020-12-04 14:56:21', 'yyyy-mm-dd hh24:mi:ss'), 13.98);
insert into turnos_de_vacinacao values (2, 2, to_date('2021-03-29 11:43:15', 'yyyy-mm-dd hh24:mi:ss'), to_date('2021-03-29 16:16:18', 'yyyy-mm-dd hh24:mi:ss'), 8.102);
insert into turnos_de_vacinacao values (3, 3, to_date('2020-08-02 23:32:19', 'yyyy-mm-dd hh24:mi:ss'), to_date('2020-08-03 05:00:45', 'yyyy-mm-dd hh24:mi:ss'), 10.372);
insert into turnos_de_vacinacao values (4, 4, to_date('2021-05-08 08:23:02', 'yyyy-mm-dd hh24:mi:ss'), to_date('2021-05-08 16:50:45', 'yyyy-mm-dd hh24:mi:ss'), 10.136);
insert into turnos_de_vacinacao values (5, 5,to_date('2021-03-05 07:27:14', 'yyyy-mm-dd hh24:mi:ss'), to_date('2021-03-05 12:07:52', 'yyyy-mm-dd hh24:mi:ss'), 9.569);
insert into turnos_de_vacinacao values (6, 6,to_date('2021-04-05 10:27:14', 'yyyy-mm-dd hh24:mi:ss'), to_date('2021-04-05 20:07:52', 'yyyy-mm-dd hh24:mi:ss'), 7.569);

--Slots
insert into slots values (67332493, 1, to_date('10:00:00' ,'hh24:mi:ss'));
insert into slots values (53698626, 2,to_date('12:00:00' ,'hh24:mi:ss'));
insert into slots values (52792248, 3,to_date('00:30:00' ,'hh24:mi:ss'));
insert into slots values (72646566, 4,to_date('14:30:00' ,'hh24:mi:ss'));
insert into slots values (22693272, 5,to_date('08:30:00' ,'hh24:mi:ss'));
insert into slots values (22293272, 6,to_date('18:30:00' ,'hh24:mi:ss'));

--Fases
insert into fases (id_fase,data_inicio,data_fim) values ('11684',to_date('20.12.01','RR.MM.DD'),to_date('21.03.17','RR.MM.DD'),1);
insert into fases (id_fase,data_inicio,data_fim) values ('25164',to_date('21.03.22','RR.MM.DD'),to_date('21.05.31','RR.MM.DD'),2);
insert into fases (id_fase,data_inicio,data_fim) values ('33168',to_date('21.05.22','RR.MM.DD'),to_date('21.07.01','RR.MM.DD'),3);

--Lotes das vacinas -- mais lotes
insert into lotes_das_vacinas values (135146, 01, 127, 7439, to_date('2020-06-20 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into lotes_das_vacinas values (265164, 02, 208, 6145, to_date('2020-12-12 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into lotes_das_vacinas values (325161, 03, 148, 7753, to_date('2020-05-10 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into lotes_das_vacinas values (432115, 04, 335, 8366, to_date('2021-04-10 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into lotes_das_vacinas values (598646, 01, 539, 9858, to_date('2021-02-08 08:30:00','yyyy-mm-dd hh24:mi:ss'));


--Frasco  -- mais frascos 
insert into frascos values (1656149, 1, 135146, 'Aveiro', to_date('2020-07-20 08:30:00','yyyy-mm-dd hh24:mi:ss'),'Bom', to_date('2020-06-20 08:30:00','yyyy-mm-dd hh24:mi:ss'), to_date('2020-08-20 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into frascos values (2351664, 2, 265164, 'Faro', to_date('2021-01-12 08:30:00','yyyy-mm-dd hh24:mi:ss'),'Bom', to_date('2020-12-12 08:30:00','yyyy-mm-dd hh24:mi:ss'), to_date('2021-02-12 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into frascos values (3519884, 3, 325161, 'Lisboa', to_date('2020-06-10 08:30:00','yyyy-mm-dd hh24:mi:ss'),'Bom', to_date('2020-05-10 08:30:00','yyyy-mm-dd hh24:mi:ss'), to_date('2020-7-10 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into frascos values (4494988, 4, 432115, 'Porto',  to_date('2021-05-10 08:30:00','yyyy-mm-dd hh24:mi:ss'),'Bom', to_date('2021-04-10 08:30:00','yyyy-mm-dd hh24:mi:ss'), to_date('2021-06-10 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into frascos values (5468498, 5, 598646, 'Viseu', to_date('2021-03-08 08:30:00','yyyy-mm-dd hh24:mi:ss'),'Bom', to_date('2021-02-08 08:30:00','yyyy-mm-dd hh24:mi:ss'), to_date('2021-04-08 08:30:00','yyyy-mm-dd hh24:mi:ss'));


--Dose -- mais doses estragadas
insert into doses values (1315651, 1656149, 1516, 'Bom', to_date('2020-07-21 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into doses values (2316849, 2351664, 2184, 'Bom', to_date('2021-01-13 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into doses values (3168466, 3519884, 3318, 'Bom', to_date('2020-06-11 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into doses values (4651315, 4494988, 4318, 'Bom', to_date('2021-05-11 08:30:00','yyyy-mm-dd hh24:mi:ss'));
insert into doses values (5316486, 5468498, 5316, 'Bom', to_date('2021-03-09 08:30:00','yyyy-mm-dd hh24:mi:ss'));

--Tomas da vacina-- mais tomas
insert into tomas_da_vacina values (1516, 280, 1315651, to_date('2020-07-21 08:30:00','yyyy-mm-dd hh24:mi:ss'), 2);
insert into tomas_da_vacina values (2184, 2609, 2316849, to_date('2021-01-13 08:30:00','yyyy-mm-dd hh24:mi:ss'), 2);
insert into tomas_da_vacina values (3318, 4, 3168466, to_date('2020-06-11 08:30:00','yyyy-mm-dd hh24:mi:ss'), 2);
insert into tomas_da_vacina values (4318, 9, 4651315, to_date('2021-05-11 08:30:00','yyyy-mm-dd hh24:mi:ss'), 1);
insert into tomas_da_vacina values (5316, 34672, 5316486, to_date('2021-03-09 08:30:00','yyyy-mm-dd hh24:mi:ss'), 1);-- vacina 1 não imunizado

--Convocatoria --mais convocatorias por causa dos imunizados
insert into convocatorias values (280, 1516, 11684, 67332493, 13219152, 'aceite', to_date('2020-07-21 08:30:00','yyyy-mm-dd hh24:mi:ss'), 's');
insert into convocatorias values (2609, 2184, 25164, 53698626, 15668707, 'aceite', to_date('2021-01-13 08:30:00','yyyy-mm-dd hh24:mi:ss'), 's');
insert into convocatorias values (4,3318, 11684, 52792248, 27716898, 'aceite', to_date('2020-08-18 08:30:00','yyyy-mm-dd hh24:mi:ss'), 's');
insert into convocatorias values (9, 4318, 33168, 72646566, 27724218, 'aceite', to_date('2021-05-11 08:30:00','yyyy-mm-dd hh24:mi:ss'), 's');
insert into convocatorias values (34672,5316, 11684, 22693272, 84649472, 'aceite', to_date('2020-09-03 08:30:00','yyyy-mm-dd hh24:mi:ss'), 's');



--armazens

insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('127','Rodovia Marcelo Albuquerque, 157','Bragança','Norte','66622');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('208','Avenida Heitor Carvalho, 617','Coimbra','Centro','67298');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('148','Travessa Vitor Moreira, 165','Porto','Norte','64202');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('335','Rua Rafael Franco, 8910','Braga','Norte','142162');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('539','Avenida Meire Reis, 563','Faro','Sul','178657');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('201','Alameda Carla Costa, 82','Terceira','Ilhas','1037');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('20','Marginal Alice Pereira, 77','Horta','Ilhas','21982');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('12','Rua Maria Clara Macedo, 44','Porto Santo','Ilhas','20107');
insert into armazens (id_armazem,morada,distrito,regiao,capacidade_maxima) values ('101','Avenida Jose Moreira, 8418','Funchal','Ilhas','40056');

--transportes
insert into transportes (id_transporte, id_centro, id_armazem, data) values (1, 1, 127, to_date('2021-02-21 15:25:15','yyyy-mm-dd hh24:mi:ss'));
insert into transportes (id_transporte, id_centro, id_armazem, data) values (2, 2, 208, to_date('2021-02-13 11:24:31','yyyy-mm-dd hh24:mi:ss'));
insert into transportes (id_transporte, id_centro, id_armazem, data) values (3, 3, 148, to_date('2021-03-26 07:47:00','yyyy-mm-dd hh24:mi:ss'));
insert into transportes (id_transporte, id_centro, id_armazem, data) values (4, 4, 335, to_date('2021-05-12 08:21:28','yyyy-mm-dd hh24:mi:ss'));
insert into transportes (id_transporte, id_centro, id_armazem, data) values (5, 5, 539, to_date('2021-03-26 19:50:49','yyyy-mm-dd hh24:mi:ss'));

--armazenamento ilhas (erro)
insert into armazenamento_ilhas (id_armazem_ilhas, id_armazem) values (1, null);
insert into armazenamento_ilhas (id_armazem_ilhas, id_armazem) values (2, 20);
insert into armazenamento_ilhas (id_armazem_ilhas, id_armazem) values (3, 12);
insert into armazenamento_ilhas (id_armazem_ilhas, id_armazem) values (4, 101);

-- enfermeiros
insert into enfermeiros values (13219152, 1, 2361, 'Tomás Telinhos Dutra', to_date('01/04/1981','dd-mm-yyyy'), 'Travessa Marcelo Macedo, 1778', '2630-015', 'Arouca', 'Aveiro', 'Centro', '2674921406', 'lbenoit0@slate.com');
insert into enfermeiros values (15668707, 2, 40712, 'Rodrigo Carvalhal Barroso', to_date('25/09/1978','dd-mm-yyyy'), 'Alameda Henrique Barros, 918', '2430-482', 'São Pedro de Muel', 'Faro', 'Sul', '1072055927', 'amillion1@merriam-webster.com');
insert into enfermeiros values (27716898, 3, 23, 'Adriana Fiúza Fraga',to_date( '15/03/1965','dd-mm-yyyy'), 'Avenida Norberto Xavier, 597', '3080-570', 'Serra de Santa Marinha', 'Lisboa', 'Centro', '4804049390', 'rpabel2@elegantthemes.com');
insert into enfermeiros values (27724218, 4, 178, 'Áurea Vidal Sodré',to_date( '12/02/1996','dd-mm-yyyy'), 'Rua Melissa Costa, 21', '2645-456', 'Vila Chã', 'Viseu', 'Centro', '4393451653', 'aunderhill3@i2i.jp');
insert into enfermeiros values (84649472, 5, 04279, 'Mariama Pinhal Mendonça', to_date('01/08/1956','dd-mm-yyyy'), 'Rua Rafael Melo, 8942', '3505-209', 'Maia', 'Porto', 'Norte', '5969919076', 'mskullet4@theguardian.com');

--podem guardar)
insert into podem_guardar values (01,127);
insert into podem_guardar values (02,208);
insert into podem_guardar values (03,148);
insert into podem_guardar values (04,335);
insert into podem_guardar values (01,539);

--reacoes
insert into reacoes values (1,'Vermilhao');
insert into reacoes values (2,'Febre');
insert into reacoes values (3,'Dor de cabeca');
insert into reacoes values (4,'Dores nos membros');
insert into reacoes values (5,'Choque alergico');

--originaram 
insert into originaram values (1,01);
insert into originaram values (2,02);
insert into originaram values (3,03);
insert into originaram values (4,04);

--Locais de trabalho
insert into locais_de_trabalho values (131486,'Bombeiros');
insert into locais_de_trabalho values (264489,'GNR','s');
insert into locais_de_trabalho values (384641,'Instituto Superior de Engenharia');
insert into locais_de_trabalho values (462517,'Continente');
insert into locais_de_trabalho values (581397,'SM3Informatica');
insert into locais_de_trabalho values (782397,'Hospital');

-- responsaveis
insert into responsaveis values(1,13219152,1);
insert into responsaveis values(2,15668707,2);
insert into responsaveis values(3,27716898,3);
insert into responsaveis values(4,27724218,4);
insert into responsaveis values(5,84649472,5);

-- criterios
insert into criterios values (1,11684,21,95); -- fase 1
insert into criterios values (2,25164,50,74); -- fase 2
insert into criterios values (3,33168,18,49); -- fase 3

--doencas
insert into doencas values(1,1,'Insuficiencia cardiaca');
insert into doencas values(2,1,'Doença coronaria');
insert into doencas values(3,1,'Insuficiencia renal');
insert into doencas values(4,1,'Doença respiratoria cronica');
insert into doencas values(5,2,'Imunossupressao');
insert into doencas values(6,2,'Diabetes');
insert into doencas values(7,2,'Doencas mentais');
insert into doencas values(8,2,'Doencas neurologicas');
insert into doencas values(9,3,'Obesidade');
insert into doencas values(10,3,'Outras doencas');

--podem ter
insert into podem_ter values(2,13219152);
insert into podem_ter values(6,84649472);

-- causam
insert into causam values(1516,2);
insert into causam values(2184,1);
insert into causam values(3318,3);
insert into causam values(4318,3);
insert into causam values(5316,3);

--incluem 
insert into incluem values (1,131486);
insert into incluem values (1,264489);
insert into incluem values (2,384641);
insert into incluem values (2,462517);
insert into incluem values (3,581397);

--trabalham
insert into trabalham values(782397,13219152);
insert into trabalham values(782397,15668707);
insert into trabalham values(782397,27716898);
insert into trabalham values(782397,27724218);
insert into trabalham values(782397,84649472);

--profissoes
insert into profissoes values(1,'Enfermeiro');
insert into profissoes values(2,'Bombeiro');
insert into profissoes values(3,'Médico');
insert into profissoes values(4,'Estudante');
insert into profissoes values(5,'Apicultor');
insert into profissoes values(6,'Arquiteto');
insert into profissoes values(7,'Carpinteiro');

--abrangidas -- confirmar segundo fases,criterios e doencas
insert into abrangidas values(1,1);
insert into abrangidas values(2,1);
insert into abrangidas values(3,1);
insert into abrangidas values(4,3);
insert into abrangidas values(5,3);
insert into abrangidas values(6,3);
insert into abrangidas values(7,3);