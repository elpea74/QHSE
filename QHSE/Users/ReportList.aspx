<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="ReportList.aspx.cs" Inherits="QHSE.Users.ReportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Incident Reports</title>
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

    <div class="row content">

        <div class="text-center">
            <h3>Incident Reports</h3>
            <br />
            <p>
                Location 
            <asp:DropDownList ID="ddlHub" AutoPostBack="true" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged"></asp:DropDownList>
                Classification
                <asp:DropDownList ID="ddlClassification" AutoPostBack="true" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged"></asp:DropDownList>
                Year
                <asp:DropDownList ID="ddlYear" AutoPostBack="True" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ddl_SelectedIndexChanged" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>
            </p>
            <asp:Label ID="lblTotalRow" runat="server"></asp:Label>
            <br />

            <div class="placeholder">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="Select DISTINCT Year(DATE) From REPORT Order BY Year(DATE) Desc"></asp:SqlDataSource>
                <asp:GridView ID="gvReportList" CssClass="grid table table-bordered text-center" runat="server" Width="798px" AllowPaging="True" Style="margin-right: 0px">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ReportNo", "~/Users/ViewReport.aspx?ReportNo={0}") %>'>View Details</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [ReportNo], [Location], [Classification], [Date] FROM [Report] WHERE (([Location] = @Location) AND ([Classification] = @Classification))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlHub" DefaultValue="All" Name="Location" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddlClassification" Name="Classification" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            </div>
        </div>
    </div>
</asp:Content>
