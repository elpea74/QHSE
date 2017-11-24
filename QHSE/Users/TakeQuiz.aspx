<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" MaintainScrollPositionOnPostBack = "true" CodeBehind="TakeQuiz.aspx.cs" Inherits="QHSE.Users.TakeQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Take quiz</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .placeholder {
            width: 60%;
            height: 100%;
            margin: auto;
        }

        .grid td, .grid th {
            /*text-align: center;*/
            border-width: 0px;
            border-style: none;
            max-height: none;
            
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
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to submit? 你确定要提交吗？")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

    <div class="text-center">
    <h3><asp:Label ID="lblQuizName" runat="server" Text=""></asp:Label></h3>
        </div>
    <div class="placeholder">
        
       <div class="grid">
           <br />
           <br />
    <asp:GridView ID="gvQuestions" ShowHeader="False" RowStyle-Height="50px" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionId" Width="702px" Height="184px" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="QuestionId" Visible="false" HeaderText="QuestionId" InsertVisible="False" ReadOnly="True" SortExpression="QuestionId" />
            <asp:BoundField DataField="QuizId" HeaderText="QuizId" Visible="false" SortExpression="QuizId" />
            <asp:BoundField DataField="OrderInQuiz" HeaderText="OrderInQuiz" Visible="false" SortExpression="OrderInQuiz" />
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <ItemTemplate>
                    <asp:Label ID="lblOrder" runat="server" Text='<%# Bind("OrderInQuiz") %>'></asp:Label>.
                    <asp:Label ID="lblQuestionId" runat="server" Text='<%# Bind("QuestionId", "{0:D}") %>' Visible="false" EnableViewState="true" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    <asp:RequiredFieldValidator ID="optionsValidator" ControlToValidate="rblOptions" runat="server" ErrorMessage="Please select an answer. 请选择答案" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:RadioButtonList ID="rblOptions" RepeatLayout="Table" RepeatColumns="1" RepeatDirection="Vertical" CssClass="mylist" runat="server" DataSourceID="SqlDataSource2" DataTextField="Description" DataValueField="OptionId">
                    </asp:RadioButtonList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT * FROM [QuestionOption] WHERE ([QuestionId] = @QuestionId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblQuestionId" Name="QuestionId" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT * FROM [QuestionOption] WHERE ([QuestionId] = @QuestionId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblQuestion" Name="QuestionId" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
<RowStyle Height="100px"></RowStyle>
        
    </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT * FROM [Question] WHERE ([QuizId] = @QuizId) ORDER BY [OrderInQuiz]">
               <SelectParameters>
                   <asp:SessionParameter Name="QuizId" SessionField="QuizId" Type="Int32" />
               </SelectParameters>
           </asp:SqlDataSource>
           </div>
        </div>
    
    <div class="text-center">
        <asp:Button ID="btnSubmit" OnClientClick="Confirm()" OnClick="btnSubmit_Click" runat="server" Text="Submit answers - 提交答案" />
    </div>
    <div style="width: 20%; margin:auto; height:100%">
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
    </div>
   </asp:Content>


