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

                    Session["IDROL"] = login.IDROL;
                    Session["IDUsuario"] = login.IDUsuario;
                    Session["NombreUsuario"] = login.NombreUsuario;
                    Session["Nombre"] = login.Nombre;

                    switch (login.IDROL.ToString())
                    {
                        case "1":
                            Response.Redirect("~/Views/admin/dashboard.aspx", false);
                            break;
                        case "2":
                            Response.Redirect("~/Views/profesor/enproceso.aspx", false);
                            break;
                        case "3":
                            Response.Redirect("~/Default.aspx", false);
                            break;
                    }
            }
            catch (Exception)
            {
                
                //mensaje de error
            }

        }
    }
}