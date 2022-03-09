<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="courseDashboard.aspx.cs" Inherits="wapp.courseDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .card__content > .card__item > .allCoursesTable td:first-child {
            color: black;
            font-size: large;
            font-weight: bold;
            text-align: right;
            width: 20%;
        }

        .card__content > .card__item > .allCoursesTable td:nth-child(2) {
            text-align: left;
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="courses">
        <div class="card">
            <div class="card__header text-light bg-info">
                <h1 >Create Course</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <table class="table allCoursesTable">
                        <tbody>
                            <tr>
                                <td>Name :</td>
                                <td>
                                    <asp:TextBox ID="txtCName" runat="server" Width="100%"  CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>Description :</td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" Width="100%" Height="100px"  CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>Category :</td>
                                <td>
                                    <asp:DropDownList ID="slctSubRole1" CssClass="select-dropdown dropdown form-control" runat="server" Width="100%">
                                        <asp:ListItem Text="Software Development" CssClass="dropdown-item form-control" Value="Software Development" />
                                        <asp:ListItem Text="UI / UX Designing" CssClass="dropdown-item form-control" Value="UI / UX Designing" />
                                        <asp:ListItem Text="Cyber Security" CssClass="dropdown-item form-control" Value="Cyber Security" />
                                        <asp:ListItem Text="Data Science" CssClass="dropdown-item form-control" Value="Data Science" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Image :</td>
                                <td>
                                   <asp:FileUpload ID="imgCourse" runat="server" CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>Start Date :</td>
                                <td>
                                    <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server"  CssClass="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>Start Date :</td>
                                <td>
                                    <asp:TextBox ID="txtEndDate" TextMode="Date" runat="server"  CssClass="form-control" />

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" OnClick="btnAddCourse_Click" CssClass="form-control btn btn-lg btn-success btn-block" ValidationGroup="courseCreate" />
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <asp:Panel ID="Panel1" runat="server">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Course Name is Required" ControlToValidate="txtCName" ForeColor="Red" ValidationGroup="courseCreate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required" ForeColor="Red" ValidationGroup="courseCreate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="imgCourse" ErrorMessage="Image is required" ForeColor="Red" ValidationGroup="courseCreate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Start Date is required" ForeColor="Red" ValidationGroup="courseCreate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEndDate" ErrorMessage="End Date is required" ForeColor="Red" ValidationGroup="courseCreate"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUDescription" ErrorMessage="Description is required for update" ForeColor="Red" ValidationGroup="courseUpdate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUStartDate" ErrorMessage="Start Date is Required" ForeColor="Red" ValidationGroup="courseUpdate"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUEndDate" ErrorMessage="End Date is Required" ForeColor="Red" ValidationGroup="courseUpdate"></asp:RequiredFieldValidator>
                        <br />--%>

                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard__item">
        <div class="card">
            <div class="card__header text-light bg-info">
                <h1>Courses</h1>
            </div>
            <div class="card__content">
                <div class="mt-2 d-flex justify-content-around">
                        <asp:Button ID="Button1" runat="server" Text="Sort Courses by Created at Date" OnClick="btnSortCourses_Click" CssClass="form-control btn btn-col-lg-6 btn-info btn-block mr-2" />
                        <asp:Button ID="Button2" runat="server" Text="Sort Courses by Start Date" OnClick="btnSortStartDate_Click" CssClass="form-control btn btn-col-lg-6 btn-secondary btn-block ml-2" />
                </div>
                <div class="card__item">
                    <asp:GridView ID="grdCourses" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="grdCourses_RowCancelingEdit"
                        OnRowEditing="grdCourses_RowEditing" OnRowUpdating="grdCourses_RowUpdating" DataKeyNames="Id"
                        OnRowDeleting="grdCourses_RowDeleting" EmptyDataText="No records has been added." Width="1020px">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_delete"  CssClass="btn btn-sm btn-block btn-danger form-control"  runat="server" Text="Delete" CommandName="Delete" Width="100%" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btn_Edit" runat="server" Text="Edit" CssClass="btn btn-sm btn-block btn-info form-control"  CommandName="Edit" Width="100%" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btn_Update" CssClass="form-control btn btn-sm btn-block btn-primary form-control" runat="server" Text="Update" CommandName="Update"/>
                                    <asp:Button ID="btn_Cancel" runat="server"  CssClass="form-control btn btn-sm btn-block btn-danger form-control mt-2"  Text="Cancel" CommandName="Cancel"/>
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
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_description" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUDescription" runat="server" CssClass="form-control" Text='<%#Eval("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_start_date" runat="server"  Text='<%#Eval("start_date") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUStartDate" TextMode="Date" CssClass="form-control"  runat="server" Text='<%#Eval("start_date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_end_date" runat="server" Text='<%#Eval("end_date") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUEndDate" TextMode="Date" CssClass="form-control"  runat="server" Text='<%#Eval("end_date") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgUCourse" runat="server" ImageUrl='<%# Eval("image") %>' Height="100px" Width="100px" style="border-radius:50%;"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_category" runat="server"  Text='<%#Eval("category") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created At">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_created_at" runat="server" Text='<%#Eval("created_at") %>'></asp:Label>
                                </ItemTemplate>
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
