<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="CreateNewDept.aspx.cs" Inherits="QHSE.Admin.NewDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New Department</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .placeholder {
            width: 35%;
            height: 100%;
            margin: auto;
        }
    </style>
    <div class="text-center">
    <h3>Create a New Department</h3>
        <br />
        <br />
    <div class="placeholder">
        <div class="row">
            <div class="col-lg-12">
            <div class ="col-lg-offset-1 col-lg-5">
            <asp:Label ID="lblDeptName" runat="server" Text="Department Name"></asp:Label>
                </div>
            <div class="col-lg-5">
            <asp:TextBox ID="tbxDeptName" CssClass="form-control" runat="server"></asp:TextBox>
                
                </div>
            <div class="col-lg-1 text-left">
                <asp:RequiredFieldValidator ID="deptNameValidator" ControlToValidate="tbxDeptName" runat="server" ErrorMessage="Department name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            <br />
            <br />
            <div class="col-lg-12">
            <div class ="col-lg-offset-1 col-lg-5">
            <asp:Label ID="lblAdmin" runat="server" Text="Password Reset POC"></asp:Label>
                </div>
            <div class="col-lg-5">
            <asp:DropDownList ID="ddlAdmin" CssClass="form-control" runat="server"></asp:DropDownList>
                
                </div>
            <div class="col-lg-1 text-left">
                <asp:RequiredFieldValidator ID="deptAdminValidator" runat="server" ControlToValidate="ddlAdmin" ErrorMessage="Department Admin is required." ForeColor="Red">*</asp:RequiredFieldValidator>

            </div>
                </div>
            <br />
            <br />
            <br />
            
            <div class="text-center">
                <asp:Button ID="btnCreateDept" runat="server" OnClick="btnCreateDept_Click" Text="Create" />
                <br />
                <br />
                <asp:ValidationSummary ForeColor="red" ID="ValidationSummary1" runat="server" />
                <asp:Label ID="lblError" runat="server" ForeColor="red" Text=""></asp:Label>
            </div>
            </div>
        </div>
    </div>
    </asp:Content>
