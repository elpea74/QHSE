<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="EditQuestion.aspx.cs" Inherits="QHSEQuiz.Admin.EditQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Question</title>
    <style>
        .placeholder {
            width: 50%;
            margin: auto;
            padding-top: 5em;
        }

        div {
            padding-bottom: 2em;
        }
    </style>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row placeholder">
        <div class="col-lg-12 col-sm-12">
            <div class="col-lg-2 col-sm-2">
                <asp:Label ID="lblQuestion" runat="server" Text="Question: "></asp:Label>
            </div>
            <div class="col-lg-10 col-sm-10">
                <asp:TextBox ID="tbxQuestion" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-12 col-sm-12">
            <div class="col-lg-2 col-sm-2">
                <asp:Label ID="lblOrder" runat="server" Text="Order in quiz: "></asp:Label>
            </div>
            <div class="col-lg-10 col-sm-10">
                <asp:TextBox ID="tbxOrder" CssClass="form-control" Width="60px" runat="server"></asp:TextBox>
            </div>
        </div>
            <div class="col-lg-12 col-sm-12">
                <div class="col-lg-2 col-sm-2">
                    <asp:Label ID="lblWeighted" CssClass="pull-left" runat="server" Text="Weighted score: "></asp:Label>
                </div>
                <div class="col-lg-10 col-sm-10">
                    <asp:TextBox ID="tbxWeighted" CssClass="form-control" Width="70px" runat="server"></asp:TextBox>
                </div>
            </div>
        <div class="col-lg-12 col-sm-12">
            <div class="col-lg-2 col-sm-2">
                    <asp:Label ID="lblType" CssClass="pull-left" runat="server" Text="Question type: "></asp:Label>
                </div>
                <div class="col-lg-10 col-sm-10">
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>True/False</asp:ListItem>
                        <asp:ListItem>3-choice</asp:ListItem>
                        <asp:ListItem>4-choice</asp:ListItem>
                        <asp:ListItem>5-choice</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="typeValidator" ForeColor="Red" InitialValue="" ControlToValidate="ddlType" runat="server" ErrorMessage="Question type is required."></asp:RequiredFieldValidator>
                </div>
        </div>
    </div>
</asp:Content>
