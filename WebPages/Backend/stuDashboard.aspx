<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Master/dashboard.Master" AutoEventWireup="true" CodeBehind="stuDashboard.aspx.cs" Inherits="wapp.WebPages.Backend.stuDashboard" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="server">
    Student Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
    <% if (Session["user_sub_role"].ToString() == "Teacher")
            { %>
        <li class="menu__item">
            <a class="menu__link is-active" href="#">Teacher Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="teachDashboard.aspx">Update Information</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="courseDashboard.aspx">Course</a>
        </li>
          <li class="menu__item">
            <a class="menu__link" href="teachStudent.aspx">Teacher Dashboard</a>
        </li>
        <% } %>
        <% if (Session["user_sub_role"].ToString() == "Student")
            { %>
        <li class="menu__item">
            <a class="menu__link" href="#">Student Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="stuDashboard.aspx">Update Information</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is_active" href="stuCourses.aspx">My Courses</a>
        </li>
        <% } %>
        <% if (Session["user_role"].ToString() == "Admin")
            { %>
        <li class="menu__item">
            <a class="menu__link" href="#">Admin Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="feedBackDashboard.aspx">Feedbacks</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="studentCourse.aspx">Students Information</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="userDashboard.aspx">User Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is_active" href="courseDashboard.aspx">Course</a>
        </li>
        <% } %>
    </ul>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style2 {
            height: 32px;<ul class="menu">
        <% if (Session["user_sub_role"].ToString() == "Teacher")
            { %>
        <li class="menu__item">
            <a class="menu__link is-active" href="#">Teacher Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="teachDashboard.aspx">Update Information</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="courseDashboard.aspx">Course</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is_active" href="noteDashboard.aspx">Notes</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="studentCourse.aspx">View Courses</a>
        </li>
        <% } %>
        <% if (Session["user_sub_role"].ToString() == "Student")
            { %>
        <li class="menu__item">
            <a class="menu__link is-active" href="#">Student Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="stuDashboard.aspx">Update Information</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="stuCourses.aspx">View Courses</a>
        </li>
        <% } %>
        <% if (Session["user_role"].ToString() == "Admin")
            { %>
        <li class="menu__item">
            <a class="menu__link" href="#">Admin Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="feedBackDashboard.aspx">Feedbacks</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="userDashboard.aspx">User Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is_active" href="courseDashboard.aspx">Course</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="studentCourse.aspx">Students Information</a>
        </li>
        <% } %>
        
    </ul>
        }
    </style>
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
                            <td Width="50%" class="auto-style2" >Address :</td>
                            <td Width="50%" class="auto-style2" ><asp:TextBox ID="txtAddress" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Password :</td>
                            <td Width="50%" ><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100%" /></td>
                        </tr>
                        <tr style="width: 150px;display:inline-block; text-align:center">
                           <td colspan="2"  Width="100%" >
                                <asp:Button ID="btnUpdateInfo" runat="server" Text="Update" OnClick="btnUpdateInfo_Click" BackColor="#66FF33" ForeColor="White" Width="250px" ValidationGroup="stuValidation" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table cellpadding="2" class="auto-style1">
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="stuValidation"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is Required" ForeColor="Red" ValidationGroup="stuValidation"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address Is Required" ForeColor="Red" ValidationGroup="stuValidation"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" ValidationGroup="stuValidation"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
