using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;

namespace Business
{

    public class Carrera
    {
        //EJEMPLO DE USO DE CLASES

        #region Constructores

        public Carrera()
        {
            //Constructor para la lista de carreras

            _modelo = new SandrelenaCS();

            var Carreras = (from c in _modelo.Carreras
                            select new
                            {
                                IDCarrera = c.id_carrera,
                                IDFacutlad = c.id_facultad,
                                Nombre = c.nombre_carrera
                            }).ToList();
            _listado = Carreras;
        }

        public Carrera(int id)
        {
            //Constructor para instanciar una carrera

            _modelo = new SandrelenaCS();

            var carrera = (from c in _modelo.Carreras
                            where c.id_carrera==id
                            select new
                            {
                                Nombre = c.nombre_carrera,
                                IDCarrera = c.id_carrera,
                                IDFacultad = c.id_facultad
                            }).Single();

            _nombre = carrera.Nombre.ToString();
            _idCarrera = carrera.IDCarrera;
            _idFacultad = carrera.IDFacultad;

        }

        #endregion

        #region Propiedades

        private SandrelenaCS _modelo;

        public dynamic _listado;
        private string _nombre;
        private int _idCarrera;
        private int? _idFacultad;

        public dynamic listado { get { return _listado; } }
        public string nombre { get { return _nombre; } set { _nombre = value; } }
        public int idCarrera { get { return _idCarrera; } set { _idCarrera = value; } }
        public int? idFacultad { get { return _idFacultad; } set { _idFacultad = value; } }

        #endregion

        #region Métodos

        //Parecido a las consultas de los constructores pero con updates, inserts, etc.; instanciando las clases del modelo.

        #endregion

    }
}
