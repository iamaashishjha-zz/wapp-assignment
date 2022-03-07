<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="stuCourses.aspx.cs" Inherits="wapp.stuCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .card__content>.card__item>.studentCourseTable td:nth-child(2){
            color:black;
            font-size:large;
            font-weight:bold;
            text-align:center;
            width:30%;
        }
        .card__content>.card__item>.studentCourseTable td:nth-child(3){
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
    <div class="dashboard__item" id="students">
        <div class="card">
            <div class="card__header" style="color: white; background-color: red;">
                <h1>Students Information</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table class="table studentCourseTable">
                        <thead class="thead-dark text-center">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Action</th>
                                <th scope="col">Course</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <asp:Label ID="lblCourseId" runat="server" Visible="false" Text='<%# Eval("courseId") %>'></asp:Label>
                                        <th scope="row"><%#Eval("courseId")%></th>
                                        <td>
                                            <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClientClick="return confirm('Do you want to delete this Customer?');"
                    OnClick="DeleteCourse_Click" />
                                            <%--<asp:LinkButton ID="btnRemoveCourse" runat="server" Text="Remove Course" CssClass="btn btn-danger btn-block" OnClientClick='javascript:return confirm("Are you sure you want to remove?")'
                                                 CommandName="remove" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "courseId") %>'>Remove</asp:LinkButton>--%>
                                            <%--<asp:Button ID="btnRemoveCourse" runat="server" Text="Remove Course" CssClass="btn btn-danger btn-block" OnClick="btnRemoveCourse_Click" />--%></td>
                                        <td><%#Eval("coursename")%></td>
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
