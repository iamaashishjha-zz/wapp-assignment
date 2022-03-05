<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="studentCourse.aspx.cs" Inherits="wapp.studentCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
        
        <li class="menu__item">
            <a class="menu__link" href="userDashboard.aspx">User Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="courseDashboard.aspx">Courses Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="feedBackDashboard.aspx">Feedbacks</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is-active" href="studentCourse.aspx">Students Information</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item"  id="students">
        <div class="card">
            <div class="card__header" style="color:white;background-color:red;">
                <h1>Students Information</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse" width="1020px">
                        <tr>
                            <th Width="50%"  style="background-color:#FF0000; color:white">User Name</th>
                            <th Width="50%"   style="background-color:#FF0000; color:white">Course Name</th>
                        </tr>
                    </table>
                    <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse; text-align:center" width="1020px">
                        
                        <tr>
                            <td Width="50%"><%#Eval("username")%></td>
                            <td Width="50%" ><%#Eval("coursename")%></td>
                        </tr>
                    </table>
                </ItemTemplate>  
            </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
