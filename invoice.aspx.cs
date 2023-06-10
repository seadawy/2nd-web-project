using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eapha
{
    public partial class invoice : System.Web.UI.Page
    {
        SqlConnection dbh;

        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dbh.Open();
            if (Session["user"] == null) Response.Redirect("login.aspx");
            DataTable dt = (DataTable)Session["user"];
            Label1.Text = dt.Rows[0]["Fname"].ToString() + " " + dt.Rows[0]["Lname"].ToString();
            Label2.Text = dt.Rows[0]["city"].ToString() + " - " + dt.Rows[0]["address"].ToString();
            Label3.Text = dt.Rows[0]["phone"].ToString();
            Label4.Text = dt.Rows[0]["email"].ToString();

            DataTable dt2 = new DataTable();
            dt2 = (DataTable)Session["invoice"];
            Label5.Text = dt2.Rows[0]["order_id"].ToString();
            Label6.Text = dt2.Rows[0]["date"].ToString();
            Label7.Text = dt2.Rows[0]["total"].ToString();
            List<Product> list = new List<Product>();
            string[] content = dt2.Rows[0]["contentArray"].ToString().Split(',');
            string[] qantity = dt2.Rows[0]["quantityArray"].ToString().Split(',');
            for (int i = 0; i < content.Length - 1; i++)
            {
                int id = Convert.ToInt32(content[i]);
                SqlCommand cmd = new SqlCommand($"select item_name, price from [dbo].[items] where item_id={id}", dbh);
                SqlDataReader exe = cmd.ExecuteReader();
                exe.Read();
                list.Add(new Product(id, exe["item_name"].ToString(), Convert.ToInt32(qantity[i]), Convert.ToInt32(exe["price"])));
                exe.Close();
            }
            dbh.Close();
            ListView1.DataSource = list;
            ListView1.DataBind();
        }
    }
}