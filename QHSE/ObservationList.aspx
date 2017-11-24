<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ObservationList.aspx.cs" Inherits="QHSE.ObservationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Your Observation Cards</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
       <div class="col-sm-8 col-md-offset-2 text-center" style="text-align: center">
        <h3>Your Observation Cards</h3>
           Year 
           <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Expr1" DataValueField="Expr1" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
           </asp:DropDownList>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(Date) AS Expr1 FROM Observation ORDER BY Expr1 DESC"></asp:SqlDataSource>
           <br />
           <br />
           <asp:Label ID="lblTotal" runat="server"></asp:Label>
           <br />
           <br />
        <asp:GridView ID="gvObsCard" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" Width="839px" DataKeyNames="CardId">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Date"/>
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                <asp:BoundField DataField="Others" HeaderText="Others" SortExpression="Others" />
                <asp:BoundField DataField="Classification" HeaderText="Classification" SortExpression="Classification" />
                <asp:TemplateField>
                    <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("CardId", "~/ViewObservation.aspx?CardId={0}") %>'>View Details</asp:HyperLink>
                        </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT [Date], [Location], [Others], [Classification], [CardId] FROM [Observation] WHERE ([Name] = @Name) AND (Year(Date) = @Year) ORDER BY [Date] DESC">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="Name" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="ddlYear" DefaultValue="All" Name="Year" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
           </div>
    </div>
 </asp:Content>