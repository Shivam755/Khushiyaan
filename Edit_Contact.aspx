<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Edit_Contact.aspx.cs" Inherits="Khushiyaan.Edit_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Edit_Contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
     <figure>
    <img src="https://www.freeiconspng.com/thumbs/contact-icon-png/contact-phone-icon-4.png" alt="logo" style="width:10%;">
  <figcaption>Edit Contact Details</figcaption>
</figure>
        <div class="info">
           Address : <br />
           Email-ID : <br />
           Contact No. : <br />
       </div>
    </div>
</asp:Content>
