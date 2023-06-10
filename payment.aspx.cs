using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Reflection.Emit;
using System.Web.Http.ExceptionHandling;
using Eapha.Admin;

namespace Eapha
{
    public partial class checkout : System.Web.UI.Page
    {
        private void calcTotal()
        {
            int finalPrice = 0;
            foreach (Product i in CartList)
            {
                finalPrice += i.Total;
            }
            total.Text = finalPrice.ToString();
        }

        List<Product> CartList = new List<Product>();
        DataTable dt;
        SqlConnection dbh;

        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            if (Session["user"] == null) Response.Redirect("index.aspx");

            if (Session["cart"] == null) Session["cart"] = CartList;
            else CartList = (List<Product>)Session["cart"];
            dt = (DataTable)Session["user"];
            Label1.Text = CartList.Count.ToString();
            ListView1.DataSource = CartList;
            ListView1.DataBind();
            calcTotal();
            FullName.Text = dt.Rows[0]["Fname"].ToString() + " " + dt.Rows[0]["Lname"].ToString();
            userId.Text = dt.Rows[0]["username"].ToString();
            Adress.Text = dt.Rows[0]["city"].ToString() + dt.Rows[0]["address"].ToString();
            phone.Text = dt.Rows[0]["phone"].ToString();
            Image1.ImageUrl = "content/avatars/" + dt.Rows[0]["avatar"].ToString();
            bool n = string.IsNullOrEmpty(dt.Rows[0]["Fname"].ToString()) || string.IsNullOrEmpty(dt.Rows[0]["Lname"].ToString()) || string.IsNullOrEmpty(dt.Rows[0]["city"].ToString()) ||
                string.IsNullOrEmpty(dt.Rows[0]["address"].ToString()) || string.IsNullOrEmpty(dt.Rows[0]["phone"].ToString());
            if (n)
            {
                comp.Visible = true;
                check.Attributes["disabled"] = "true";
            }
            if (CartList.Count == 0) check.Attributes["disabled"] = "true";
        }
        protected void checkout_btn(object sender, EventArgs e)
        {
            dbh.Open();
            string content = "";
            string quantity = "";
            foreach (Product P in CartList)
            {
                content += (P.Id + ",");
                quantity += (P.Quantity + ",");
            }
            DateTime currentDate = DateTime.Now.Date;
            string Date = currentDate.ToString("MM/dd/yyyy");
            SqlCommand q = new SqlCommand($"insert into [dbo].[user_order] (user_id, state, total,contentArray,quantityArray,date) values ({Convert.ToInt32(dt.Rows[0]["user_id"])},'In Progress',{Convert.ToInt32(total.Text)},'{content}','{quantity}','{Date}')", dbh);
            q.ExecuteNonQuery();
            Session["cart"] = null;
            CartList = null;
            dbh.Close();
            if (MyRadioButtons.SelectedValue == "2")
            {
                Response.Redirect("userProfile.aspx#order");
            }
            else
            {
                Response.Redirect("userProfile.aspx#order");
            }
        }

        protected void Redeem_Click(object sender, EventArgs e)
        {
            dbh.Open();
            SqlCommand q = new SqlCommand($"select * from [dbo].[promo_codes] where code='{promo.Text}'", dbh);
            SqlDataReader ex = q.ExecuteReader();

            if (ex.HasRows && CartList.Count > 0)
            {
                ex.Read();
                Label3.Text = ex["discount"].ToString();
                Label2.Text = promo.Text;
                total.Text = (Convert.ToInt32(total.Text) - Convert.ToInt32(ex["discount"].ToString())).ToString();
                ex.Close();
                string script = $"$('#promo0').show();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);

            }
            else
            {
                string script = $"sendNotification('error', 'Promo code cant be applied');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", script, true);
            }
            dbh.Close();
        }
    }
}
