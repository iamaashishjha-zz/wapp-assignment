<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="teachStudent.aspx.cs" Inherits="wapp.teachStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .card__content>.card__item>.teacherCourseTable td:nth-child(1){
            color:black;
            font-size:large;
            font-weight:bold;
            text-align:center;
            width:30%;
        }
        .card__content>.card__item>.teacherCourseTable td:nth-child(2){
            color:black;
            font-size:large;
            font-weight:bold;
            text-align:center;
            width:60%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="info">
        <div class="card">
            <div class="card__header" style="color: white; background-color: red;">
                <h1>My Courses</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table class="table teacherCourseTable" >
                        <thead class="thead-dark text-center">
                            <tr>
                                <th scope="col">Course Name</th>
                                <th scope="col">User Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("courseName")%></td>
                                        <td><%#Eval("userCount")%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
