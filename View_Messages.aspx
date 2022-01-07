<%@ Page Async="true" Title="View Messages" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="View_Messages.aspx.cs" Inherits="Khushiyaan.View_Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Container" runat="server"></div>
    <table id="Members" runat="server">
        <tr>
            <th>Selected</th>
            <th>Name</th>
            <th>Type</th>
            <th>Photo</th>
        </tr>
    </table>
</asp:Content>
