using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using SandrelenaWebApplication.Scripts;

namespace SandrelenaWebApplication.Views
{
    public partial class matricula : System.Web.UI.Page
    {

        SandrelenaCS contexto = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClasesDisponibles();
            }
        }

        private void CargarClasesDisponibles()
        {
            try
            {
                int id_estudiante = Convert.ToInt32(Session["IDUsuario"].ToString());
                var estudiante = contexto.Usuarios.Find(id_estudiante);
                var matriculas = contexto.Matriculas.Where(o => o.id_estudiante == id_estudiante);

                // Carreras del estudiante
                var carreras = contexto.Carreras.Where(o => o.Usuarios.Where(x => x.id_usuario == id_estudiante).FirstOrDefault().id_usuario == id_estudiante).ToList();
                List<Semestres> semestres = new List<Semestres>();
                List<Asignaturas> clases = new List<Asignaturas>();
                foreach (var ca in carreras)
                {
                    // Semestres de las carreras
                    foreach (var sm in ca.Semestres)
                    {
                        // Clases de los semestres
                        foreach (var cl in sm.Asignaturas)
                        {
                            clases.Add(cl);
                        }
                    }
                }

                var horarios_disponibles = contexto.Horarios.Where(o => o.isActive == true);
                foreach (var ma in matriculas)
                {
                    // Excluyendo las ya matriculadas
                    horarios_disponibles = horarios_disponibles.Where(o => o.id_horario != ma.id_horario);
                    foreach (var cl in clases)
                    {
                        // Excluyendo las que no son de la carrera
                        horarios_disponibles = horarios_disponibles.Where(o => o.id_asignatura == cl.id_asignatura);
                    }
                }

                GridView1.DataSource = clases;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarClasesDisponibles()");
            }
        }

        private void Matricular()
        {
            //int id_clase = 1;
            //// Cargado de un combobox
            //var horarios = contexto.Horarios.ToList();//horarios_disponibles;
            //// Cargado de otro combobox
            //var horarios_clase = horarios.Where(o => o.id_asignatura == id_clase);
            //// Seleccionando de otro o del mismo (no se el puto de Jimmy)
            //int id_horario_seleccionado = 1;
            //// Matriculando
            //Matriculas m = new Matriculas();
            //m.id_horario = id_horario_seleccionado;
            //m.id_estudiante = 1; // La variable de sesión
            //m.fecha_de_inscripcion = DateTime.Now;

            //contexto.Matriculas.Add(m);
            //contexto.SaveChanges();
        }

    }
}