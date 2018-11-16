<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="Presentation.BookDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div>
            <%--Super Big Title--%>
            <%=book.Title %>
        </div>
        <div>
            <%--Author--%>
            <%=book.Author %>
        </div>
        <div>
            <%--Contain cover image--%>
            <img src="" alt="Cover" width="100" height="100">
        </div>
        <div>
            <%--ISBN+Ratings--%>
        </div>
        <div>
            <%--Contain Book description--%>
        </div>
    </div>
</asp:Content>
