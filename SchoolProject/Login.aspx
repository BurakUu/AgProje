<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/dd36616560.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
                        <div class="row" style="background: #3a3841; padding-top:20px; padding-left:20px; padding-bottom:20px; position: sticky; top: 0; width: 100%; z-index: 100;">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="padding-top: 20px;">
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-bottom: 10px; text-align:center;">
                        <a href="Home.aspx"><i style="color: red;" class="fas fa-gamepad fa-5x"></i></a>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-top:20px; text-align:center;">
                    </div>
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top:20px;">
                    </div>
                </div>
            <br />
            <table style="margin-left: auto; margin-right: auto;">
                <tr>
                    <td>Kullanıcı Adı: </td>
                    <td><asp:TextBox ID="UsernameTextbox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Şifre: </td>
                    <td><asp:TextBox ID="PasswordTextbox" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:LinkButton ID="RegisterButton" runat="server" OnClick="RegisterButton_Click">Üye ol</asp:LinkButton>
                    </td>
                </tr>
            </table>

            <asp:Label ID="LoginInfo" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
