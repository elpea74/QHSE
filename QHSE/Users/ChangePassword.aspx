<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="ChangePassword.aspx.cs" Inherits="QHSE.Users.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Change Your Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .placeholder {
            width: 50%;
            height: 50%;
            margin: auto;
        }
        .logo {
            width: 25%;
            height: 100%;
             margin: auto;
        }

       
    </style>

    <div class="container-fluid">
        
            <div class="row">
                <div class="text-center">
                    <h3>Change Your Password </h3>
                    <h3>更改您的密码</h3>
                    <br />
                </div>
            </div>
        <div class="placeholder">
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-4 col-md-offset-3">
                            Current Password 当前密码: 
                        </div>
                        <div class="col-sm-5">
                            <asp:TextBox ID="tbxCurrentPw" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="PasswordValidate" ErrorMessage="Current password is incorrect." ForeColor="Red" ControlToValidate="tbxCurrentPw">*</asp:CustomValidator>
                            

                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="col-sm-4 col-md-offset-3">
                            New Password 新密码:
                        </div>
                        <div class="col-sm-5">
                            <asp:TextBox ID="tbxNewPw" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox><br />
                       
                        </div>
                        <br />
                        <br />
                        <br />

                        <div class="col-sm-4 col-md-offset-3">
                           Confirm New Password 确认新密码:
                        </div>
                        <div class="col-sm-5 text-center">
                            <asp:TextBox ID="tbxCfmNewPw" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="tbxCfmNewPw" ControlToCompare="tbxNewPw" runat="server" ForeColor="Red" ErrorMessage="New password and confirm new password must match.">*</asp:CompareValidator><br />
                        </div>
                        <br />
                        <div class="col-sm-12" style="text-align: center">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success pull-center" runat="server" OnClick="btnSubmit_Click" Text="Change Password" />
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-center" ForeColor="Red" />
                        </div>
                         
                    </div>
                   
                </div>

                <div class="col-sm-5"></div>
            </div>
        </div>
    </div>
</asp:Content>