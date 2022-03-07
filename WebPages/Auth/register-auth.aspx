<%@ Page Title="" Language="C#" MasterPageFile="~/auth.Master" AutoEventWireup="true" CodeBehind="register-auth.aspx.cs" Inherits="wapp.register_auth" %>

<asp:Content ID="Content3" ContentPlaceHolderID="formbody" runat="server">
    <div class="container">
            <center>
                <h3>Registration Page</h3>
                <h3>
                    <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </h3>
            </center>
            <label for="txtName"><b>Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="registerValidation"></asp:RequiredFieldValidator>
            </b></label>
            &nbsp;<asp:TextBox runat="server" ID="txtName" placeholder="Enter Username"></asp:TextBox>
            <label for="txtEmail"><b>Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="registerValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Format" ForeColor="Red" ValidationGroup="registerValidation" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </b></label>
            &nbsp;<asp:TextBox runat="server" ID="txtEmail" placeholder="Enter Email"></asp:TextBox>

            <label for="txtName"><b>Address<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ForeColor="Red" ValidationGroup="registerValidation"></asp:RequiredFieldValidator>
            </b></label>
            &nbsp;<asp:TextBox runat="server" ID="txtAddress" placeholder="Enter Username"></asp:TextBox>
            <label for="txtPassword"><b>Password<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="registerValidation"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Password" ForeColor="#FF3300" ValidationExpression="^[\w ]{4,19}$" ControlToValidate="txtPassword" ValidationGroup="registerValidation"></asp:RegularExpressionValidator>
            </b></label>
            &nbsp;<asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <label for="txtCPassword"><b>Confirm Password<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Passwords doesnot match" ForeColor="Red" ValidationGroup="registerValidation"></asp:CompareValidator>
            </b></label>
            &nbsp;<asp:TextBox runat="server" ID="txtCPassword" TextMode="Password" placeholder="Enter Confirm Password"></asp:TextBox>
            <label for="slctRole"><b>Role<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Role is required" ForeColor="#FF3300" ControlToValidate="slctRole" ValidationGroup="registerValidation"></asp:RequiredFieldValidator>
            </b></label>
            &nbsp;<asp:DropDownList ID="slctRole" CssClass="select-dropdown" runat="server">
                <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                <asp:ListItem Text="Student" Value="Student" />
                <asp:ListItem Text="Teacher" Value="Teacher" />
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnLogin" CssClass="lgnbtn" Text="Login" OnClick="btnLogin_Click" />
            <asp:Button runat="server" ID="btnRegister" Text="Register" class="cnbtn" OnClick="btnRegister_Click" ValidationGroup="registerValidation"/>
        </div>
</asp:Content>
