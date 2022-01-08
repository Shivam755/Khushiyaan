<%@ Page Async="true" Title="View Messages" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeBehind="View_Messages.aspx.cs" Inherits="Khushiyaan.View_Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="heading">Message Responses</div>
    <div id="Container" runat="server">

    </div>
    <div id="tableCont" class="column">
        <table id="Messages" runat="server">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
        </table>
        </div>
    <link href="Assets/View_Messages.css" rel="stylesheet"/>
</asp:Content>
