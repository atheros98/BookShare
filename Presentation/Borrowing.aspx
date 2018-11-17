<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="Borrowing.aspx.cs" Inherits="Presentation.Borrowing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/table.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search-nav">
        <span>Filter by: </span>
        <ul class="type-list">
            <% foreach (string type in listQuery)
                { %>
            <li>
                <% if (filter == type)
                    { %>
                <a class="seleted-type" href="<%= string.Format("Borrowing.aspx?filter={0}", type)%>"><%= type %></a>
                <%}
                    else
                    { %>
                <a class="unseleted-type" href="<%= string.Format("Borrowing.aspx?filter={0}", type)%>"><%= type %></a>
                <%} %>
            </li>
            <%} %>
        </ul>
    </div>
    <br /><br />
    <div class ="table-responsive table-responsive-data2">
        <table class="table table-data2">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Book Title</th>
                    <th>Start Date</th>
                    <th>Lender</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <tr class="tr-shadow">
                    <td>1</td>
                    <td>1fdsfsfsdfsafsa fsfsafsdfasfdasfsa</td>
                    <td>1ffffffffffffff ffffffffffff</td>
                    <td>1ffffffffff ffffffff</td>
                    <td>4.5</td>
                </tr>
                <tr class="spacer"></tr>
                <tr class="tr-shadow">
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                    <td>4.5</td>
                </tr>
                <tr class="spacer"></tr>
            </tbody>
        </table>
    </div>

</asp:Content>
