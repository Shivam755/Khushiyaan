<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Edit_Contact.aspx.cs" Inherits="Khushiyaan.Edit_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Edit_Contact.css" rel="stylesheet" />
    <script src="Edit_Contact.js"></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
      crossorigin="anonymous"
    />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<fieldset>  
    <figure>
    <img src="https://apsdma.ap.gov.in/common_mns/img/contact-us.jpg" alt="logo" style="width:25%;">
  <figcaption>Edit Contact Details</figcaption>
</figure>
</fieldset>
    <div class="cont">
        <div class="container">
            <form id="form">
                <div class="title">Contact Info</div>
      
              <!-- /** 
                * ! user name Input here
               **/ -->
      
              <div>
                <label for="phone" class="loginlb">Contact Number</label>
                <i class="fas fa-phone"></i>
                <input
                  type="number"
                  name="phone"
                  class="lodinip"
                  value=""
                  id="phone"
                  placeholder="Contact"
                />
                <i class="fas fa-exclamation-circle failure-icon"></i>
                <i class="far fa-check-circle success-icon"></i>
                <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! Email Input here
               **/ -->
      
              <div>
                <label for="email" class="loginlb">Email</label>
                <i class="far fa-envelope"></i>
                <input
                  type="email"
                  name="email"
                  id="email"
                  class="lodinip"
                  placeholder="abc@gmail.com"
                />
                <i class="fas fa-exclamation-circle failure-icon"></i>
                <i class="far fa-check-circle success-icon"></i>
                <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! Registered address Input here
               **/ -->
      
              <div>
                  <label for="regaddrs" class="loginlb">Reg. Address</label>
                  <i class="fas fa-map-marked-alt"></i>
                  <textarea style="resize:none" class="lodinip" name="regaddress" id="regaddrs" cols="24" rows="4" placeholder="Registred Address here...."></textarea>
                  <i class="fas fa-exclamation-circle failure-icon"></i>
                  <i class="far fa-check-circle success-icon"></i>
                  <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! head address Input here
               **/ -->
      
               <div>
                  <label for="offaddrs" class="loginlb">Head office Address</label>
                  <i class="far fa-building"></i>
                  <textarea style="resize:none" class="lodinip" name="offaddress" id="offaddrs" cols="24" rows="4" placeholder="Head office Address here...."></textarea>
                  <i class="fas fa-exclamation-circle failure-icon"></i>
                  <i class="far fa-check-circle success-icon"></i>
                  <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! facebook Input here
               **/ -->
      
               <div>
                  <label for="fburl" class="loginlb">facebook</label>
                  <i class="fab fa-facebook"></i>
                  <input
                  type="fburl"
                  name="fburl"
                  id="fburl"
                  class="lodinip"
                  placeholder="facebook page link..."
                />
                  <i class="fas fa-exclamation-circle failure-icon"></i>
                  <i class="far fa-check-circle success-icon"></i>
                  <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! twitter Input here
               **/ -->
      
               <div>
                  <label for="twurl" class="loginlb">twitter</label>
                  <i class="fab fa-twitter-square"></i>
                  <input
                  type="twurl"
                  name="twurl"
                  id="twurl"
                  class="lodinip"
                  placeholder="twitter account link..."
                />
                  <i class="fas fa-exclamation-circle failure-icon"></i>
                  <i class="far fa-check-circle success-icon"></i>
                  <div class="error"></div>
              </div>
      
              <!-- /** 
                * ! instagram Input here
               **/ -->
      
               <div>
                  <label for="igurl" class="loginlb">instagram</label>
                  <i class="fab fa-instagram"></i>
                  <input
                  type="igurl"
                  name="igurl"
                  id="igurl"
                  class="lodinip"
                  placeholder="instagram account link..."
                />
                  <i class="fas fa-exclamation-circle failure-icon"></i>
                  <i class="far fa-check-circle success-icon"></i>
                  <div class="error"></div>
              </div>
      
              <button type="submit" id="submit">Submit</button>
            </form>
          </div>
      </div>

        <button class="submit-btn" type="submit" id="submit">Update</button> 
    </div>
    </div>
</asp:Content>
