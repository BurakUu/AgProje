using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using MySql.Data.MySqlClient;

namespace SchoolProject
{
    public partial class Home : System.Web.UI.Page
    {
        MySqlConnection sqlCon = new MySqlConnection("server=localhost;user id=root; password=Galataslan3298!; database=proje");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                UsernameLabel.Visible = false;
                LogoutButton.Visible = false;
                SignInButton.Visible = true;
                SignUpButton.Visible = true;
            }
            else
            {
                UsernameLabel.Text = Session["username"].ToString();
                UsernameLabel.Visible = true;
                LogoutButton.Visible = true;
                SignInButton.Visible = false;
                SignUpButton.Visible = false;
            }

            

            sqlCon.Open();

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM game_table", sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            GamesListView.DataSource = dt;
            GamesListView.DataBind();

            MySqlDataAdapter adapter2 = new MySqlDataAdapter("SELECT * FROM game_announcements", sqlCon);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);

            RepeaterAnnouncements.DataSource = dt2;
            RepeaterAnnouncements.DataBind();

            sqlCon.Close();
        }

        protected string GetActiveItemClass(int itemIndex)
        {
            if (itemIndex == 0)
                return "active";
            else
                return "";
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect(Request.RawUrl);
        }

        protected void AramaButton_Click(object sender, EventArgs e)
        {
            var aramaString = GameSearch.Text;

            sqlCon.Open();

            string cmd = "SELECT * FROM game_table WHERE game_name LIKE '%" + aramaString + "%';";
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd, sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GamesListView.DataSource = dt;
            GamesListView.DataBind();

            sqlCon.Close();
        }

        protected void SortList_SelectedIndexChanged(object sender, EventArgs e)
        {
            var aramaString = GameSearch.Text;
            var orderArea = "";
            switch (SortList.SelectedIndex)
            {
                case 0:
                    orderArea = "";
                    break;
                case 1:
                    orderArea = " ORDER BY game_price";
                    break;
                case 2:
                    orderArea = " ORDER BY game_price DESC";
                    break;
                default:
                    break;
            }
            sqlCon.Open();

            string cmd = "SELECT * FROM game_table WHERE game_name LIKE '%" + aramaString + "%'" + orderArea;
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd, sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GamesListView.DataSource = dt;
            GamesListView.DataBind();

            sqlCon.Close();
        }

        protected void SepeteEkle_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                var user = Session["username"].ToString();
                var info = (sender as Button).CommandArgument.ToString().Split(',');

                string cmd = "INSERT INTO users_cart(username, game_name, game_price) VALUES('" + user + "', '" + info[1] + "', '" + info[2] + "');";
                MySqlCommand command = new MySqlCommand(cmd, sqlCon);
                sqlCon.Open();
                command.ExecuteNonQuery();
                sqlCon.Dispose();
                sqlCon.Close();

                Response.Write("<script>alert('Sepete Eklendi!');</script>");

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}