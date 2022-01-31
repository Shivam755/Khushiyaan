<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Khushiyaan.index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="Assets/homepage.css" rel="stylesheet" />
    <div class="picslider">
        <div id="slider">  
                    <ul class="slides">  
                        <li class="slide"><img src="Assets/rotihome.jpg"/></li>  
                        <li class="slide"><img src="Assets/bwhome.jpg"/></li>  
                        <li class="slide"><img src="Assets/naarihome.jpg"/></li>  
                        <li class="slide"><img src="Assets/pathhome.jpg"/></li>  
                        <li class="slide"><img src="Assets/rotihome.jpg"/></li>  
                    </ul>  
        </div>
    </div>



    <div class="containcont">
        <br/><br/>
        <asp:Image id="Image1" runat="server" ImageUrl="https://www.khushiyaanfoundation.org/images/IMG_20180513_210715_690.jpg"/>
    <div class="containtxt" style="margin:0; padding:0;">
        <div class="title">
        About us:
        <hr style="height:5%; width:80%; margin:0" />
    </div>
    <div class="content">
        Khushiyaan, as the name suggests 'Happiness" is committed to delivering Happiness to underprivileged humans of the society & environment. 
        Khushiyaan Foundation is officially registered under the Mumbai Public Trust Act, 1950 & Societies Registration Act, 1860. 
        Khushiyaan Foundation is formed by young team under the leadership of Mr.Chinu Kwatra.
        <br />
        Through its successfully running projects Roti Ghar, Naari Shakti, Beach Warriors and Project Paathshala it strives to provide quality food,
        women empowerment and hygiene, cleanliness drives and the gift of education respectively.
    </div>
    </div>
    </div>

    <div class="containtxt">
        <div class="title">
            <center>
            Become a member
            <hr style="height:5%; width:80%; margin:0" />
            </center>
        </div>
        <div class="content1">
            Khushiyaan Foundation welcomes new members. We currently have more than 100 members who just wish to spread happiness & love.
            Together we are strong to bring the change in the society.
        </div>
        
        <div class="redme">
           <center> 
        <asp:HyperLink ID="redirectme1" runat="server" NavigateUrl="~/Help_query.aspx">Read more</asp:HyperLink>
            </center>
         </div>    
    </div>



    <div class="containtxt">
        <div class="title">
            <center>
            Become a Volunteer
            <hr style="height:5%; width:80%; margin:0" />
            </center>
        </div>
        <div class="content1">
            Khushiyaan Foundation offers a diverse range of volunteering opportunities.
            Through these, you can not only contribute towards the betterment of the society & environment, but also undergo a transformational journey for yourselves.
        </div>
        
        <div class="redme">
           <center> 
        <asp:HyperLink ID="redirectme2" runat="server" NavigateUrl="~/Help_query.aspx">Read more</asp:HyperLink>
            </center>
         </div>    
    </div>
    <script>
        $(function () {
            //value for animation  
            var width = 1000;
            var animationSpeed = 2000;
            var pause = 7000;
            var currentSlide = 1;
            //Dom element.   
            var $slider = $('#slider');
            var $sliderAnimation = $slider.find('.slides');
            var $slides = $sliderAnimation.find('.slide');

            setInterval(function () {
                $sliderAnimation.animate({ 'margin-left': '-=' + width }, animationSpeed, function () {
                    currentSlide++;
                    if (currentSlide === $slides.length) {
                        $sliderAnimation.css('margin-left', 0);
                        currentSlide = 1;
                    }
                });
            }, pause);
        });
    </script>
</asp:Content>