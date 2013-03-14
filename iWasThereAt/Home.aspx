<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>iWasThereAt - Home</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="all">
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 style="color: #fff; font-size: 64px; font-weight: bold;">iWasThereAt</h1>
    <div class="connect" style="vertical-align: middle; text-align: center">
    Connect With Your Twitter Account and authorize the application<br />
        But make sure, You have Location Settings Enabled in Your Twitter Account<br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="58px" 
            ImageUrl="~/sign-in-with-twitter.png" onclick="ImageButton1_Click" 
            Width="440px" />
            <br />
            </div>
            <div class="connect" style="vertical-align: Bottom; text-align: center">
                <a href="http://piyushwadhwa.com/projects/iWasThereAt.html" style="color: #fff;">Click Here To Know More</a>
            </div>
    </div>
    </form>
</body>
</html>
