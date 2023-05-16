CREATE TABLE public."EMPLEADO" (nrolegajo bigint , nombre VARCHAR(50), fechaingreso DATE , coddepto varchar(10));

INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (1,'r', '07-07-2019','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (2,'j', '07-07-2019','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (3,'l', '07-07-2021','A');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (4,'0', '07-07-2022','C');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (5,'Q', '07-07-2012','C');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (6,'g', '07-07-2019','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (7,'s', '07-07-2019','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (8,'a', '07-07-2019','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (9,'h', '07-07-2011','B');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (10,'n', '07-07-2019','C');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (11,'m', '07-07-2019','C');
INSERT INTO public."EMPLEADO" ("nrolegajo","nombre", "fechaingreso", "coddepto") VALUES (12,'b', '07-07-2019','C')

select * from public."EMPLEADO"

-- a. Los códigos de departamento para aquellos que tengan más de 5 empleados ingresados en 2019.

SELECT coddepto
from public."EMPLEADO" as e
Where fechaIngreso between '01-01-2019' and '31-12-2019'
group by coddepto
HAVING COUNT(nrolegajo) >= 5

--Los códigos de departamentos con la cantidad de empleados que tienen menos de 5 años de antigüedad,
--discriminado por los años de antigüedad.
select coddepto, count(nrolegajo) as cantidad ,( date_part('year', CURRENT_DATE) - date_part('year', fechaingreso)) AS ANTIGUEDAD
from public."EMPLEADO"
WHERE  date_part('year', CURRENT_DATE) - date_part('year', fechaingreso) <= 5
group by coddepto, date_part('year', CURRENT_DATE) - date_part('year', fechaingreso)

