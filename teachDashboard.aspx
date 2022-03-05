<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="teachDashboard.aspx.cs" Inherits="wapp.teachDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Teachers Dashboard
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
        <li class="menu__item">
            <a class="menu__link is-active" href="#">Admin Dashboard</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="courseDashboard.aspx">Courses Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="#info">Update Information</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item"  id="courses">
        <div class="card">
            <div class="card__header" style="color:white;background-color:dimgrey;">
                <h1>Courses</h1>
            </div>
            <div class="card__content">
                <br />
                <asp:Button ID="btnSortCourses" runat="server" Text="Sort Courses by Date (in Descending order)" OnClick="btnSortCourses_Click" />

                <asp:Button ID="btnSortStartDate" runat="server" Text="Sort Courses by Start Date (in Descending order)" OnClick="btnSortStartDate_Click" />
                <br />
                <div class="card__item">
                    <asp:GridView ID="grdCourses" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="grdCourses_RowCancelingEdit"
                        OnRowEditing="grdCourses_RowEditing" OnRowUpdating="grdCourses_RowUpdating" DataKeyNames="Id"
                        OnRowDeleting="grdCourses_RowDeleting" EmptyDataText="No records has been added." Width="1020px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" Width="100%" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" Width="100%" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" Width="50%" />
                                    <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" Width="50%" />
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
                                    <asp:TextBox ID="txtCName" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
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
                                    <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server" Text='<%#Eval("start_date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_end_date" runat="server" Text='<%#Eval("end_date") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEndDate" TextMode="Date" runat="server" Text='<%#Eval("end_date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created By">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_user" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_category" runat="server" Text='<%#Eval("category") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown" runat="server" Width="100%">
                                    <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                                    <asp:ListItem Text="Network" Value="Network" />
                                    <asp:ListItem Text="Programming" Value="Programming" />
                                    <asp:ListItem Text="Designing" Value="Programming" />
                                    <asp:ListItem Text="Arts and Humanities" Value="Arts" />
                                </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created At">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_created_at" runat="server" Text='<%#Eval("created_at") %>'></asp:Label>
                                </ItemTemplate>
                                <%--<EditItemTemplate>
                                    <asp:TextBox ID="txtcategory" runat="server" Text='<%#Eval("end_date") %>'></asp:TextBox>
                                </EditItemTemplate>--%>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#663300" ForeColor="#ffffff" />
                        <RowStyle BackColor="#e7ceb6" />
                    </asp:GridView>
                    
                    <table border="0" cellpadding="2" cellspacing="3" style="border-collapse: collapse; margin-top:25px;" width="1020px" s>
                        <tr>
                            <td Width="50%" >Name:</td>
                            <td Width="50%" ><asp:TextBox ID="txtCName" runat="server"  Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Description :</td>
                            <td Width="50%" ><asp:TextBox ID="txtDescription" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >Start Date :</td>
                            <td Width="50%" ><asp:TextBox ID="txtStartDate" TextMode="Date" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td Width="50%" >End Date :</td>
                            <td Width="50%" ><asp:TextBox ID="txtEndDate" TextMode="Date" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Category:</td>
                            <td width="50%">
                                <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown" runat="server" Width="100%">
                                    <asp:ListItem Value="0" disabled>Select One</asp:ListItem>
                                    <asp:ListItem Text="Network" Value="Network" />
                                    <asp:ListItem Text="Programming" Value="Programming" />
                                    <asp:ListItem Text="Designing" Value="Programming" />
                                    <asp:ListItem Text="Arts and Humanities" Value="Arts" />
                                </asp:DropDownList>
                        </tr>
                        <tr style="width: 150px;display:inline-block; text-align:center">
                           <td colspan="2"  Width="100%" >
                                <asp:Button ID="btnAddCourse" runat="server" Text="Create" OnClick="btnAddCourse_Click" BackColor="#66FF33" ForeColor="White" Width="250px" />
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
