<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Master/index.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="wapp.WebPages.Frontend.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="nav" runat="server">
    <li><a href="login-auth.aspx">Login</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <style>
input[type=text]:hover {
  border: 1px solid rgb(22, 7, 105);
  margin-top: 6px;
box-shadow: 0px 0px 5px rgb(22, 7, 105);
}



/* Style inputs */
.input, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

.btnSend {
  background-color: darkblue;
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
}

.btnSend:hover {
  background-color: #45a049;
}

/* Style the container/contact section */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 10px;
}

/* Create two columns that float next to eachother */
.column {
  float: left;
  width: 50%;
  margin-top: 6px;
  padding: 20px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


@media screen and (max-width: 600px) {
  .column, .btnSend {
    width: 100%;
    margin-top: 0;
  }
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
<div class="container">
  <div style="text-align:center">
    <h2>Feel Free to Contact Us</h2>
    
  </div>
  <div class="row">
    <div class="column">
      
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14129.445442684992!2d85.32450396977535!3d27.70612700000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19a00bd8d7c1%3A0xe01225b704668023!2sLord%20Buddha%20Education%20Foundation-%20LBEF%20CAMPUS%20(College%20For%20Professional%20Studies)!5e0!3m2!1sen!2snp!4v1646412241838!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

    </div>
    <div class="column">
        <label>First Name</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
        <label>Subject</label>
        <asp:TextBox ID="txtSubject" runat="server" CssClass="input"></asp:TextBox>
        <label>Message</label>
        <asp:TextBox ID="txtMessage" runat="server" CssClass="input" Height="170px"></asp:TextBox>
        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btnSend" OnClick="btnSend_Click" />
    </div>
  </div>
</div>
</asp:Content>
