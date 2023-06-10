using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eapha
{
    public partial class FAQ : System.Web.UI.Page
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
    }
}