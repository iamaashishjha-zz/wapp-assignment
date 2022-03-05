<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="wapp.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <li><asp:Button ID="Button1" runat="server" Text="Log Out" CssClass="button" OnClick="btnLogout_Click" /></li>
    <li><asp:Button ID="Button2" runat="server" Text="Student"  CssClass="button" OnClick="Button2_Click"/></li>
    <li><asp:Button ID="Button3" runat="server" Text="Teacher" CssClass="button"  OnClick="Button1_Click" /></li>
    <li><asp:Button ID="Button4" runat="server" Text="Admin"  CssClass="button" OnClick="Button3_Click" /></li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
</asp:Content>
