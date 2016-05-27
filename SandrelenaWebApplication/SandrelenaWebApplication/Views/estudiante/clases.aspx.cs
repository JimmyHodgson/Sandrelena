using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using System.Data.Entity;

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
                CargarInformacion();
            }
        }

        private void CargarClases()
        {
            int id_estudiante = Convert.ToInt32(Session["IDUsuario"].ToString());
            var estudiante = modelo.Usuarios.Find(id_estudiante);

            var matriculas = modelo.Matriculas.Where(o => o.id_estudiante == estudiante.id_usuario);

            List<Horarios> horarios = new List<Horarios>();


            foreach (var x in matriculas)
            {
                horarios.Add(modelo.Horarios.Find(x.id_horario));
            }

            List<Asignaturas> clases = new List<Asignaturas>();

            foreach (var x in horarios)
            {
                clases.Add(modelo.Asignaturas.Find(x.id_asignatura));
            }

            ddlClases.DataSource = clases;
            ddlClases.DataValueField = "id_asignatura";
            ddlClases.DataTextField = "nombre_asignatura";
            ddlClases.DataBind();
        }

        private void CargarInformacion()
        {

            var clase = modelo.Asignaturas.Find(Convert.ToInt32(ddlClases.SelectedValue));

            int id_estudiante = Convert.ToInt32(Session["IDUsuario"].ToString());
            int id_asignatura = Convert.ToInt32(ddlClases.SelectedValue);

            var estudiante = modelo.Usuarios.Find(id_estudiante);

            var matriculas = modelo.Matriculas.Where(o => o.id_estudiante == estudiante.id_usuario);

            List<Horarios> horarios = new List<Horarios>();

            foreach (var x in matriculas)
            {
                horarios.Add(modelo.Horarios.Find(x.id_horario));
            }

            var horario_clase = horarios.Where(o => o.id_asignatura == id_asignatura).FirstOrDefault();

            var grupo = horario_clase.no_grupo;
            var creditos = modelo.Asignaturas.Find(id_asignatura).creditos;

            var profesor = modelo.Usuarios.Find(horario_clase.id_profesor);

            grupoLabel.Text = grupo.ToString();
            creditsLabel.Text = creditos.ToString();
            lblProfesor.Text = profesor.primer_nombre.ToString() + " " + profesor.primer_apellido.ToString();
            lblUsuario.Text = profesor.username.ToString();

            matriculas = modelo.Matriculas.Where(o => o.id_horario == horario_clase.id_horario);
            List<Usuarios> Estudiantes = new List<Usuarios>();

            foreach (var ma in matriculas)
            {
                Estudiantes.Add(modelo.Usuarios.Find(ma.id_estudiante));
            }

            gvwAlumnos.DataSource = Estudiantes;
            gvwAlumnos.DataBind();

        }


        protected void ddlClases_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarInformacion();
        }
    }
}