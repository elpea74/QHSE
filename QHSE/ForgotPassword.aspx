<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="QHSE.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/bootstrap.min.css") %>" />
    <script src="<%= Page.ResolveUrl("~/Scripts/jquery-1.9.1.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/Scripts/bootstrap.min.js") %>"></script>
    <link href="<%= Page.ResolveUrl("~/Style/main.css") %>" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
    <title>Login to QHSE Reporting System</title>
    <style>
        .placeholder {
            width: 25%;
            height: 50%;
            margin: auto;
        }

        .logo {
            width: 25%;
            height: 100%;
            margin: auto;
            text-align: center;
        }

        h3 {
            margin-bottom: 0;
        }

        table {
            width: 100%;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        .btnLogin {
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>

<body style="background-color: #eeeeee">

    <form id="form1" runat="server" class="form-horizontal">
        <div class="container-fluid">
            <div class="logo">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Style/Bollore_Logistics_Logo.png" Width="329px" Height="204px" />

            </div>
        </div>
        <div class="container-fluid">
            <div class="placeholder">
                <div class="row">

                    <h3><b>Forgot Password? - 忘记密码</b></h3>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <asp:Label ID="lblName" runat="server" CssClass="pull-left" AssociatedControlID="tbxName">Your Name - 你的名字:</asp:Label>
                            <asp:TextBox ID="tbxName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Visible="false" ID="NameRequired" runat="server" ControlToValidate="tbxName" ErrorMessage="Name is required." ToolTip="Name is required." >*</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDept" CssClass="pull-left" runat="server" AssociatedControlID="ddlDept">Hub - 枢纽:</asp:Label>

                            <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator Visible="false" ID="DeptRequired" runat="server" ControlToValidate="ddlDept" InitialValue="0" ForeColor="Red" ErrorMessage="Department is required." ToolTip="Department is required.">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 col-md-offset-3">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success btnLogin" ValidationGroup="Login1" OnClick="btnSubmit_Click" />
                        </div>
                        <div class="col-md-12">
                            <span style="color: red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </div>
            </div>
        </div>

    </form>
</body>
</html>
