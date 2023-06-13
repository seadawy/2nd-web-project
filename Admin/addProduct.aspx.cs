using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Http.Description;
using System.Xml.Linq;
using System.IO;

namespace Eapha.Admin
{
    public partial class addProduct : System.Web.UI.Page
    {
        SqlConnection dbh;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            dbh.Open();
            string fileName = Path.GetFileName(productImage.PostedFile.FileName);
            string filePath = Server.MapPath("../content/products/" + fileName);
            productImage.PostedFile.SaveAs(filePath);
            SqlCommand q = new SqlCommand($"insert into [dbo].[items] (item_name, price, description,item_img,quantity) values ('{productname.Text}',{Convert.ToInt32(productprice.Text)},'{productdes.Text}','{fileName}',{Convert.ToInt32(productStock.Text)})", dbh);
            int x = q.ExecuteNonQuery();
            if (x > 0)
            {

            }
            dbh.Close();
        }
    }
}