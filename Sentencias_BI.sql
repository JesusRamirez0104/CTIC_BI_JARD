--LIMPIAR TABLA SIN COMMIT
TRUNCATE TABLE TMP_INFO_CREDITICIA;
-- consulta duplicados
select trim(codentidad), count(*) from tmp_bancos
group by trim(codentidad)
having count(*) >1
-- consulta nulos
select * from tmp_bancos
WHERE
codentidad is null
--- cantidad de registros distintos
select count(DISTINCT tipocompetencia2)from TMP_BANCOS;
--- valores maximos y minimos CODENTIDAD
SELECT MAX(LENGTH(TRIM(codentidad))) FROM TMP_BANCOS 
SELECT MIN(LENGTH(TRIM(codentidad))) FROM TMP_BANCOS
--- valores maximos y minimos BANCO
SELECT MIN(LENGTH(TRIM(banco))) FROM TMP_BANCOS
--- valores maximos y minimos NOMBREBANCO
SELECT MAX(LENGTH(TRIM(NombreBanco))) FROM TMP_BANCOS 
--- valores maximos y minimos TIPOENTIDAD
SELECT MIN(LENGTH(TRIM(TipoEntidad))) FROM TMP_BANCOS
--- valores maximos y minimos TIPOCOMPETENCIA
SELECT MAX(LENGTH(TRIM(TipoCompetencia))) FROM TMP_BANCOS
--- valores maximos y minimos TIPOCOMPETENCIA
SELECT MAX(LENGTH(TRIM(TipoCompetencia))) FROM TMP_BANCOS
--- valores maximos y minimos TIPOCOMPETENCIA2
SELECT MIN(LENGTH(TRIM(TipoCompetencia2))) FROM TMP_BANCOS 
---------------------------------------------------------------------

select count(DISTINCT SEXO)from TMP_DATOS_CLIENTE;

select count(SEXO)from TMP_DATOS_CLIENTE;
----------
SELECT MAX(LENGTH(TRIM(SEXO))) FROM TMP_DATOS_CLIENTE; 
SELECT MIN(LENGTH(TRIM(SEXO))) FROM TMP_DATOS_CLIENTE;
---------
select * from TMP_DATOS_CLIENTE
WHERE
SEXO is null
---------
select trim(SEXO), count(*) from TMP_DATOS_CLIENTE
group by trim(SEXO)
having count(*) >1

---------------------------------------------------------------------

select count(DISTINCT NOMBRE2)from TMP_DEUDOR;

select count(NOMBRE2)from TMP_DEUDOR;
----------
SELECT MAX(LENGTH(TRIM(NOMBRE2))) FROM TMP_DEUDOR; 
SELECT MIN(LENGTH(TRIM(NOMBRE2))) FROM TMP_DEUDOR;
---------
select * from TMP_DEUDOR
WHERE
TIP_REG is null
---------
select trim(SEXO), count(*) from TMP_DEUDOR
group by trim(SEXO)
having count(*) >1

--------------------------------------------------------------------------------------

select count(DISTINCT TIP_REG)from TMP_INFO_CREDITICIA;

select count(NOMBRE2)from TMP_DEUDOR;
----------
SELECT MAX(LENGTH(TRIM(CLASIFICACION))) FROM TMP_INFO_CREDITICIA; 
SELECT MIN(LENGTH(TRIM(CLASIFICACION))) FROM TMP_INFO_CREDITICIA;
---------
select * from TMP_INFO_CREDITICIA
WHERE
TIP_REG is null
---------
select trim(SEXO), count(*) from TMP_INFO_CREDITICIA
group by trim(SEXO)
having count(*) >1

-------------------------------------------------------------------------------------

INSERT INTO H_INFO_CREDITICIA_2(
PERIODO, 
TIP_REG , 
COD_SBS_CLI , 
COD_EMPRESA , 
TIP_CREDITO , 
COD_CUENTA ,
CONDICION ,
SALDO ,
CLASIFICACION
)
SELECT 
PERIODO, 
TIP_REG , 
COD_SBS_CLI , 
COD_EMPRESA , 
TIP_CREDITO , 
COD_CUENTA ,
CONDICION ,
--SALDO ,
TO_NUMBER(REPLACE (SALDO,'.',',')) ,
CLASIFICACION
FROM
TMP_INFO_CREDITICIA;
COMMIT;

SELECT * FROM H_INFO_CREDITICIA_2;

SELECT 
SALDO , -- CAMPO ORIGINAL
REPLACE(SALDO,'.',','),  -- REEMPLAZAMOS . POR ,
 -- FORMATEAMOS O CASTEAMOS A TIPO DE DATO NUMERICO
FROM 
TMP_INFO_CREDITICIA;
-------------------------
ALTER TABLE H_INFO_CREDITICIA MODIFY SALDO NUMBER(10,2)


CREATE TABLE  "H_INFO_CREDITICIA_2" 
   (	"PERIODO" NUMBER(6,0), 
	"TIP_REG" VARCHAR2(20), 
	"COD_SBS_CLI" NUMBER(9,0), 
	"COD_EMPRESA" NUMBER(3,0), 
	"TIP_CREDITO" NUMBER(2,0), 
	"COD_CUENTA" VARCHAR2(14), 
	"CONDICION" NUMBER(4,0), 
	"SALDO" NUMBER(10,2), 
	"CLASIFICACION" NUMBER(1,0)
   ) ;
   INSERT INTO H_INFO_CREDITICIA_2
   SELECT * FROM H_INFO_CREDITICIA
   
   DROP TABLE H_INFO_CREDITICIA
   
   RENAME H_INFO_CREDITICIA_2 TO H_INFO_CREDITICIA

---------------------------------------

CREATE TABLE  TMP_BANCOS
   (	
CodEntidad VARCHAR2(100),
Banco VARCHAR2(100),
Nombrebanco VARCHAR2(100),
TipoEntidad VARCHAR2(100),
TipoCompetencia VARCHAR2(100),
Tipocompetencia2 VARCHAR2(100)
   ) ;
   
--------------------------------------

CREATE TABLE  TMP_DATOS_CLIENTE 
   (	
NumDoc VARCHAR2(100),
DigVer VARCHAR2(100),
GrpVot VARCHAR2(100),
Ubigeo VARCHAR2(100),
ApPaterno VARCHAR2(100),
ApMaterno VARCHAR2(100),
Nombres VARCHAR2(100),
FecNac VARCHAR2(100),
Sexo VARCHAR2(100)
   ) ;
   
----------------------------------

CREATE TABLE  TMP_DEUDOR 
   (	
periodo VARCHAR2(100),
Tip_Reg VARCHAR2(100),
Cod_Sbs_Cli VARCHAR2(100),
Fec_Reporte VARCHAR2(100),
Tip_Doc_Tri VARCHAR2(100),
RUC VARCHAR2(100),
Tip_Doc_Ide VARCHAR2(100),
Doc_Identidad VARCHAR2(100),
Tip_Persona VARCHAR2(100),
Tip_Empresa VARCHAR2(100),
Can_Empresa VARCHAR2(100),
Deu_Calif0 VARCHAR2(100),
Deu_Calif1 VARCHAR2(100),
Deu_Calif2 VARCHAR2(100),
Deu_Calif3 VARCHAR2(100),
Deu_Calif4 VARCHAR2(100),
Raz_Soc_o_AP VARCHAR2(100),
Ape_Materna VARCHAR2(100),
Ape_Casada VARCHAR2(100),
Nombre1 VARCHAR2(100),
Nombre2 VARCHAR2(100)
   ) ;
   
-------------------------------------

CREATE TABLE  TMP_INFO_CREDITICIA
   (	
periodo VARCHAR2(100),
tip_reg VARCHAR2(100),
cod_sbs_cli VARCHAR2(100),
cod_empresa VARCHAR2(100),
tip_credito VARCHAR2(100),
cod_cuenta VARCHAR2(100),
condicion VARCHAR2(100),
saldo VARCHAR2(100),
clasificacion VARCHAR2(100)
   ) ;

-----------------------------------------

CREATE TABLE  TMP_UBIGEO
   (	
Ubigeo VARCHAR2(100),
Departamento VARCHAR2(100),
Provincia VARCHAR2(100),
Distrito VARCHAR2(100),
FlgZona VARCHAR2(100),
FlgCiudad VARCHAR2(100)
   ) ;

------------------------------------

CREATE TABLE  H_UBIGEO
   (	
Ubigeo VARCHAR2(6),
Departamento VARCHAR2(15),
Provincia VARCHAR2(30),
Distrito VARCHAR2(36),
FlgZona VARCHAR2(6),
FlgCiudad VARCHAR2(30)
   ) ;

------------------------------------------

CREATE TABLE  H_BANCOS
   (	
CodEntidad VARCHAR2(5),
Banco VARCHAR2(80),
Nombrebanco VARCHAR2(22),
TipoEntidad VARCHAR2(35),
TipoCompetencia VARCHAR2(22),
Tipocompetencia2 VARCHAR2(22)
   ) ;

-----------------------------------------

CREATE TABLE  H_DATOS_CLIENTE 
   (	
NumDoc NUMBER(8),
DigVer NUMBER(1),
GrpVot VARCHAR2(10),
Ubigeo VARCHAR2(6),
ApPaterno VARCHAR2(2),
ApMaterno VARCHAR2(2),
Nombres VARCHAR2(33),
FecNac NUMBER(8),
Sexo NUMBER(1)
   ) ;

--------------------------------------

CREATE TABLE  H_DEUDOR 
   (	
periodo VARCHAR2(7),
Tip_Reg NUMBER(7),
Cod_Sbs_Cli VARCHAR2(11),
Fec_Reporte VARCHAR2(11),
Tip_Doc_Tri VARCHAR2(11),
RUC VARCHAR2(11),
Tip_Doc_Ide VARCHAR2(11),
Doc_Identidad VARCHAR2(8),
Tip_Persona VARCHAR2(11),
Tip_Empresa VARCHAR2(11),
Can_Empresa NUMBER(11),
Deu_Calif0 NUMBER(10),
Deu_Calif1 NUMBER(10),
Deu_Calif2 NUMBER(10),
Deu_Calif3 NUMBER(10),
Deu_Calif4 NUMBER(10),
Raz_Soc_o_AP VARCHAR2(2),
Ape_Materna VARCHAR2(2),
Ape_Casada VARCHAR2(2),
Nombre1 VARCHAR2(2),
Nombre2 VARCHAR2(2)
   ) ;
   
---------------------------------------------------

CREATE TABLE  H_INFO_CREDITICIA
   (	PERIODO NUMBER(6,0), 
	TIP_REG VARCHAR2(20), 
	COD_SBS_CLI NUMBER(9,0), 
	COD_EMPRESA NUMBER(3,0), 
	TIP_CREDITO NUMBER(2,0), 
	COD_CUENTA VARCHAR2(14), 
	CONDICION NUMBER(4,0), 
	SALDO NUMBER(10,2), 
	CLASIFICACION NUMBER(1,0)
   ) ;

---------------------------------------

INSERT INTO H_INFO_CREDITICIA
(
PERIODO, 
TIP_REG , 
COD_SBS_CLI , 
COD_EMPRESA , 
TIP_CREDITO , 
COD_CUENTA ,
CONDICION ,
SALDO ,
CLASIFICACION
)
SELECT 
PERIODO, 
TIP_REG , 
COD_SBS_CLI , 
COD_EMPRESA , 
TIP_CREDITO , 
COD_CUENTA ,
CONDICION ,
--SALDO ,
TO_NUMBER(REPLACE (SALDO,'.',',')) ,
CLASIFICACION
FROM
TMP_INFO_CREDITICIA;
COMMIT;

--------------------------------------------

INSERT INTO H_BANCOS
(
CodEntidad,
Banco,
Nombrebanco,
TipoEntidad,
TipoCompetencia,
Tipocompetencia2
)
SELECT 
CodEntidad,
Banco,
Nombrebanco,
TipoEntidad,
TipoCompetencia,
Tipocompetencia2
FROM
TMP_BANCOS;
COMMIT;

-----------------------------------------------

INSERT INTO H_DATOS_CLIENTE
(
NumDoc,
DigVer,
GrpVot,
Ubigeo,
ApPaterno,
ApMaterno,
Nombres,
FecNac,
Sexo
)
SELECT 
NumDoc,
DigVer,
GrpVot,
Ubigeo,
ApPaterno,
ApMaterno,
Nombres,
FecNac,
Sexo
FROM
TMP_DATOS_CLIENTE;
COMMIT;

-------------------------------------

INSERT INTO H_DEUDOR
(
periodo,
Tip_Reg,
Cod_Sbs_Cli,
Fec_Reporte,
Tip_Doc_Tri,
RUC,
Tip_Doc_Ide,
Doc_Identidad,
Tip_Persona,
Tip_Empresa,
Can_Empresa,
Deu_Calif0,
Deu_Calif1,
Deu_Calif2,
Deu_Calif3,
Deu_Calif4,
Raz_Soc_o_AP,
Ape_Materna,
Ape_Casada,
Nombre1,
Nombre2
)
SELECT
periodo,
Tip_Reg,
Cod_Sbs_Cli,
Fec_Reporte,
Tip_Doc_Tri,
RUC,
Tip_Doc_Ide,
Doc_Identidad,
Tip_Persona,
Tip_Empresa,
Can_Empresa,
--Deu_Calif0,
TO_NUMBER(REPLACE (Deu_Calif0,'.',',')) ,
--Deu_Calif1,
TO_NUMBER(REPLACE (Deu_Calif1,'.',',')) ,
--Deu_Calif2,
TO_NUMBER(REPLACE (Deu_Calif2,'.',',')) ,
--Deu_Calif3,
TO_NUMBER(REPLACE (Deu_Calif3,'.',',')) ,
--Deu_Calif4,
TO_NUMBER(REPLACE (Deu_Calif4,'.',',')) ,
Raz_Soc_o_AP,
Ape_Materna,
Ape_Casada,
Nombre1,
Nombre2
FROM
TMP_DEUDOR;
COMMIT;

-------------------------------------------------

INSERT INTO H_UBIGEO
(
Ubigeo,
Departamento,
Provincia,
Distrito,
FlgZona,
FlgCiudad
)
SELECT 
Ubigeo,
Departamento,
Provincia,
Distrito,
FlgZona,
FlgCiudad
FROM
TMP_UBIGEO;
COMMIT;

SELECT * FROM TMP_DEUDOR;