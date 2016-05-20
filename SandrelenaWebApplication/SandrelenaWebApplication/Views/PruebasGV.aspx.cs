using SandrelenaWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SandrelenaWebApplication.Views
{
    public partial class PruebasGV : System.Web.UI.Page
    {

        SandrelenaCS modelo = new SandrelenaCS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id"), new DataColumn("Name"), new DataColumn("Country") });
                dt.Rows.Add(1, "John Hammond", "United States");
                dt.Rows.Add(2, "Mudassar Khan", "India");
                dt.Rows.Add(3, "Suzanne Mathews", "France");
                dt.Rows.Add(4, "Robert Schidner", "Russia");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("OnMouseOver", "this.style.cursor = 'hand';");
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Haga click para seleccionar.";
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                Label1.Text = GridView1.SelectedDataKey.Value.ToString();
                if (row.RowIndex == GridView1.SelectedIndex)
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
        }
    }
}