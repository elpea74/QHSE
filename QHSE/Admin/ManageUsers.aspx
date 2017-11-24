<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ManageUsers.aspx.cs" Inherits="QHSE.Admin.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="row content">

        <div class="col-sm-8 col-md-offset-2 text-center">
            <h3>Manage Users</h3>
            <br />
            Search <asp:TextBox ID="tbxSearch" runat="server" ToolTip="Search by Name or HRMS"></asp:TextBox>
            
            Department <asp:DropDownList ID="ddlDepartment" runat="server" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AppendDataBoundItems="true"/>
            <asp:Button ID="btnSearch" CssClass="btn" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <br />
            <br />
            <%--<asp:HyperLink ID="hlNewUser" runat="server" NavigateUrl="~/Admin/CreateUser.aspx">Create a New User</asp:HyperLink>--%>
            <asp:Button ID="btnNewUser" runat="server" CssClass="btn btn-default btn-info" Text="Create a New User" OnClick="btnNewUser_Click" /> 
            <br />
            <br />
    
            <asp:Label ID="lblTotalRow" runat="server"></asp:Label>
    <br />     
    <br />
    <asp:GridView ID="gvUser" PageSize="10" runat="server" AllowPaging="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" Width="902px" OnRowDataBound="gvUser_RowDataBound" OnRowDeleting="gvUser_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="HRMS" HeaderText="HRMS" SortExpression="HRMS" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="hlEditUser" runat="server" NavigateUrl='<%# Eval("UserName", "~/Admin/EditUser.aspx?username={0}") %>'>Edit</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="linkbtnDeleteUser" runat="server" OnClick="linkbtnDeleteUser_Click">Delete2</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
            </div>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [UserName], [Name], [Title], [Department], [Email], [Role], [EmployeeID] FROM [Employee] ORDER BY [Name], [Role] DESC" 
        DeleteCommand= "DELETE FROM [Employee] WHERE [EmployeeID] = @EmployeeID">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    </asp:Content>