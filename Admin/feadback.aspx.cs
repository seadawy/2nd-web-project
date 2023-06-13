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
    public partial class feadback : System.Web.UI.Page
    {
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            if (!IsPostBack)
            {
                dbh.Open();
                SqlCommand qq = new SqlCommand($"Select * from [dbo].[feedback] ", dbh);
                SqlDataReader rdr = qq.ExecuteReader();
                rdr.Read();
                ListView12.DataSource = rdr;
                ListView12.DataBind();
                dbh.Close();
            }
        }
        protected void ListView12_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "dele")
            {
                dbh.Open();
                int x = Convert.ToInt32(e.CommandArgument);
                SqlCommand qq = new SqlCommand($"delete from [dbo].[feedback] where id={x}", dbh);
                qq.ExecuteNonQuery();
                dbh.Close();
            }
        }
    }
}