Create Database Sandrelena
Use Sandrelena

Create Table Permisos (
	id_permiso int Identity(1,1) Primary Key Not Null,
	nombre_permiso nvarchar(30) Not Null Unique,
	isActive bit Not Null Default 1
)

--************************************************************************

Insert Into Permisos (nombre_permiso) Values ('Agregar Permisos') --id:1
Insert Into Permisos (nombre_permiso) Values ('Agregar Roles') --id:2
Insert Into Permisos (nombre_permiso) Values ('Agregar Usuarios') --id:3
Insert Into Permisos (nombre_permiso) Values ('Agregar Facultades') --id:4
Insert Into Permisos (nombre_permiso) Values ('Agregar Grupos') --id:5
Insert Into Permisos (nombre_permiso) Values ('Agregar Carreras') --id:6
Insert Into Permisos (nombre_permiso) Values ('Agregar Asignaturas') --id:7
Insert Into Permisos (nombre_permiso) Values ('Agregar Semestres') --id:8
Insert Into Permisos (nombre_permiso) Values ('Agregar Notas') --id:9
Insert Into Permisos (nombre_permiso) Values ('Agregar Aulas') --id:10
Insert Into Permisos (nombre_permiso) Values ('Agregar DiaDisponibilidades') --id:11
Insert Into Permisos (nombre_permiso) Values ('Agregar Horarios') --id:12

Insert Into Permisos (nombre_permiso) Values ('Asignar Prerrequisitos') --id:13

Insert Into Permisos (nombre_permiso) Values ('Ver Notas') --id:14

--************************************************************************

Create Table Roles (
	id_rol int Identity(1,1) Primary Key Not Null,
	nombre_rol nvarchar(30) Not Null Unique,
	isActive bit Not Null Default 1
)

--************************************************************************

Insert Into Roles (nombre_rol) Values ('Administrador') --id:1
Insert Into Roles (nombre_rol) Values ('Profesor') --id:2
Insert Into Roles (nombre_rol) Values ('Estudiante') --id:3

--************************************************************************

Create Table PermisosDeRoles (
	id_permiso int Not Null,
	id_rol int Not Null,
	Primary Key Clustered (id_permiso, id_rol),
	Foreign Key (id_permiso) References Permisos(id_permiso),
	Foreign Key (id_rol) References Roles(id_rol)
)

--************************************************************************

-- Permisos de administrador
Insert Into PermisosDeRoles Values (1, 1)
Insert Into PermisosDeRoles Values (2, 1)
Insert Into PermisosDeRoles Values (3, 1)
Insert Into PermisosDeRoles Values (4, 1)
Insert Into PermisosDeRoles Values (5, 1)
Insert Into PermisosDeRoles Values (6, 1)
Insert Into PermisosDeRoles Values (7, 1)
Insert Into PermisosDeRoles Values (8, 1)
Insert Into PermisosDeRoles Values (9, 1)
Insert Into PermisosDeRoles Values (10, 1)
Insert Into PermisosDeRoles Values (11, 1)
Insert Into PermisosDeRoles Values (12, 1)
Insert Into PermisosDeRoles Values (13, 1)
Insert Into PermisosDeRoles Values (14, 1)

-- Permisos de profesor
Insert Into PermisosDeRoles Values (9, 2)
Insert Into PermisosDeRoles Values (14, 2)

-- Permisos de estudiante
Insert Into PermisosDeRoles Values (14, 3)

--************************************************************************

Create Table Usuarios (
	id_usuario int Identity(1,1) Primary Key Not Null,
	username nvarchar(30) Not Null Unique,
	pass nvarchar(100) Not Null,
	primer_nombre nvarchar(30) Not Null,
	segundo_nombre nvarchar(30),
	primer_apellido nvarchar(30) Not Null,
	segundo_apellido nvarchar(30),
	fecha_de_nacimiento date Not Null,
	id_rol int Foreign Key References Roles(id_rol),
	isActive bit Not Null Default 1
)

--************************************************************************

-- Administradores
Insert Into Usuarios Values ('kmoreira', 'nivek', 'Kevin', 'Jose', 'Moreira', 'Morales', '1994-08-14', 1, 1) --id:1

-- Profesores
Insert Into Usuarios Values ('jwilson', 'reivaj', 'Javier', '-', 'Wilson', '-', '1980-01-01', 2, 1) --id:2
Insert Into Usuarios Values ('aurrutia', 'ofloda', 'Adolfo', '-', 'Urrutia', '-', '1980-01-01', 2, 1) --id:3
Insert Into Usuarios Values ('srestrepo', 'leumas', 'Samuel', '-', 'Restrepo', '-', '1980-01-01', 2, 1) --id:4

-- Estudiantes
Insert Into Usuarios Values ('jhodgson', 'ymmij', 'Jimmy', 'Jaider', 'Hodgson', 'Gonzalez', '1995-01-01', 3, 1) --id:5
Insert Into Usuarios Values ('calberto', 'solrac', 'Carlos', 'Alberto', 'Campos', 'Castro', '1995-01-01', 3, 1) --id:6
Insert Into Usuarios Values ('smachado', 'anelerdnas', 'Sandrelena', '-', 'Machado', '-', '2000-01-01', 3, 1) --id:7


--************************************************************************

Create Table Facultades (
    id_facultad int Identity(1,1) Primary Key Not Null,
    nombre_facultad nvarchar(30) Not Null Unique,
	isActive bit Not Null Default 1
)

--************************************************************************

Insert Into Facultades Values ('Ingeniería', 1) --id:1
Insert Into Facultades Values ('Diseño', 1) --id:2

--************************************************************************

Create Table Grupos (
    id_grupo int Identity(1,1) Primary Key Not Null,
    nombre_grupo nvarchar(30) Not Null Unique,
    id_facultad int Foreign Key References Facultades(id_facultad),
	isActive bit Not Null Default 1
)

--************************************************************************



--************************************************************************

Create Table GruposDeUsuarios (
    id_usuario int Foreign Key References Usuarios(id_usuario),
    id_grupo int Foreign Key References Grupos(id_grupo)
)

--************************************************************************



--************************************************************************

Create Table Carreras (
    id_carrera int Identity(1,1) Primary Key Not Null,
    nombre_carrera nvarchar(50) Not Null Unique,
    id_facultad int Foreign Key References Facultades(id_facultad),
	isActive bit Not Null Default 1
)

--************************************************************************

Insert Into Carreras Values ('Ingeniería en Sistemas', 1, 1) --id:1
Insert Into Carreras Values ('Ingeniería en Gerencia Informática', 1, 1) --id:2
Insert Into Carreras Values ('Diseño y Comunicación Visual', 2, 1) --id:3

--************************************************************************

Create Table CarrerasDeEstudiantes (
    id_estudiante int Not Null,
	id_carrera int Not Null,
	Primary Key Clustered (id_estudiante, id_carrera),
	Foreign Key (id_estudiante) References Usuarios(id_usuario),
    Foreign Key (id_carrera) References Carreras(id_carrera)
)

--************************************************************************

Insert Into CarrerasDeEstudiantes Values (3, 1)
Insert Into CarrerasDeEstudiantes Values (4, 1)
Insert Into CarrerasDeEstudiantes Values (4, 2)
Insert Into CarrerasDeEstudiantes Values (5, 3)

--************************************************************************

Create Table Asignaturas (
    id_asignatura int Identity(1,1) Primary Key Not Null,
    codigo_asignatura int Not Null Unique,
    nombre_asignatura nvarchar(60) Not Null Unique,
    creditos int Not Null,
	isActive bit Not Null Default 1
)

--************************************************************************

Insert Into Asignaturas Values (001, 'Ingeniería de software', 4, 1) --id:1
Insert Into Asignaturas Values (002, 'Análisis y Diseño de Objetos', 4, 1) --id:2
Insert Into Asignaturas Values (003, 'Algoritmos y Estructura de Datos', 3, 1) --id:3
Insert Into Asignaturas Values (004, 'Sistemas Operativos I', 3, 1) --id:4
Insert Into Asignaturas Values (005, 'Sistemas Operativos II', 4, 1) --id:5

Insert Into Asignaturas Values (006, 'Gerencia TIC I', 4, 1) --id:6
Insert Into Asignaturas Values (007, 'Gerencia TIC II', 4, 1) --id:7

Insert Into Asignaturas Values (008, 'Diseño Digital I', 2, 1) --id:8
Insert Into Asignaturas Values (009, 'Diseño Digital II', 3, 1) --id:9
Insert Into Asignaturas Values (010, 'Pensamiento Creativo', 3, 1) --id:10

--************************************************************************

Create Table Prerrequisitos (
    id_prerrequisito int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_asignatura_requisito int Foreign Key References Asignaturas(id_asignatura)
)

--************************************************************************

Insert Into Prerrequisitos Values (5, 4)
Insert Into Prerrequisitos Values (9, 8)

--************************************************************************

Create Table Semestres (
    id_semestre int Identity(1,1) Primary Key Not Null,
    no_semestre int Not Null,
	id_carrera int Foreign Key References Carreras(id_carrera),
	isActive bit Not Null Default 1
)

--************************************************************************

-- Ing. Sistemas
Insert Into Semestres Values (01, 1, 1) --id:1
Insert Into Semestres Values (02, 1, 1) --id:2
Insert Into Semestres Values (03, 1, 1) --id:3

-- Ing. Gerencia
Insert Into Semestres Values (01, 2, 1) --id:4
Insert Into Semestres Values (02, 2, 1) --id:5

-- Diseño CV
Insert Into Semestres Values (01, 3, 1) --id:6
Insert Into Semestres Values (02, 3, 1) --id:7

--************************************************************************

Create Table AsignaturasDeSemestres (
    id_semestre int Not Null,
	id_asignatura int Not Null,
	Primary Key Clustered (id_semestre, id_asignatura),
	Foreign Key (id_semestre) References Semestres(id_semestre),
    Foreign Key (id_asignatura) References Asignaturas(id_asignatura)
)

--************************************************************************

-- Ing. Sistemas
Insert Into AsignaturasDeSemestres Values (1, 2) --id:1
Insert Into AsignaturasDeSemestres Values (2, 1) --id:2
Insert Into AsignaturasDeSemestres Values (2, 3) --id:3
Insert Into AsignaturasDeSemestres Values (2, 4) --id:4
Insert Into AsignaturasDeSemestres Values (3, 5) --id:5

-- Ing. Gerencia
Insert Into AsignaturasDeSemestres Values (4, 6) --id:6
Insert Into AsignaturasDeSemestres Values (5, 7) --id:7

-- Diseño CV
Insert Into AsignaturasDeSemestres Values (6, 8) --id:8
Insert Into AsignaturasDeSemestres Values (6, 10) --id:9
Insert Into AsignaturasDeSemestres Values (7, 9) --id:10

--************************************************************************

Create Table ProfesoresDeAsignaturas (
    id_asignatura int Not Null,
	id_usuario int Not Null,
	Primary Key Clustered (id_asignatura, id_usuario),
	Foreign Key (id_asignatura) References Asignaturas(id_asignatura),
    Foreign Key (id_usuario) References Usuarios(id_usuario)
)

--************************************************************************

Insert Into ProfesoresDeAsignaturas Values (1, 2) --id:1
Insert Into ProfesoresDeAsignaturas Values (2, 3) --id:2
Insert Into ProfesoresDeAsignaturas Values (3, 3) --id:3
Insert Into ProfesoresDeAsignaturas Values (4, 2) --id:4
Insert Into ProfesoresDeAsignaturas Values (5, 2) --id:5
Insert Into ProfesoresDeAsignaturas Values (6, 2) --id:6
Insert Into ProfesoresDeAsignaturas Values (7, 3) --id:7
Insert Into ProfesoresDeAsignaturas Values (8, 4) --id:8
Insert Into ProfesoresDeAsignaturas Values (9, 4) --id:9
Insert Into ProfesoresDeAsignaturas Values (10, 4) --id:10

--************************************************************************

Create Table Notas (
    id_nota int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_usuario int Foreign Key References Usuarios(id_usuario),
    nota int Not Null,
	isActive bit Not Null Default 1
)

--************************************************************************

--************************************************************************

Create Table Aulas (
    id_aula int Identity(1,1) Primary Key Not Null,
    nombre_aula nvarchar(30) Not Null Unique,
    isLab bit Not Null,
    isActive bit Not Null Default 1
)

--************************************************************************

--************************************************************************

Create Table DiaDisponibilidades (
    id_diaDisponibilidad int Identity(1,1) Primary Key Not Null,
    dia nvarchar(30) Not Null,
    start_time time Not Null,
    end_time time Not Null,
	isActive bit Not Null Default 1
)

--************************************************************************

--************************************************************************

Create Table Horarios (
    id_horario int Identity(1,1) Primary Key Not Null,
    id_aula int Foreign Key References Aulas(id_aula),
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    no_grupo int Not Null,
    id_diaDisponibilidad int Foreign Key References DiaDisponibilidades(id_diaDisponibilidad),
	isActive bit Not Null Default 1
)

--************************************************************************

--************************************************************************

Create Table Actividades (
    id_actividad int Identity(1,1) Primary Key Not Null,
    nombre_actividad nvarchar(30) Not Null Unique,
	isActive bit Not Null Default 1
)

--************************************************************************

--************************************************************************

Create Table RegistrosDeActividades (
    id_actividad int Not Null,
	id_usuario int Not Null,
	Primary Key Clustered (id_actividad, id_usuario),
	Foreign Key (id_actividad) References Actividades(id_actividad),
    Foreign Key (id_usuario) References Usuarios(id_usuario)
)

--************************************************************************

--************************************************************************