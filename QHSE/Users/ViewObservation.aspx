<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="ViewObservation.aspx.cs" Inherits="QHSE.Users.ViewObservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Observation Card</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .placeholder {
            width: 50%;
            height: 50%;
            margin: auto;
        
        }
    </style>

    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-12" style="text-align: center">
                        <asp:Label ID="lblCardId" runat="server" Text="Observation Card #: " Font-Size="X-Large"></asp:Label>
                        <asp:Label ID="lblCardId2" runat="server" Font-Size="X-Large"></asp:Label>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />

                    <div class="col-lg-6">
                        <asp:Label ID="lblDate" runat="server" Text="Date 日期: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litDate" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblLocation" runat="server" Text="Location 地点: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblOthers" runat="server" Text="If others 其他: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litOthers" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblClassification" runat="server" Text="Classification 分类: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litClassification" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblDescription" runat="server" Text="Description 观察描述: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblImmAction" runat="server" Text="Immediate Action Taken 立即采取的行动: " Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litImmAction" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblFurtherAction" runat="server" Font-Bold="true" Text="Further Actions Suggested  建议采取进一步的行动: "></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litFurtherAction" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblComment" runat="server" Font-Bold="true" Text="Positive Comment  正面评论: "></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:Literal ID="litComment" runat="server"></asp:Literal>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div class="col-lg-6">
                        <asp:Label ID="lblPhoto" runat="server" Font-Bold="true" Text="Photo 照片:"></asp:Label>
                    </div>
                    <div class="col-lg-6">
                        <asp:ImageButton ID="imgBtn" runat="server" AlternateText="Image Failed to Load" />

                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
