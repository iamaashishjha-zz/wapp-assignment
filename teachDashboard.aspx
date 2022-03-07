<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="teachDashboard.aspx.cs" Inherits="wapp.teachDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Teachers Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .card__content>.card__item>.teacherInfoTable td:first-child{
            color:black;
            font-size:large;
            font-weight:bold;
            text-align:right;
            width:20%;
        }
        .card__content>.card__item>.teacherInfoTable td:nth-child(2){
            /*color:black;
            font-size:large;
            font-weight:bold;*/
            text-align:left;
            width:80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item"  id="info">
        <div class="card">
            <div class="card__header" style="color:white;background-color:red;">
                <h1>Update Your Information </h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table class="table teacherInfoTable">
                        <tbody>
                            <tr>
                                <td>Name :</td>
                                <td><asp:TextBox ID="txtTName" runat="server"  Width="100%"  CssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td><asp:TextBox ID="txtEmail" runat="server" Width="100%" ReadOnly="True"  CssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Address :</td>
                                <td><asp:TextBox ID="txtAddress" runat="server" Width="100%"  CssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Password :</td>
                                <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100%"  CssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password :</td>
                                <td><asp:TextBox ID="txtCPassword" TextMode="Password" runat="server" Width="100%"  CssClass="form-control" /></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                <asp:Button ID="btnUpdateInfo" runat="server" Text="Update" OnClick="btnUpdateInfo_Click" CssClass="btn btn-info btn-lg btn-block form-control" />

                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:Panel ID="Panel1" runat="server">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="teachValidation"></asp:RequiredFieldValidator>
                        <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is Required" ForeColor="Red" ValidationGroup="teachValidation"></asp:RequiredFieldValidator>
                        <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address Is Required" ForeColor="Red" ValidationGroup="teachValidation"></asp:RequiredFieldValidator>
                        <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" ValidationGroup="teachValidation"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCPassword" ErrorMessage="Confirm Password is Required" ForeColor="Red" Display="Dynamic" ValidationGroup="teachValidation"></asp:RequiredFieldValidator>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
