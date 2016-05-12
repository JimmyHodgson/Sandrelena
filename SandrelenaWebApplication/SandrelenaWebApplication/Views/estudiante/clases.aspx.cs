using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

namespace SandrelenaWebApplication.Views
{
    public partial class clases : System.Web.UI.Page
    {
        SandrelenaCS modelo = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                CargarClases();
                CargarDatos();
            }
        }

        private void CargarDatos()
        {
            CargarProfesor();
            CargarEstudiantes();
        }

        private void CargarClases()
        {
            ddlClases.DataSource = modelo.Asignaturas.ToList();
            ddlClases.DataValueField = "id_asignatura";
            ddlClases.DataTextField = "nombre_asignatura";
            ddlClases.DataBind();
        }

        private void CargarProfesor()
        {
            var clase = modelo.Asignaturas.Find(Convert.ToInt32(ddlClases.SelectedValue));
            var semestre = modelo.Semestres.Find(clase.id_asignatura);
            var carrera = modelo.Carreras.Find(semestre.id_carrera);
            var facultad = modelo.Facultades.Find(carrera.id_facultad);

            var profe = modelo.Usuarios.Find(2);

            lblProfesor.Text = profe.primer_nombre.ToString() + " " + profe.primer_apellido.ToString();
            lblUsuario.Text = profe.username.ToString();
            lblFacultad.Text = facultad.nombre_facultad.ToString();
        }

        private void CargarEstudiantes()
        {
            var Estudiantes = (from u in modelo.Usuarios
                               where u.id_rol == 3
                               select u).ToList();

            gvwAlumnos.DataSource = Estudiantes;
            gvwAlumnos.DataBind();
        }

        protected void ddlClases_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatos();
        }
    }
}