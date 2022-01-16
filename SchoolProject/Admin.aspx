<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SchoolProject.Admin" %>

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
            <h4 style="text-decoration: underline;">Oyun Paneli</h4>
            <table>
                <tr><td>Game ID: </td><td><asp:TextBox ID="TextBox4" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox></td></tr>
                <tr><td>Game Name: </td><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr>
                <tr><td>Game Price: </td><td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td></tr>
                <tr><td>Game Image: </td><td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td></tr>
                <tr>
                    <td colspan="1"></td>
                    <td colspan="1">
                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click"/>
                        <asp:Button ID="ClearButton" runat="server" Text="Clear" OnClick="ClearButton_Click"/>
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete Selected" OnClick="DeleteButton_Click"/>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="AdminGridView" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" OnSelectedIndexChanged="AdminGridView_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="game_id" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="game_name" HeaderText="Name" />
                    <asp:BoundField DataField="game_price" HeaderText="Price" />
                    <asp:BoundField DataField="game_image" HeaderText="Img" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <h4 style="text-decoration: underline;">Duyuru Paneli</h4>
            <table>
                <tr><td>Duyuru ID: </td><td><asp:TextBox ID="TextBox5" runat="server" ReadOnly="true"></asp:TextBox></td></tr>
                <tr><td>Duyuru Başlığı: </td><td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td></tr>
                <tr><td>Duyuru İçeriği: </td><td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td></tr>
                <tr><td>Duyuru Resimi: </td><td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td></tr>
                <tr>
                    <td colspan="3"><asp:Button ID="AnnoUpdateButton" runat="server" Text="Güncelle" Width="100%" Enabled="false" OnClick="AnnoUpdateButton_Click" /></td>
                </tr>
            </table>
            <asp:GridView ID="AnnoGridView" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="true" OnSelectedIndexChanged="AnnoGridView_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="anno_id" HeaderText="ID" ReadOnly="true"/>
                    <asp:BoundField DataField="anno_title" HeaderText="Başlık"/>
                    <asp:BoundField DataField="anno_desc" HeaderText="İçerik"/>
                    <asp:BoundField DataField="anno_img" HeaderText="Resim" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
