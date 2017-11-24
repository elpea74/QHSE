<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="QuizList.aspx.cs" Inherits="QHSEQuiz.Admin.QuizList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />

    <style>
        .grid td, .th {
            border-style: double;
            width: inherit;
            column-width: auto;
            max-height: none;
            height: 20px;
            text-align: center;
            padding-left: 1em;
            padding-right: 1em;
        }

        .th {
            background-color: #eee;
            background-image: linear-gradient(to top, rgba(100,100,100,0.2) 0%, rgba(255,255,255,0.2) 100%);
        }
    </style>
    <script src="../Scripts/jquery.responsivetable.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[src*=plus]").live("click", function () {
            $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
            $(this).attr("src", "../Style/minus.png");
        });
        $("[src*=minus]").live("click", function () {
            $(this).attr("src", "../Style/plus.png");
            $(this).closest("tr").next().remove();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="availablecompetitions">
        <div class="text-center">
            <h2>Quiz List</h2>
            <p><a href="CreateQuiz.aspx">Create a new quiz</a></p>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-12">
            <div class="grid col-lg-offset-3">
                <asp:Label ID="lblmessage" runat="server" ForeColor="#ff0000" Visible="false" />
                <asp:GridView ID="gvQuizList" DataKeyNames="QuizId" OnRowDataBound="gvQuizList_RowDataBound" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <img alt="" style="cursor: pointer" src="../Style/plus.png" />
                                <asp:Panel ID="pnelDateRange" runat="server" Style="display: none">
                                    <asp:GridView ID="gvDateRange" EmptyDataText="No records!" OnRowEditing="gvDateRange_RowEditing" runat="server" AutoGenerateColumns="False" CssClass="ChildGrid">
                                        <Columns>
                                            <asp:BoundField ItemStyle-Width="150px" DataField="Hub" HeaderText="Hub">
                                                <ItemStyle Width="150px"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDate", "{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EndDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EndDate", "{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" />
                                            </asp:TemplateField>
                                            <asp:CommandField ShowEditButton="True" />
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="QuizId" HeaderText="Quiz ID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Quiz Name" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkViewQuestions" runat="server" NavigateUrl='<%# Eval("QuizId", "~/Admin/ManageQuestions.aspx?QuizId={0}") %>'>View Questions</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

                <%--<asp:Repeater ID="currrepeater" runat="server" Visible="false" OnItemCommand="currrepeater_ItemCommand">
                <HeaderTemplate>
                    <table class="col-lg-offset-2 col-sm-offset-2 grid responsiveTable1">
                        <tr>
                            <td class="th">Quiz Name</td>
                            <td class="th">Start Date</td>
                            <td class="th">End Date</td>
                            <td class="th">&nbsp;</td>
                            <td class="th">&nbsp;</td>
                            <td class="th">&nbsp;</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblquizname" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name")%>' Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblfromdate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Startdate", "{0:dd/MM/yyyy}")%>' ForeColor="Green" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lbltodate" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Enddate", "{0:dd/MM/yyyy}")%>' ForeColor="Red" Font-Bold="true"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkquestions" runat="server" CommandName="questions" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "QuizId") %>' CausesValidation="false">View Questions</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkView" runat="server" CommandName="responses" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "QuizId") %>' CausesValidation="false">View Responses</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "QuizId") %>' CausesValidation="false">Edit Quiz</asp:LinkButton>
                        </td>

                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>--%>
                </div>
            </div>
        </div>
    </div>
    
    <br />
</asp:Content>

