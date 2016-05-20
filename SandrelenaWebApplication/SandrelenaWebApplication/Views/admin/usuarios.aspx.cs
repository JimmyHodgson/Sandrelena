using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using System.Drawing;

namespace SandrelenaWebApplication.Views.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SandrelenaCS modelo = new SandrelenaCS();
        int selectedUserID;

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
                selectedUserID = 0;
                var usuarios = (from u in modelo.Usuarios
                                join r in modelo.Roles on u.id_rol equals r.id_rol
                                where (u.primer_nombre.Contains(search_box.Text)
                                    || u.primer_apellido.Contains(search_box.Text))
                                    select new
                                    {
                                        IDUsuario = u.id_usuario,
                                        Nombre = (u.primer_nombre + " " + u.primer_apellido),
                                        Usuario = u.username,
                                        Nacimiento = u.fecha_de_nacimiento,
                                        Rol = r.nombre_rol,
                                        Estado = u.isActive
                                    }).ToList().OrderBy(u => u.Nombre);

                //var users = modelo.Usuarios

                user_table.DataSource = usuarios;
                user_table.DataBind();
            }
            catch (Exception)
            {
                
            }
            
        }

        private void CargarRoles()
        {
            frm_agr_rol.DataSource = modelo.Roles.ToList();
            frm_agr_rol.DataTextField = "nombre_rol";
            frm_agr_rol.DataValueField = "id_rol";
            frm_agr_rol.DataBind();

            frm_mod_rol.DataSource = modelo.Roles.ToList();
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
                modelo.Usuarios.Add(user);
                modelo.SaveChanges();
                CargarUsuarios();
            }
            catch (Exception)
            {

            }
            
        }

        protected void search_box_TextChanged(object sender, EventArgs e)
        {
            CargarUsuarios();
        }

        protected void user_table_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("OnMouseOver", "this.style.cursor = 'hand';");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(user_table, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Haga click para seleccionar.";
            }
        }

        protected void user_table_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Label1.Text = user_table.SelectedDataKey.Value.ToString();
            selectedUserID = Convert.ToInt32(user_table.SelectedDataKey.Value.ToString());
            foreach (GridViewRow row in user_table.Rows)
            {
               
                if (row.RowIndex == user_table.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Haga click para seleccionar..";
                }
            }
            LlenarEditar();
        }

        private void LlenarEditar()
        {
            try
            {
                var usuario = modelo.Usuarios.Find(selectedUserID);
                frm_mod_nombres.Text = usuario.primer_nombre;
                frm_mod_apellidos.Text = usuario.primer_apellido;
                frm_mod_username.Text = usuario.username;
                frm_mod_rol.SelectedValue = usuario.id_rol.ToString(); //hay que poner not null para que no salga admin en errores
                frm_mod_password.Text = usuario.pass;
                frm_mod_nacimiento.Text = usuario.fecha_de_nacimiento.ToString("yyyy/MM/dd");
            }
            catch (Exception ex)
            {

            }

        }

        protected void frm_mod_aceptar_Click(object sender, EventArgs e)
        {
            try
            {
                selectedUserID = Convert.ToInt32(user_table.SelectedDataKey.Value.ToString());
                Usuarios actUsuario = new Usuarios();
                actUsuario = modelo.Usuarios.Find(selectedUserID);
                actUsuario.primer_nombre = frm_mod_nombres.Text;
                actUsuario.primer_apellido = frm_mod_apellidos.Text;
                actUsuario.id_rol = Convert.ToInt32(frm_mod_rol.SelectedValue);
                if (frm_mod_password.Text != "")
                    actUsuario.pass = frm_mod_password.Text;
                actUsuario.fecha_de_nacimiento = Convert.ToDateTime(frm_mod_nacimiento.Text);
                modelo.Usuarios.Attach(actUsuario);
                modelo.Entry(actUsuario).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
                CargarUsuarios();
            }
            catch (Exception ex)
            {

            }
            
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                selectedUserID = Convert.ToInt32(user_table.SelectedDataKey.Value.ToString());
                Usuarios actUsuario = new Usuarios();
                actUsuario = modelo.Usuarios.Find(selectedUserID);
                actUsuario.isActive = false;
                modelo.Usuarios.Attach(actUsuario);
                modelo.Entry(actUsuario).State = System.Data.Entity.EntityState.Modified;
                modelo.SaveChanges();
                CargarUsuarios();
            }
            catch (Exception ex)
            {

            }
            
        }
    }
}