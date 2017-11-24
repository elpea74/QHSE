<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="OwnResultList.aspx.cs" Inherits="QHSE.Users.OwnResultList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Your Quiz Results</title>
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
            width: inherit;
            max-height: none;
            text-align: center;
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
    <div class="row">
        <div class="text-center" style="text-align: center">
            <h3>Your Quiz Results</h3>
            <asp:Label ID="lblNoResult" runat="server" Text="" ForeColor="red"></asp:Label>
            <br />
            <br />
        </div>
    </div>
    <div class="placeholder">
        <asp:GridView ID="gvResult" EnableViewState="true" HeaderStyle-HorizontalAlign="Center" GridLines="None" CssClass="grid" OnRowCommand="gvResult_RowCommand" runat="server" Width="656px" AutoGenerateColumns="False" DataKeyNames="ResultId" Height="130px">
            <Columns>
                <asp:TemplateField Visible="false" InsertVisible="False" SortExpression="ResultId">
                    <EditItemTemplate>
                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="ResultId" Mode="Edit" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblResultId" runat="server" EnableViewState="true" Text='<%# Eval("ResultId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="QuizId" Visible="false" SortExpression="QuizId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuizId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblQuizId" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Quiz Name" SortExpression="Name" />
                <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                <asp:BoundField DataField="TimeSubmitted" HeaderText="Time Submitted" SortExpression="TimeSubmitted" />
            <asp:CommandField ShowSelectButton="True" SelectText="View Details" />
            </Columns>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

        </asp:GridView>

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QHSEConnectionString %>" SelectCommand="SELECT * FROM [QuizResult] WHERE ([Username] = @Username)">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>

        </div>
</asp:Content>