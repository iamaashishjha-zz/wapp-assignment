<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="teachDashboard.aspx.cs" Inherits="wapp.teachDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Teachers Dashboard
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
            <a class="menu__link is_active" href="courseDashboard.aspx">Course</a>
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
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item"  id="info">
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
                                <asp:Button ID="btnUpdateInfo" runat="server" Text="Update" OnClick="btnUpdateInfo_Click" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <div class="dashboard__item"  id="info">
        <div class="card">
            <div class="card__header" style="color:white;background-color:red;">
                <h1>Students Information</h1>
            </div>
            <%--<div class="card__content">
                <div class="card__item">
                    <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse" width="1020px">
                        <tr>
                            <th Width="50%">Course Name:</th>
                            <th Width="50%" ><%#Eval("Position")%></th>
                        </tr>
                        <tr>
                            <td Width="50%"><%#Eval("Position")%></td>
                            <td Width="50%" ><%#Eval("Position")%></td>
                        </tr>
                     
                        <tr style="width: 150px;display:inline-block; text-align:center">
                           <td colspan="2"  Width="100%" >
                                <asp:Button ID="Button3" runat="server" Text="Update" OnClick="Insert3" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>  
            </asp:Repeater>
                </div>
            </div>
        </div>--%>
    </div>
</asp:Content>
