using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eapha.Admin
{
    public partial class manageProducts : System.Web.UI.Page
    {
        DataTable dt;
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dt = (DataTable)Session["admin"];
            if (!IsPostBack)
            {
                dbh.Open();
                SqlCommand qq = new SqlCommand($"Select * from [dbo].[items] ", dbh);
                SqlDataReader rdr = qq.ExecuteReader();
                rdr.Read();
                Listview1.DataSource = rdr;
                Listview1.DataBind();
                dbh.Close();
            }

        }
        protected void List_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                dbh.Open();
                int x = Convert.ToInt32(e.CommandArgument);
                SqlCommand qq = new SqlCommand($"delete from [dbo].[items] where item_id={x}", dbh);
                qq.ExecuteNonQuery();
                dbh.Close();

            }
        }
    }
}