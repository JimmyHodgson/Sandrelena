using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

namespace SandrelenaWebApplication.Views
{
    public partial class index_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SandrelenaCS db = new SandrelenaCS();
            /***** PROFESOR *****/
            /*Todas las clases que está dando el profesor logueado (idUsuario) */
            int id_profesor = 3;
            var profesor = db.Usuarios.Find(id_profesor);
           
            var clases_profesor = db.Asignaturas.Where(o => o.Usuarios == profesor);
            /********************************************************************/
            /*Los alumnos de la clase que seleccione (idAsignatura) */
            int id_horario = 1;
            var matriculas = db.Matriculas.Where(o => o.id_horario == id_horario);
            List<Usuarios> estudiantes = new List<Usuarios>();
            foreach (var m in matriculas)
            {                
                estudiantes.Add(db.Usuarios.Find(m.id_estudiante));
            }
            /********************************************************************/
            /*La nota de cada alumno*/
            // Por cada alumno encontrado en el bloque anterior... (sustituir ambos first)
            var matricula = estudiantes.First().Matriculas.Where(o => o.id_horario == id_horario).First();
            var horario = db.Horarios.Find(matricula.id_horario);
            var clase = db.Asignaturas.Find(horario.id_asignatura);
            var nota = matricula.nota;


            /***** ALUMNOS *****/
            /*Ver las clases que puede inscribir el estudiante logueado (idUsuario)*/
            int id_estudiante = 6;
            var estudiante = db.Usuarios.Find(id_estudiante);
            matriculas = db.Matriculas.Where(o => o.id_estudiante == id_estudiante);

        }
    }
}