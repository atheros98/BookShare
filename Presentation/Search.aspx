<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Presentation.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Result for "<%= Request.QueryString["query"] %>":</h3>
    <div class="search-nav">
        <span>Find by: </span>
        <ul class="type-list">
            <% foreach (string type in listQuery)
                { %>
            <li>
                <% if (filter == type)
                    { %>
                <a class="seleted-type" href="<%= string.Format("Search.aspx?query={0}&filter={1}",Request.QueryString["query"], type)%>"><%= type %></a>
                <%}
                    else
                    { %>
                <a class="unseleted-type" href="<%= string.Format("Search.aspx?query={0}&filter={1}",Request.QueryString["query"], type)%>"><%= type %></a>
                <%} %>
            </li>
            <%} %>
        </ul>
    </div>
    <section class="section-center">
        <% for (int j = 0; j < books.Count; j++)
            { %>
        <div class="book-item">
            <a href="BookDetails.aspx?id=<%= books[j].Id %>">
                <div class="img">
                    <img src="./images/bookCover/<%=books[j].CoverImg%>" />
                </div>
                <div class="book-content">
                    <h2><%= books[j].Title %></h2>
                    <pre><%= books[j].Author %></pre>
                    <p><%= books[j].Description %></p>
                </div>
            </a>
        </div>
        <%} %>
        <% if (books.Count == 0)
            { %>
        <div class="not-found-book">
            Book not found
        </div>
        <%} %>
    </section>
    <div class="page">
        <% if (totalPage > 1)
            { %>
        <%for (int i = 1; i < totalPage; i++)
            { %>
        <% if (page == i)
            { %>
        <span class="selected-page"><%= i %></span>
        <%}
            else
            { %>
        <a class="next-page" href="<%= string.Format("Search.aspx?query={0}&filter={1}&page={2}", Request.QueryString["query"], filter , i) %>"><%= i %></a>
        <%} %>
        <%} %>
        <%} %>
    </div>
</asp:Content>
