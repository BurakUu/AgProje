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
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection sqlCon = new MySqlConnection("server=localhost;user id=root; password=Galataslan3298!; database=proje");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            
            var username = UsernameTextbox.Text;
            var password = PasswordTextbox.Text;

            sqlCon.Open();
            string cmd = "SELECT * FROM users where username='" + username + "' AND password='" + password + "';";
            MySqlCommand command = new MySqlCommand(cmd, sqlCon);
            command.ExecuteNonQuery();
            MySqlDataAdapter adapter = new MySqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["username"] = dr["username"].ToString();
                Response.Redirect("home.aspx");
            }

            LoginInfo.Text = "Incorrect username or password.";

            sqlCon.Close();
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}