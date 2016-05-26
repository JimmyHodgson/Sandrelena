using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

namespace SandrelenaWebApplication.Views
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                Session["IDROL"] = "";
                Session["IDUsuario"] = "";
                Session["NombreUsuario"] = "";
                Session["Nombre"] = "";
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string usuario, contrasena;

            usuario = uLogin.Text;
            contrasena = uPassword.Text;

            SandrelenaCS contexto = new SandrelenaCS();

            try
            {
                var login = (from u in contexto.Usuarios
                             where u.username == usuario
                             && u.pass == contrasena
                             select new
                             {
                                 IDROL = u.id_rol,
                                 IDUsuario = u.id_usuario,
                                 NombreUsuario = u.username,
                                 Nombre = u.primer_apellido
                             }).FirstOrDefault();

                if (login==null)
                {
                    lblError.Text = "El nombre de usuario y la contraseña no coinciden.";
                    return;
                }
                    

                Session["IDROL"] = login.IDROL;
                Session["IDUsuario"] = login.IDUsuario;
                Session["NombreUsuario"] = login.NombreUsuario;
                Session["Nombre"] = login.Nombre;

                switch (login.IDROL.ToString())
                {
                        case "1":
                            Response.Redirect("~/Views/admin/dashboard.aspx", true);
                            break;
                        case "2":
                            Response.Redirect("~/Views/profesor/", true);
                            break;
                        case "3":
                            Response.Redirect("~/Default.aspx", true);
                            break;
                }
            }
            catch (Exception ex)
            {
                ExecuteJavaScript("showAlert('#e-alert', 'Error', '" + ex.Message.ToString() + "');");

                warning.Text = ex.Message.ToString();
                lblError.Text = "Error: " + ex.Message.ToString();
                //mensaje de error
            }

        }

        public void ExecuteJavaScript(string funcion)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), UniqueID, funcion, true);
        }

    }
}