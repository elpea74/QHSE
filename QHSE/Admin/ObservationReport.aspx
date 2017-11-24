<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ObservationReport.aspx.cs" Inherits="QHSE.Admin.ObservationReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Observation Card Overview</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .placeholder {
        height: 100%;
        width: 75%;
        margin: auto;
    }
</style>
    <div class="container-fluid">

        <div class="row">
            <div class="col-sm-8 col-md-offset-2 text-center">
                <h3>Observation Cards Overview</h3>
                Year
                <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Column1" DataValueField="Column1" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="Select DISTINCT Year(DATE) From OBSERVATION Order BY Year(DATE) Desc"></asp:SqlDataSource>
                <br />
            </div>
        </div>
        <div class="placeholder">
            <div class="col-md-12 grid">
                <asp:GridView ID="gvReport" HeaderStyle-HorizontalAlign="center" runat="server" CssClass="table table-bordered text-center" ShowFooter="True" AutoGenerateColumns="False" AllowPaging="True" OnSelectedIndexChanged="gvReport_SelectedIndexChanged" style="margin-left: 0px; margin-right: 18px">
                    <Columns>
                        <asp:BoundField DataField="Hub" HeaderText="Hub" SortExpression="Hub" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                        <asp:BoundField DataField="1" HeaderText="Jan" ReadOnly="True" SortExpression="1" />
                        <asp:BoundField DataField="2" HeaderText="Feb" ReadOnly="True" SortExpression="2" />
                        <asp:BoundField DataField="3" HeaderText="Mar" ReadOnly="True" SortExpression="3" />
                        <asp:BoundField DataField="4" HeaderText="Apr" ReadOnly="True" SortExpression="4" />
                        <asp:BoundField DataField="5" HeaderText="May" ReadOnly="True" SortExpression="5" />
                        <asp:BoundField DataField="6" HeaderText="Jun" ReadOnly="True" SortExpression="6" />
                        <asp:BoundField DataField="7" HeaderText="Jul" ReadOnly="True" SortExpression="7" />
                        <asp:BoundField DataField="8" HeaderText="Aug" ReadOnly="True" SortExpression="8" />
                        <asp:BoundField DataField="9" HeaderText="Sep" ReadOnly="True" SortExpression="9" />
                        <asp:BoundField DataField="10" HeaderText="Oct" ReadOnly="True" SortExpression="10" />
                        <asp:BoundField DataField="11" HeaderText="Nov" ReadOnly="True" SortExpression="11" />
                        <asp:BoundField DataField="12" HeaderText="Dec" ReadOnly="True" SortExpression="12" />

                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />

                        <asp:TemplateField HeaderText="Choose month">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="false">
                                    <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="1">Jan</asp:ListItem>
                                    <asp:ListItem Value="2">Feb</asp:ListItem>
                                    <asp:ListItem Value="3">Mar</asp:ListItem>
                                    <asp:ListItem Value="4">Apr</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">Jun</asp:ListItem>
                                    <asp:ListItem Value="7">Jul</asp:ListItem>
                                    <asp:ListItem Value="8">Aug</asp:ListItem>
                                    <asp:ListItem Value="9">Sep</asp:ListItem>
                                    <asp:ListItem Value="10">Oct</asp:ListItem>
                                    <asp:ListItem Value="11">Nov</asp:ListItem>
                                    <asp:ListItem Value="12">Dec</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField SelectText="View" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <div class="text-center">
                    <asp:Button ID="btnDownloadCSV" CssClass="btn btn-info" OnClick="btnDownloadCSV_Click" runat="server" Text="Export Observation Cards to Excel" />
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-offset-8 col-md-4">

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="spObservationReport" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="year" PropertyName="SelectedValue" Size="10" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="p2" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                </div>
            </div>
        </div>
</asp:Content>
