<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Team.aspx.cs" Inherits="Khushiyaan.Manage_Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="Assets/Manage_Team.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="section-title">Add Members</h1>
    <div id="addForm" class="row">
        <span class="parts">
            Name: <input class="input" type="text" ID="Name" text="Name" runat="server" required="required"/>
        </span>
        <span class="parts">
            Type: <select class="input" id="typeSel" runat="server" ></select>
        </span>
        <asp:Button ID="add" CssClass="submit parts" runat="server" Text="Add" OnClick="add_Click" />
    </div>
    <hr />
    <h1 class="section-title">Team members: </h1>
    <div id="tableCont" class="column">
        <table id="Members" runat="server">
            <tr>
                <th>Selected</th>
                <th>Name</th>
                <th>Type</th>
                <th>Photo</th>
            </tr>
        </table>
        <asp:Button CssClass="submit" ID="Delete" runat="server" Text="Delete Selected"/>
    </div>
    <script type="module">
        // Import the functions you need from the SDKs you need
        import { getFirestore, collection, deleteDoc, doc } from "https://www.gstatic.com/firebasejs/9.6.1/firebase-firestore.js"
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

        const contCol = collection(db, 'Team');

        const onDelete = (e) => {
            e.preventDefault();
            const checks = document.querySelectorAll("input[type='checkBox']");

            checks.forEach(check => {
                if (check.checked) {
                    const cur = doc(contCol, check.id.split("_")[1]);
                    //Removing prefix
                    deleteDoc(cur)
                        .then(del => {
                            document.querySelector("tbody").removeChild(check.parentElement.parentElement);
                        });
                }

            });
            alert("Members deleted!!");
            return false;
        }

        document.getElementById("ContentPlaceHolder1_Delete").onclick = onDelete;



    </script>
</asp:Content>

