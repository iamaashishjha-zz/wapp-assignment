<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="wapp.adminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
                <li class="menu__item">
                    <a class="menu__link is-active" href="#">Admin Dashboard</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#users">User Settings</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#courses">Courses Settings</a>
                </li>
        <li class="menu__item">
                    <a class="menu__link" href="#feedbacks">Feedbacks</a>
                </li>
            </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .select-dropdown {}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="users">
        <div class="card">
            <div class="card__header" style="color:white;background-color:dimgrey;">
                <h1>Users</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id" 
                 OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." Width="1020px">  
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
                                <asp:Button ID="Button2" runat="server" Text="Add" OnClick="Insert2" BackColor="#66FF33" ForeColor="White" Width="250px" />
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

    <div class="dashboard__item" id="courses">
        <div class="card">
            <div class="card__header" style="color:white;background-color:blue;">
                <h1>Courses</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView2_RowCancelingEdit"
                            OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" DataKeyNames="Id" 
                 OnRowDeleting="OnRowDeleting2" EmptyDataText="No records has been added." Width="1020px">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="100%" />  
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit"   Width="100%" />  
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
                <asp:TemplateField HeaderText="Description">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_description" runat="server" Text='<%#Eval("description") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txtDescription" runat="server" Text='<%#Eval("description") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Start Date">
                    <ItemTemplate>
                        <asp:Label ID="lbl_start_date" runat="server" Text='<%#Eval("start_date") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStartDate" runat="server" Text='<%#Eval("start_date") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date">
                    <ItemTemplate>
                        <asp:Label ID="lbl_end_date" runat="server" Text='<%#Eval("end_date") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEndDate" runat="server" Text='<%#Eval("end_date") %>'></asp:TextBox>
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
                                <asp:TextBox ID="txtCName" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Description :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtDescription" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Start Date :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtStartDate" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">End Date :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtEndDate" runat="server" Width="100%" /></td>
                        </tr>
                        <tr style="width: 150px; display: inline-block; text-align: center">
                            <td colspan="2" width="100%">
                                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Insert2" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
           <%-- <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse"  Width="1020px">
            <tr>
                <td style="width: 50px">
                    Name:<br />
                    <asp:TextBox ID="txtCName" runat="server" Width="100%" />
                </td>
                <td>
                    Description:<br />
                    <asp:TextBox ID="txtDescription" runat="server" Width="100%" />
                </td>
                <td style="width: 100px">
                    Start Date:<br />
                    <asp:TextBox ID="txtStartDate" runat="server" Width="100%" />
                </td>
                <td style="width: 100px">
                    End Date:<br />
                    <asp:TextBox ID="txtEndDate" runat="server" Width="100px" />
                </td>
                <td style="width: 150px">
                    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Insert" BackColor="#66FF33" ForeColor="White" Width="150px" />
                </td>
            </tr>
        </table>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="dashboard__item" id="feedbacks">
        <div class="card">
            <div class="card__header"  style="color:white;background-color:orangered;">
                <h1>Feedbacks</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="6" DataKeyNames="Id" 
                 OnRowDeleting="OnRowDeleting3" EmptyDataText="No records has been added." Width="1020px">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="100%" />  
                    </ItemTemplate>
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
                    
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_description" runat="server" Text='<%#Eval("email") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Subject">
                    <ItemTemplate>
                        <asp:Label ID="lbl_start_date" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                    </ItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message">
                    <ItemTemplate>
                        <asp:Label ID="lbl_end_date" runat="server" Text='<%#Eval("message") %>'></asp:Label>
                    </ItemTemplate>
                    
                </asp:TemplateField>
                
            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView> 
          
                </div>
            </div>
        </div>
    </div>
</asp:Content>
