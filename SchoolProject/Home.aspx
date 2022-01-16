<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolProject.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"7/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Game Store</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/dd36616560.js" crossorigin="anonymous"></script>
</head>
<body style="background-image: url(https://i.imgur.com/EMPZQhW.jpg); background-size: cover; background-attachment: fixed; margin: 0;">


    <style>
        *{
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        .carousel-item{
            height:16rem;
            color: white;
            background: #c5c5c5;
        }

        #gameItem:hover{
            transition-property: all;
            transition-duration: 0.3s;
            box-shadow: 0px 0px 10px black;
        }

        #gameItem.carousel-item:hover{
            color: black;
        }
    </style>

    <form id="form1" runat="server">
                <div class="row" style="background: #3a3841; padding-top:20px; padding-left:20px; padding-bottom:20px; position: sticky; top: 0; width: 100%; z-index: 100; box-shadow: 0px 0px 50px;">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="padding-top: 20px;">
                        <h1 style="color: white; font-weight:bold;">GAME STORE</h1>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-bottom: 10px; text-align:center;">
                        <a href="Home.aspx"><i style="color: white;" class="fas fa-gamepad fa-5x"></i></a>
                    </div>
                    <a href="Sepet.aspx"><div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-top:20px; text-align:center;">
                        <i class="fas fa-shopping-cart fa-2x" style="color:white;"></i>
                        <br />
                        <h5 style="color:white;">Sepet</h5>
                    </div></a>
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top:20px;">
                        <asp:Label ID="UsernameLabel" runat="server" Text="Username" Visible="false" ForeColor="white" Font-Bold="true" Font-Size="Large"></asp:Label>
                        <asp:LinkButton ID="SignUpButton" runat="server" CssClass="font-weight-bold" OnClick="SignUpButton_Click"><span style="color:white;">Sign Up</span></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="LogoutButton" runat="server" CssClass="font-weight-bold" OnClick="LogoutButton_Click" Visible="false"><span style="color:white;">Logout</span></asp:LinkButton>
                        <asp:LinkButton ID="SignInButton" runat="server" CssClass="font-weight-bold" OnClick="SignInButton_Click"><span style="color:white;">Sign In</span></asp:LinkButton>
                    </div>
                </div>
        <div class="container" style="background-color: white; box-shadow: 0px 0px 100px;">
            <div class="container-fluid">


                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <asp:Repeater ID="RepeaterAnnouncements" runat="server">
                            <ItemTemplate>
                                <div class="carousel-item <%#GetActiveItemClass(Container.ItemIndex) %>" style="text-align:center; background-image: url(<%#Eval("anno_img") %>); background-size: cover; height: 26rem;">
                                    <h1 style="padding-top:20px;"><%#Eval("anno_title") %></h1>
                                    <h3><%#Eval("anno_desc") %></h3>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Önceki</span>
                        </a>

                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Sonraki</span>
                        </a>

                    </div>
                </div>



                <div id="catalogue" class="container">

                    <div id="searchbar" class="row" style="margin-top: 10px; margin-bottom:20px; padding: 5px;">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <h1 style="font-weight:bold;">All Games</h1>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2" style="float:left;">
                            <span>Sırala:</span><br />
                            <asp:DropDownList ID="SortList" runat="server" OnSelectedIndexChanged="SortList_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Selected="True">Varsayılan</asp:ListItem>
                                <asp:ListItem>Fiyata Göre Artan</asp:ListItem>
                                <asp:ListItem>Fiyata Göre Azalan</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <br />
                            <asp:TextBox ID="GameSearch" runat="server" placeholder="Search for a game..." Width="100%"></asp:TextBox>
                            <span class="glyphicon glyphicon-search"></span>
                        </div>
                    
                        <div class="col-lg-1 col-md-1 col-sm-1">
                            <br />
                            <asp:Button ID="AramaButton" runat="server" Text="Search" OnClick="AramaButton_Click"/>
                        </div>
                    </div>
                    
                    <div id="cardsOuter" style="overflow-y:scroll; height: 400px; padding-bottom: 50px;">
                        <asp:ListView ID="GamesListView" runat="server">
                            <ItemTemplate>
                                <div id="gameItem" class="list card" style="float: left; width: 16%; height: 320px; margin: 10px;">
                                    
                                    <table style="position: relative;">
                                        <tr><td><img src="<%#Eval("game_image") %>" style="width:100%; height:180px;" /></td></tr>
                                        <tr><td style="text-align: center;"><h5 style="padding-top: 5px; color: black;"><%# Eval("game_name") %></h5></td></tr>
                                        <tr><td></td></tr>
                                        
                                    </table>
                                    <div style="position: absolute; bottom:0;">
                                        <table>
                                            <tr>
                                                <td><asp:Button ID="SepeteEkle" runat="server" Text="Sepete Ekle" CssClass="btn btn-primary" OnClick="SepeteEkle_Click" CommandArgument='<%#Eval("game_id") + ", " + Eval("game_name") + ", " + Eval("game_price") %>'/></td>
                                                <td style="float: right;"><p style="padding-top: 15px; padding-left: 5px; color: black; font-weight: bold;">$<%# Eval("game_price") %></p></td>
                                            </tr>
                                        </table>
                                        
                                        
                                    </div>
                                    
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    
                    <div style="height: 100px;">

                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
