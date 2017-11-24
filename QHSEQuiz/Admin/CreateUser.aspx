<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="CreateUser.aspx.cs" Inherits="QHSEQuiz.Admin.CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Create New User</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="col-sm-8 col-md-offset-2 text-center">
                    <h3>Create New User</h3>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <asp:CreateUserWizard ID="CreateUserWizard1" CssClass="col-lg-offset-4" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" RequireEmail="False">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="Step1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="tbxEmail">Email (required for admins):</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Email address is required." ToolTip="Email address is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Name: </b>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxName" runat="server">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Role:</b>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlRole" runat="server">
                                                    <asp:ListItem>Hub</asp:ListItem>
                                                    <asp:ListItem>Admin</asp:ListItem>
                                                    <%--<asp:ListItem>Sub-Admin</asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color: Red;">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>

                                    </table>
                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td align="center" colspan="2">Complete</td>
                                        </tr>
                                        <tr>
                                            <td>Your account has been successfully created.</td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="ContinueButton" CssClass="btn" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </div>

                <div class="col-sm-5"></div>

            </div>
        </div>
    </div>
   
</asp:Content>