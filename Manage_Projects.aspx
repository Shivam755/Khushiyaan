<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Projects.aspx.cs" Inherits="Khushiyaan.Manage_Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-firestore.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="h1pro">PROJECTS</h1>

        <input class="buttn" type="radio" name="opration" id="update"/><label class="Operationa" for="add" aria-checked="true">ADD</label>
        <input class="buttn" type="radio" name="opration" id="add" /> <label class="Operationu" for="update">UPDATE</label>

        <button id="addlab" style="margin-left: 585px; width: 150px;" class="buttn"></button>
        <button id="updatelab" style="margin-left: 50px; width: 150px;" class="buttn"></button>

        <div class="content">

            <div id="add-cafe-form">
                <input class="inputPro" type="text" id="Name" placeholder="project name" />
                <input class="inputPro" type="date" id="StartedOn" placeholder="project date" />
                <textarea class="description" id="Description" rows="12" cols="50" placeholder="add project description here...."></textarea>
                <input class="photoR" id="Path" type="file" accept="image/*" capture="camera" id="cameraInput" />
                <button class="buttn" id="addbtn" style="margin-top: 5px;">Add project</button>
                <button class="buttn" id="updatebtn" style="margin-top: 10px; margin-left: 10px;">Update project</button>
            </div>

            <ul id="cafe-list"></ul>

        </div>

        <script>
            // Initialize Firebase
            
            var config = {
                apiKey: "AIzaSyCVC_QyeHJr_FfBB3Ffvks7PPcn5Gg8AYI",
                authDomain: "khushiyaan-48310.firebaseapp.com",
                projectId: "khushiyaan-48310",
                storageBucket: "khushiyaan-48310.appspot.com",
                messagingSenderId: "213055695762",
                appId: "1:213055695762:web:68824895488aa66eb96f4b",
                measurementId: "G-KPTTYTC4SX"
            };

            firebase.initializeApp(config);
            const db = firebase.firestore();
            db.settings({ timestampsInSnapshots: true });


            window.onload = function () {
                //document.getElementById('updatebtn').style.display = 'none';
                document.getElementById('updatebtn').onclick = submit;
                document.getElementById('addbtn').onclick = submit;
                document.getElementById('update').onselect = yesnoCheck;
                document.getElementById('add').onselect = yesnoCheck;

                listProj();
            }

            function yesnoCheck(e) {
                e.preventDefault();
                if (document.getElementById('update').ariaChecked) {
                    document.getElementById('updatebtn').style.display = 'block';
                    document.getElementById('addbtn').style.display = 'none';
                }
                else if (document.getElementById('add').ariaChecked) {
                    document.getElementById('addbtn').style.display = 'block';
                    document.getElementById('updatebtn').style.display = 'none';
                }
                return false;
            }





            const projtList = document.querySelector('#cafe-list');
            const form = document.querySelector('#add-cafe-form');

            function renderProjt(doc) {
                let li = document.createElement('li');
                let Name = document.createElement('span');
                let StartedOn = document.createElement('span');
                let Path = document.createElement('span');
                let Description = document.createElement('span');
                let cross = document.createElement('div');

                li.setAttribute('data-id', doc.id);
                Name.textContent = doc.data().Name;
                StartedOn.textContent = doc.data().StartedOn;  //.toDate();
                Path.textContent = doc.data().Path;
                Description.textContent = doc.data().Description;
                cross.textContent = 'x';


                li.appendChild(Name);
                li.appendChild(StartedOn);
                li.appendChild(cross);

                projtList.appendChild(li);

                cross.addEventListener('click', (e) => {
                    e.stopPropagation();
                    let id = e.target.parentElement.getAttribute('data-id');
                    db.collection('Project').doc(id).delete();
                    projtList.replaceChildren();
                    listProj();
                })

            }

            const listProj = () => {
                db.collection('Project').get().then((snapshot) => {
                    snapshot.docs.forEach(doc => {
                        renderProjt(doc);
                    });
                })
            }
            
            const submit = (e) => {
                e.preventDefault();
                db.collection('Project').add({
                    Name: document.getElementById("Name").value,
                    StartedOn: document.getElementById("StartedOn").value,
                    Description: document.getElementById("Description").value,
                    Path: document.getElementById("Path").value
                }).then(() => {
                    console.log("success");
                    alert("Project added succesfully!!");
                    projtList.replaceChildren();
                    listProj();
                })
            }


        </script>

</asp:Content>
