CREATE DATABASE Escolar_Equipo4
USE Escolar_Equipo4

CREATE TABLE CAMPUS
(
id_campus char(4) PRIMARY KEY,
tipo_campus char(1) check(tipo_campus='V' or tipo_campus='F'),
nombre_campus char(1),
direccion varchar(70)
)

CREATE TABLE PROGRAMA(
id_programa char(4) PRIMARY KEY,
nivel_programa varchar(70),
nombre_programa varchar(70),
id_campus char(4) REFERENCES CAMPUS(id_campus),
estatus_programa varchar(8) check(estatus_programa='ACTIVO' or estatus_programa='INACTIVO'),
)

CREATE TABLE PLAN_ESTUDIOS(
id_plan_estudio char(4) PRIMARY KEY,
nombre_plan_estudio varchar(200),
id_programa char(4) REFERENCES PROGRAMA(id_programa),
semestre int,
estatus_plan_estudio varchar(8) check(estatus_plan_estudio='ACTIVO' or estatus_plan_estudio='INACTIVO'),
)

CREATE TABLE MATERIA(
id_materia_clave char(4) PRIMARY KEY,
nombre_materia varchar(70),
estatus_materia varchar(8) check(estatus_materia='ACTIVO' or estatus_materia='INACTIVO'),
)

CREATE TABLE MATERIA_PLAN_ESTUDIOS(
id_materia_clave char(4) REFERENCES MATERIA(id_materia_clave),
id_plan_estudio char(4) REFERENCES PLAN_ESTUDIOS(id_plan_estudio),
CONSTRAINT PK_MATERIA_PLAN_ESTUDIOS PRIMARY KEY (id_plan_estudio,id_materia_clave)
)

CREATE TABLE MAESTROS(
id_maestro_no_empleado char(4) PRIMARY KEY,
nombre_maestro varchar(70),
apellidos_maestro varchar(200),
direccion_maestro varchar(200),
lugar_nacimiento varchar(70),
fecha_nacimiento date,
estatus_maestro varchar(8) check(estatus_maestro='ACTIVO' or estatus_maestro='INACTIVO')
)

CREATE TABLE ALUMNOS(
id_alumno_matricula char(4) PRIMARY KEY,
nombre_alumno varchar(70),
apellidos_alumno varchar(200),
direccion_alumno varchar(200),
lugar_nacimiento varchar(70),
fecha_nacimiento date,
estatus_alumno varchar(8) check(estatus_alumno='ACTIVO' or estatus_alumno='INACTIVO')
)

CREATE TABLE ALUMNO_PROGRAMA(
id_alumno_matricula char(4) REFERENCES ALUMNOS(id_alumno_matricula),
id_plan_estudio char(4) REFERENCES PLAN_ESTUDIOS(id_plan_estudio),
id_programa char(4) REFERENCES PROGRAMA(id_programa),
estatus_alumno_programa varchar(8) check(estatus_alumno_programa='ACTIVO' or estatus_alumno_programa='INACTIVO'),
fecha_inicio date,
fecha_finalizacion date,
progreso int,
CONSTRAINT PK_ALUMNO_PROGRAMA PRIMARY KEY (id_alumno_matricula,id_programa,id_plan_estudio)
)

CREATE TABLE ALUMNO_MATERIA(
id_alumno_matricula char(4) REFERENCES ALUMNOS(id_alumno_matricula),
periodo_escolar varchar(70),
id_materia_clave char(4) REFERENCES MATERIA(id_materia_clave),
id_maestro_no_empleado char(4) REFERENCES MAESTROS(id_maestro_no_empleado),
estatus_materia varchar(8) check(estatus_materia ='EN CURSO' or estatus_materia ='APROBADA' or estatus_materia ='PENDIENTE'),
CONSTRAINT PK_ALUMNO_MATERIA PRIMARY KEY (id_alumno_matricula,periodo_escolar,id_materia_clave)
)

CREATE TABLE MAESTRO_MATERIA(
id_maestro_no_empleado char(4) REFERENCES MAESTROS(id_maestro_no_empleado),
periodo_escolar varchar(70),
id_materia_clave char(4) REFERENCES MATERIA(id_materia_clave),
estatus_materia varchar(8) check(estatus_materia ='EN CURSO' or estatus_materia ='FINALIZADA'),
CONSTRAINT PK_MAESTRO_MATERIA PRIMARY KEY (id_maestro_no_empleado,periodo_escolar,id_materia_clave)
)
