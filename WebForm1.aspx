<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="wapp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>  
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                    <table class="table table-bordered">  
                        <tr>  
                            <%--<td style="width: 20%;">  
                                <img alt="" width="150" class="img-thumbnail" src='<%#Eval("Profile_Picture")%>' />  
                            </td> --%> 
                            <td>  
                                <table class="table">  
                                    <tr>  
                                        <td style="width:50%;">Employee Name:</td>  
                                        <td><%#Eval("name")%></td>  
                                    </tr>  
                                    <tr>  
                                        <td>Position:</td>  
                                        <td><%#Eval("description")%></td>  
                                    </tr>  
                                    <tr>  
                                        <td>Office:</td>  
                                        <td><%#Eval("start_date")%></td>  
                                    </tr>  
                                    <tr>  
                                        <td>Salary:</td>  
                                        <td><%#Eval("end_date")%></td>  
                                    </tr>  
                                </table>  
                            </td>  
                        </tr>  
                    </table>  
                </ItemTemplate>  
            </asp:Repeater>  
        </div>
    </form>
</body>
</html>
