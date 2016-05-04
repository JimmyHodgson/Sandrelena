Create Database Sandrelena
Use Sandrelena

Create Table Permisos (
	id_permiso int Identity(1,1) Primary Key Not Null,
	nombre_permiso nvarchar(30) Not Null Unique,
	isActive bit Not Null
)

Create Table Roles (
	id_rol int Identity(1,1) Primary Key Not Null,
	nombre_rol nvarchar(30) Not Null Unique,
	isActive bit Not Null
)

Create Table PermisosDeRoles (
	id_permisos_roles int Identity(1,1) Primary Key Not Null,
	id_permiso int Foreign Key References Permisos(id_permiso),
	id_rol int Foreign Key References Roles(id_rol)
)

Create Table Usuarios (
	id_usuario int Identity(1,1) Primary Key Not Null,
	username nvarchar(30) Not Null Unique,
	pass nvarchar(100) Not Null,
	primer_nombre nvarchar(30) Not Null,
	segundo_nombre nvarchar(30) Not Null,
	primer_apellido nvarchar(30) Not Null,
	segundo_apellido nvarchar(30) Not Null,
	fecha_de_nacimiento date Not Null,
	id_rol int Foreign Key References Roles(id_rol),
	isActive bit Not Null
)

Create Table Facultades (
    id_facultad int Identity(1,1) Primary Key Not Null,
    nombre_facultad nvarchar(30) Not Null Unique,
	isActive bit Not Null
)

Create Table Grupos (
    id_grupo int Identity(1,1) Primary Key Not Null,
    nombre_grupo nvarchar(30) Not Null Unique,
    id_facultad int Foreign Key References Facultades(id_facultad),
	isActive bit Not Null
)

Create Table GruposDeUsuarios (
    id_grupos_usuarios int Identity(1,1) Primary Key Not Null,
    id_usuario int Foreign Key References Usuarios(id_usuario),
    id_grupo int Foreign Key References Grupos(id_grupo)
)

Create Table Carreras (
    id_carrera int Identity(1,1) Primary Key Not Null,
    nombre_carrera nvarchar(30) Not Null Unique,
    id_facultad int Foreign Key References Facultades(id_facultad),
	isActive bit Not Null
)

Create Table CarrerasDeUsuarios (
    id_carreras_usuarios int Identity(1,1) Primary Key Not Null,
    id_usuario int Foreign Key References Usuarios(id_usuario),
    id_carrera int Foreign Key References Carreras(id_carrera)
)

Create Table Asignaturas (
    id_asignatura int Identity(1,1) Primary Key Not Null,
    codigo_asignatura int Not Null Unique,
    nombre_asignatura nvarchar(30) Not Null Unique,
    creditos int Not Null,
	isActive bit Not Null
)

Create Table Prerrequisitos (
    id_prerrequisito int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_asignatura_requisito int Foreign Key References Asignaturas(id_asignatura)
)

Create Table Semestres (
    id_semestre int Identity(1,1) Primary Key Not Null,
    no_semestre int Not Null,
	isActive bit Not Null
)

Create Table AsignaturasDeSemestres (
    id_asignaturas_semestres int Identity(1,1) Primary Key Not Null,
    id_semestre int Foreign Key References Semestres(id_semestre),
    id_asignatura int Foreign Key References Asignaturas(id_asignatura)
)

Create Table SemestresDeCarreras (
    id_semestres_carreras int Identity(1,1) Primary Key Not Null,
    id_semestre int Foreign Key References Semestres(id_semestre),
    id_carrera int Foreign Key References Carreras(id_carrera)
)

Create Table ProfesoresDeAsignaturas (
    id_profesores_asignaturas int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_usuario int Foreign Key References Usuarios(id_usuario)
)

Create Table Notas (
    id_nota int Identity(1,1) Primary Key Not Null,
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    id_usuario int Foreign Key References Usuarios(id_usuario),
    nota int Not Null,
	isActive bit Not Null
)

Create Table Aulas (
    id_aula int Identity(1,1) Primary Key Not Null,
    nombre_aula nvarchar(30) Not Null Unique,
    isLab bit Not Null,
    isActive bit Not Null
)

Create Table DiaDisponibilidades (
    id_diaDisponibilidad int Identity(1,1) Primary Key Not Null,
    dia nvarchar(30) Not Null,
    start_time time Not Null,
    end_time time Not Null,
	isActive bit Not Null
)

Create Table Horarios (
    id_horario int Identity(1,1) Primary Key Not Null,
    id_aula int Foreign Key References Aulas(id_aula),
    id_asignatura int Foreign Key References Asignaturas(id_asignatura),
    no_grupo int Not Null,
    id_diaDisponibilidad int Foreign Key References DiaDisponibilidades(id_diaDisponibilidad),
	isActive bit Not Null
)

Create Table Actividades (
    id_actividad int Identity(1,1) Primary Key Not Null,
    nombre_actividad nvarchar(30) Not Null Unique,
	isActive bit Not Null
)

Create Table RegistrosDeActividades (
    id_registros_actividades int Identity(1,1) Primary Key Not Null,
    id_actividad int Foreign Key References Actividades(id_actividad),
    id_usuario int Foreign Key References Usuarios(id_usuario)
)

--************************************************************************

go
-- in: name
Create Procedure getIDPermiso (
	@name nvarchar(30)
)
as
begin
	Select id_permiso From Permisos Where nombre_permiso = @name
end

go
-- in: name
Create Procedure addPermiso (
	@name nvarchar(30)
)
as
begin
	Insert Into Permisos (nombre_permiso, isActive) Values (@name, 1)
end

go
-- in: actual_nombre_permiso, toBe_nombre_permiso
Create Procedure editNamePermiso (
	@actual_name nvarchar,
	@toBe_name nvarchar(30)
)
as
begin
	Update Permisos Set nombre_permiso = @toBe_name Where nombre_permiso = @actual_name
end

go
-- in: id_permiso
Create Procedure activatePermiso (
	@id int
)
as
begin
	Update Permisos Set isActive = 1 Where id_permiso = @id
end

go
-- in: id_permiso
Create Procedure deactivatePermiso (
	@id int
)
as
begin
	Update Permisos Set isActive = 0 Where id_permiso = @id
end

--************************************************************************

exec addPermiso 'write'

--************************************************************************

go
-- in: name
Create Procedure getIDRol (
	@name nvarchar(30)
)
as
begin
	Select id_rol From Roles Where nombre_rol = @name
end

go
-- in: name
Create Procedure addRol (
	@name nvarchar(30)
)
as
begin
	Insert Into Roles (nombre_rol, isActive) Values (@name, 1)
end

go
-- in: actuar_nombre_rol, toBe_nombre_rol
Create Procedure editNameRol (
	@actual_name nvarchar(30),
	@toBe_name nvarchar(30)
)
as
begin
	Update Roles Set nombre_rol = @toBe_name Where nombre_rol = @actual_name
end

go
-- in: id_rol
Create Procedure activateRol (
	@id int
)
as
begin
	Update Roles Set isActive = 1 Where id_rol = @id
end

go
-- in: id_rol
Create Procedure deactivateRol (
	@id int
)
as
begin
	Update Roles Set isActive = 0 Where id_rol = @id
end

--************************************************************************

exec addRol 'admin'

--************************************************************************

go
-- in: nombre_rol, nombre_permiso
Create Procedure assignPermisoToRol (
    @nombre_rol nvarchar(30),
    @nombre_permiso nvarchar(30)
)
as
begin
    Insert Into PermisosDeRoles (id_permiso, id_rol) Values(
        (Select id_permiso From Permisos Where nombre_permiso = @nombre_permiso),
        (Select id_rol From Roles Where nombre_rol = @nombre_rol)
    )
end

go
-- in: nombre_rol
Create Procedure getPermisosOfRol (
    @name nvarchar(30)
)
as
begin
    Select * From Permisos
end

--************************************************************************

exec assignPermisoToRol 'admin', 'write'

--************************************************************************

go
-- in: username
Create Procedure getUser_byUsername (
    @username nvarchar(30)
)
as
begin
    Select * From Usuarios Where username = @username
end

go
-- in: first_name
Create Procedure getUser_byFirstName (
    @f_name nvarchar(30)
)
as
begin
    Select * From Usuarios Where primer_nombre Like '%'+@f_name+'%'
end

go
-- in: first_lastName
Create Procedure getUser_byFirstLastName (
    @f_lname nvarchar(30)
)
as
begin
    Select * From Usuarios Where primer_apellido Like '%'+@f_lname+'%'
end

go
-- in: username, pass
-- out: 0 or 1
Create Procedure login (
    @username nvarchar(30),
    @pass nvarchar(100)
)
as
begin
    Select Case When Exists (
        Select * From Usuarios
        Where   username = @username
            And pass = @pass
    )
    Then CAST(1 As bit)
    Else CAST(0 As bit) end
end

go
-- in: username, pass, primer_nombre, segundo_nombre,
--     primer_apellido, segundo_apellido,
--     fecha_de_nacimiento, id_rol
Create Procedure addUsuario (
    @username nvarchar(30),
    @pass nvarchar(100),
    @f_name nvarchar(30),
    @s_name nvarchar(30),
    @f_lname nvarchar(30),
    @s_lname nvarchar(30),
    @birth date,
    @id_rol int
)
as
begin
    Insert Into Usuarios
		(username, pass, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, fecha_de_nacimiento, id_rol, isActive)
		Values
			(@username, @pass, @f_name, @s_name, @f_lname, @s_lname, @birth, @id_rol, 1)
end

--************************************************************************

exec addUsuario 'kevmusic','123','Kevin', 'Jose', 'Moreira', 'Morales', '1994-08-14', 1

--************************************************************************











