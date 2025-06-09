DROP DATABASE Retiro_DW
CREATE DATABASE Retiro_DW
USE Retiro_DW

-------------------------------- Tabla de hechos ----------------------------------------
CREATE TABLE fact_retiro(
    retiro_ID       INT IDENTITY PRIMARY KEY,
    fecha_ID        INT NOT NULL,
    estudiante_ID   INT NOT NULL,
    docente_ID      INT NOT NULL,
    materia_ID      INT NOT NULL,
    departamento_ID INT NOT NULL,
    ciclo_ID        INT NOT NULL,
    tipo_retiro_ID  INT NOT NULL,
    razon_retiro_ID INT NOT NULL
)

-------------------------------- Tablas de dimensiones-----------------------------------
CREATE TABLE dim_tiempo(
    fecha_ID    INT PRIMARY KEY,
    fecha       DATE,
    year        INT,    --inglés de la nada para no usar anio o peor
    mes         INT,
    semestre    INT
)

CREATE TABLE dim_estudiante(
    estudiante_ID       INT PRIMARY KEY,
    nombres             VARCHAR(60),
    apellidos           VARCHAR(60),
    carrera             VARCHAR(50),
    fecha_ingreso       DATE,
    estado_académico    VARCHAR(150),
    genero              VARCHAR(150),
    sexo                VARCHAR(150)
)

CREATE TABLE dim_docente(
    docente_ID      INT PRIMARY KEY,
    nombres         VARCHAR(60),
    apellidos       VARCHAR(60),
    departamento    VARCHAR(150),
    estado_docente  VARCHAR(150),
    fecha_ingreso   DATE
)

CREATE TABLE dim_materia(
    materia_ID      INT PRIMARY KEY,
    codigo          VARCHAR(150) NOT NULL,
    nombre          VARCHAR(70),
    departamento    VARCHAR(150),
    uvs             INT
)

CREATE TABLE dim_departamento(
    departamento_ID     INT PRIMARY KEY,
    nombre              VARCHAR(150)
)

CREATE TABLE dim_ciclo(
    ciclo_ID        INT PRIMARY KEY,
    periodo         INT,
    fecha_inicio    DATE,
    fecha_fin       DATE
)

CREATE TABLE dim_tipo_retiro(
    tipo_ID     INT PRIMARY KEY,
    nombre      VARCHAR(150)
)

CREATE TABLE dim_razon_retiro(
    razon_ID        INT PRIMARY KEY,
    nombre_razon    VARCHAR(150)
)

----------------------------------- Llaves foráneas -------------------------------------
ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_FECHA
FOREIGN KEY (fecha_ID) REFERENCES dim_tiempo(fecha_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_ESTUDIANTE
FOREIGN KEY (estudiante_ID) REFERENCES dim_estudiante(estudiante_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_DOCENTE
FOREIGN KEY (docente_ID) REFERENCES dim_docente(docente_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_MATERIA
FOREIGN KEY (materia_ID) REFERENCES dim_materia(materia_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_DEPARTAMENTO
FOREIGN KEY (departamento_ID) REFERENCES dim_departamento(departamento_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_CICLO
FOREIGN KEY (ciclo_ID) REFERENCES dim_ciclo(ciclo_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_TIPO
FOREIGN KEY (tipo_retiro_ID) REFERENCES dim_tipo_retiro(tipo_ID);

ALTER TABLE fact_retiro
ADD CONSTRAINT FK_RETIRO_RAZON
FOREIGN KEY (razon_retiro_ID) REFERENCES dim_razon_retiro(razon_ID);