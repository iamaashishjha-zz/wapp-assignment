<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userLists.aspx.cs" Inherits="wapp.userLists" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server">
                <LayoutTemplate>
                <table class="lamp" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <th>
                            S.No.
                        </th>
                        <th>
                            Name
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            Department
                        </th>
                        <th colspan="2">
                            Edit
                        </th>
                    </tr>
                    <tr id="itemplaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
