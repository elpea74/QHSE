<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="QHSEQuiz.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>Access Denied!
        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:history.go(-1);">Click here to go back</asp:HyperLink>--%>
        <asp:HyperLink ID="hlBackAdmin" runat="server" NavigateUrl="~/Admin/QuizResultList.aspx" Visible="false">Click here to go back</asp:HyperLink>
        <asp:HyperLink ID="hlBackUser" runat="server" NavigateUrl="~/Hub/QuizList.aspx" Visible="false">Click here to go back</asp:HyperLink>
        <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="~/Logout.aspx" Visible="false">Click here to log in again</asp:HyperLink>
    </h3>
            </div>
    </form>
</body>
</html>
