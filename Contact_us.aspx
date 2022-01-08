<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="Khushiyaan.ContactUs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/Contact_us.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section id="contact">
  <div class="contact-box">
    <div class="contact-links">
      <h2>CONTACT</h2>
       <div class="info">
           Address : <div id="RegAddr" ></div>
           Email-ID : <div id="mail" ></div>
           Contact No. : <div id="ContNo" ></div>
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
          <input type="text" name="sender" required="required"/>
          <label>Name:</label>
        </div>
        <div class="form-item">
          <input type="text" name="email" required="required"/>
          <label>Email:</label>
        </div>
        <div class="form-item">
          <textarea class="" name="message" required="required"></textarea>
          <label>Message:</label>
        </div>
        <button class="submit-btn">Send</button> 
    </div>
  </div>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { getFirestore, collection, getDocs, getDoc } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js"
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

        getDocs(contCol).then(snapshot => {
            snapshot.forEach(doc => {
                if (doc.exists()) {

                    switch (doc.id) {
                        case "RegisteredAddress":
                            document.getElementById("RegAddr").innerText = doc.data()["Value"];
                            break;
                        case "ContactNo":
                            document.getElementById("ContNo").innerText = doc.data()["Value"];
                            break;
                        case "Email":
                            document.getElementById("mail").innerText = doc.data()["Value"];
                            break;

                    }

                }
            })
        });

    </script>
</section>
</asp:Content>

