using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SandrelenaWebApplication.Views
{
    public partial class matricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {

                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add("ProductName", System.Type.GetType("System.String"));
                dt.Columns.Add("CategoryName", System.Type.GetType("System.String"));
                dt.Columns.Add("SupplierName", System.Type.GetType("System.String"));
                dt.Columns.Add("UnitPrice", System.Type.GetType("System.Double"));
                dt.Columns.Add("Discontinued", System.Type.GetType("System.String"));

                for (int i = 0; i < 15; i++)
                {
                    dr = dt.NewRow();
                    dr["ProductName"] = i.ToString();
                    dr["CategoryName"] = i.ToString();
                    dr["SupplierName"] = i.ToString();
                    dr["UnitPrice"] = i;
                    dr["Discontinued"] = i.ToString();
                    dt.Rows.Add(dr);
                }

                dt.AcceptChanges();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}