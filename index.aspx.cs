using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography.X509Certificates;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Http.Batch;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;
using System.Web.UI.WebControls.WebParts;

namespace Eapha
{
    public partial class index : System.Web.UI.Page
    {
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["Dark"]) == 1)
            {
                string script = "const main = document.getElementsByTagName(\"html\")[0];main.setAttribute(\"data-theme\", \"dark\")";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);

            }
            if (Session["user"] == null)
            {
                profile.Visible = false;
                cart.Visible = false;
                logout.Visible = false;
            }
            else
            {
                login.Visible = false;
                signup.Visible = false;
            }

            if (Session["cart"] == null)
            {
                Session["cart"] = CartList;
            }
            else
            {
                CartList = (List<Product>)Session["cart"];
            }
            ListView2.DataSource = Session["cart"];
            calcTotal();
            ListView2.DataBind();
        }

        protected void view_addCart(object sender, ListViewCommandEventArgs e)
        {
            if (Session["user"] == null)
            {
                string script = $"sendNotification('warning', 'you have to login first');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
                return;
            }
            if (e.CommandName == "addCart")
            {
                string s = e.CommandArgument.ToString();
                string[] arrgs = s.Split(',');
                ListViewItem item = e.Item;
                TextBox quantityBox = (TextBox)item.FindControl("Quantity");
                string script;
                if (Page.IsValid && !string.IsNullOrEmpty(quantityBox.Text))
                {
                    int quantity = Convert.ToInt32(quantityBox.Text);
                    Product record = new Product(Convert.ToInt32(arrgs[0]), arrgs[1].ToString(), quantity, Convert.ToInt32(arrgs[2]));
                    Product check = ((List<Product>)Session["Cart"]).FirstOrDefault(x => x.Id == record.Id);
                    if (check != null)
                    {
                        check.Quantity = record.Quantity;
                        check.Total = record.Total;
                    }
                    else ((List<Product>)Session["Cart"]).Add(record); ;
                    ListView2.DataBind();
                    script = $"sendNotification('success', ' {quantity} of {arrgs[1]} added');";
                }
                else
                {
                    script = $"sendNotification('error', ' {arrgs[1]} cant added without quantity');";
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
                calcTotal();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dbh.Open();
            SqlCommand cmd = new SqlCommand($"insert into [dbo].[feedback] (email,msg) values ('{txt_email.Text}','{TextArea1.Text}')", dbh);
            cmd.ExecuteNonQuery();
            string script = $"sendNotification('success','your feedback has been sent');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Dark"] == null || (int)Session["Dark"] == 1)
            {
                Session["Dark"] = 1;
            }
            else
            {
                Session["Dark"] = 0;
            }
        }


        [WebMethod]
        public static string Search(string val)
        {
            SqlConnection dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dbh.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[items] WHERE [item_name] LIKE '%" + val + "%';", dbh);
            SqlDataReader rdr = cmd.ExecuteReader();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            while (rdr.Read())
            {
                Dictionary<string, object> row = new Dictionary<string, object>();
                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    row.Add(rdr.GetName(i), rdr.GetValue(i));
                }
                rows.Add(row);
            }
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            string jsonData = jsSerializer.Serialize(rows);
            return jsonData;
        }

    }
}