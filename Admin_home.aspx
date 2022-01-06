<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Admin_home.aspx.cs" Inherits="Khushiyaan.Admin_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href ="Assets/Admin_home.css" rel ="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section>
          <i class="fa fa-home" style="font-size:48px"></i>
    <h1>Admin HomePage</h1>

  <div class="container">
    <div class="topnav">

      <a href="#home">Manage Projects</a><br />
      <a href="#news">View Messages</a><br />
      <a href="#contact">Edit Contact</a><br />
      <a href="#about">Manage Team Members</a>
    </div>
  </div>
</section>
 

</asp:Content>
