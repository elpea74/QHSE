<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewObservation.aspx.cs" Inherits="QHSE.Admin.ViewObservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <title>View Observation Card</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        .placeholder {
            width: 50%;
            height: 50%;
            margin: auto;
        
        }

        h3 {
            padding-top: 1em;
            padding-bottom: 1.25em;
        }
    </style>

    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-12" style="text-align: center">
                        <h3>
                        <asp:Label ID="lblCardId" runat="server" Text="Observation Card #: " ></asp:Label>
                        <asp:Label ID="lblCardId2" runat="server" ></asp:Label>
                           </h3>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />

                    <div class="col-lg-6">
                        <asp:Label ID="lblDate" runat="server" Text="Date: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litDate" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblLocation" runat="server" Text="Location: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblOthers" runat="server" Text="If others: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litOthers" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblClassification" runat="server" Text="Classification: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litClassification" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblDescription" runat="server" Text="Description: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblImmAction" runat="server" Text="Immediate Action Taken: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litImmAction" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblFurtherAction" runat="server" Font-Bold="true" Text="Further Actions Suggested : "></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litFurtherAction" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblComment" runat="server" Font-Bold="true" Text="Positive Comment: "></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litComment" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblPhoto" runat="server" Font-Bold="true" Text="Photo:"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:ImageButton ID="imgBtn" AlternateText="Image Failed to Load" runat="server" />

                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

