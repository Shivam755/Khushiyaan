<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="Khushiyaan.Admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
        window.onload = () => {
            console.log(sessionStorage.getItem("session"));
            if (sessionStorage.getItem("session") != null) {
                window.location = "Admin_home.aspx";
            }
        }
    </script>
    <title></title>
    <link href="Admin_login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="content">
        <div class ="card">
            <div class="title">Admin Login</div>
            <input id="password" type="password" placeholder="Password" class="user-input" runat="server"/>
            <asp:Button ID="submit" runat="server" Text="Submit" class="submit-button" OnClick="submit_Click" />
        </div>
    </div>
    </form>
</body>
</html>
