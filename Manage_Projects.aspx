<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Projects.aspx.cs" Inherits="Khushiyaan.Manage_Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.0.3/firebase-firestore.js"></script>
    <link rel="stylesheet" href="style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="h1pro">PROJECTS</h1>

        <input type="radio" name="opration" id="update" style="display: none;" />
        <input type="radio" name="opration" id="add" style="display: none;" /> 

        <button style="margin-left: 585px; width: 150px;" onclick="yesnoCheck();"><label class="Operationa" for="add" aria-checked="true">ADD</label></button>
        <button style="margin-left: 50px; width: 150px;" onclick="yesnoCheck();"><label class="Operationu" for="update">UPDATE</label></button>

        <div class="content">

            <form id="add-cafe-form">
                <input class="inputPro" type="text" name="Name" placeholder="project name" />
                <input class="inputPro" type="date" name="StartedOn" placeholder="project date" />
                <textarea class="description" name="Description" rows="12" cols="50" placeholder="add project description here...."></textarea>
                <input class="photoR" name="Path" type="file" accept="image/*" capture="camera" id="cameraInput" />
                <button class="buttn" id="addbtn" style="margin-top: 5px;">Add project</button>
                <button class="buttn" id="updatebtn" style="margin-top: 10px; margin-left: 10px;">Update project</button>
            </form>

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
        </script>
        <script src="appi.js"></script>

</asp:Content>
