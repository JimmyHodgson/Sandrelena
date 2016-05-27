using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using SandrelenaWebApplication.Scripts;
using System.Drawing;

namespace SandrelenaWebApplication.Views.admin
{
    public partial class asignaturas : System.Web.UI.Page
    {
        SandrelenaCS contexto = new SandrelenaCS();

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
                var Asignaturas = contexto.Asignaturas.ToList().Where(x => x.nombre_asignatura.Contains(search_box.Text)).OrderBy(x => x.nombre_asignatura);

                asignatura_table.DataSource = Asignaturas;
                asignatura_table.DataBind();
            }
            catch (Exception ex)
            {
                //MyMasterPage.ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
                //ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + "Error en CargarAsignaturas()" + "');");
                //MyMasterPage.JSAlert(this, "Error en CargarAsignaturas().");
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarAsignaturas()");
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
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en btnAceptar_Click()");
                //MyMasterPage.JSAlert(this, "Error en el botón aceptar.");
            }
        }

        private void LlenarEditar()
        {
            try
            {
                //var asignatura = contexto.Asignaturas.Find(Convert.ToInt32(asignatura_table.SelectedDataKey.Value.ToString()));
                //frm_mod_nombres.Text = usuario.primer_nombre;
                //frm_mod_apellidos.Text = usuario.primer_apellido;
                //frm_mod_username.Text = usuario.username;
                //frm_mod_rol.SelectedValue = usuario.id_rol.ToString(); //hay que poner not null para que no salga admin en errores
                //frm_mod_password.Text = usuario.pass;
                //frm_mod_nacimiento.Text = usuario.fecha_de_nacimiento.ToString("yyyy/MM/dd");
            }
            catch (Exception ex)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en LlenarEditar()");
                //ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");
            }

        }

        protected void search_box_TextChanged(object sender, EventArgs e)
        {
            CargarAsignaturas();
        }

        protected void asignatura_table_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Attributes.Add("OnMouseOver", "this.style.cursor = 'hand';");
                    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(asignatura_table, "Select$" + e.Row.RowIndex);
                    e.Row.ToolTip = "Haga click para seleccionar.";
                }
            }
            catch (Exception ex)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en asignatura_table_RowDataBound()");
            }
        }

        protected void asignatura_table_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in asignatura_table.Rows)
                {

                    if (row.RowIndex == asignatura_table.SelectedIndex)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                        row.ToolTip = string.Empty;
                    }
                    else
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                        row.ToolTip = "Haga click para seleccionar.";
                    }
                }
                //LlenarEditar();
            }
            catch (Exception ex)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en asignatura_table_SelectedIndexChanged()");
            }
        }
    }
}