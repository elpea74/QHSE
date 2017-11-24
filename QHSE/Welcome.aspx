<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="QHSE.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:HyperLink ID="AdminLink" runat="server" Text="Administrators, click here." NavigateUrl="Admin/Register.aspx" Visible="False" />
    <asp:HyperLink ID="Logout" runat="server" Text="Logout" NavigateUrl="Logout.aspx" />
    <form id="form1" runat="server">
    <div>
    
        <asp:FileUpload ID="FileUpload1" runat="server" />
    
    </div>
        <p>
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />

    
        </p>
        <br />
        <asp:Label ID="lblStatus" runat="server" ></asp:Label>
        <br />
        <asp:Panel ID="Panel1" Width="440" Height="440" runat="server"></asp:Panel>
    </form>
</body>
</html>
