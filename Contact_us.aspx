<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="Khushiyaan.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="Assets/Contact_us.css" rel="stylesheet"/>
<section id="contact">
  <div class="contact-box">
    <div class="contact-links">
      <h2>CONTACT</h2>
       <div class="info">
           Address : <div id="address" runat="server"></div>
           Email-ID : <div id="email" runat="server" ></div>
           Contact No. : <div id="contactno" runat="server" ></div>
       </div>
      <div class="links">
        <div class="link">
          <a><img src="https://i.postimg.cc/m2mg2Hjm/linkedin.png" alt="linkedin"/></a>
        </div>
        <div class="link">
          <a><img src="https://i.postimg.cc/YCV2QBJg/github.png" alt="github"/></a>
        </div>
        <div class="link">
          <a><img src="https://i.postimg.cc/NjLfyjPB/email.png" alt="email"/></a>
        </div>
      </div>
    </div>
    <div class="contact-form-wrapper">
      
        <div class="form-item">
          <input type="text" name="sender" required/>
          <label>Name:</label>
        </div>
        <div class="form-item">
          <input type="text" name="email" required/>
          <label>Email:</label>
        </div>
        <div class="form-item">
          <textarea class="" name="message" required/>
          <label>Message:</label>
        </div>
        <button class="submit-btn">Send</button> 
    </div>
  </div>
</section>

</asp:Content>

