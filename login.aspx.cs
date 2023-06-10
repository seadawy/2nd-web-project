using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Eapha
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            if (Session["user"] != null) Response.Redirect("index.aspx");
        }

        protected void login_btn(object sender, EventArgs e)
        {
            dbh.Open();
            SqlCommand q = new SqlCommand($"select * from [dbo].[admin] where adminuser='{user1.Text}' and pass='{pass1.Text}'", dbh);
            SqlDataReader rdr = q.ExecuteReader();
            if (rdr.HasRows)
            {
                DataTable Admin = new DataTable();
                Admin.Load(rdr);
                Session["Admin"] = Admin;
                Response.Redirect("Admin/defualt.aspx");
            }
            rdr.Close();
            SqlCommand qq = new SqlCommand($"select * from [dbo].[users] where username='{user1.Text}' and password='{pass1.Text}'", dbh);
            SqlDataReader rdr2 = qq.ExecuteReader();
            if (rdr2.HasRows)
            {
                DataTable user = new DataTable();
                user.Load(rdr2);
                Session["user"] = user;
                Response.Redirect("index.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "submitCallback", "document.getElementById('loginError').style.display = 'block'; ", true);
                user1.Text = pass1.Text = null;

            }
            rdr2.Close();
            dbh.Close();
        }

        protected void sign_btn(object sender, EventArgs e)
        {
            dbh.Open();
            string error = "";
            SqlCommand checkuser = new SqlCommand($"select * from [dbo].[users] where username='{user.Text}'", dbh);
            SqlDataReader rdr = checkuser.ExecuteReader();
            rdr.Read();
            if (rdr.HasRows)
            {
                error += " username ";
            }
            rdr.Close();
            SqlCommand checkemail = new SqlCommand($"select * from [dbo].[users] where email='{email.Text}'", dbh);
            rdr = checkemail.ExecuteReader();
            rdr.Read();
            if (rdr.HasRows)
            {
                error += " email ";
            }
            rdr.Close();
            if (error == "")
            {
                SqlCommand q = new SqlCommand($"insert into [dbo].[users] (username, email, password) values ('{user.Text}','{email.Text}','{pass.Text}')", dbh);
                q.ExecuteNonQuery();
                user.Text = email.Text = pass.Text = confirmpass.Text = null;
                error = "user added sucessfully";
            }
            else error += " already taken";

            ScriptManager.RegisterStartupScript(this, GetType(), "submitCallback", $"document.getElementById('registError').style.display = 'block';", true);
            registLabel.Text = error;
            dbh.Close();
        }
    }
}