using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandrelenaWebApplication.Models;
using SandrelenaWebApplication.Scripts;

namespace SandrelenaWebApplication.Views
{
    public partial class matricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClasesDisponibles();
            }
        }

        private void CargarClasesDisponibles()
        {
            try
            {

            }
            catch (Exception)
            {
                Alertas.NuevaAlerta(this, Alertas.Tipos.Error, "Error en CargarClasesDisponibles()");
            }
        }

    }
}