
 create Table Permisos (
	id_permiso int Identity(1,1) Primary Key Not Null,
	nombre_permiso nvarchar(30) Not Null
)

go
 create Table Roles (
	id_rol int Identity(1,1) Primary Key Not Null,
	nombre_rol nvarchar(30) Not Null
)

go
 create Table PermisosDeRoles (
	id_permisos_roles int Identity(1,1) Primary Key Not Null,
	id_permiso int Foreign Key References Permisos(id_permiso),
	id_rol int Foreign Key References Roles(id_rol)
)

go
 create Table Usuarios (
	id_usuario int Identity(1,1) Primary Key Not Null,
	username nvarchar(30) Not Null,
	pass nvarchar(100) Not Null,
	primer_nombre nvarchar(30) Not Null,
	segundo_nombre nvarchar(30) Not Null,
	primer_apellido nvarchar(30) Not Null,
	segundo_apellido nvarchar(30) Not Null,
	fecha_de_nacimiento date Not Null,
	id_rol int Foreign Key References Roles(id_rol)
)

go 
create Table Facultades (
    id_facultad int Identity(1,1) Primary Key Not Null,
    nombre_facultad nvarchar(30) Not Null
)

go 
create Table Grupos (
    id_grupo int Identity(1,1) Primary Key Not Null,
    nombre_grupo nvarchar(30) Not Null,
    id_facultad int Foreign Key References Facultades(id_facultad)
)

go
 create Table GruposDeUsuarios (
    id_grupos_usuarios int Identity(1,1) Primary Key Not Null,
    id_usuario int Foreign Key References Usuarios(id_usuario),
    id_grupo int Foreign Key References Grupos(id_grupo)
)

go
 create Table Carreras (
    id_carrera int Identity(1,1) Primary Key Not Null,
    nombre_carrera nvarchar(30) Not Null,
    id_facultad int Foreign Key References Facultades(id_facultad)
)

go 
create Table CarrerasDeUsuarios (
    id_carreras_usuarios int Identity(1,1) Primary Key Not Null,
    id_usuario int Foreign Key References Usuarios(id_usuario),
    id_carrera int Foreign Key References Carreras(id_carrera)
)

go
 create Table Asignaturas (
    id_asignatura int Identity(1,1) Primary Key Not Null,
    codigo_asignatura int Not Null,
    nombre_asignatura nvarchar(30) Not Null,
    creditos int Not Null
)

go 
create Table Prerrequisitos (
    id_prerrequisito int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_asignatura_requisito int Foreign Key References Asignaturas(id_asignatura)
)

go 
create Table Semestres (
    id_semestre int Identity(1,1) Primary Key Not Null,
    no_semestre int Not Null
)

go 
create Table AsignaturasDeSemestres (
    id_asignaturas_semestres int Identity(1,1) Primary Key Not Null,
    id_semestre int Foreign Key References Semestres(id_semestre),
    id_asignatura int Foreign Key References Asignaturas(id_asignatura)
)

go
 create Table SemestresDeCarreras (
    id_semestres_carreras int Identity(1,1) Primary Key Not Null,
    id_semestre int Foreign Key References Semestres(id_semestre),
    id_carrera int Foreign Key References Carreras(id_carrera)
)

go 
create Table ProfesoresDeAsignaturas (
    id_profesores_asignaturas int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_usuario int Foreign Key References Usuarios(id_usuario)
)

go 
create Table Notas (
    id_nota int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_usuario int Foreign Key References Usuarios(id_usuario),
    nota int Not Null
)

go 
create Table Aulas (
    id_aula int Identity(1,1) Primary Key Not Null,
    nombre_aula nvarchar(30) Not Null,
    esLaboratorio bit Not Null,
    esActiva bit Not Null
)

go
 create Table DiaDisponibilidades (
    id_diaDisponibilidad int Identity(1,1) Primary Key Not Null,
    dia nvarchar(30) Not Null,
    start_time time Not Null,
    end_time time Not Null
)

go
 create Table Horarios (
    id_horario int Identity(1,1) Primary Key Not Null,
    id_aula int Foreign Key References Aulas(id_aula),
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    no_grupo int Not Null,
    id_diaDisponibilidad int Foreign Key References DiaDisponibilidades(id_diaDisponibilidad)
)

go
 create Table Actividades (
    id_actividad int Identity(1,1) Primary Key Not Null,
    nombre_actividad nvarchar(30) Not Null
)

go
 create Table RegistrosDeActividades (
    id_registros_actividades int Identity(1,1) Primary Key Not Null,
    id_actividad int Foreign Key References Actividades(id_actividad),
    id_usuario int Foreign Key References Usuarios(id_usuario)
)