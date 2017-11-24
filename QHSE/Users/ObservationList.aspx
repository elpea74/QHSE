<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="ObservationList.aspx.cs" Inherits="QHSE.Users.ObservationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Your Observation Cards</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .placeholder {
            width: 60%;
            height: 100%;
            margin: auto;
        }

        .grid td, .grid th {
            text-align: center;
        }
    </style>

    <div class="row">

        <div class="text-center" style="text-align: center">
            <h3>Your Observation Cards - 你的观察卡</h3>
            <div class="col-lg-12">
                <asp:Label ID="lblNotify" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-lg-12">
                <asp:Label ID="lblNotifyChinese" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                <br />
                <br />

            </div>
            <asp:Button ID="btnNewCard" runat="server" CssClass="btn btn-success" Text="New Observation Card – 新的观察卡" OnClick="btnNewCard_Click" />
            <br />
            <br />
            Year - 年份
           <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="Expr1" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
           </asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(Date) AS Expr1 FROM Observation ORDER BY Expr1 DESC"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
            <br />
        </div>


        <br />
        <div class="placeholder">
            <asp:GridView ID="gvObsCard" OnRowCommand="gvObsCard_RowCommand" CssClass="grid table table-bordered table-condensed" runat="server" AutoGenerateColumns="False" Width="839px" DataKeyNames="CardId" PageSize="8">
                <Columns>
                    <asp:TemplateField SortExpression="CardId" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("CardId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCardId" runat="server" Text='<%# Bind("CardId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Date" HeaderText="Date - 日期" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Date" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Location" HeaderText="Location – 地点" SortExpression="Location" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center">
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Others" HeaderText="Others – 其他" SortExpression="Others" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center">
                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Classification" HeaderText="Classification – 分类" SortExpression="Classification" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="text-center">

                        <HeaderStyle HorizontalAlign="Center" CssClass="text-center"></HeaderStyle>

                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("CardId", "~/Users/ViewObservation.aspx?CardId={0}") %>'>View Details - 查看详情</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="hlEditObservation" runat="server" NavigateUrl='<%# Eval("CardId", "~/Users/EditObservation.aspx?CardId={0}") %>'>Edit - 编辑</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField SelectText="View Details - 查看详情" ShowSelectButton="True" />--%>

                    <asp:CommandField SelectText="Edit - 编辑" ShowSelectButton="True" />

                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div class="text-center">


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [Date], [Location], [Others], [Classification], [CardId] FROM [Observation] WHERE ([Name] = @Name) AND (Year(Date) = @Year) ORDER BY [Date] DESC">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="Name" SessionField="username" Type="String" />
                    <asp:ControlParameter ControlID="ddlYear" DefaultValue="All" Name="Year" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
