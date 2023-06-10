using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Eapha
{
    public partial class product : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
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

            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            dbh.Open();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            SqlCommand cmd = new SqlCommand($"select * from [dbo].[items] where item_id ={id}", dbh);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();
            name.Text = rdr["item_name"].ToString();
            price.Text = rdr["price"].ToString();
            des.Text = rdr["description"].ToString();
            stock.Text = rdr["quantity"].ToString();
            Image1.ImageUrl = "content/products/" + rdr["item_img"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string script;
            if (Session["user"] == null)
            {
                script = $"sendNotification('warning', 'you have to login first');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
                return;
            }
            if (Page.IsValid && !string.IsNullOrEmpty(quantityBox.Text))
            {
                int quantity = Convert.ToInt32(quantityBox.Text);
                Product record = new Product(Convert.ToInt32(Request.QueryString["id"]), name.Text, quantity, Convert.ToInt32(price.Text));
                Product check = ((List<Product>)Session["Cart"]).FirstOrDefault(x => x.Id == record.Id);
                if (check != null)
                {
                    check.Quantity = record.Quantity;
                    check.Total = record.Total;
                }
                else ((List<Product>)Session["Cart"]).Add(record); ;
                ListView2.DataBind();
                script = $"sendNotification('success', ' {quantity} of {name.Text} added');";
            }
            else
            {
                script = $"sendNotification('error', ' {name.Text} cant added without quantity');";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
            calcTotal();

        }
    }
}