<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Edit_Contact.aspx.cs" Inherits="Khushiyaan.Edit_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Edit_Contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<fieldset>  
    <figure>
    <img src="https://apsdma.ap.gov.in/common_mns/img/contact-us.jpg" alt="logo" style="width:25%;">
  <figcaption>Edit Contact Details</figcaption>
</figure>
</fieldset>
    <div class="contact-box">
<div class="contact-form-wrapper">
      
        <div class="form-item">
          <textarea class="" name="add" required="required"></textarea>
          <label>Registered Address:</label>
        </div>
    `   <div class="form-item">
          <textarea class="" name="headAdd" required="required"></textarea>
          <label>Head Office Address:</label>
        </div>
        <div class="form-item">
          <input type="text" id="email" required="required"/>
          <label>Email:</label>
        </div>
        <div class="form-item">
          <input type="text" id="phone" required="required"/>
          <label>Phone Number:</label>
        </div>

        <button class="submit-btn" type="submit" id="submit">Update</button> 
    </div>
    </div>
</asp:Content>
