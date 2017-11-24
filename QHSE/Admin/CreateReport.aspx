<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="CreateReport.aspx.cs" Inherits="QHSE.Admin.CreateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New incident report</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="col-sm-8 col-md-offset-2 text-center">
                    <h3>New incident report</h3>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2">
                            <p>Report #</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxReportNo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxReportNo" ErrorMessage="Report Number is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-2">
                            <p>Date</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Location</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlLocation" CssClass="form-control" runat="server">
                               <%-- <asp:ListItem Value="Hub 1">Hub 1</asp:ListItem>--%>
                            </asp:DropDownList><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Classification</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlClassification" CssClass="form-control" runat="server"></asp:DropDownList><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Description</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Memo</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxMemo" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p>Choose Photo to Upload</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:FileUpload ID="UploadPhoto" CssClass="form-control" runat="server" /><br />
                            <br />
                        </div>
                        <div class="col-sm-12" style="text-align: center">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success pull-center" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                        </div>
                    </div>
                </div>

                <div class="col-sm-5"></div>

            </div>
        </div>
    </div>
</asp:Content>


