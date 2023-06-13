using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eapha.Admin
{
    public partial class order : System.Web.UI.Page
    {
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");

            dbh.Open();
            SqlCommand qq = new SqlCommand($"Select * from [dbo].[user_order] ", dbh);
            SqlDataReader rdr = qq.ExecuteReader();
            rdr.Read();
            if (!IsPostBack)
            {
                List12.DataSource = rdr;
                List12.DataBind();
            }
            dbh.Close();

        }
        protected void List12_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "canc")
            {
                dbh.Open();
                int id = Convert.ToInt32(e.CommandArgument);
                SqlCommand d = new SqlCommand($"update [dbo].[user_order] set state='Canceled' where order_id={id}", dbh);
                d.ExecuteNonQuery();
                SqlCommand qq = new SqlCommand($"Select * from [dbo].[user_order] ", dbh);
                SqlDataReader rdr = qq.ExecuteReader();
                List12.DataSource = rdr;
                List12.DataBind();
                dbh.Close();
                return;
            }
            if (e.CommandName == "done")
            {
                dbh.Open();
                int id = Convert.ToInt32(e.CommandArgument);
                SqlCommand d = new SqlCommand($"update [dbo].[user_order] set state='Delivered' where order_id={id}", dbh);
                d.ExecuteNonQuery();
                List12.DataSource = null;
                SqlCommand qq = new SqlCommand($"Select * from [dbo].[user_order] ", dbh);
                SqlDataReader rdr = qq.ExecuteReader();
                List12.DataSource = rdr;
                List12.DataBind();
                dbh.Close();
            }

        }
    }
}