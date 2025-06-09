-- La idea es que se puedan ver las tablas después de hacer el ETL
USE Retiro_DW

SELECT * FROM dim_razon_retiro
SELECT * FROM dim_tipo_retiro
SELECT * FROM dim_ciclo
SELECT * FROM dim_departamento
SELECT * FROM dim_materia
SELECT * FROM dim_docente
SELECT * FROM dim_estudiante
SELECT * FROM dim_tiempo

SELECT * FROM fact_retiro