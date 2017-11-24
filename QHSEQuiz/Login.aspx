<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QHSEQuiz.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="<%= Page.ResolveUrl("~/Content/bootstrap.min.css") %>" />
    <script src="<%= Page.ResolveUrl("~/Scripts/jquery-1.9.1.min.js") %>"></script>
    <script src="<%= Page.ResolveUrl("~/Scripts/bootstrap.min.js") %>"></script>
    <link href="<%= Page.ResolveUrl("~/Style/main.css") %>" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <title>QHSE Bollore Quiz System</title>
    <style>
        .placeholder {
            width: 25%;
            height: 50%;
            margin: inherit;
        }
        .logo {
            width: 100%;
            height: 30%;
             margin: auto;
             text-align: center;
             padding-left: 2em;
        }

        h4 {
            margin-bottom: 0;
            text-align: center;
        }

        .btnLogin {
            width: 100%;
            margin-top: 20px;
        }

        body {
            background-color: #eeeeee; 
            background-image:url('Style/Vilarpac_website_background.jpg');
        }

        img {
            max-width: 100%;
            max-height: 100%;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">
                <div class="logo">
                    <asp:Image ID="imgLogo" AlternateText="Bollore Logo" runat="server" ImageUrl="~/Style/Bollore_Logistics_Logo.png" Width="329px" Height="204px" />    
        </div>
        <div class="container-fluid">
            
                    <h4><b>Log In to QHSE Quiz System</b></h4>
                <br />
            <div class="placeholder">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Redirect.aspx">
                            <InstructionTextStyle CssClass="control-label" />
                            <LayoutTemplate>
                                <div class="form-group">
                                    <asp:Label ID="UserNameLabel" Font-Bold="false" runat="server" CssClass="pull-left" AssociatedControlID="UserName">Username:</asp:Label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator Visible="false" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Username is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="PasswordLabel" Font-Bold="false" CssClass="pull-left" runat="server" AssociatedControlID="Password">Password:</asp:Label>

                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator Visible="false" ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" />
                                    </label>
                                </div>
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" CssClass="btn btn-success btnLogin" ValidationGroup="Login1" />
                                </div>
                                <div class="col-md-6 col-md-offset-3">
                                    <asp:HyperLink ID="hlForgotPassword" runat="server" Text="Forgot Password - 忘记密码" NavigateUrl="~/ForgotPassword.aspx"/>
                                </div>
                                <div class="col-md-12">
                                    <span style="color: red"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                                </div>
                            </LayoutTemplate>
                            <LoginButtonStyle CssClass="btn" />
                            <TextBoxStyle CssClass="form-control" />
                            <TitleTextStyle CssClass="control-label" />
                        </asp:Login>
                    </div>
                </div>
                <div class="row">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Login1" ForeColor="Red" />
                </div>
            </div>
        </div>

    </form>
</body>
</html>
