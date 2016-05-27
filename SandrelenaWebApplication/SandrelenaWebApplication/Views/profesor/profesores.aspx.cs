using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using SandrelenaWebApplication.Scripts;

namespace SandrelenaWebApplication.Views.profesor
{
    public partial class profesores : System.Web.UI.Page
    {

        SandrelenaCS contexto = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClases();
                CargarInformacion();
            }
        }

        private void CargarClases()
        {
            try
            {
                //int id_profesor = Convert.ToInt32(Session["IDUsuario"].ToString());

                //var profesor = contexto.Usuarios.Find(id_profesor);

                //var clases_profesor = contexto.Asignaturas.Where(o => o.Usuarios == profesor);

                //ddlClases.DataSource = clases_profesor;
                //ddlClases.DataTextField = "nombre_asignatura";
                //ddlClases.DataValueField = "id_asignatura";
                //ddlClases.DataBind();
            }
            catch (Exception)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarClases()");
            }
            
        }

        private void CargarInformacion()
        {
            try
            {
                //var clase = contexto.Asignaturas.Find(Convert.ToInt32(ddlClases.SelectedValue));

                //int id_profesor = Convert.ToInt32(Session["IDUsuario"].ToString());
                //int id_asignatura = Convert.ToInt32(ddlClases.SelectedValue);

                //var estudiante = contexto.Usuarios.Find(id_profesor);

                //var matriculas = contexto.Matriculas.Where(o => o.id_estudiante == estudiante.id_usuario);

                //List<Horarios> horarios = new List<Horarios>();

                //foreach (var x in matriculas)
                //{
                //    horarios.Add(contexto.Horarios.Find(x.id_horario));
                //}

                //var horario_clase = horarios.Where(o => o.id_asignatura == id_asignatura).FirstOrDefault();

                //var grupo = horario_clase.no_grupo;
                //var creditos = contexto.Asignaturas.Find(id_asignatura).creditos;

                //grupoLabel.Text = grupo.ToString();
                //creditsLabel.Text = creditos.ToString();
            }
            catch (Exception)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarInformacion()");
            }
            
        }

    }
}