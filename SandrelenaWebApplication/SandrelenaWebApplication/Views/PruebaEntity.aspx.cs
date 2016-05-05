using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace SandrelenaWebApplication.Views
{
    public partial class PruebaEntity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Carrera carrera = new Carrera();

            GridView1.DataSource = carrera.listado;
            GridView1.DataBind();

        }
    }
}