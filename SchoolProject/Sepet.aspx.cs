using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace SchoolProject
{
    public partial class Sepet : System.Web.UI.Page
    {
        MySqlConnection sqlCon = new MySqlConnection("server=localhost;user id=root; password=Galataslan3298!; database=proje");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            sqlCon.Open();
            string cmd = "SELECT * FROM users_cart WHERE username = '" + Session["username"].ToString() + "';";
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd, sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            CartGridView.DataSource = dt;
            CartGridView.DataBind();

            var totalPrice = 0;
            foreach (GridViewRow row in CartGridView.Rows)
            {
                var price = Convert.ToInt32(row.Cells[2].Text);
                totalPrice += price;
            }

            TotalPrice.Text = totalPrice.ToString();

            sqlCon.Close();
        }

        protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var index = Convert.ToInt32(e.RowIndex);
            var order_id = Convert.ToInt32(CartGridView.Rows[index].Cells[0].Text);

            var cmd = "DELETE FROM users_cart WHERE(order_id =" + order_id + ");";
            MySqlCommand command = new MySqlCommand(cmd, sqlCon);
            sqlCon.Open();
            command.ExecuteNonQuery();
            sqlCon.Dispose();

            string query = "SELECT * FROM users_cart WHERE username = '" + Session["username"].ToString() + "';";
            MySqlDataAdapter adapter = new MySqlDataAdapter(query, sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            CartGridView.DataSource = dt;
            CartGridView.DataBind();

            var totalPrice = 0;
            foreach (GridViewRow row in CartGridView.Rows)
            {
                var price = Convert.ToInt32(row.Cells[2].Text);
                totalPrice += price;
            }

            TotalPrice.Text = totalPrice.ToString();

            sqlCon.Close();

        }

        protected void SatınAlButton_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TotalPrice.Text) > 0)
            {
                sqlCon.Open();
                string cmd = "DELETE FROM users_cart WHERE username = '" + Session["username"].ToString() + "';";
                MySqlCommand command = new MySqlCommand(cmd, sqlCon);
                command.ExecuteNonQuery();
                sqlCon.Close();

                Response.Write("<script>alert('Satın alma işleminiz gerçekleşmiştir! Anasayfaya yönlendirileceksiniz.');</script>");
                Response.AddHeader("REFRESH", "1;URL=Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sepetinizde bir ürün bulunmuyor.');</script>");
            }
        }
    }
}