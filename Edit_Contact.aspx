<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Edit_Contact.aspx.cs" Inherits="Khushiyaan.Edit_Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/Edit_Contact.css" rel="stylesheet" />
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
    
        <div class="container">
            <div id="form">
                <div class="title">Contact Info</div>

                <!-- /** 
                * ! user name Input here
               **/ -->

                

                <div class="smallcont" style="height: 150px">
                    <label for="phone" style="margin-bottom: 30px" class="loginlb">Contact Number</label>
                    <div class="iconinput">
                        <i class="fas fa-phone"></i>
                        <input type="text" name="phone" class="lodinip" value="" id="phone" placeholder="Contact" />
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
                            type="url"
                            name="fburl"
                            id="Facebook"
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
                            type="url"
                            name="twurl"
                            id="Twitter"
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
                            type="url"
                            name="igurl"
                            id="Instagram"
                            class="lodinip"
                            placeholder="instagram account link..." />
                    </div>

                    <i class="fas fa-exclamation-circle failure-icon"></i>
                    <i class="far fa-check-circle success-icon"></i>
                    <div class="error"></div>
                </div>

                <button type="submit" class="submit-btn" id="submit">Update</button>
            </div>
        </div>

    <script type="module">
        // Import the functions you need from the SDKs you need
        import { getFirestore, collection, getDocs, getDoc, updateDoc, doc} from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js"
        import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js";
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

        // Utility function
        let id = (id) => document.getElementById(id);

        let classes = (classes) => document.getElementsByClassName(classes);

        const db = getFirestore(app);
        const contCol = collection(db, 'Contact Us Info');
        let docs = null;

        let phone = id("phone"),
            email = id("email"),
            regaddrs = id("regaddrs"),
            offaddrs = id("offaddrs"),
            fburl = id("Facebook"),
            twurl = id("Twitter"),
            igurl = id("Instagram"),
            submit = id("submit"),
            errorMsg = classes("error"),
            successIcon = classes("success-icon"),
            failureIcon = classes("failure-icon");
        
        getDocs(contCol).then(snapshot => {
            docs = snapshot;
            snapshot.forEach(doc => {
                if (doc.exists()) {

                    switch (doc.id) {
                        case "HeadOffice":
                            offaddrs.value = doc.data()["Value"];
                            break;
                        case "RegisteredAddress":
                            regaddrs.value = doc.data()["Value"];
                            break;
                        case "ContactNo":
                            phone.value = doc.data()["Value"];
                            break;
                        case "Email":
                            email.value = doc.data()["Value"];
                            break;
                        case "Social":
                            var medias = doc.data()["Social"];
                            //console.log(medias[0]);
                            medias.forEach((media) => {
                                getDoc(media)
                                    .then(snap => {
                                        id(snap.id).value =  snap.data()["Link"];
                                    })

                            });
                            break;

                    }

                }
            })
        });
   
        submit.addEventListener("click", (e) => {
            e.preventDefault();

            engine(phone, 0, "contact cannot be blank");
            engine(email, 1, "Email cannot be blank");
            engine(regaddrs, 2, "address cannot be blank");
            engine(offaddrs, 3, "Address cannot be blank");
            engine(fburl, 4, "url cannot be blank");
            engine(twurl, 5, "url cannot be blank");
            engine(igurl, 6, "url cannot be blank");

            //Updating values
            let curdoc = doc(db, "Contact Us Info", "HeadOffice");
            updateDoc(curdoc, { Value: offaddrs.value })
                .then(() => { console.log("done"); updateRegAdd() })
                .catch(err => console.log(err));

            const updateRegAdd = () => {
                curdoc = doc(db, "Contact Us Info", "RegisteredAddress");
                updateDoc(curdoc, { Value: regaddrs.value })
                    .then(() => { console.log("done"); updateCont() })
                    .catch(err => console.log(err));
            }

            const updateCont = () => {
                curdoc = doc(db, "Contact Us Info", "ContactNo");
                updateDoc(curdoc, { Value: "" + phone.value })
                    .then(() => { console.log("done"); updateEmail() })
                    .catch(err => console.log(err));
            }

            const updateEmail = () => {
                curdoc = doc(db, "Contact Us Info", "Email");
                updateDoc(curdoc, { Value: email.value })
                    .then(() => { console.log("done"); updateSocial() })
                    .catch(err => console.log(err));
            }

            const updateSocial = async() => {
                curdoc = doc(db, "Contact Us Info", "Social");
                let medias = await getDoc(curdoc);
                console.log(medias);
                let mediaList = medias.data()["Social"];
                mediaList.forEach((media) => {

                    getDoc(media)
                        .then(snap => {
                            updateDoc(media, { Link: id(media.id).value }).
                                then(() => alert("Values Updated!!!"))
                                .catch(err => console.log(err));
                        })

                });
            }

            return false;
        });

        let engine = (id, serial, message) => {
            if (id.value.trim() === "") {
                errorMsg[serial].innerHTML = message;
                id.style.border = "2px solid red";

                // icons
                failureIcon[serial].style.opacity = "1";
                successIcon[serial].style.opacity = "0";
            } else {
                errorMsg[serial].innerHTML = "";
                id.style.border = "2px solid green";

                // icons
                failureIcon[serial].style.opacity = "0";
                successIcon[serial].style.opacity = "1";
            }
        };

    </script>

</asp:Content>
