<%@ Page Language="C#" MasterPageFile="~/Hub/User.Master" AutoEventWireup="true" CodeBehind="QuizList.aspx.cs" Inherits="QHSEQuiz.Hub.QuizList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Available Quizzes</title>
    
    <script src="../Scripts/jquery.responsivetable.min.js"></script> 
    <link href="../Style/main.css" type="text/css" rel="stylesheet" />
     
    <style>
        .placeholder {
            width: 70%;
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
            padding: 1.5em;
        }

        .grid th {
            background-color: #eee;
            background-image: linear-gradient(to top, rgba(100,100,100,0.2) 0%, rgba(255,255,255,0.2) 100%);
        }

        #gvQuizList {
            width: 872px;
            margin-left: auto;
            margin-right: auto;
        }

        h3 {
            padding-bottom: 1.5em;
        }

        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            setupResponsiveTables();
        });

        function setupResponsiveTables() {
            $('.responsiveTable1').responsiveTable();
        }
    </script>
    <div class="text-center">
        <h3>List of Quizzes - 测验列表</h3>
        <asp:Label ID="lblNoQuiz" ForeColor="Red" runat="server" Text=""></asp:Label>
        <div class="placeholder">
            <asp:GridView ID="gvQuizList" runat="server" EnableViewState="true" AutoGenerateColumns="False" DataKeyNames="QuizId"  OnRowCommand="gvQuizList_RowCommand" CssClass="grid responsiveTable1">
                <Columns>
                    <asp:TemplateField InsertVisible="False" SortExpression="QuizId" Visible="false">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuizId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuizId" EnableViewState="true" Visible="true" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle ForeColor="White" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Name" HeaderText="Quiz Name" SortExpression="Name" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:dd/MM/yyyy}" />


                    <asp:CommandField SelectText="Take quiz" ShowSelectButton="True" />


                    <%--<asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnTakeQuiz" runat="server" CausesValidation="False" CommandName="Select" Text="Take Quiz"></asp:LinkButton>
                    <asp:Label ID="lblCompleted" runat="server" Visible="false" Text="Quiz completed."></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
