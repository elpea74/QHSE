<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ManageDepartments.aspx.cs" Inherits="QHSE.Admin.ManageDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Departments</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .placeholder {
            width: 25%;
            height: 100%;
            margin: auto;
        }

        .grid td, .grid th {
            text-align: center;
        }
    </style>

    <div class="row content">

        <div class="text-center">
            <h3>Manage Departments</h3>
            <div class="placeholder">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>">
                    <%--<SelectParameters>
                    <asp:Parameter DefaultValue="%Hub%" Name="Name" Type="String" />
                </SelectParameters>--%>
                </asp:SqlDataSource>
                <asp:Button ID="btnNewDept" runat="server" CssClass="btn btn-info" OnClick="btnNewDept_Click" Text="Create a New Department" />
                <br />
                <br />
                <asp:GridView ID="gvDept" HeaderStyle-HorizontalAlign="Center" OnRowUpdating="gvDept_RowUpdating" OnRowEditing="gvDept_RowEditing" DataKeyNames="Name" OnSelectedIndexChanged="gvDept_SelectedIndexChanged" OnRowCancelingEdit="gvDept_RowCancelingEdit" CssClass="grid table table-bordered text-center" runat="server" AutoGenerateColumns="False">

                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxDeptName" Enabled="false" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password reset POC" SortExpression="DeptAdmin">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAdmin" AppendDataBoundItems="True" runat="server" Text='<%# Bind("DeptAdmin") %>' DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlAdmin" ErrorMessage="Each department needs to have an admin.">*</asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [Name] FROM [Employee] WHERE ([Role] = @Role) OR ([Role] = @Role2)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Admin" Name="Role" Type="String" />
                                        <asp:Parameter DefaultValue="Sub-Admin" Name="Role2" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAdmin" runat="server" Text='<%# Bind("DeptAdmin") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" />

                    </Columns>


                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>


                </asp:GridView>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
        </div>
    </div>
</asp:Content>
