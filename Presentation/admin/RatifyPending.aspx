<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="RatifyPending.aspx.cs" Inherits="Presentation.admin.RatifyPending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="col-md-12">
        <!-- DATA TABLE -->
        <h3 class="title-5 m-b-35">Pending books</h3>
        <form runat="server" method="post" action="RatifyPending.aspx">
        <div class="table-responsive table-responsive-data2">
            <table class="table table-data2">
                <thead>
                    <tr>
                        <th>Cover</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>ISBN</th>
                        <th>Category</th>
                        <th colspan="2">Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                                            
                        <% for (int i= 0;i< PendingList.Count;i++) {
                                Model.Book book = PendingList[i];    %>
                    <tr class="tr-shadow">
                        <td style="vertical-align:middle">
                            <div class="cover-pending"><img  src="<%=book.CoverImg%>" /></div>
                        </td>
                        <td><%=book.Title %></td>
                        <td><%=book.Author %></td>
                        <td><%=book.ISBN1 %></td>
                        <td><%=Categories[i].Name %></td>
                        <td colspan="2">
                            <%=book.Description %>
                        </td>
                                                
                        <td>
                            <div class="table-data-feature">
                                <a href='RatifyPending.aspx?pageId=<%=PageId%>&bookId=<%=book.Id%>&action=approve' class="item">
                                    <i class='fas fa-check' data-placement="top" title="" data-original-title="Approve"></i>
                                </a>
                                <a href='RatifyPending.aspx?pageId=<%=PageId%>&bookId=<%=book.Id%>&action=reject' class="item">
                                    <i class='fas fa-times' data-placement="top" title="" data-original-title="Reject"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                                            
                                           
                </tbody>
            </table>

            <div class="page">

            <% if (TotalPages > 1)
                { %>
            <%for (int i = 1; i <= TotalPages; i++)
                { %>
                <% if (PageId == i)
                    { %>
                    <span class="selected-page"><%= i %></span>
                    <%}
                    else
                    { %>
                    <a class="next-page" href="RatifyPending.aspx?pageId=<%=i %>"><%= i %></a>
                    <%} %>
            <%} %>
            <%} %>
        </div>
        </div>
        </form>
        <!-- END DATA TABLE -->
    </div>
</asp:Content>
