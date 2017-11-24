<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ReportList.aspx.cs" Inherits="QHSE.Admin.ReportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Incident Reports</title>
     <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
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
    <script src="../Scripts/jquery.responsivetable.min.js"></script> 
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row content">
        
        <div class="text-center">
            <h3>Incident Reports</h3>
            <br />
            <p>Location 
            <asp:DropDownList ID="ddlHub" AutoPostBack="true" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged"></asp:DropDownList>
            Classification
                <asp:DropDownList ID="ddlClassification" AutoPostBack="true" runat="server" AppendDataBoundItems="True" OnSelectedIndexChanged="ddl_SelectedIndexChanged"></asp:DropDownList>
            Year
                <asp:DropDownList ID="ddlYear" AutoPostBack="True" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="ddl_SelectedIndexChanged" DataTextField="Column1" DataValueField="Column1"></asp:DropDownList>
            </p>
            <asp:Label ID="lblTotalRow" runat="server"></asp:Label>
            <br />

            </div>
        <div class="grid">
            
            <div class="placeholder">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="Select DISTINCT Year(DATE) From REPORT Order BY Year(DATE) Desc"></asp:SqlDataSource>
            <asp:GridView ID="gvReportList" AutoGenerateColumns="false" HeaderStyle-CssClass="text-center" CssClass="table table-bordered responsiveTable1" runat="server" Width="798px" AllowPaging="True" Style="margin-right: 0px">
                <Columns>
                    <asp:BoundField DataField="ReportNo" SortExpression="ReportNo" HeaderText="Report Number" />
                    <asp:BoundField DataField="Location" SortExpression="Location" HeaderText="Location" />
                    <asp:BoundField DataField="Classification" SortExpression="Classification" HeaderText="Classification" />
                    <asp:BoundField DataField="Date" SortExpression="Date" HeaderText="Date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="Submitter" SortExpression="Submitter" HeaderText="Submitter" />
                    
                <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" CssClass="text-left" runat="server" NavigateUrl='<%# Eval("ReportNo", "~/Admin/ViewReport.aspx?ReportNo={0}") %>'>View</asp:HyperLink>
                            | <asp:HyperLink ID="HyperLink2" runat="server" CssClass="text-right" NavigateUrl='<%# Eval("ReportNo", "~/Admin/EditReport.aspx?ReportNo={0}") %>'>Edit</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
            </asp:GridView>
                </div>
        </div>
        </div>
</asp:Content>