using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.ComponentModel.Design;
using System.IO;

namespace Eapha
{
    public partial class userProfile : System.Web.UI.Page
    {
        SqlConnection dbh;

        private void calcTotal()
        {
            int finalPrice = 0;
            foreach (Product i in CartList)
            {
                finalPrice += i.Total;
            }
            Label1.Text = "Total: " + finalPrice.ToString() + "$";
        }

        List<Product> CartList = new List<Product>();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dt = (DataTable)Session["user"];

            if (!IsPostBack)
            {

                if (Session["user"] == null) Response.Redirect("login.aspx");

                if (Session["cart"] == null) Session["cart"] = CartList;
                else CartList = (List<Product>)Session["cart"];

                ListView2.DataSource = Session["cart"];
                calcTotal();
                ListView2.DataBind();


                fname.Attributes["placeholder"] = dt.Rows[0]["Fname"].ToString();
                lname.Attributes["placeholder"] = dt.Rows[0]["Lname"].ToString();
                uname.Attributes["placeholder"] = dt.Rows[0]["username"].ToString();
                email.Attributes["placeholder"] = dt.Rows[0]["email"].ToString();
                phone.Attributes["placeholder"] = dt.Rows[0]["phone"].ToString();
                city.Attributes["placeholder"] = dt.Rows[0]["city"].ToString();
                address.Attributes["placeholder"] = dt.Rows[0]["address"].ToString();
                Image1.ImageUrl = "content/avatars/" + dt.Rows[0]["avatar"].ToString();

                dbh.Open();
                SqlCommand qq = new SqlCommand($"Select * from [dbo].[user_order] where user_id={Convert.ToInt32(dt.Rows[0]["user_id"])}", dbh);
                SqlDataReader rdr = qq.ExecuteReader();
                rdr.Read();
                ListView1.DataSource = rdr;
                ListView1.DataBind();
                dbh.Close();
            }
        }
        protected void setting(object sender, EventArgs e)
        {
            int id = (int)dt.Rows[0]["user_id"];
            if (fname.Text == "") fname.Text = fname.Attributes["placeholder"];
            if (lname.Text == "") lname.Text = lname.Attributes["placeholder"];
            if (uname.Text == "") uname.Text = uname.Attributes["placeholder"];
            if (email.Text == "") email.Text = email.Attributes["placeholder"];
            if (phone.Text == "") phone.Text = phone.Attributes["placeholder"];
            if (city.Text == "") city.Text = city.Attributes["placeholder"];
            if (address.Text == "") address.Text = address.Attributes["placeholder"];
            dbh.Open();
            string fileName = dt.Rows[0]["avatar"].ToString();
            if (fileName == null) fileName = "default.jpeg";
            if (FileUpload1.HasFile)
            {
                fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("content/avatars/" + fileName);
                FileUpload1.PostedFile.SaveAs(filePath);
            }
            SqlCommand save = new SqlCommand($"UPDATE [dbo].[users] SET Fname='{fname.Text}', Lname= '{lname.Text}',phone='{phone.Text}',city='{city.Text}',address='{address.Text}', avatar='{fileName}' WHERE user_id ={id}", dbh);
            int R = save.ExecuteNonQuery();
            if (R == 1)
            {
                SqlCommand q = new SqlCommand($"select * from [dbo].[users] where user_id ={id}", dbh);
                SqlDataReader rdr = q.ExecuteReader();
                if (rdr.HasRows)
                {
                    dt = null;
                    dt = new DataTable();
                    dt.Load(rdr);
                    Session["user"] = dt;
                    string script = $"sendNotification('success', 'data saved');$('#START').click();";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
                    fname.Text = lname.Text = uname.Text = email.Text = phone.Text = city.Text = city.Text = address.Text = null;
                    fname.Attributes["placeholder"] = dt.Rows[0]["Fname"].ToString();
                    lname.Attributes["placeholder"] = dt.Rows[0]["Lname"].ToString();
                    uname.Attributes["placeholder"] = dt.Rows[0]["username"].ToString();
                    email.Attributes["placeholder"] = dt.Rows[0]["email"].ToString();
                    phone.Attributes["placeholder"] = dt.Rows[0]["phone"].ToString();
                    city.Attributes["placeholder"] = dt.Rows[0]["city"].ToString();
                    address.Attributes["placeholder"] = dt.Rows[0]["address"].ToString();
                }
            }
            Image1.ImageUrl = "content/avatars/" + dt.Rows[0]["avatar"].ToString();
            dbh.Close();
        }
        protected void Button2_click(object sender, EventArgs e)
        {
            int id = (int)dt.Rows[0]["user_id"];
            dbh.Open();
            SqlCommand v = new SqlCommand($"select * from [dbo].[users] where user_id='{id}' and password='{oldpass.Text}'", dbh);
            SqlDataReader ex = v.ExecuteReader();
            if (ex.HasRows)
            {
                SqlCommand l = new SqlCommand($"UPDATE [dbo].[users] SET password='{confirm.Text}' WHERE user_id ={id}", dbh);
                ex.Close();
                int o = l.ExecuteNonQuery();
                if (o == 1)
                {
                    string script = $"sendNotification('success', 'new password saved');$('#pp').click();";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
                }
            }
            else
            {
                string script = $"sendNotification('error', 'old password not correct');$('#pp').click();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
            }
            oldpass.Text = confirm.Text = newpass.Text = null;
            dbh.Close();
        }

        protected void ListView1_Details(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "invoice")
            {
                dbh.Open();
                SqlCommand q = new SqlCommand($"select * from [dbo].[user_order] where order_id={Convert.ToInt32(e.CommandArgument)}", dbh);
                SqlDataReader rdr = q.ExecuteReader();
                DataTable dttt = new DataTable();
                dttt.Load(rdr);
                Session["invoice"] = dttt;
                Response.Redirect("invoice.aspx");
            }
        }
    }
}