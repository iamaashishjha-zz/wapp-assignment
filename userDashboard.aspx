<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="wapp.userDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Dashboard | Users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .card__content > .card__item > .adminUserTable td:first-child {
            color: black;
            font-size: large;
            font-weight: bold;
            text-align: right;
            width: 20%;
        }

        .card__content > .card__item > .adminUserTable td:nth-child(2) {
            text-align: left;
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="users">
        <div class="card">
            <div class="card__header" style="color: white; background-color: dimgrey;">
                <h1>Users</h1>
            </div>
            <div class="card__content">

                <div class="card__item">
                    <table class="table adminUserTable">
                        <tbody>
                            <tr>
                                <td>Name :</td>
                                <td>
                                    <asp:TextBox ID="txtName" CssClass=" form-control" runat="server" Width="100%" />
                                </td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" CssClass=" form-control" runat="server" Width="100%" /></td>
                            </tr>
                            <tr>
                                <td>Address :</td>
                                <td>
                                    <asp:TextBox ID="txtAddress" CssClass=" form-control" runat="server" Width="100%" /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <asp:TextBox ID="txtPassword" CssClass=" form-control" runat="server" Width="100%" />
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td>
                                    <asp:TextBox ID="txtCPassword" CssClass=" form-control" runat="server" Width="100%" />
                                </td>
                            </tr>
                            <tr>
                                <td>Role :</td>
                                <td>
                                    <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown dropdown form-control" runat="server" Width="100%">
                                        <asp:ListItem Value="0" CssClass="dropdown-item" Selected>Select One</asp:ListItem>
                                        <asp:ListItem Text="Student" CssClass="dropdown-item" Value="Student" />
                                        <asp:ListItem Text="Teacher" CssClass="dropdown-item" Value="Teacher" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="btnAddUser" runat="server" Text="Add" OnClick="btnAddUser_Click" CssClass="form-control btn btn-lg btn-success btn-block" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard__item">
        <div class="card">
            <div class="card__header" style="color: white; background-color: dimgrey;">
                <h1>Users</h1>
            </div>
            <div class="card__content">

                <div class="card__item">
                    <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="grdUsers_RowCancelingEdit"
                        OnRowEditing="grdUsers_RowEditing" OnRowUpdating="grdUsers_RowUpdating" DataKeyNames="Id"
                        OnRowDeleting="grdUsers_RowDeleting" EmptyDataText="No records has been added." Width="1020px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" Width="100%" CssClass="form-control btn btn-sm btn-danger btn-block"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" Width="100%" CssClass="form-control btn btn-sm btn-info btn-block"/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" CssClass="form-control btn btn-sm btn-primary btn-block"/>
                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="form-control btn btn-sm btn-danger btn-block" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_City" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Address" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" CssClass="form-control"  runat="server" Text='<%#Eval("address") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Role" runat="server" Text='<%#Eval("role") %>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Role">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Sub_Role" runat="server" Text='<%#Eval("sub_role") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="slctSubRole" CssClass="select-dropdown form-control dropdown" runat="server">
                                        <asp:ListItem Value="0" CssClass="dropdown-item"  disabled>Select One</asp:ListItem>
                                        <asp:ListItem Text="Student" CssClass="dropdown-item" Value="Student" />
                                        <asp:ListItem Text="Teacher" CssClass="dropdown-item" Value="Teacher" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <HeaderStyle BackColor="#663300" ForeColor="#ffffff" />
                        <RowStyle BackColor="#e7ceb6" />
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
