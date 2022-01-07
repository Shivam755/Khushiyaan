<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Team.aspx.cs" Inherits="Khushiyaan.Manage_Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Members</h1>
    <div>
        <span>
            Name: <input type="text" ID="Name" text="Name" runat="server"/>
        </span>
        <span>
            Type: <select id="typeSel" runat="server" runat="server"></select>
        </span>
        <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" />
    </div>
    <h1>Team members: </h1>
    <table id="Members" runat="server">
        <tr>
            <th>Selected</th>
            <th>Name</th>
            <th>Type</th>
            <th>Photo</th>
        </tr>
    </table>
    <asp:Button ID="Delete" runat="server" Text="Delete Selected" OnClick="delete_Click" UseSubmitBehavior="False" />

</asp:Content>

