<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/Users.Master" CodeBehind="NewObservation.aspx.cs" Inherits="QHSE.Users.NewObservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New Observation Card</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="placeholder">
            <div class="row">
                <div class="text-center">
                    <h3>Safety Observation card </h3>
                    <h3>安全观察卡</h3>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2">
                            <p>Location 地点:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="validatorLocation" runat="server" ErrorMessage="Please select a vaild location." ForeColor="Red" ControlToValidate="ddlLocation" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                            <br />

                        </div>
                        <div class="col-sm-2">
                            <p>If others, please specify - 其他，请注明:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxOthers" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox><br />
                        <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Classification 分类:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:DropDownList ID="ddlClassification" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlClassification_SelectedIndexChanged">
                                <asp:ListItem Value="Health Issue 与健康有关的问题">Health Issue 与健康有关的问题</asp:ListItem>
                                <asp:ListItem Value="Safety Issue 安全问题">Safety Issue 安全问题</asp:ListItem>
                                <asp:ListItem Value="Environmental Issue 环境问题">Environmental Issue 环境问题</asp:ListItem>
                                <asp:ListItem Value="Near Miss">Near Miss 有惊无险</asp:ListItem>
                                <asp:ListItem Value="Unsafe Condition/Act  不安全状态 /举止">Unsafe Condition/Act  不安全状态 /举止</asp:ListItem>
                                <asp:ListItem Value="Positive observation 正面观察">Positive observation 正面观察</asp:ListItem>
                                <asp:ListItem Value="Suggestion 建议">Suggestion 建议</asp:ListItem>

                            </asp:DropDownList>
                            <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Description 观察描述:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxDescription" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox><br />
                        <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Immediate Action Taken 立即采取的行动:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxImmAction" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Further Actions Suggested  建议采取进一步的行动:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxFurtherAction" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Positive Comment  正面评论:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="tbxComment" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox><br />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please fill in the details for at least one of the following: Description, Immediate Action Taken, Further Actions Suggested, or Positive Comment" OnServerValidate="CustomValidator_ServerValidate" ValidationGroup="ValidationSummary1" ForeColor="#CC0000"></asp:CustomValidator>
                        <br />
                        </div>
                        <div class="col-sm-2">
                            <p>Choose Photo to Upload 上传照片:</p>
                        </div>
                        <div class="col-sm-10">
                            <asp:FileUpload ID="UploadPhoto" CssClass="form-control" runat="server" /><br />
                            <br />
                        </div>
                        <div class="col-sm-12" style="text-align: center">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-success pull-center" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                            <br />
                        </div>
                    </div>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </div>

                <div class="col-sm-5"></div>
            </div>
        </div>
    </div>
</asp:Content>