<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Master/dashboard.Master" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="wapp.WebPages.Backend.userDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Dashboard | Users
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

    <div class="dashboard__item" id="users">
        <div class="card">
            <div class="card__header" style="color:white;background-color:dimgrey;">
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
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="100%" />  
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit"  Width="100%" />  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"  Width="50%" />  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"  Width="50%" />  
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
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_City" runat="server" Text='<%#Eval("email") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Address" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>
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
                        <asp:DropDownList ID="slctSubRole" CssClass="select-dropdown" runat="server">
                            <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                            <asp:ListItem Text="Student" Value="Student" />
                            <asp:ListItem Text="Teacher" Value="Teacher" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView> 
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse; margin-top: 25px;" width="1020px" s>
                        <tr>
                            <td width="50%">Name:</td>
                            <td width="50%">
                                <asp:TextBox ID="txtName" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Email :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtEmail" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Address :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtAddress" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Password:</td>
                            <td width="50%">
                                <asp:TextBox ID="txtPassword" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Role:</td>
                            <td width="50%">
                                <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown" runat="server" Width="100%">
                                    <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                                    <asp:ListItem Text="Student" Value="Student" />
                                    <asp:ListItem Text="Teacher" Value="Teacher" />
                                </asp:DropDownList>
                        </tr>
                        <tr style="width: 150px; display: inline-block; text-align: center">
                            <td colspan="2" width="100%">
                                <asp:Button ID="btnAddUser" runat="server" Text="Add" OnClick="btnAddUser_Click" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
            <%--<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" Width="1020px">
            <tr>
                <td style="width: 100px">
                    Name:<br />
                    <asp:TextBox ID="txtName" runat="server"  Width="100%" />
                </td>
                <td style="width: 150px">
                    Email:<br />
                    <asp:TextBox ID="txtEmail" runat="server"  Width="100%" />
                </td>
                <td >
                    Address:<br />
                    <asp:TextBox ID="txtAddress" runat="server"  Width="100%" />
                </td>
                <td style="width: 150px">
                    Password:<br />
                    <asp:TextBox ID="txtPassword" runat="server"  Width="100%" />
                </td>
                <td class="auto-style1" style=" width: 150px">
                    Role:<br />
                    <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown" runat="server"  Width="100%">
                            <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                            <asp:ListItem Text="Student" Value="Student" />
                            <asp:ListItem Text="Teacher" Value="Teacher" />
                        </asp:DropDownList>
                </td>
                <td style="width: 150px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" BackColor="#66FF33" ForeColor="White"  Width="100%" />
                </td>
            </tr>
        </table>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
