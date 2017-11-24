<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewObservation.aspx.cs" Inherits="QHSE.ViewObservation" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <title>View Observation Card</title>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
            
            <div class="col-lg-12 text-center" style="text-align: center">
                <br />
            <br />
                <div class="col-lg-12 text-center" style="text-align: center">
            <asp:Label ID="lblCardId" runat="server" Text="Observation Card #: " Font-Size="X-Large" ></asp:Label>
            <asp:Label ID="lblCardId2" runat="server" Font-Size="X-Large" ></asp:Label>
            <br />
            <br />
                    </div>
            <asp:Label ID="lblDate" runat="server" Text="Date 日期: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litDate" runat="server" ></asp:Literal>
            <br />
            <br />
            <asp:Label ID="lblLocation" runat="server" Text="Location 地点: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litLocation" runat="server" ></asp:Literal>
            <br /><br />
            <asp:Label ID="lblOthers" runat="server" Text="If others 其他: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litOthers" runat="server" ></asp:Literal>
            <br /><br />

            <asp:Label ID="lblClassification" runat="server" Text="Classification 分类: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litClassification" runat="server" ></asp:Literal>

            <br /><br />
            <asp:Label ID="lblDescription" runat="server" Text="Description 观察描述: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litDescription" runat="server" ></asp:Literal>
            <br /><br />
            <asp:Label ID="lblImmAction" runat="server" Text="Immediate Action Taken 立即采取的行动: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litImmAction" runat="server" ></asp:Literal>

            <br /><br />

            <asp:Label ID="lblFurtherAction" runat="server" Text="Further Actions Suggested  建议采取进一步的行动: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litFurtherAction" runat="server" ></asp:Literal>

            <br /><br />

            <asp:Label ID="lblComment" runat="server" Text="Positive Comment  正面评论: " Font-Size="Larger"></asp:Label>
            <asp:Literal ID="litComment" runat="server" ></asp:Literal>

            <br /><br />

            <asp:Label ID="lblPhoto" runat="server" Text="Photo 照片" Font-Size="Larger"></asp:Label>
            <asp:ImageButton ID="imgBtn" runat="server" />
                </div>
        </div>
    </asp:Content>
