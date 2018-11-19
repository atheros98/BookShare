<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="DashboardStatistics.aspx.cs" Inherits="Presentation.admin.DashboardStatistics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="row m-t-25">

        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c1">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="zmdi zmdi-account-o"></i>
                        </div>
                        <div class="text">
                            <h2><%=UserNum %></h2>
                            <span>Total Members</span>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c2">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="fas fa-bookmark"></i>
                        </div>
                        <div class="text">
                            <h2><%=TotalAccepted %></h2>
                            <span>Total accepted books</span>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c3">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="text">
                            <h2><%=TotalPendings%></h2>
                            <span>Total pending books</span>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="overview-item overview-item--c4">
                <div class="overview__inner">
                    <div class="overview-box clearfix">
                        <div class="icon">
                            <i class="fas fa-share-square"></i>
                        </div>
                        <div class="text">
                            <h2><%=N_LastestAvailableTradings %></h2>
                            <span>Available tradings</span>
                        </div>
                    </div>
                                        
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <!-- DATA TABLE -->
        <h3 class="title-5 m-b-35">Users</h3>
        <form runat="server" method="post" action="RatifyPending.aspx">
        <div class="table-responsive table-responsive-data2">
            <table class="table table-data2">
                <thead>
                    <tr>
                        <th>Lender Username</th>
                        <th>Borrower Username</th>
                        <th>Book</th>
                        <th>Status</th>
                        <th>Commited Time</th>
                        <th colspan="2">Description</th>
                        <th>Ratings</th>
                    </tr>
                </thead>
                <tbody>
                                            
                        <% for (int i= 0;i< LastestCompletedTradings.Count;i++) {
                                Model.Trading trading = LastestCompletedTradings[i];    %>
                    <tr class="tr-shadow">
                        <td style="vertical-align:middle">
                            <%=Lenders[i].Username %>
                        </td>
                        <td><%=Borrowers[i]!=null?Borrowers[i].Username:"Not yet" %></td>
                        <td><%=Books[i].Title %></td>
                        <%if (trading.TradingStatus == Model.Trading.STATUS_AVAILABLE)
                            { %>
                            <td><span style="color:green">Available</span></td>
                        <%}
                        else if (trading.TradingStatus == Model.Trading.STATUS_LENDING)
                        { %>
                            <td><span style="color:blue">Lending</span></td>
                                            <%}
                        else if (trading.TradingStatus == Model.Trading.STATUS_PENDING)
                        { %>
                            <td><span style="color:sandybrown">Pending</span></td>
                                            <%}
                        else
                        { %>
                            <td><span style="color:black">Completed</span></td>
                        <%} %>
                        <td><%=trading.TradingStatus %></td>
                        <td><%=trading.CompletedTime %></td>
                        <td colspan="2">
                            <%=trading.Description %>
                        </td>
                        
                    </tr>
                    <% } %>
                                            
                                           
                </tbody>
            </table>

        </div>
        </form>
        <!-- END DATA TABLE -->
    </div>
</asp:Content>
