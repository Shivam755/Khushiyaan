<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="Khushiyaan.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="Admin_login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <body>
          <div class="content">
                    <div class ="card">
      <form id="form1">
          <div class="title">Admin Login</div>
          <input type="password" placeholder="Password" class="user-input">
          <input type="Submit" value="Submit" class="submit-button">
      </form>
          </div>
              </div>
  </body>
</asp:Content>
