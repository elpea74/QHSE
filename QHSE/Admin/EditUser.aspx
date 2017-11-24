<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" MasterPageFile="~/Admin/Admin.Master" Inherits="QHSE.Admin.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New incident report</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="col-sm-8 col-md-offset-2 text-center">
                    <h3>Edit User</h3>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2">
                            <p>Username</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxUserName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" ErrorMessage="Username is Required" ForeColor="Red">*</asp:RequiredFieldValidator><br />
                        </div>
                        <div class="col-sm-2">
                            <p>HRMS</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxHRMS" runat="server" CssClass="form-control" TextMode="Number" MaxLength="6"></asp:TextBox><br />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxHRMS" ErrorMessage="HRMS is Required" ForeColor="Red">*</asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="col-sm-2">
                            <p>Name</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxName" runat="server" CssClass="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxName" ErrorMessage="Name is Required" ForeColor="Red">*</asp:RequiredFieldValidator><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Designation (optional)</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxTitle" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Email (optional)</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Role</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>User</asp:ListItem>
                            </asp:DropDownList><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Department</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlDept" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [Name] FROM [Department]"></asp:SqlDataSource>
                            <br />
                        </div>
                        <div class="col-sm-2">
                            <p>New Password</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxChangePassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                        </div>
                        <div class="col-sm-12" style="text-align: center">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-success pull-center" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                        </div>
                    </div>
                </div>

                <div class="col-sm-5"></div>

            </div>
        </div>
    </div>
</asp:Content>
