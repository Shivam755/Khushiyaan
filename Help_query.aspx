<%@ Page Title="Help_us" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="Help_query.aspx.cs" Inherits="Khushiyaan.Help_query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Help_query_StyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <input class="inputR" type="radio" name="Photos" id="check1"  />
    <input class="inputR" type="radio" name="Photos" id="check2" checked="checked" />
    <input class="inputR" type="radio" name="Photos" id="check3" />
    <input class="inputR" type="radio" name="Photos" id="check4" />

    <div class="container">
        <h1 class="h1R"> SUPPORT US </h1>
        <div class="top-content">
            <h3 class="h3R">How ? </h3>
            <label class="labelR" for="check2">DONATION </label>
            <label class="labelR" for="check3">BE A MEMBER </label>
            <label class="labelR" for="check4">VOLUNTEER </label>
        </div>
        <div class="photo-gallery">
            <div class="pic family">
                <img src="quote1.png" />
            </div>
            <div class="pic family">
                <img src="Roti_Ghar_Donation.jpg" />
            </div>
            <div class="pic family">
                <img src="Naari_Shakti_Donation.jpg" />
            </div>
            <div class="pic family">
                <img src="Project_ Pathshala_Donation.jpg" />
            </div>
            <div class="pic family">
                <img src="Beach_Warriors_Donation.jpg" />
            </div>
            <div class="pic family">
                <img src="WhatsApp.jpeg" />
            </div>
            <div class="pic family">
                <img src="Other_Donation.jpg" />
            </div>
            <div class="pic family" style="box-shadow: none;">
                <div class="boxi" style="box-shadow: none">
                    Name: Khushiyaan Foundation<br />
                    Bank : Axis Bank<br />
                    A/c no: 920010067288698<br />
                    IFSC code: UTIB0004732<br />
                    A/c Type: Savings<br />
                    Branch - Majiwada
                    Name: Khushiyaan Foundation<br />
                    Bank Name: Bharat Bank<br />
                    A/c No: 009410100016730<br />
                    IFSC: BCBM0000095<br />
                    A/c Type: Savings<br />
                    Branch: Shree Nagar, Mulund (w)
                </div>
            </div>
            <div class="pic child">
                part 2
                <img src="quote1.png" />
            </div>
            <div class="pic place">
                part3
                <img src="quote1.png" />
            </div>
        </div>
        <div class="pic family" style="width: 57%; height: 250px; color: black; text-align: left; margin-top: 40px; margin-left: 300px; margin-bottom: 40px; background-color: lightgray; padding: 10px 10px 10px 5px;">
            And here we are back !<br />
            <br />
            Your <b>&#8377;100</b> have helped us get <b>&#8377;1,65,000</b> which is used to build computer labs, library &amp;
                <br />
            <br />
            other stationary material in next 15 days.
                <br />
            <br />
            This year we Hope to get similar support.
                <br />
            <br />
            Adopt a kid at <b>&#8377;100/Month</b>.<br />
            <br />
            Note: You can adopt as many kids as uou can on monthly or yearly basis. Once
                <br />
            <br />
            confirmed, we hope you won't back out.
                <b>For more details : 9769181218</b><br />
            <br />
        </div>
    </div>
    <div class="containeri">
        <div class="box">
            <div class="iconi">
                <i class="fa fa-university" aria-hidden="true"></i>
            </div>
            <div class="content">
                <h3>BANK DETAILS </h3>
                <p style="font-size: small;">
                    Name: Khushiyaan Foundation<br />
                    Bank : Axis Bank<br />
                    A/c no: 920010067288698<br />
                    IFSC code: UTIB0004732<br />
                    A/c Type: Savings<br />
                    Branch - Majiwada
                </p>
            </div>
        </div>
        <div class="box">
            <div class="iconi">
                <i class="fa fa-university" aria-hidden="true"></i>
            </div>
            <div class="content">
                <h3>BANK DETAILS </h3>
                <p style="font-size: small;">
                    Name: Khushiyaan Foundation<br />
                    Bank Name: Bharat Bank<br />
                    A/c No: 009410100016730<br />
                    IFSC: BCBM0000095<br />
                    A/c Type: Savings<br />
                    Branch: Shree Nagar, Mulund (w)
                </p>
            </div>
        </div>
    </div>
    
    

</asp:Content>
