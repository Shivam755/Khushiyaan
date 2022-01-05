<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="Khushiyaan.AddMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <input type="text" ID="Name" text="Name" runat="server"/><br />
        Type: <select id="typeSel" runat="server" runat="server"></select><br />
        <asp:Button ID="add" runat="server" Text="Add" OnClick="add_Click" />
    </div>
</asp:Content>
