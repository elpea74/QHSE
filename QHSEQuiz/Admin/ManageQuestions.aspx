<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ManageQuestions.aspx.cs" Inherits="QHSEQuiz.Admin.ManageQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         

            .grid td, .grid th {
                border-style: double;
                width: inherit;
                column-width: auto;
                max-height: none;
                height: 30px;
                text-align: center;
                padding-left: 1.5em;
                padding-right: 1.5em;
            }

            .grid th {
                background-color: #eee;
                background-image: linear-gradient(to top, rgba(100,100,100,0.2) 0%, rgba(255,255,255,0.2) 100%);
            }
         }
    </style>
    <script>
        function confirmDelete() {
            if (confirm('Deleting the question?') == false) {

            }
        }

    </script>
    <link rel="stylesheet" href="../Style/main.css" type="text/css" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align: center;">Question List</h2>

    <br />
    <div class="row">
        <div class="grid col-lg-offset-1 col-lg-10 col-sm-offset-1 col-sm-10"> 
        <asp:GridView ID="gvQuestions" CssClass="responsiveTable1" RowStyle-Height="50px" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionId" OnRowDeleting="gvQuestions_RowDeleting">

            <Columns>
                <asp:BoundField DataField="QuestionId"  HeaderText="QuestionId" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="QuestionId" />
                <asp:BoundField DataField="OrderInQuiz" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="Order" SortExpression="OrderInQuiz" />
                <asp:BoundField DataField="Description" HeaderText="Question" SortExpression="Description" />
                <asp:BoundField DataField="Weighted" HeaderText="Weighted Score" SortExpression="Weighted" />
                <asp:BoundField DataField="Type" HeaderText="Question Type" SortExpression="Type" />

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("QuestionId", "~/Admin/EditQuestion.aspx?qid={0}") %>' Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Do you want to delete the question? ');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
<RowStyle Height="50px"></RowStyle>

        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuizConnectionString %>" SelectCommand="SELECT [QuestionId], [OrderInQuiz], [Description], [Weighted] FROM [Question] WHERE ([QuizId] = @QuizId) ORDER BY [OrderInQuiz]">
                <SelectParameters>
                    <asp:SessionParameter Name="QuizId" SessionField="QuizId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="text-center" style="padding-top: 1.5em;">
            <asp:Button ID="btnNewQuestion" runat="server" OnClick="btnNewQuestion_Click" Text="Add a new Question" CssClass="btn btn-info" />
                </div>
            </div>
        <div class="col-lg-1 col-sm-1"></div>
    </div>/
</asp:Content>

