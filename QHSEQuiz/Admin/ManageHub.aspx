<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ManageHub.aspx.cs" Inherits="QHSEQuiz.Admin.ManageHub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Hubs</title>

    <style>
        .grid {
            white-space: nowrap;
        }

            .grid td, .grid th {
                border-style: double;
                width: inherit;
                column-width: auto;
                max-height: none;
                height: 30px;
                text-align: center;
            }

            .grid th {
                background-color: #eee;
                background-image: linear-gradient(to top, rgba(100,100,100,0.2) 0%, rgba(255,255,255,0.2) 100%);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="row content">

        <div class="col-sm-8 col-md-offset-2 text-center">
            <h3>Manage Hubs</h3>
            <br />
            <br />
            <br />
            <%--<asp:HyperLink ID="hlNewUser" runat="server" NavigateUrl="~/Admin/CreateUser.aspx">Create a New User</asp:HyperLink>--%>
            <asp:Button ID="btnNewHub" runat="server" CssClass="btn btn-default btn-info" Text="Create a New Hub" OnClick="btnNewHub_Click" />

            <%--<asp:Label ID="lblTotalRow" runat="server"></asp:Label>--%>
            <br />
            <br />
            <div class="grid">
            <asp:GridView ID="gvUser" runat="server" AllowPaging="true" CssClass="responsiveTable1" AutoGenerateColumns="False" Width="902px" OnRowDataBound="gvUser_RowDataBound" OnRowDeleting="gvUser_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderStyle-CssClass="text-center hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="UserName" HeaderStyle-CssClass="text-center" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="Email" HeaderStyle-CssClass="text-center hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" HeaderStyle-CssClass="text-center hidden-xs" ItemStyle-CssClass="hidden-xs" SortExpression="Role" />
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
    </div>
<%--    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuizConnectionString %>" SelectCommand="SELECT [UserName], [Name],  [HubID] FROM [Hub] ORDER BY [Name] DESC"
        DeleteCommand="DELETE FROM [Hub] WHERE [HubID] = @HubID">
        <DeleteParameters>
            <asp:Parameter Name="HubID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
