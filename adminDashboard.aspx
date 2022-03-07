<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="wapp.adminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .select-dropdown {}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Welcome Back Admin</strong>.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</asp:Content>
