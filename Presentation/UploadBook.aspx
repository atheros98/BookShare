<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="UploadBook.aspx.cs" Inherits="Presentation.UploadBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" media="screen" href="css/uploadbook.css" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-upload">
        <i class="fas fa-plus-square"><b>Book information</b></i>
    </div>
    <form id="uploadBook" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="info-book">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="elements">
                        <div class="title"><i class="fas fa-barcode"></i>ISBN</div>
                        <div class="input">
                            <asp:TextBox ID="isbn" runat="server" AutoPostBack="true" Width="100%" autocomplete="off" placeholder="ISBN" OnTextChanged="isbn_TextChanged"></asp:TextBox>
                            <input id="idBookTxt" type="hidden" runat="server" />
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <img src="img/loader.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                    </div>
                    <div class="elements">
                        <div class="title"><i class="fas fa-file-signature"></i>Title</div>
                        <div class="input">
                            <input id="title" type="text" placeholder="Title Book" required="" runat="server" />
                        </div>
                    </div>
                    <div class="elements">
                        <div class="title"><i class="fas fa-user-tie"></i>Author</div>
                        <div class="input">
                            <input id="author" type="text" placeholder="Author Book" required="" runat="server" />
                        </div>
                    </div>

                    <div class="elements">
                        <div class="title"><i class="fas fa-image"></i>Cover</div>
                        <div class="input">
                            <asp:Image ID="image" Visible ="false" runat="server" Width="100px"/>
                            <asp:FileUpload ID="FileUpload1" runat="server" accept="image/png, image/jpeg" required="" />
                        </div>
                    </div>
                    <div class="elements">
                        <div class="title"><i class="fas fa-tags"></i>Category</div>
                        <div class="input">
                            <asp:DropDownList ID="cate" runat="server"> 
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="elements">
                        <div class="title"><i class="fas fa-language"></i>Language</div>
                        <div class="input">
                            <input id="language" type="text" placeholder="Language Book" required="" runat="server" />
                        </div>
                    </div>
                    <div class="elements">
                        <div class="title"><i class="fas fa-pen"></i>Description</div>
                        <div class="input">
                            <textarea id="description" placeholder="Description" required="required" style="border: none;" runat="server"></textarea>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="title-upload">
            <i class="fas fa-info"><b>Trading information</b></i>
        </div>
        <div class="info-book">
            <div class="elements">
                <div class="title"><i class="fas fa-images"></i>Book images</div>
                <div class="input">
                    <asp:FileUpload ID="FileUpload2" runat="server" accept="image/png, image/jpeg" AllowMultiple="true" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-address-card"></i>Book condition</div>
                <div class="input">
                    <textarea id="Textarea1" placeholder="Description" required="required" style="border: none;" runat="server"></textarea>
                </div>
            </div>
            <div class="elements" style="border: none;">
                <div class="title"><i class="fas fa-gavel"></i>Rules</div>
                <div class="input">
                    <textarea rows="6" cols="50" name="rules" readonly="readonly"></textarea><br />
                    <div class="check-rules">
                        <asp:CheckBox ID="checkRules" runat="server" required="" />I have read, and agree to abide by the bookshare.com website rules.
                    </div>
                </div>
            </div>
        </div>
        <div class="uploadBtn">
            <asp:Button ID="uploadBtn" runat="server" Text="Upload" disabled="" />
        </div>
    </form>
    <script>
        document.getElementById("ctl00_ContentPlaceHolder1_checkRules").addEventListener("change", function () {
            document.getElementById("ctl00_ContentPlaceHolder1_uploadBtn").disabled = !this.checked;
            var check = $("#ctl00_ContentPlaceHolder1_title").is('[disabled=disabled]');
            if (check == true) $(".upload-image input").attr('disabled', 'disabled');
            else $(".upload-image input").attr('disabled', false);
        });
    </script>
</asp:Content>
