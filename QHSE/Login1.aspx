<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="QHSE.Login1" %>

<!DOCTYPE html>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<html runat="server">
<head>
    <title>Login</title>
</head>
<body>
    <form runat="server">
        Username:
        <input id="Username" runat="server"
            type="text" /><br />
        Password:
        <input id="Password" runat="server" type="password" /><br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click"
            Text="Login" />
        <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"
            Visible="false" />
    </form>
</body>
</html>
