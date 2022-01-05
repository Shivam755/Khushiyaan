<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="Manage_Team.aspx.cs" Inherits="Khushiyaan.Manage_Team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Team members: </h1>
    <asp:HyperLink ID="addMember" runat="server" NavigateUrl="~/AddMember.aspx">Add Member</asp:HyperLink>
    <table id="Members" runat="server">
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Photo</th>
            <th>Edit</th>
        </tr>
    </table>

</asp:Content>

