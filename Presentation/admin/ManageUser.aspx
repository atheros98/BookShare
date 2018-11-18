<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="Presentation.admin.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="col-md-12">
        <!-- DATA TABLE -->
        <h3 class="title-5 m-b-35">Users</h3>
        <form runat="server" method="post" action="RatifyPending.aspx">
        <div class="table-responsive table-responsive-data2">
            <table class="table table-data2">
                <thead>
                    <tr>
                        <th>Avatar</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone number</th>
                        <th colspan="2">Address</th>
                        <th>Ratings</th>
                    </tr>
                </thead>
                <tbody>
                                            
                        <% for (int i= 0;i< Users.Count;i++) {
                                Model.User user = Users[i];    %>
                    <tr class="tr-shadow">
                        <td style="vertical-align:middle">
                            <div class="cover-pending"><img  src="<%=user.Avatar%>" /></div>
                        </td>
                        <td><%=user.FullName %></td>
                        <td><%=user.Username %></td>
                        <td><%=user.Email %></td>
                        <td><%=user.PhoneNum %></td>
                        <td colspan="2">
                            <%=user.Address %>
                        </td>
                        <td><%=user.UserPoint %></td>                   
                        <td>
                            <div class="table-data-feature">
                                <a href='ManageUser.aspx?pageId=<%=PageId%>&userid=<%=user.Id%>' class="item">
                                    <i class='fas fa-trash-alt' data-placement="top" title="" data-original-title="Reject"></i>
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
                    <a class="next-page" href="ManageUser.aspx?pageId=<%=i %>"><%= i %></a>
                    <%} %>
            <%} %>
            <%} %>
        </div>
        </div>
        </form>
        <!-- END DATA TABLE -->
    </div>
</asp:Content>
