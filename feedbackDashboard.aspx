<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="feedbackDashboard.aspx.cs" Inherits="wapp.feedbackDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Feedbacks
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <ul class="menu">
        <li class="menu__item">
            <a class="menu__link" href="userDashboard.aspx">User Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="courseDashboard.aspx">Courses Settings</a>
        </li>
        <li class="menu__item">
            <a class="menu__link is-active" href="feedBackDashboard.aspx">Feedbacks</a>
        </li>
        <li class="menu__item">
            <a class="menu__link" href="studentCourse.aspx">Students Information</a>
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="dashboard__item" id="feedbacks">
        <div class="card">
            <div class="card__header"  style="color:white;background-color:orangered;">
                <h1>Feedbacks</h1>
            </div>
            <div class="card__content">
                <div class="card__item">
                    <asp:GridView ID="grdFeedback" runat="server" AutoGenerateColumns="False" CellPadding="6" DataKeyNames="Id" 
                 OnRowDeleting="grdFeedback_RowDeleting" EmptyDataText="No records has been added." Width="1020px">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete"  Width="100%" />  
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Id") %>'></asp:Label>  
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
