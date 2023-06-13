using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Eapha.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dbh.Open();
            SqlCommand q = new SqlCommand($"insert into [dbo].[Tasks] (description) values ('{Add.Text}')", dbh);
            q.ExecuteNonQuery();
            dbh.Close();
            ListView1.DataBind();
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                dbh.Open();
                int x = Convert.ToInt32(e.CommandArgument);
                SqlCommand qq = new SqlCommand($"delete from [dbo].[Tasks] where id={x}", dbh);
                qq.ExecuteNonQuery();
                ListView1.DataBind();
                dbh.Close();
            }
        }
    }
}