<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Master/dashboard.Master" AutoEventWireup="true" CodeBehind="courseDashboard.aspx.cs" Inherits="wapp.WebPages.Backend.courseDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Courses
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
            <a class="menu__link is_active" href="courseDashboard.aspx">Course</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="noteDashboard.aspx">Notes</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="studentCourse.aspx">Notes</a>
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
    <div class="dashboard__item" id="courses">
        <div class="card">
            <div class="card__header" style="color:white;background-color:blue;">
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
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="imgCourse" runat="server" ImageUrl='<%# Eval("Image") %>'/>
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
                                <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">End Date :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtEndDate" TextMode="Date" runat="server" Width="100%" /></td>
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
                        <tr>
                            <td width="50%">Category:</td>
                            <td width="50%">
                                <asp:FileUpload id="imgCourse" runat="server" />
                                <%--<asp:RegularExpressionValidator   
id="FileUpLoadValidator" runat="server"   
ErrorMessage="Upload Jpegs and Gifs only."   
ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG|.gif|.GIF)$"   
ControlToValidate="imgCourse">  
</asp:RegularExpressionValidator> --%>
                        </tr>
                        <tr style="width: 150px; display: inline-block; text-align: center">
                            <td colspan="2" width="100%">
                                <asp:Button ID="btnAddCourse" runat="server" Text="Create" OnClick="btnAddCourse_Click" BackColor="#66FF33" ForeColor="White" Width="250px" />
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
</asp:Content>
