<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="Lending.aspx.cs" Inherits="Presentation.Lending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/lending.css">
    <link rel="stylesheet" type="text/css" href="css/table.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="search-nav">
            <span>Filter by: </span>
            <ul class="type-list">
                <% foreach (string type in listQuery)
                    { %>
                <li>
                    <% if (filter == type)
                        { %>
                    <a class="seleted-type" href="<%= string.Format("Lending.aspx?filter={0}", type)%>"><%= type %></a>
                    <%}
                        else
                        { %>
                    <a class="unseleted-type" href="<%= string.Format("Lending.aspx?filter={0}", type)%>"><%= type %></a>
                    <%} %>
                </li>
                <%} %>
            </ul>
        </div>
        <br />
        <br />


        <% if (tradings.Count == 0)
            { %>
        <div class="not-found-book">No data</div>
        <%}
            else
            { %>
        <div class="table-responsive table-responsive-data2">
            <table class="table table-data2">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Book Title</th>
                        <th>Start Date</th>
                        <%if (filter != "Available")
                            {%>
                        <%--Delete button--%>
                        <th>Borrower</th>
                        <%}%>
                        
                        <th>Rating</th>

                        <%if (filter == "Available")
                            {%>
                        <%--Delete button--%>
                        <th>Delete</th>
                        <%}
                            else if (filter == "Pending")
                            {%>
                        <%--Approve button--%>
                        <th>Approve</th>
                        <%}%>    
                    </tr>
                </thead>
                <tbody>

                    <% for (int i = 0; i < tradings.Count; i++)
                        { %>
                    <tr class="tr-shadow">
                        <td><%= i + 1 %></td>
                        <td><a href="BookDetail.aspx?id=<%=books[i].Id %>"><%= books[i].Title %></a></td>
                        <td><%= tradings[i].CompletedTime.ToShortDateString()%><br />
                            <%=tradings[i].CompletedTime.ToShortTimeString() %></td>
                        <%if (filter != "Available")
                            { %>
                            <td><a href="Profile.aspx?userid=<%=borrowers[i].Id%>"><%=borrowers[i].FullName %></a></td>
                        <%} %>
                        
                        
                        <td><%if (filter != "Completed")
                                { %>N/A<%}
                                           else
                                           {
                                               if (tradings[i].LenderRatePoint != -1)
                                               {%><%=tradings[i].LenderRatePoint %><%}
                                                                                       else
                                                                                       {%>
                            <div class="table-data-feature">
                                <a href="<%=string.Format("Lending.aspx?filter=Completed&id={0}", i)%>"
                                    <button class="item"><i class="fa fa-thumbs-up"></i></button>
                                </a>
                            </div>
                            <%} %>
                            <%} %>
                        </td>
                        <%--Delete Button--%>
                        <%if (filter == "Available")
                            { %>
                        <%--if Filter = available system will display the delete button--%>
                        <td>
                            <div class="table-data-feature">
                                <div class="btn">
                                    <a href="<%=string.Format("Lending.aspx?filter=Delete&deleteID={0}", tradings[i].Id)%>">
                                    X
                                    </a>
                                </div>
                            </div>
                        </td> 
                        <%} %>
                        <%--Approve Button--%>
                        <%if (filter == "Pending")
                            { %>
                        <%--if Filter = pending system will display the approve button--%>
                        <td>
                            <div class="table-data-feature">
                                <div class="btn">
                                    <a href="<%=string.Format("Lending.aspx?filter=Approve&approveID={0}", tradings[i].Id)%>">
                                    X
                                    </a>
                                </div>
                            </div>
                        </td> 
                        <%} %>
                    </tr>
                    <tr class="spacer"></tr>

                    <%} %>
                </tbody>
            </table>
        </div>
        <%} %>

        <div id="myModal" class="modal" runat="server" visible="false">

            <!-- Modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <asp:LinkButton runat="server" OnClick="CloseRating"> <span class="close">&times;</span></asp:LinkButton>
                    <h2 id="header" runat="server">Rate this user:</h2>
                </div>
                <div class="modal-body">
                    <br />
                    <label id="info" runat="server"></label>
                    <br />
                    <span class="fa fa-star checked" id="star1" onclick="add(this,1)"></span>
                    <span class="fa fa-star" id="star2" onclick="add(this,2)"></span>
                    <span class="fa fa-star" id="star3" onclick="add(this,3)"></span>
                    <span class="fa fa-star" id="star4" onclick="add(this,4)"></span>
                    <span class="fa fa-star" id="star5" onclick="add(this,5)"></span>
                    <br />
                    <br />
                    <br />
                </div>
                <label id="ratepoint" style="display: none" runat="server">1</label>
                <label id="trading" style="display: none" runat="server"></label>
                <div class="modal-footer">
                    <button class="btnRate"><a id="rate" href="<%=string.Format("Lending.aspx?trading={0}&point=1", trading.InnerText) %>">Rate Now</a></button>
                </div>
            </div>
        </div>

        <div class="page">
            <% if (totalPages > 0)
                { %>
            <%for (int i = 1; i < totalPages; i++)
                { %>
            <% if (page == i)
                { %>
            <span class="selected-page"><%= i %></span>
            <%}
                else
                { %>
            <a class="next-page" href="<%= string.Format("Search.aspx?filter={0}&page={1}", filter , i) %>"><%= i %></a>
            <%} %>
            <%} %>
            <%} %>
        </div>
    </form>


    <script>
        // Get the modal
        var modal = document.getElementById('ctl00_ContentPlaceHolder1_myModal');
        var rate = document.getElementById('rate');
        var trading = document.getElementById('ctl00_ContentPlaceHolder1_trading');
        var ratepoint = document.getElementById('ctl00_ContentPlaceHolder1_ratepoint');

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }


        function add(ths, sno) {

            ratepoint.innerHTML = sno;
            rate.href = "Lending.aspx?trading=" + trading.innerText + "&point=" + ratepoint.innerText;

            for (var i = 1; i <= 5; i++) {
                var cur = document.getElementById("star" + i)
                cur.className = "fa fa-star"
            }

            for (var i = 1; i <= sno; i++) {
                var cur = document.getElementById("star" + i)
                if (cur.className == "fa fa-star") {
                    cur.className = "fa fa-star checked"
                }
            }

        }
    </script>

</asp:Content>
