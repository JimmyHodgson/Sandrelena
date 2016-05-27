using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using SandrelenaWebApplication.Scripts;

namespace SandrelenaWebApplication.Views.admin
{
    public partial class facultades : System.Web.UI.Page
    {

        SandrelenaCS contexto = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarFacultades();
                CargarCarreras();
            }
        }

        private void CargarFacultades()
        {
            //var facultades = (from f in contexto.Facultades
            //                  select new
            //                  {
            //                      Nombre = f.nombre_facultad
            //                  }).ToList().OrderBy(f => f.Nombre);

            try
            {
                var Facultades = contexto.Facultades.ToList().OrderBy(x => x.nombre_facultad);

                faculty_table.DataSource = Facultades;
                faculty_table.DataBind();

                ddlFacultades.DataSource = Facultades;
                ddlFacultades.DataTextField = "nombre_facultad";
                ddlFacultades.DataValueField = "id_facultad";
                ddlFacultades.DataBind();
                ddlFacultades.Items.Insert(0, new ListItem("Todas", "0"));
            }
            catch (Exception)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarCarreras()");
            }


        }

        private void CargarCarreras()
        {
            try
            {
                
                
                int facultad = Convert.ToInt32(ddlFacultades.SelectedValue);

                var lascarreras = (from c in contexto.Carreras
                                   select c);

                if (ddlFacultades.SelectedItem.ToString() != "Todas")
                {
                    lascarreras = lascarreras.Where(c => c.id_facultad == facultad);
                }
                lascarreras = lascarreras.OrderBy(c => c.nombre_carrera);
                

                carreras_table.DataSource = lascarreras.ToList();
                carreras_table.DataBind();
            }
            catch (Exception)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarCarreras()");
            }
            
        }

        protected void ddlFacultades_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCarreras();
        }
    }
}