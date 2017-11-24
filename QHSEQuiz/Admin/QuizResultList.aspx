<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" CodeBehind="QuizResultList.aspx.cs" Inherits="QHSEQuiz.Admin.QuizResultList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quiz Results</title>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
    <style>
        .placeholder {
            width: 80%;
            height: 100%;
            margin: auto;
        }

        .grid td, .grid th {
            /*text-align: center;*/
            border-style: double;
            width: inherit;
            column-width: auto;
            max-height: none;
            height: 30px;
            text-align: center;
        }

        .grid th {
            background-color: #eee;
            background-image: linear-gradient(to top, rgba(100,100,100,0.2) 0%, rgba(255,255,255,0.2) 100%);
        }

        .auto-style1 {
            width: 75%;
            height: 100%;
            margin: auto;
            padding-top: 1.5em;
            padding-left: 2.5em;
        }

        .h3 {
            line-break: loose;
        }
    </style>
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
    <script src="../Scripts/jquery.responsivetable.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupResponsiveTables();
        });

        function setupResponsiveTables() {
            $('.responsiveTable1').responsiveTable();
        }
    </script>
    <div class="row">
        <div class="text-center" style="text-align: center">
            <h3>Quiz Results</h3>
            Hub:
            <asp:DropDownList ID="ddlHub" OnSelectedIndexChanged="ddlHub_SelectedIndexChanged" runat="server" AppendDataBoundItems="True" AutoPostBack="true">
            </asp:DropDownList>
            Quiz:
            <asp:DropDownList ID="ddlQuiz" OnSelectedIndexChanged="ddlHub_SelectedIndexChanged" runat="server" AppendDataBoundItems="True" AutoPostBack="true">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblNoResult" runat="server" Visible="false" Text="" ForeColor="red"></asp:Label>
            <br />
            <br />

            <asp:Button ID="btnPDF" runat="server" Text="Download Answers" CssClass="btn btn-success" OnClick="btnPDF_Click" />
            <asp:Button ID="btnExcel" runat="server" Text="Export Table to Excel" CssClass="btn btn-info" OnClick="btnExcel_Click" />
        </div>
    </div>
    <div class="row">
        <div class ="auto-style1">
        <div class="col-xs-offset-1 col-xs-11">
            <asp:GridView ID="gvResult" RowStyle-Wrap="false" EmptyDataRowStyle-ForeColor="Red" EmptyDataRowStyle-BorderStyle="None" EmptyDataRowStyle-BorderColor="White" OnSorting="gvResult_Sorting" HeaderStyle-HorizontalAlign="Center" CssClass="grid responsiveTable1" OnRowCommand="gvResult_RowCommand" runat="server" Width="900px" AutoGenerateColumns="False" DataKeyNames="ResultId" Style="margin-left: 0">
                <Columns>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">

                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Username" SortExpression="Username" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblUsername" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="HRMS" SortExpression="HRMS">
                        <ItemTemplate>
                            <asp:Label ID="lblHRMS" runat="server" Text='<%# Bind("HRMS") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Hub" SortExpression="Hub">
                        <ItemTemplate>
                            <asp:Label ID="lblHub" runat="server" Text='<%# Bind("Hub") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Visible="false" InsertVisible="False" SortExpression="ResultId">

                        <ItemTemplate>
                            <asp:Label ID="lblResultId" runat="server" EnableViewState="true" Text='<%# Eval("ResultId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="QuizId" Visible="false" SortExpression="QuizId">

                        <ItemTemplate>
                            <asp:Label ID="lblQuizId" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="QuizName" HeaderText="Quiz Name" SortExpression="QuizName" />
                    <asp:BoundField DataField="Mark" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="Score" SortExpression="Mark" />
                    <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                    <asp:BoundField DataField="TimeSubmitted" HeaderText="Time Submitted" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs" SortExpression="TimeSubmitted" />
                    <asp:CommandField ShowSelectButton="True" SelectText="View Details" />
                </Columns>

                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

            </asp:GridView>
        </div>
            </div>
    </div>
</asp:Content>
