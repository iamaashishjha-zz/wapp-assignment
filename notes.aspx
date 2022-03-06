<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="notes.aspx.cs" Inherits="wapp.notes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .bcontent {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="container bcontent">
        <h1 style="">All Notes</h1>
        <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>
                    <div class="card">
                        <div class="card-header"><%#Eval("name")%></div>
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("description")%></h5>
                            <p class="card-text">Welcome to Tutlane. Its card sample text.</p>
                            <button class="btn btn-primary">
                                Download</button>
                        </div>
                        <div class="card-footer text-muted">
                            <p>Course : <%#Eval("courseName")%></p>
                            <p>Category : <%#Eval("category")%></p>
                            <p>Created By : <%#Eval("username")%></p>
                        </div>
                    </div>
                </ItemTemplate>  
            </asp:Repeater>  
        
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</asp:Content>
