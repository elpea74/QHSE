<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuiz.aspx.cs" MasterPageFile="~/Admin/Admin.Master" Inherits="QHSEQuiz.Admin.CreateQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="http://static.jquery.com/ui/css/demo-docs-theme/ui.theme.css" type="text/css" media="all" />
    <script src="../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%= txtstartdate.ClientID  %>").datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '+0d' });
            $("#<%= txtenddate.ClientID  %>").datepicker({ dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true, minDate: '+0d' });
        });
    </script>
    <script type="text/javascript" src="../Scripts/ckeditor/ckeditor.js"></script>
    <style type="text/css">
        #ui-datepicker-div {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="startquiz" class="text-center">
        <br />
        <h2>New quiz</h2>
        <br />
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <div class="col-lg-2 col-sm-1">
                    <asp:Label ID="lblname" Text="Quiz Name" Font-Bold="true" runat="server" />

                    <br />
                </div>
                <div class="col-lg-10 col-sm-11">
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"  />&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="namevalidator" runat="server" ControlToValidate="txtname" Display="Dynamic" ErrorMessage="please enter quiz name" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />
                    <asp:RegularExpressionValidator ID="nameregexvalidator" runat="server" ErrorMessage="only alphabets allowed" ControlToValidate="txtname" Display="Dynamic" ValidationExpression="^[a-zA-Z'.\s]{1,100}$" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

                    <br />
                    <br />
                </div>
                <div class="col-lg-2 col-sm-1">
                    <asp:Label ID="lbldescription" Text="Description" Font-Bold="true" runat="server" />
                    <br />
                </div>
                <div class="col-lg-10 col-sm-11">
                    <asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine" CssClass="form-control"  />&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="descriptionvalidator" runat="server" ControlToValidate="txtdescription" Display="Dynamic" ErrorMessage="please enter description" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

                    <br />
                </div>
                <div class="col-lg-2 col-sm-1">
                    <asp:Label ID="lblstartdate" Text="Start Date" Font-Bold="true" runat="server" />
                    <br />
                </div>
                <div class="col-lg-10 col-sm-11">
                    <asp:TextBox ID="txtstartdate" runat="server" CssClass="form-control" Width="150px"  />&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="startdatevalidator" runat="server" ControlToValidate="txtstartdate" Display="Dynamic" ErrorMessage="please enter start date" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

                    <br />
                </div>
                <div class="col-lg-2 col-sm-1">
                    <asp:Label ID="lblenddate" Text="End Date" Font-Bold="true" runat="server" />
                    <br />
                </div>
                <div class="col-lg-10 col-sm-11">
                    <asp:TextBox ID="txtenddate" runat="server" CssClass="form-control" Width="150px"  />&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="enddatevalidator" runat="server" ControlToValidate="txtenddate" Display="Dynamic" ErrorMessage="please enter end date" SetFocusOnError="true" ForeColor="Red" ValidationGroup="submitvalidation" />

                    <br />
                </div>
                <div class="text-center">
                    <asp:Button ID="submitquiz" runat="server" Text="Submit" Height="25px" Width="75px" OnClick="submitquiz_click" ValidationGroup="submitvalidation" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblalert" runat="server" Visible="false" ForeColor="Red" /><br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

