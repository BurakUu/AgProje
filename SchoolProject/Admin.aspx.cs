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
    public partial class Admin : System.Web.UI.Page
    {
        MySqlConnection sqlCon = new MySqlConnection("server=localhost;user id=root; password=Galataslan3298!; database=proje");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() != "admin")
            {
                Response.Redirect("Home.aspx");
            }

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM game_table", sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            AdminGridView.DataSource = dt;
            AdminGridView.DataBind();

            MySqlDataAdapter adapter2 = new MySqlDataAdapter("SELECT * FROM game_announcements", sqlCon);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);

            AnnoGridView.DataSource = dt2;
            AnnoGridView.DataBind();

        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {

            var game_id = TextBox4.Text;
            var game_name = TextBox1.Text;
            var game_price = TextBox2.Text;
            var game_image = TextBox3.Text;

            if (game_id == "")
            {
                string cmd = "INSERT INTO game_table(game_name, game_price, game_image) VALUES('" + game_name + "', '" + game_price + "', '" + game_image + "');";
                MySqlCommand command = new MySqlCommand(cmd, sqlCon);
                sqlCon.Open();
                command.ExecuteNonQuery();
                sqlCon.Dispose();
            }

            else
            {
                string cmd = "UPDATE game_table SET game_name = '" + game_name + "', game_price = '" + game_price + "', game_image = '" + game_image + "' WHERE game_id = '" + game_id + "';";
                MySqlCommand command = new MySqlCommand(cmd, sqlCon);
                sqlCon.Open();
                command.ExecuteNonQuery();
                sqlCon.Dispose();

            }

            

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM game_table", sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            AdminGridView.DataSource = dt;
            AdminGridView.DataBind();

            sqlCon.Close();
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";

            AdminGridView.SelectedIndex = -1;

            SaveButton.Text = "Save";
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            
            var id = AdminGridView.SelectedRow.Cells[1].Text;
            var cmd = "DELETE FROM game_table WHERE(game_id =" + id + ");";
            MySqlCommand command = new MySqlCommand(cmd, sqlCon);
            sqlCon.Open();
            command.ExecuteNonQuery();
            sqlCon.Dispose();

            MySqlDataAdapter adapter = new MySqlDataAdapter("SELECT * FROM game_table", sqlCon);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            AdminGridView.DataSource = dt;
            AdminGridView.DataBind();

            sqlCon.Close();
        }

        protected void AdminGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = AdminGridView.SelectedRow.Cells[1].Text;
            var name = AdminGridView.SelectedRow.Cells[2].Text;
            var price = AdminGridView.SelectedRow.Cells[3].Text;
            var image = AdminGridView.SelectedRow.Cells[4].Text;
            AdminGridView.SelectedRowStyle.BackColor = System.Drawing.Color.RoyalBlue;
            AdminGridView.SelectedRowStyle.ForeColor = System.Drawing.Color.White;

            TextBox4.Text = id;
            TextBox1.Text = name;
            TextBox2.Text = price;
            TextBox3.Text = image;

            SaveButton.Text = "Update";
        }

        protected void AnnoGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = AnnoGridView.SelectedRow.Cells[1].Text;
            var title = AnnoGridView.SelectedRow.Cells[2].Text;
            var description = AnnoGridView.SelectedRow.Cells[3].Text;
            var image = AnnoGridView.SelectedRow.Cells[4].Text;
            AnnoGridView.SelectedRowStyle.BackColor = System.Drawing.Color.RoyalBlue;
            AnnoGridView.SelectedRowStyle.ForeColor = System.Drawing.Color.White;

            TextBox5.Text = id;
            TextBox6.Text = title;
            TextBox7.Text = description;
            TextBox8.Text = image;

            AnnoUpdateButton.Enabled = true;
        }

        protected void AnnoUpdateButton_Click(object sender, EventArgs e)
        {
            var id = TextBox5.Text;
            var title = TextBox6.Text;
            var desc = TextBox7.Text;
            var image = TextBox8.Text;

            sqlCon.Open();
            string cmd = "UPDATE game_announcements SET anno_title = '" + title + "', anno_desc = '" + desc + "', anno_img = '" + image + "' WHERE anno_id = '" + id + "';";
            MySqlCommand command = new MySqlCommand(cmd, sqlCon);
            command.ExecuteNonQuery();
            sqlCon.Close();

            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";

            AnnoUpdateButton.Enabled = false;

            MySqlDataAdapter adapter2 = new MySqlDataAdapter("SELECT * FROM game_announcements", sqlCon);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);

            AnnoGridView.DataSource = dt2;
            AnnoGridView.DataBind();
        }
    }
}