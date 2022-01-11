<%@ Page Title="" Language="C#" MasterPageFile="~/BasicLayout.master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="Khushiyaan.Contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/Contact_us.css" rel="stylesheet"/>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-firestore.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section id="contact">
  <div class="contact-box">
    <div class="contact-links">
      <h2>CONTACT</h2>
       <div class="info">
           <br /><br />
           Address : <span id="RegAddr" ></span><br /><br />
           Email-ID : <span id="mail" ></span><br /><br />
           Contact No. : <span id="ContNo" ></span>
       </div>
      
    </div>
    <div class="contact-form-wrapper">
        <div class="form-item" id="form">
          <input type="text" name="sender" required="required" id="name"/>
          <label>Name:</label>
        </div>
        <div class="form-item">
          <input type="text" name="email" required="required" id="email"/>
          <label>Email:</label>
        </div>
        <div class="form-item">
          <textarea class="" name="message" required="required" id="message"></textarea>
          <label>Message:</label>
        </div>
        <button class="submit-btn" id="sendbtn" type="submit">Send</button> 

    </div>
  </div>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { getFirestore, collection, getDocs, getDoc, addDoc} from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js"
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
        const resCol = collection(db, 'Responses ');
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

        window.onload = function () {
            document.getElementById('sendbtn').onclick = sendMess;
        }
        async function sendMess(s)
        {
            s.preventDefault();
            try {
                const docRef = await addDoc(resCol, {
                    Name: await document.getElementById("name").value,
                    Email: await document.getElementById("email").value,
                    Message: await document.getElementById("message").value
                });
                console.log("Document written with ID: ", docRef.id);
                document.getElementById("name").value = " ";
                document.getElementById("email").value = " ";
                document.getElementById("message").value = " ";
                alert("Your message has been sent succesfully!!");
            } catch (e) {
                console.error("Error adding document: ", e);
            }
           
        }

    </script>
</section>
</asp:Content>

