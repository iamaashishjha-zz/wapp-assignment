<%@ Page Title="" Language="C#" MasterPageFile="~/auth.Master" AutoEventWireup="true" CodeBehind="login-auth.aspx.cs" Inherits="wapp.login_auth" %>

<asp:Content ID="Content3" ContentPlaceHolderID="formbody" runat="server">
    <div class="container">

        <center>
            <h3>Login Page</h3>
            <h3>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </h3>
        </center>
        <label for="uname"><b>Email</b></label>
        <asp:TextBox runat="server" ID="txtEmail" placeholder="Enter Username"></asp:TextBox>
        <label for="psw"><b>Password</b></label>
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
        <asp:Button runat="server" ID="btnLogin" CssClass="lgnbtn" Text="Login" OnClick="btnLogin_Click" />
        <asp:Button runat="server" ID="btnRegister" Text="Regsiter" class="cnbtn" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
