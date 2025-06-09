USE Retiro_universitario

-- Insertar catálogos
INSERT INTO ESTADO_DOCENTE (Nombre) VALUES
('Activo'), ('Inactivo'), ('Suspendido');

INSERT INTO ESTADO_ACADEMICO (Nombre) VALUES
('Matriculado'), ('Retirado'), ('Graduado');

INSERT INTO RAZON_RET (Nombre) VALUES
('Problemas económicos'), ('Salud'), ('Cambio de carrera'), ('Problemas personales');

INSERT INTO TIPO_RET (Nombre) VALUES
('Temporal'), ('Definitivo');

INSERT INTO GENERO (Nombre) VALUES
('Masculino'), ('Femenino'), ('No binario');

INSERT INTO SEXO (Nombre) VALUES
('Masculino'), ('Femenino');

INSERT INTO DEPARTAMENTO (Nombre) VALUES
('Matemática'), ('Física'), ('Informática'), ('Ciencias Sociales');

-- Insertar estudiantes
INSERT INTO ESTUDIANTE (Nombres, Apellidos, Carrera, Fecha_ingreso, id_estado, correo_institucional, id_genero, id_sexo) VALUES
('Carlos', 'Martínez', 'Ingeniería Informática', '2022-01-10', 1, 'carlos.martinez@universidad.edu', 1, 1),
('Laura', 'Pérez', 'Matemática Aplicada', '2021-01-10', 1, 'laura.perez@universidad.edu', 2, 2),
('Jorge', 'Hernández', 'Física', '2020-08-15', 2, 'jorge.hernandez@universidad.edu', 1, 1);

-- Insertar docentes
INSERT INTO DOCENTE (Nombres, Apellidos, id_departamento, Fecha_ingreso, correo_institucional, id_estado) VALUES
('Ana', 'Ramírez', 1, '2015-06-01', 'ana.ramirez@universidad.edu', 1),
('Luis', 'Gómez', 3, '2018-03-12', 'luis.gomez@universidad.edu', 1);

-- Insertar materias
INSERT INTO MATERIA (codigo, nombre, id_departamento, UVs) VALUES
('MAT101', 'Cálculo I', 1, 4),
('INF201', 'Estructuras de Datos', 3, 4),
('FIS110', 'Física General', 2, 4);

-- Insertar ciclos
INSERT INTO CICLO (periodo, Fecha_ini, Fecha_fin) VALUES
(1, '2024-01-15', '2024-06-15'),
(2, '2024-07-01', '2024-12-01');

-- Insertar cursos
INSERT INTO CURSO (id_materia, id_docente, id_ciclo, seccion, Aula) VALUES
(1, 1, 1, 1, 'B101'),
(2, 2, 1, 1, 'A202'),
(3, 1, 2, 2, 'C303');

-- Insertar estudiantes por curso
INSERT INTO ESTUDIANTEXCURSO (id_estudiante, id_curso, fecha_asignacion) VALUES
(1, 1, '2024-01-20'),
(2, 2, '2024-01-21'),
(3, 3, '2024-07-05');

-- Insertar retiros
INSERT INTO RETIRO (id_estudianteXcurso, id_razon, id_tipo, fecha) VALUES
(3, 1, 2, '2024-08-01');

-- Insertar razones otras
INSERT INTO RAZON_OTRO (id_razon_ret, descripcion) VALUES
(4, 'Tuvo que regresar a su país de origen por motivos familiares');