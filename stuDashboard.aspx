<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="stuDashboard.aspx.cs" Inherits="wapp.stuDashboard" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Student Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
                <li class="menu__item">
                    <a class="menu__link is-active" href="#">Student Dashboard</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#users">Update Information</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#courses">Courses Settings</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#feedbacks">Feedbacks</a>
                </li>
            </ul>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="users">
        <div class="card">
            <div class="card__header" style="color:white;background-color:red;">
                <h1>Update Your Information</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse" width="1020px">
                        <tr>
                            <td Width="50%" >Name:</td>
                            <td Width="50%" ><asp:TextBox ID="txtTName" runat="server"  Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Email :</td>
                            <td Width="50%" ><asp:TextBox ID="txtEmail" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Address :</td>
                            <td Width="50%" ><asp:TextBox ID="txtAddress" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Password :</td>
                            <td Width="50%" ><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100%" /></td>
                        </tr>
                        <tr style="width: 150px;display:inline-block; text-align:center">
                           <td colspan="2"  Width="100%" >
                                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Insert3" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
