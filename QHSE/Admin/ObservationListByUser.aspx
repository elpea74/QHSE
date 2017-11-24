<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ObservationListByUser.aspx.cs" Inherits="QHSE.Admin.ObservationListByUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        .grid td, .grid th {
            text-align: center;
        }
    </style>
    <br />
    <div class="row content">

        <div class="col-sm-8 col-md-offset-2 text-center">
            <asp:Label ID="lblHeader" runat="server" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblNoResult" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:GridView ID="gvObCardList" CssClass="grid table table-bordered text-center" Style="text-align: center" runat="server" AutoGenerateColumns="False" DataKeyNames="CardId" DataSourceID="SqlDataSource1">
                <Columns>
                    <%--<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />--%>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="Others" HeaderText="Others" SortExpression="Others" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:BoundField DataField="Classification" HeaderText="Classification" SortExpression="Classification" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("CardId", "~/Admin/ViewObservation.aspx?CardId={0}") %>'>View Details</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:CommandField SelectText="View Details"  ShowSelectButton="True" />--%>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnDownloadExcel" OnClick="btnDownloadExcel_Click" runat="server" Text="Export as Excel File" CssClass="btn btn-info" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Name" QueryStringField="username" Type="String" />
                    <asp:QueryStringParameter Name="month" QueryStringField="month" Type="String" />
                    <asp:QueryStringParameter Name="year" QueryStringField="year" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
