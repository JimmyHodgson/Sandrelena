using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;

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
            }
        }

        private void CargarFacultades()
        {
            var facultades = (from f in contexto.Facultades
                              select new
                              {
                                  Nombre=f.nombre_facultad
                              }).ToList().OrderBy(f => f.Nombre);

            user_table.DataSource = facultades;
            user_table.DataBind();

        }

    }
}