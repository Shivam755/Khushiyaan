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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table id="Members" runat="server">
                <tr>
                    <th>Selected</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Photo</th>
                </tr>
            </table>
            <asp:Button CssClass="submit" ID="Delete" runat="server" Text="Delete Selected" OnClick="delete_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

