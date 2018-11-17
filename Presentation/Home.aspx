<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Presentation.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h3>NEWEST BOOK UPLOAD</h3>
        <section class="section-center">
            <% for (int i = 0; i < Books.Count; i++)
                {%>
            <div class="new-book">
                <div class="section-center-header">
                    <div class="user">
                        <a href="Profile.aspx?userid=<%=Users[i].Id%>" %>
                            <img src="<% = Users[i]!=null?Users[i].Avatar:""%>" />
                            <p><%= Users[i]!=null?Users[i].Username:"" %></p>
                        </a>
                        <span>Ratings: <%= Users[i]!=null?Users[i].UserPoint:0 %></span>
                    </div>
                    <div class="time">
                        <%= Books[i].CreatedTime.ToString("dd/MM/yyyy") %>
                    </div>
                </div>
                <div class="book-item">
                    <a href="BookDetail.aspx?id=<%= Books[i].Id %>" class="book-link">
                        <div class="img">
                            <img src="<%= Books[i].CoverImg %>" alt="" />
                        </div>
                        <div class="book-content">
                            <h2><%= Books[i].Title %></h2>
                            <pre><%= Books[i].Author %></pre>
                            <p><%= Books[i].Description %></p>
                        </div>
                    </a>
                </div>
            </div>
            <%} %>
        </section>
         <div class="page">
        <% if (TotalPages > 1)
            { %>
        <%for (int i = 1; i <= TotalPages; i++)
            { %>
            <% if (PageIndex == i)
                { %>
                <span class="selected-page"><%= i %></span>
                <%}
                else
                { %>
                <a class="next-page" href="Home.aspx?pageIndex=<%=i %>"><%= i %></a>
                <%} %>
        <%} %>
        <%} %>
    </div>

    </form>
</asp:Content>
