Create Database Sandrelena
Use Sandrelena

Create Table Permisos (
	id_permiso int Identity(1,1) Primary Key Not Null,
	nombre_permiso nvarchar(50) Not Null
)

Create Table Roles (
	id_rol int Identity(1,1) Primary Key Not Null,
	nombre_rol nvarchar(50) Not Null
)

Create Table PermisosDeRoles (
	id_permisos_roles int Identity(1,1) Primary Key Not Null,
	id_permiso int Foreign Key References Permisos(id_permiso),
	id_rol int Foreign Key References Roles(id_rol)
)

Create Table Usuarios (
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