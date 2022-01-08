<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="Our_team.aspx.cs" Inherits="Khushiyaan.Our_team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/Our_team.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Teams" class="column">
        <div class="column team-cont">
            <h1 class="team-title">Trustee</h1>
            <p class="team-des">Youth represent the most dynamic segment of the population and are the future of the Nation. India is one of the youngest nations in the world. About 65% of India's population is under 35 years of age. Khushiyaan Foundation captures this zest and enthusiasm in its core team. It is developed under the able leadership of Mr.Chinu Kwatra. It’s an NGO having 8 out of 9 trustees under the age of 30</p>
            <ul class="mem-list" runat="server"  id="Trustee">

            </ul>
        </div>
        <div class="column team-cont">
            <h1 class="team-title">Advisory</h1>
            <p class="team-des">Superhuman are those who lends helping hands to the one who needs them the most. Our superhuman are none other than the Advisory Board of Khushiyaan Foundation who stands firm with us in all our decisions & also make sure our all projects are super successful & making a great impact in the society.Our superhumans possess rich experience in their respective fields of Movies, Production, Education, Recycling, Manufacturing, Investments & Networking. They believe in Mantra Fly High, Stay Grounded!</p>
            <ul class="mem-list" runat="server" id="Advisory">

            </ul>
        </div>
        <div class="column team-cont">
            <h1 class="team-title">Core Team</h1>
            <p class="team-des">The core team members are the Pillars of Khushiyaan Foundation. They are an army of 21 people who are in their 20's. Youth can bring the change in the society & this is proved by the Core Team of Khushiyaan Foundation.Our Core Team firmly believes that our nation can greatly benefit from our resourceful youth population by having a plan and vision to change the future of our country.</p>
            <ul class="mem-list" runat="server" id="Core_Team">

            </ul>
        </div>
    </div>
</asp:Content>
