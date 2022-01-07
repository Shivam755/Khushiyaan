<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Team.aspx.cs" Inherits="Khushiyaan.Manage_Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Members</h1>
    <div>
        Name: <input type="text" id="Name" text="Name" runat="server"/><br />
        Type: <select id="typeSel" runat="server"></select><br />
        <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" />
    </div>
    <h1>Team members: </h1>
    <table id="Members" runat="server">
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Photo</th>
            <th>Edit</th>
        </tr>
    </table>

</asp:Content>

