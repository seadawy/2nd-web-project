using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Eapha.Admin
{
    public partial class editProduct : System.Web.UI.Page
    {
        SqlConnection dbh;
        int id; string fileName;
        protected void Page_Load(object sender, EventArgs e)
        {
            dbh = new SqlConnection(@"Data Source=DESKTOP-E5ORPQK;Initial Catalog=website;Integrated Security=True");
            id = Convert.ToInt32(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                dbh.Open();
                SqlCommand cmd = new SqlCommand($"select * from items where item_id ={id}", dbh);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                productname.Text = dr["item_name"].ToString();
                productprice.Text = dr["price"].ToString();
                productdes.Text = dr["description"].ToString();
                fileName = dr["item_img"].ToString();
            }
        }
        protected void save_Click(object sender, EventArgs e)
        {
            dbh.Open();
            if (productImage.HasFile)
            {
                fileName = Path.GetFileName(productImage.PostedFile.FileName);
                string filePath = Server.MapPath("../content/products/" + fileName);
                productImage.PostedFile.SaveAs(filePath);
            }
            SqlCommand q = new SqlCommand($"UPDATE [dbo].[items] SET item_name='{productname.Text}', price= '{productprice.Text}',description='{productdes.Text}',item_img='{fileName}' WHERE item_id ={id}", dbh);
            q.ExecuteNonQuery();
            dbh.Close();
        }
    }
}