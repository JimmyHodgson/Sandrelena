using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

namespace SandrelenaWebApplication.Views.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SandrelenaCS contexto = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarUsuarios();
                CargarRoles();
            }
        }

        private void CargarUsuarios()
        {
            try
            {
                var usuarios = (from u in contexto.Usuarios
                                    join r in contexto.Roles on u.id_rol equals r.id_rol
                                    select new
                                    {
                                        Nombre = (u.primer_nombre + " " + u.primer_apellido),
                                        Usuario = u.username,
                                        Nacimiento = u.fecha_de_nacimiento,
                                        Rol = r.nombre_rol,
                                        Estado = u.isActive
                                    }).ToList().OrderBy(u => u.Nombre);

                user_table.DataSource = usuarios;
                user_table.DataBind();
            }
            catch (Exception)
            {
                
            }
            
        }

        private void CargarRoles()
        {
            frm_agr_rol.DataSource = contexto.Roles.ToList();
            frm_agr_rol.DataTextField = "nombre_rol";
            frm_agr_rol.DataValueField = "id_rol";
            frm_agr_rol.DataBind();

            frm_mod_rol.DataSource = contexto.Roles.ToList();
            frm_mod_rol.DataTextField = "nombre_rol";
            frm_mod_rol.DataValueField = "id_rol";
            frm_mod_rol.DataBind();
            
        }

        protected void frm_agr_agregar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuarios user = new Usuarios();
                user.primer_nombre = frm_agr_nombres.Text;
                user.primer_apellido = frm_agr_apellidos.Text;
                user.username = frm_agr_username.Text;
                user.id_rol = Convert.ToInt32(frm_agr_rol.SelectedValue);
                user.pass = frm_agr_password.Text;
                user.fecha_de_nacimiento = Convert.ToDateTime(frm_agr_nacimiento.Text);
                user.isActive = true;
                contexto.Usuarios.Add(user);
                contexto.SaveChanges();
                CargarUsuarios();
            }
            catch (Exception)
            {

            }
            
        }


    }
}