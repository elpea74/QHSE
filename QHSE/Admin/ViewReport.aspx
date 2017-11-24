<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ViewReport.aspx.cs" Inherits="QHSE.Admin.ViewReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Report</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .placeholder {
            width: 50%;
            height: 50%;
            margin: auto;
        }
    </style>

    <br />
    <br />

    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="text-center">
                    <asp:Label ID="lblReportNo" runat="server" Text="Report #: " Font-Size="X-Large" Font-Bold="True"></asp:Label>
                </div>
                <br />
                <br />
                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblDate" runat="server" Text="Date of report: " Font-Bold="true"></asp:Label>
                </div>
                
                <div class="col-lg-6">
                    <asp:Literal ID="litDate" runat="server"></asp:Literal>
                </div>
                
                <br />
                <br />
                <br />
                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblLocation" runat="server" Text="Location: " Font-Bold="true"></asp:Label>
                </div>
                
                <div class="col-lg-6">
                    <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                </div>
                <br />
                <br />
                <br />
                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblClassification" runat="server" Text="Classification: " Font-Bold="true"></asp:Label>    
                </div>
                <div class="col-lg-6">
                    <asp:Literal ID="litClassification" runat="server"></asp:Literal>
                </div>
                <br />
                <br />
                <br />

                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblDescription" runat="server" Text="Description: " Font-Bold="true"></asp:Label>
                </div>
                <div class="col-lg-6">
                    <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                </div>
                 
                <br />
                <br />
                <br />
                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblMemo" runat="server" Text="Memo: " Font-Bold="true"></asp:Label>
                </div>
                <div class="col-lg-6">
                    <asp:Literal ID="litMemo" runat="server"></asp:Literal>
                </div>
                
                

                <br />
                <br />
                <br />
                <div class="col-lg-4 col-lg-offset-2">
                    <asp:Label ID="lblPhoto" runat="server" Text="Photo" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-lg-6">
                     <asp:ImageButton ID="imgBtn" AlternateText="Image Failed to Load" runat="server" />
                </div>
                
               
            </div>
            <br />
            <br />
            <div class="col-sm-12" style="text-align: center">
                <asp:Button ID="btnBack" CssClass="btn" runat="server" OnClick="btnBack_Click" Text="Back" />
            </div>
        </div>
    </div>
</asp:Content>
