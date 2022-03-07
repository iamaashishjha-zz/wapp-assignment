<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="noteDashboard.aspx.cs" Inherits="wapp.noteDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="courses">
        <div class="card">
            <div class="card__header" style="color:white;background-color:blue;">
                <h1>Courses</h1>
            </div>
            <div class="card__content">
                 
                <div class="card__item">
                    <asp:GridView ID="grdNotes" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="grdNotes_RowCancelingEdit"
                            OnRowEditing="grdNotes_RowEditing" OnRowUpdating="grdNotes_RowUpdating" DataKeyNames="Id" 
                 OnRowDeleting="grdNotes_RowDeleting" EmptyDataText="No records has been added." Width="1020px">  
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
                
                 <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_course" runat="server" Text='<%#Eval("course") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                     <asp:DropDownList ID="slctCourse1" CssClass="select-dropdown" runat="server" Width="100%">
                                    
                                </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_category" runat="server" Text='<%#Eval("category") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                <asp:TemplateField HeaderText="File Upload">
                    <ItemTemplate>
                        <asp:Label ID="lbl_file_upload" runat="server" Text='<%#Eval("file_upload") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:FileUpload ID="fileUpload1" runat="server" />

                    </EditItemTemplate>
                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created At">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_created_at" runat="server" Text='<%#Eval("created_at") %>'></asp:Label>
                                </ItemTemplate>
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
                            <td width="50%">Description :</td>
                            <td width="50%">
                                <asp:TextBox ID="txtDescription" runat="server" Width="100%" /></td>
                        </tr>
                        <tr>
                            <td width="50%">Course:</td>
                            <td width="50%">
                                <asp:DropDownList ID="slctCourse" CssClass="select-dropdown" runat="server" Width="100%">
                                    
                                </asp:DropDownList>
                        </tr>
                        <tr>
                            <td width="50%">File:</td>
                            <td width="50%">
                                <asp:FileUpload id="flUpload" runat="server" />
                                <%--<asp:RegularExpressionValidator   
id="FileUpLoadValidator" runat="server"   
ErrorMessage="Upload Jpegs and Gifs only."   
ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG|.gif|.GIF)$"   
ControlToValidate="imgCourse">  
</asp:RegularExpressionValidator> --%>
                        </tr>
                        <tr style="width: 150px; display: inline-block; text-align: center">
                            <td colspan="2" width="100%">
                                <asp:Button ID="btnAddNotes" runat="server" Text="Create" OnClick="btnAddNotes_Click" BackColor="#66FF33" ForeColor="White" Width="250px" />
                            </td>
                        </tr>
                    </table>
           
                </div>
            </div>
        </div>
    </div>
</asp:Content>
