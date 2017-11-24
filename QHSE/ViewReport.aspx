<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewReport.aspx.cs" Inherits="QHSE.ViewReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Report</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <asp:Label ID="lblReportNo" runat="server" Text="Report #: " Font-Size="X-Large" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblDate" runat="server" Text="Date of report: "></asp:Label>
        <asp:Literal ID="litDate" runat="server"></asp:Literal>
        <br />
        <asp:Label ID="lblLocation" runat="server" Text="Location: "></asp:Label>
        <asp:Literal ID="litLocation" runat="server"></asp:Literal>

        <br />

        <asp:Label ID="lblClassification" runat="server" Text="Classification: "></asp:Label>
        <asp:Literal ID="litClassification" runat="server"></asp:Literal>

        <br />
        <asp:Label ID="lblDescription" runat="server" Text="Description: "></asp:Label>
        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
        <br />
        <asp:Label ID="lblMemo" runat="server" Text="Memo: "></asp:Label>
        <asp:Literal ID="litMemo" runat="server"></asp:Literal>

        <br />
        <asp:Label ID="lblPhoto" runat="server" Text="Photo"></asp:Label>
        <asp:ImageButton ID="imgBtn" runat="server" />
    </div>
</asp:Content>
