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
    public partial class Register : System.Web.UI.Page
    {
        MySqlConnection sqlCon = new MySqlConnection("server=localhost;user id=root; password=Galataslan3298!; database=proje");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (UsernameTb.Text != "" && PasswordTb.Text != "")
            {
                if (PasswordTb.Text == ConfirmPasswordTb.Text)
                {
                    Session.Clear();
                    Session["username"] = UsernameTb.Text;

                    var username = UsernameTb.Text;
                    var password = PasswordTb.Text;

                    sqlCon.Open();
                    string cmd = "INSERT INTO users(username, password) VALUES('" + username + "', '" + password + "');";
                    MySqlCommand command = new MySqlCommand(cmd, sqlCon);
                    command.ExecuteNonQuery();
                    sqlCon.Close();
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    RegisterInfoLabel.Text = "Şifreler uyuşmuyor.";
                    UsernameTb.Text = "";
                    PasswordTb.Text = "";
                    ConfirmPasswordTb.Text = "";
                }
            }
            else
            {
                RegisterInfoLabel.Text = "Kullanıcı adı veya şifre boş olamaz.";
                UsernameTb.Text = "";
                PasswordTb.Text = "";
                ConfirmPasswordTb.Text = "";
            }
        }
    }
}