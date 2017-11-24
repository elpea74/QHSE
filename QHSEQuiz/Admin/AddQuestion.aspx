<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="AddQuestion.aspx.cs" Inherits="QHSEQuiz.Admin.AddQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        h2 {
            text-align: center;
            padding-bottom: 2em;
        }

        div {
            padding-bottom: 1.5em;
        }
    </style>
     <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 style="text-align: center;">Add a New Question</h2>
    <div class="row placeholder">
        <div class="col-lg-12 col-xs-12">
            <div class="col-lg-1 col-xs-2">
                Order in Quiz
            </div>
            <div class="col-lg-11 col-xs-1">
                <asp:TextBox ID="tbxOrder" TextMode="Number" CssClass="form-control" Width="60px" Enabled="false" runat="server"></asp:TextBox>
            </div>
        </div>
        <%--<div class="col-lg-12 col-xs-12">
            <div class="col-lg-1 col-xs-2">
                Question
            </div>
            <div class="col-lg-11 col-xs-10">
                <asp:TextBox ID="tbxQuestion" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>
        </div>--%>
        <div class="col-lg-12 col-xs-12">
            <div class="col-lg-1 col-xs-2">
                Weighted score
            </div>
            <div class="col-lg-2 col-xs-2">
                <asp:TextBox ID="tbxWeighted" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-9 col-xs-8">
            <asp:RegularExpressionValidator ID="NumericOnlyValidator" ForeColor="Red" runat="server" ControlToValidate="tbxWeighted" ErrorMessage="Please enter a decimal number between 0.01 and 1.00" ValidationExpression="^\s*(?=.*[0-1])\d*(?:\.\d{1,2})?\s*$"></asp:RegularExpressionValidator>
                </div>
            <div class="col-lg-12 col-xs-12">
            <div class="col-lg-1 col-xs-2">
                Question Type
            </div>
            <div class="col-lg-2 col-xs-2">
                <asp:DropDownList ID="ddlType"  AutoPostBack="true" CssClass="form-control" runat="server">
                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                    <asp:ListItem Value="True/False"></asp:ListItem>
                    <asp:ListItem Value="3-choice"></asp:ListItem>
                    <asp:ListItem Value="4-choice"></asp:ListItem>
                    <asp:ListItem Value="5-choice"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-9 col-xs-8">
                <asp:RequiredFieldValidator ID="QuestionTypeValidator" runat="server" InitialValue="0" ControlToValidate="ddlType" ErrorMessage="Please select question type." ForeColor="red"></asp:RequiredFieldValidator>
                </div>
        </div>
        <div style="clear: both"></div>
        <div id="div3choice" runat="server" visible="false">
            <b>Question</b><br />
            <asp:TextBox ID="tbx3choiceQuestion" runat="server" Height="23px" Width="400px" TextMode="MultiLine" />&nbsp;<asp:RequiredFieldValidator ID="singlequestionvalidator" runat="server" ControlToValidate="tbx4choiceQuestion" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx3choiceoption1" runat="server" Height="23px" Width="200px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx3choiceoption1" Display="Dynamic" ErrorMessage="please enter option 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx3choiceoption2" runat="server" Height="23px" Width="200px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbx3choiceoption2" Display="Dynamic" ErrorMessage="please enter option 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 3</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx3choiceoption3" runat="server" Height="23px" Width="200px" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbx3choiceoption3" Display="Dynamic" ErrorMessage="please enter option 3" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <%--<b>option 4</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtsingleoption4" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsingleoption4" Display="Dynamic" ErrorMessage="please enter option 4" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />--%>
            <br />
            <asp:Button ID="btnSubmit3choiceQuestion" runat="server" OnClick="btnSubmit3choiceQuestion_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="singleoptionvalidation" /><br /><br />
            <asp:Label ID="lblAnswer3choice" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Please select the answer</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddl3choiceAnswer" runat="server" AutoPostBack="false" Visible="false">
                <asp:ListItem Text="Option 1" Value="optn3Choice1" Selected="True" />
                <asp:ListItem Text="Option 2" Value="optn3Choice2" />
                <asp:ListItem Text="Option 3" Value="optn3Choice3" />
            </asp:DropDownList><br /><br />
            <asp:Button ID="btnSubmit3choiceAnswer" runat="server" OnClick="btnSubmit3choiceAnswer_Click" Text="Submit" Height="23px" Width="100px" Visible="false" />
        </div>
            <div id="div4choice" runat="server" visible="false">
            <b>Question</b><br />
            <asp:TextBox ID="tbx4choiceQuestion" runat="server" Height="23px" Width="400px" TextMode="MultiLine" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbx4choiceQuestion" Display="Dynamic" ErrorMessage="please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx4choiceoption1" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbx4choiceoption1" Display="Dynamic" ErrorMessage="please enter option 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx4choiceoption2" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbx4choiceoption2" Display="Dynamic" ErrorMessage="please enter option 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 3</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx4choiceoption3" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="tbx4choiceoption3" Display="Dynamic" ErrorMessage="please enter option 3" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 4</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbx4choiceoption4" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tbx4choiceoption4" Display="Dynamic" ErrorMessage="please enter option 4" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <br />
            <asp:Button ID="btnSubmit4choiceQuestion" runat="server" OnClick="btnSubmit4choiceQuestion_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="singleoptionvalidation" /><br /><br />
            <asp:Label ID="lblAnswer4choice" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Please select the answer</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddl4choiceAnswer" runat="server" AutoPostBack="false" Visible="false">
                <asp:ListItem Text="Option 1" Value="optn4Choice1" Selected="True" />
                <asp:ListItem Text="Option 2" Value="optn4Choice2" />
                <asp:ListItem Text="Option 3" Value="optn4Choice3" />
                <asp:ListItem Text="Option 4" Value="optn4Choice4" />
            </asp:DropDownList><br /><br />
            <asp:Button ID="btnSubmit4choiceAnswer" runat="server" OnClick="btnSubmit4choiceAnswer_Click" Text="Submit" Height="23px" Width="100px" Visible="false" />
        </div>
        <div id="truefalsediv" runat="server" visible="false">
            <b>Question</b><br />
            <asp:TextBox ID="tbxTFQuestion" runat="server" Height="23px" Width="400px" TextMode="MultiLine" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbxTFQuestion" Display="Dynamic" ErrorMessage="Please enter Question" SetFocusOnError="true" ForeColor="Red" ValidationGroup="singleoptionvalidation" /><br />
            <br />
            <b>Option 1</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbxTrue" Enabled="false" Text="True 对" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbxTrue" Display="Dynamic" ErrorMessage="please enter option 1" SetFocusOnError="true" ForeColor="Red" ValidationGroup="truefalseValidation" /><br />
            <br />
            <b>Option 2</b>&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tbxFalse" Enabled="false" Text="False 错" runat="server" Height="23px" Width="200px" />&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbxFalse" Display="Dynamic" ErrorMessage="please enter option 2" SetFocusOnError="true" ForeColor="Red" ValidationGroup="truefalseValidation" /><br />
            <br />
            <asp:Button ID="btnTFSubmitQuestion" runat="server" OnClick="btnTFSubmitQuestion_Click" Text="Submit" Height="23px" Width="100px" ValidationGroup="truefalseValidation" /><br /><br />
            <asp:Label ID="lblTFAnswer" runat="server" Font-Bold="true" ForeColor="Red" Visible="false">Please select the answer</asp:Label>&nbsp;&nbsp;
            <asp:DropDownList ID="ddlTFAnswer" runat="server" AppendDataBoundItems="true" AutoPostBack="false" Visible="false">
            </asp:DropDownList><br /><br />
            <asp:Button ID="btnTFSubmitAnswer" runat="server" OnClick="btnTFSubmitAnswer_Click" Text="Submit" Height="23px" Width="100px" Visible="false" />
        </div>
       <%-- <div class="text-center">
        <asp:Button ID="btnAddQuestion" OnClick="btnAddQuestion_Click" CssClass="btn btn-success" runat="server" Text="Add question" />
            </div>--%>
    </div>
        <asp:Label ID="lblError" ForeColor="Red" runat="server" Text=""></asp:Label>

    </asp:Content>
