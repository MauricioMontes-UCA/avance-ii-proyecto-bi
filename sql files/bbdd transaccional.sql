	-----------------------------------------------------ELIMINACIO Y CREACION DE BASE-----------------------------------------------
	Drop database Retiro_universitario;
	Create database Retiro_universitario;
	Use Retiro_universitario;

	------------------------------------------------------CREACION DE TABLAS------------------------------------
	-- tablas catalofo
	create table ESTADO_DOCENTE (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(50)
	);

	create table ESTADO_ACADEMICO(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);

	create table RAZON_RET(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);

	create table TIPO_RET(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);

	create table GENERO(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);
	create table SEXO(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);

	create table DEPARTAMENTO (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombre VARCHAR(150)
	);

	-- Otras tablas
	create table RAZON_OTRO(
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_razon_ret int,
		descripcion VARCHAR(1000)
	);

	--tablas principales
	CREATE TABLE ESTUDIANTE (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombres VARCHAR(150),
		Apellidos VARCHAR(150),
		Carrera VARCHAR(150), 
		Fecha_ingreso DATE,
		id_estado int,
		correo_institucional VARCHAR(100),
		id_genero INT,
		id_sexo INT,
	);

	CREATE TABLE MATERIA (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		codigo VARCHAR(150),
		nombre VARCHAR(150),
		id_departamento INT,
		UVs INT,
	);

	CREATE TABLE DOCENTE (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		Nombres VARCHAR(150),
		Apellidos VARCHAR(150),    
		id_departamento INT,
		Fecha_ingreso DATE,
		correo_institucional VARCHAR(100),
		id_estado int
	);


	CREATE TABLE CICLO(
		id	INT NOT NULL IDENTITY PRIMARY KEY,
		periodo INT,
		Fecha_ini DATE,
		Fecha_fin DATE,
	);

	CREATE TABLE CURSO (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_materia INT,
		id_docente INT,
		id_ciclo INT,
		seccion INT,
		Aula VARCHAR (20)
	);

	CREATE TABLE RETIRO (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_estudianteXcurso INT,
		id_razon INT,
		id_tipo INT,
		fecha DATE	
	);


	--tablas cruz
	CREATE TABLE ESTUDIANTEXCURSO (
		id INT NOT NULL IDENTITY PRIMARY KEY,
		id_estudiante INT,
		id_curso INT,
		fecha_asignacion DATE	
	);
	------llaves foraneas
	alter table RAZON_OTRO add foreign key(id_razon_ret) references RAZON_RET(id) on delete cascade on update cascade;


	alter table ESTUDIANTE add foreign key(id_estado) references ESTADO_ACADEMICO(id);
	alter table ESTUDIANTE add foreign key(id_genero) references GENERO(id);
	alter table ESTUDIANTE add foreign key(id_sexo) references SEXO(id);

	alter table MATERIA add foreign key(id_departamento) references DEPARTAMENTO(id);

	alter table DOCENTE add foreign key(id_departamento) references DEPARTAMENTO(id);
	alter table DOCENTE add foreign key (id_estado) references ESTADO_DOCENTE(id);

	alter table CURSO add foreign key(id_materia) references MATERIA(id) on update cascade;
	alter table CURSO add foreign key(id_docente) references DOCENTE(id) ;
	alter table CURSO add foreign key(id_ciclo) references CICLO(id);

	alter table ESTUDIANTEXCURSO add foreign key(id_estudiante) references ESTUDIANTE(id) ;
	alter table ESTUDIANTEXCURSO add foreign key(id_curso) references CURSO(id) on delete cascade on update cascade;

	alter table RETIRO add foreign key(id_estudianteXcurso) references ESTUDIANTEXCURSO(id) on delete cascade on update cascade;
	alter table RETIRO add foreign key(id_razon) references RAZON_RET(id);
	alter table RETIRO add foreign key(id_tipo) references TIPO_RET(id);

