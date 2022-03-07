<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Master/dashboard.Master" AutoEventWireup="true" CodeBehind="teachStudent.aspx.cs" Inherits="wapp.WebPages.Backend.teachStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item"  id="info">
        <div class="card">
            <div class="card__header" style="color:white;background-color:red;">
                <h1>My Courses</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse" width="1020px">
                        <tr>
                            <th Width="50%"   style="background-color:#FF0000; color:white">Course Name</th>
                            <th Width="50%"  style="background-color:#FF0000; color:white">User Name</th>
                        </tr>
                    </table>
                    <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse" width="1020px">
                        <tr>
                            <td Width="50%"><%#Eval("courseName")%></td>
                            <td Width="50%" ><%#Eval("userCount")%></td>
                        </tr>
                    </table>
                </ItemTemplate>  
            </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
