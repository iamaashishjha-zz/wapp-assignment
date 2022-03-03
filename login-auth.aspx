<%@ Page Title="" Language="C#" MasterPageFile="~/auth.Master" AutoEventWireup="true" CodeBehind="login-auth.aspx.cs" Inherits="wapp.login_auth" %>

<asp:Content ID="Content3" ContentPlaceHolderID="formbody" runat="server">
    <div class="container">

        <center>
            <h3>Login Page</h3>
            <h3>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </h3>
        </center>
        <label for="uname"><b>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Is Required" ForeColor="Red" ValidationGroup="loginValidation"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="loginValidation"></asp:RegularExpressionValidator>
        </b></label>
        &nbsp;<asp:TextBox runat="server" ID="txtEmail" placeholder="Enter Username"></asp:TextBox>
        <label for="psw"><b>Password<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Password is Required" ForeColor="Red" ValidationGroup="loginValidation"></asp:RequiredFieldValidator>
        </b></label>
&nbsp;<asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
        <asp:Button runat="server" ID="btnLogin" CssClass="lgnbtn" Text="Login" OnClick="btnLogin_Click" ValidationGroup="loginValidation" />
        <asp:Button runat="server" ID="btnRegister" Text="Regsiter" class="cnbtn" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
