<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="ViewQuizResult.aspx.cs" Inherits="QHSEQuiz.Admin.ViewQuizResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quiz Result</title>
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .placeholder {
            width: 60%;
            height: 100%;
            margin: auto;
        }

        .grid th {
            text-align: center;
            border-width: 0px;
            border-style: none;
            padding-bottom: 1.5em;
            padding-right: 1.25em;
            
        }

        h4 {
            padding-bottom: 1.5em;
        }
         .grid td {
             border-width: 0px;
            border-style: none;
            padding-bottom: 1.5em;
            padding-right: 3em;
         }

        table.mylist input {
      width: 20px;
      display: block;
      float: left;
   }
   table.mylist label {
      width: 600px;
      display: block;
      float: left;
      font-style: normal;
   }
    </style>


    <div class="text-center">
    <h4><asp:Label ID="lblQuizName" runat="server" Text=""></asp:Label></h4>
        </div>
    <div class="placeholder">
        <br />
        <b>Name:</b> <asp:Label ID="lblName" runat="server" Text=""></asp:Label><br />
        <asp:Label Font-Bold="true" ID="lblHub" runat="server" Text=""></asp:Label>
        <br />
        <b>Score:</b> <asp:Label ID="lblScore" runat="server" Text=""></asp:Label>
       <div class="grid">
           <br />
           <br />
    <asp:GridView ID="gvQuestions" ShowHeader="False" RowStyle-Height="50px" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionId" Width="702px" Height="184px" DataSourceID="SqlDataSource1" OnRowDataBound="gvQuestions_RowDataBound">
        <Columns>
            <asp:BoundField DataField="QuestionId" Visible="false" HeaderText="QuestionId" InsertVisible="False" ReadOnly="True" SortExpression="QuestionId" />
            <asp:BoundField DataField="QuizId" HeaderText="QuizId" Visible="false" SortExpression="QuizId" />
            <asp:BoundField DataField="OrderInQuiz" HeaderText="OrderInQuiz" Visible="false" SortExpression="OrderInQuiz" />
            <asp:TemplateField HeaderText="" SortExpression="Description">
                <%--<EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>--%>
                <ItemTemplate>
                    <asp:Label ID="lblOrder" runat="server" Text='<%# Bind("OrderInQuiz") %>'></asp:Label>.
                    <asp:Label ID="lblQuestionId" runat="server" Visible="False" Text='<%# Bind("QuestionId", "{0:D}") %>'></asp:Label>
                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblRightWrong" runat="server"></asp:Label>
                    <br />
                    <%--<asp:RadioButtonList ID="rblOptions" RepeatLayout="Table" RepeatColumns="1" RepeatDirection="Vertical" CssClass="mylist" runat="server" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="OptionId">
                    </asp:RadioButtonList>--%>
                    <strong>Answer:</strong>
                    <asp:Label ID="lblYourAnswer" runat="server"></asp:Label>
                    <br />
                    <strong>Correct answer:</strong>
                    <asp:Label ID="lblCorrectAnswer" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuizConnectionString %>" SelectCommand="SELECT Description FROM [QuestionOption] WHERE ([QuestionId] = @QuestionId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblQuestionId" Name="QuestionId" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuizConnectionString %>" SelectCommand="SELECT * FROM [QuestionOption] WHERE ([QuestionId] = @QuestionId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblQuestion" Name="QuestionId" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
<RowStyle Height="100px"></RowStyle>
        
    </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuizConnectionString %>" SelectCommand="SELECT * FROM [Question] WHERE ([QuizId] = @QuizId) ORDER BY [OrderInQuiz]">
               <SelectParameters>
                   <asp:SessionParameter Name="QuizId" SessionField="QuizId" Type="Int32" />
               </SelectParameters>
           </asp:SqlDataSource>
           </div>
        <div class="text-center">
            <asp:Button ID="btnResultList" runat="server" Text="Back to Quiz Results" OnClick="btnResultList_Click" />
            <br />
            <br />
        </div>
        </div>
    
   </asp:Content>