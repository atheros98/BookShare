<%@ Page Title="" Language="C#" MasterPageFile="~/masterForm/MainForm.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookShare.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h3>NEWEST BOOK UPLOAD</h3>
        <section class="section-center">
            <% for (int i = 0; i < tradings.Count; i++)
                {%>
            <div class="new-book">
                <div class="section-center-header">
                    <div class="user">
                        <a href="Profile.aspx?id=<%= tradings[i].getUser.id %>">
                            <img src="<%= rootPath + tradings[i].getUser.avatar %>" />
                            <p><%= tradings[i].getUser.userName %></p>
                        </a>
                    </div>
                    <div class="time">
                        <%= tradings[i].createDate.ToString("dd/MM/yyyy") %>
                    </div>
                </div>
                <div class="book-item">
                    <a href="BookDetails.aspx?id=<%= tradings[i].getBook.id %>" class="book-link">
                        <div class="img">
                            <img src="<%= rootPath+ tradings[i].getBook.getImage %>" alt="" />
                        </div>
                        <div class="book-content">
                            <h2><%= tradings[i].getBook.title %></h2>
                            <pre><%= tradings[i].getBook.author %></pre>
                            <p><%= tradings[i].getBook.description %></p>
                        </div>
                    </a>
                </div>
            </div>
            <%} %>
        </section>
        <div class="page">
            <% if (pages > 1)
                { %>
            <% for (int j = 1; j <= pages; j++)
                { %>
            <% if (j == page)
                { %>
            <span class="selected-page"><%= j %></span>
            <%}
                else
                { %>
            <a class="next-page" href="Home.aspx?page=<%= j %>"><%= j %></a>
            <%} %>
            <%} %>
            <%} %>
        </div>
    </form>
</asp:Content>
