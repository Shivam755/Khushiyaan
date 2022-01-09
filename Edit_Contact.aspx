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
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-firestore.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <figure class="figure">
            <img class="pic" src="https://apsdma.ap.gov.in/common_mns/img/contact-us.jpg" alt="logo" style="width:25%;" />
            <figcaption class="figcaption">Edit Contact Details</figcaption>
        </figure>
    <div class="cont">
        <div class="container">
            <div id="form">
                <div class="title">Contact Info</div>

                <!-- /** 
                * ! user name Input here
               **/ -->

                <label for="phone" class="loginlb">Contact Number</label>

                <div class="smallcont">
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




                <button type="submit" id="updatebtn">Update</button>
            </div>
        </div>
    </div>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { getFirestore, collection, doc, getDoc, addDoc } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js"
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-analytics.js";
        // TODO: Add SDKs for Firebase products that you want to use
        // https://firebase.google.com/docs/web/setup#available-libraries

        // Your web app's Firebase configuration
        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
        const firebaseConfig = {
            apiKey: "AIzaSyCVC_QyeHJr_FfBB3Ffvks7PPcn5Gg8AYI",
            authDomain: "khushiyaan-48310.firebaseapp.com",
            projectId: "khushiyaan-48310",
            storageBucket: "khushiyaan-48310.appspot.com",
            messagingSenderId: "213055695762",
            appId: "1:213055695762:web:68824895488aa66eb96f4b",
            measurementId: "G-KPTTYTC4SX"
        };

        // Initialize Firebase
        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);
        const db = getFirestore(app);
        const contCol = collection(db, 'Contact Us Info');
        const phoneDoc = doc(db, 'Contact Us Info/ContactNo');
        const emailDoc = doc(db, 'Contact Us Info/Email');
        const officeDoc = doc(db, 'Contact Us Info/HeadOffice');
        const addressDoc = doc(db, 'Contact Us Info/RegisteredAddress');
        const socialDoc = doc(db, 'Contact Us Info/Social');





        window.onload = function () {
            document.getElementById('updatebtn').style.display = 'none';
           // document.getElementById('updatebtn').onclick = updateInfo;
            renderProj();
            console.log(emailDoc.Value);
        }
        const phone = document.getElementById("phone");
        const email = document.getElementById("email");
        const regaddrs = document.getElementById("regaddrs");
        const offaddrs = document.getElementById("offaddrs");
        const fburl = document.getElementById("fburl");
        const igurl = document.getElementById("igurl");
        const twurl = document.getElementById("twurl");
        
        
        async function renderProj() {
            phone.value = await phoneDoc.data().Value;
            email.value = await emailDoc.data().Value;
            regaddrs.value = await addressDoc.data().Value;
            offaddrs.value = await officeDoc.data().Value;
            fburl.value = await socialDoc.data().Value;
            twurl.value = await socialDoc.data().Value;
            igurl.value = await socialDoc.data().Value;
        }
    </script>
</asp:Content>
