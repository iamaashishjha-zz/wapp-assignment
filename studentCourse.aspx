<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="studentCourse.aspx.cs" Inherits="wapp.studentCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="students">
        <div class="card">
            <div class="card__header" style="color: white; background-color: red;">
                <h1>All Courses and enrolled Students</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr CssClass="text-center">
                                <th scope="col">#</th>
                                <th scope="col">User Name</th>
                                <th scope="col">Course Name</th>
                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr CssClass="text-center">
                                        <th scope="row"><%#Eval("id")%></th>
                                        <td><%#Eval("username")%></td>
                                        <td><%#Eval("coursename")%></td>
                                        <td><%#Eval("start_date")%></td>
                                        <td><%#Eval("end_date")%></td>
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
