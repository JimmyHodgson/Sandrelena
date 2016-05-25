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
            int id_profesor = 1;
            var profesor = db.Usuarios.Find(id_profesor);
           
            var clases_profesor = db.Asignaturas.Where(o => o.Usuarios == profesor);
            /********************************************************************/

            int id_horario = 1;
            var matriculas = db.Matriculas.Where(o => o.id_horario == id_horario);
            List<Usuarios> estudiantes = new List<Usuarios>();
            foreach (var m in matriculas)
            {
                /*Los alumnos de la clase que seleccione (idAsignatura) */
                estudiantes.Add(db.Usuarios.Find(m.id_estudiante));
            }
            /********************************************************************/

            int id_estudiante = 1;
            //buscar todas las matriculas del horario, y x cada matricula hallar el estudiantes
        }
    }
}