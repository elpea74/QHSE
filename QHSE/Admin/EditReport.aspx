<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master" CodeBehind="EditReport.aspx.cs" Inherits="QHSE.Admin.EditReport" %>

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
                            <p><b>Report #</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxReportNo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxReportNo" ErrorMessage="Report Number is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-2">
                            <p><b>Submitted by</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxSubmitterName" runat="server" CssClass="form-control"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p><b>Date</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxDate" runat="server" CssClass="form-control"></asp:TextBox>
                           
                            <br />
                        </div>
                        <div class="col-sm-2">
                            <p><b>Location</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlLocation" CssClass="form-control" runat="server">
                                <%--<asp:ListItem Value="Hub 1">Hub 1</asp:ListItem>--%>
                            </asp:DropDownList><br />
                        </div>
                        <div class="col-sm-2">
                            <p><b>Classification</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlClassification" CssClass="form-control" runat="server"></asp:DropDownList><br />
                        </div>
                        <div class="col-sm-2">
                            <p><b>Description</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="col-sm-2">
                            <p><b>Memo</b></p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxMemo" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        </div>
                        <div class="col-lg-12">
                            <div class="col-lg-2">
                                <asp:Label ID="lblPhoto" runat="server" Text="Photo" Font-Bold="true" Style="line-height: 50px"></asp:Label>
                            </div>
                            <div class="col-lg-10">
                                <asp:ImageButton ID="imgBtn" runat="server" />
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <p>Upload a new Photo?</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:FileUpload ID="UploadPhoto" CssClass="form-control" runat="server" /><br />
                            <br />
                        </div>
                        <div class="col-sm-12" style="text-align: center">
                            <asp:Button ID="btnUpdate" CssClass="btn btn-success pull-center" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                        </div>
                    </div>
                </div>

                <div class="col-sm-5"></div>

            </div>
        </div>
    </div>
</asp:Content>


