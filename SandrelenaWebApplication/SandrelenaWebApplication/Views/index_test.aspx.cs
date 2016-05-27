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
            /********************************************************************/
            /***** PROFESOR *****/
            /********************************************************************/
            /*Todas las clases que está dando el profesor logueado (idUsuario) */
            int id_profesor = 3;
            var profesor = db.Usuarios.Find(id_profesor);
           
            var clases_profesor = db.Asignaturas.Where(o => o.Usuarios == profesor);
            /********************************************************************/
            /*Los alumnos de la clase que seleccione (idAsignatura) */
            /*Nombres y horarios de las clases que puede inscribir*/

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

            /********************************************************************/
            /***** ALUMNOS *****/
            /********************************************************************/
            /*Ver las clases que puede inscribir el estudiante logueado (idUsuario)*/
            int id_estudiante = 6;
            var estudiante = db.Usuarios.Find(id_estudiante);
            matriculas = db.Matriculas.Where(o => o.id_estudiante == id_estudiante);

            // Carreras del estudiante
            var carreras = db.Carreras.Where(o => o.Usuarios.Where(x => x.id_usuario == id_estudiante).First().id_usuario == id_estudiante);
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

            var horarios_disponibles = db.Horarios.Where(o => o.isActive == true);
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
            /********************************************************************/
            /***** ADMINISTRACIÓN *****/
            /********************************************************************/
            /*Crear una nueva clase*/
            Asignaturas nuevaClase = new Asignaturas();
            nuevaClase.codigo_asignatura = 0314;
            nuevaClase.nombre_asignatura = "Ingeniería Ambiental I";
            nuevaClase.creditos = 4;

            db.Asignaturas.Add(nuevaClase);
            db.SaveChanges();
            /********************************************************************/
            /*Darle horarios a la clase*/
            // Filtrar los horarios que ya están asignados
            id_horario = 7;
            horario = db.Horarios.Find(7);
            db.Horarios.Attach(horario);
            nuevaClase.Horarios.Add(horario);

            db.Entry(nuevaClase).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            /********************************************************************/
            /*Ver todas las clases*/ // Carlos, plz...
            var allClases = db.Asignaturas;
            /********************************************************************/
            /*Cargar los horarios de todas las clases*/
            foreach (var cl in db.Asignaturas)
            {
                var horarios_asignatura = db.Horarios.Where(o => o.id_asignatura == cl.id_asignatura);
            }

            /********************************************************************/
            /********************************************************************/
            /********************************************************************/

            // Mayo 27 2016, 00:26am
            /*Último grupo de la clase*/
            int id_asignatura = 1;
            int last_no_grupo = db.Horarios.Where(o => o.id_asignatura == id_asignatura).Max(o => o.no_grupo);
        }
    }
}
 