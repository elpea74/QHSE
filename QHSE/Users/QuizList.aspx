<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="QuizList.aspx.cs" Inherits="QHSE.Users.QuizList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>List of Quizzes - 测验列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .placeholder {
            width: 60%;
            height: 100%;
            margin: auto;
        }

        .grid td, .grid th {
            text-align: center;
            border-width: 0px;
            border-style: none;
            
        }
    </style>
    <div class="text-center">
    <h3>List of Quizzes - 测验列表</h3>
        </div>
    <div class="placeholder text-center">
        <asp:Label ID="lblNoQuiz" ForeColor="Red" runat="server" Text=""></asp:Label>
       <div class="grid">
           <br />
           <br />
    <asp:GridView ID="gvQuizList" OnRowDataBound="gvQuizList_RowDataBound" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="QuizId" Width="702px" Height="140px" OnRowCommand="gvQuizList_RowCommand">
        <Columns>
           
               <%-- <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnTakeQuiz" OnClick="lbtnTakeQuiz_Click" runat="server">Quiz</asp:LinkButton>
                            <asp:HyperLink ID="hlTakeQuiz" runat="server" NavigateUrl='<%# Eval("QuizId", "~/Users/TakeQuiz.aspx?QuizId={0}") %>'>Take Quiz</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    
                    
               <asp:TemplateField InsertVisible="False" SortExpression="QuizId">
                   <EditItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuizId") %>'></asp:Label>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="lblQuizId" EnableViewState="true" Visible="true" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                   </ItemTemplate>
                   <ItemStyle ForeColor="White" />
               </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="" SortExpression="Name" />
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


