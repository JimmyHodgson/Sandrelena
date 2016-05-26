using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

namespace SandrelenaWebApplication.Views.admin
{
    public partial class asignaturas : System.Web.UI.Page
    {
        SandrelenaCS contexto = new SandrelenaCS();
        SiteAdmin MyMasterPage = new SiteAdmin();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAsignaturas();
            }
        }

        private void CargarAsignaturas()
        {
            try
            {
                var Asignaturas = (from a in contexto.Asignaturas
                                   select new
                                   {
                                       Nombre = a.nombre_asignatura,
                                       Codigo = a.codigo_asignatura,
                                       Creditos = a.creditos,
                                       Estado = a.isActive
                                   }).ToList().OrderBy(a => a.Nombre);

                asignatura_table.DataSource = Asignaturas;
                asignatura_table.DataBind();
            }
            catch (Exception ex)
            {
                //MyMasterPage.ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
                ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
            }
            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Asignaturas asignatura = new Asignaturas();
                asignatura.codigo_asignatura = Convert.ToInt32(frm_agr_cod.Text);
                asignatura.nombre_asignatura = frm_agr_nom.Text;
                asignatura.creditos = Convert.ToInt32(frm_agr_cre.Text);
                asignatura.isActive = true;
                contexto.Asignaturas.Add(asignatura);
                contexto.SaveChanges();
                CargarAsignaturas();
            }
            catch (Exception ex)
            {
                //MyMasterPage.ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
                ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
            }
        }

        public void ExecuteJavaScript(string funcion)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, funcion, true);
        }

    }
}