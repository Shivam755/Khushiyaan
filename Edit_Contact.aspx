<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Edit_Contact.aspx.cs" Inherits="Khushiyaan.Edit_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/Edit_Contact.css" rel="stylesheet" />
    <script src="Assets/Edit_contact.js"></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
      crossorigin="anonymous"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <figure class="figure">
            <img class="pic" src="https://apsdma.ap.gov.in/common_mns/img/contact-us.jpg" alt="logo" style="width:25%;" />
            <figcaption class="figcaption">Edit Contact Details</figcaption>
        </figure>
    <div class="cont">
        <div class="container">
            <form id="form">
                <div class="title">Contact Info</div>

                <!-- /** 
                * ! user name Input here
               **/ -->

                

                <div class="smallcont" style="height: 150px">
                    <label for="phone" style="margin-bottom: 30px" class="loginlb">Contact Number</label>
                    <div class="iconinput">
                        <i class="fas fa-phone"></i>
                        <input type="number" name="phone" class="lodinip" value="" id="phone" placeholder="Contact" />
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>

                <!-- /** 
                * ! Email Input here
               **/ -->


                <label for="email" class="loginlb">Email</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="far fa-envelope"></i>
                        <input
                            type="email"
                            name="email"
                            id="email"
                            class="lodinip"
                            placeholder="abc@gmail.com" />
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>



                <!-- /** 
                * ! Registered address Input here
               **/ -->


                <label for="regaddrs" class="loginlb">Reg. Address</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="fas fa-map-marked-alt"></i>
                        <textarea style="resize: none" class="lodinip" name="regaddress" id="regaddrs" cols="24" rows="4" placeholder="Registred Address here...."></textarea>
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>



                <!-- /** 
                * ! head address Input here
               **/ -->


                <label for="offaddrs" class="loginlb">Head office Address</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="far fa-building"></i>
                        <textarea style="resize: none" class="lodinip" name="offaddress" id="offaddrs" cols="24" rows="4" placeholder="Head office Address here...."></textarea>
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>



                <!-- /** 
                * ! facebook Input here
               **/ -->


                <label for="fburl" class="loginlb">facebook</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="fab fa-facebook"></i>
                        <input
                            type="fburl"
                            name="fburl"
                            id="fburl"
                            class="lodinip"
                            placeholder="facebook page link..." />
                    </div>
                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>



                <!-- /** 
                * ! twitter Input here
               **/ -->


                <label for="twurl" class="loginlb">twitter</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="fab fa-twitter-square"></i>
                        <input
                            type="twurl"
                            name="twurl"
                            id="twurl"
                            class="lodinip"
                            placeholder="twitter account link..." />
                    </div>
                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>




                <!-- /** 
                * ! instagram Input here
               **/ -->


                <label for="igurl" class="loginlb">instagram</label>
                <div class="smallcont">
                    <div class="iconinput">
                        <i class="fab fa-instagram"></i>
                        <input
                            type="igurl"
                            name="igurl"
                            id="igurl"
                            class="lodinip"
                            placeholder="instagram account link..." />
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>




                <button type="submit" id="submit">Submit</button>
            </form>
        </div>
    </div>

</asp:Content>
