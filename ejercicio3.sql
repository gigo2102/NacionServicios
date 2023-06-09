CREATE TABLE public."T_COMPLEMENTOS" (id bigint , tipo VARCHAR(50), valor varchar(50), index INT PRIMARY KEY);

CREATE TABLE public."T_CATEGORIA"("COD_CATEGORIA" INT PRIMARY KEY , "DESCRIPCION" varchar(50));
					
CREATE TABLE public."T_SUB_CATEGORIAS"("COD_SUBCATEGORIA" INT, "CODCATEGORIA" INT REFERENCES "T_CATEGORIA", 
					"DESCRIPCION" varchar(50), 
					 PRIMARY KEY("COD_SUBCATEGORIA", "CODCATEGORIA"));
					
					
CREATE TABLE public."T_TRANSACCIONES"("ID" bigint PRIMARY KEY , 
					"TIEMPO" INT, "MOTIVO" INT , "FECHA" DATE);
					
INSERT INTO public."T_COMPLEMENTOS"("ID","TIPO", "VALOR" ,"INDEX") VALUES(169142273781929866,'CODSUBCAT',10108,1);					
INSERT INTO public."T_COMPLEMENTOS"("ID", "TIPO", "VALOR" ,"INDEX") VALUES (169142273781929866, 'COMENT','analia domiguez*40000000',2);					
INSERT INTO public."T_COMPLEMENTOS"("ID", "TIPO", "VALOR" ,"INDEX") VALUES (169142273984829319, 'CODSUBCAT',12228,3);					
INSERT INTO public."T_COMPLEMENTOS"("ID", "TIPO", "VALOR" ,"INDEX") VALUES (169142273984829319, 'COMENT','Magali Heredia*111111111*4444444',4);					
INSERT INTO public."T_COMPLEMENTOS"("ID", "TIPO", "VALOR" ,"INDEX") VALUES (169142274080970660, 'CODSUBCAT',4716,5);					
INSERT INTO public."T_COMPLEMENTOS"("ID", "TIPO", "VALOR" ,"INDEX") VALUES (169142274080970660, 'COMENT','RODRIGUEZ MARIANO ANDRES',6);

INSERT INTO public."T_CATEGORIA" ("COD_CATEGORIA","DESCRIPCION" )VALUES (4928,'TARJETA DE DEBITO');
INSERT INTO public."T_CATEGORIA" ("COD_CATEGORIA" , "DESCRIPCION") VALUES (2352,'Programa de beneficios Consultas');
INSERT INTO public."T_CATEGORIA" ("COD_CATEGORIA","DESCRIPCION" )VALUES (5802,'TARJETA DE CREDITO');	

INSERT INTO public."T_SUB_CATEGORIAS" ("COD_SUBCATEGORIA", "CODCATEGORIA","DESCRIPCION") VALUES (10108,4928,'TARJETA DE DEBITO - General');							   
INSERT INTO public."T_SUB_CATEGORIAS" ("COD_SUBCATEGORIA", "CODCATEGORIA","DESCRIPCION") VALUES (12228,5802,'OTRAS CONSULTAS');
INSERT INTO public."T_SUB_CATEGORIAS" ("COD_SUBCATEGORIA", "CODCATEGORIA","DESCRIPCION") VALUES (4716,2352,'No Contactado');
									   
INSERT INTO public."T_TRANSACCIONES" ("ID", "TIEMPO", "MOTIVO", "FECHA") VALUES (169142273781929866,212,5,'2022-03-21');
INSERT INTO public."T_TRANSACCIONES" ("ID", "TIEMPO", "MOTIVO", "FECHA" )VALUES (169142273984829319,238,2,'2022-03-21');
INSERT INTO public."T_TRANSACCIONES" ("ID", "TIEMPO", "MOTIVO", "FECHA" )VALUES (169142274080970660,48,4,'2022-03-21');		

select T."ID" , T."FECHA",(
	select "VALOR" from "T_COMPLEMENTOS" as C where C."TIPO" ilike 'COMENT' and C."ID" = T."ID") AS VALOR, 
	T."MOTIVO", CT."DESCRIPCION", SC."DESCRIPCION"
from "T_COMPLEMENTOS" AS C
INNER JOIN "T_SUB_CATEGORIAS" AS SC ON SC."COD_SUBCATEGORIA"::VARCHAR = C."VALOR" AND C."TIPO" ILIKE 'CODSUBCAT'
INNER JOIN "T_CATEGORIA" AS CT ON CT."COD_CATEGORIA" = SC."CODCATEGORIA"
INNER JOIN "T_TRANSACCIONES" AS T ON T."ID" = C."ID"





								  
									   
							   
