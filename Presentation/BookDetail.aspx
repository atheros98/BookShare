<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="Presentation.BookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/bookDetail.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="book-title">
        <h2><%=book.Title %></h2>
    </div>
    <div class="rate-book">
        <div class="rate">
            <select id="rate">
                <option value="1">1 Star</option>
                <option value="2">2 Star</option>
                <option value="3">3 Star</option>
                <option value="4">4 Star</option>
                <option value="5">5 Star</option>
            </select>
            <div id="star">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
            </div>
        </div>
    </div>
    <%--Book Cover--%>
    <%--List all the covers of book--%>
    <div class="cover-book">
        <% for (int c = 0; c < 1; c++)
            { %>
        <img src="images/bookCover/pic1.jpg" />
        <%} %>
    </div>
    <%--Book info--%>
    <div class="info-book">
        <div class="scrollhere"></div>
        <%--ISBN--%>
        <div class="elements">
            <div class="title"><i class="fas fa-barcode"></i>ISBN</div>
            <div class="input">
                <input type="number" value="<%=book.ISBN1 %>" readonly="readonly" />
            </div>
        </div>
        <%--Title--%>
        <div class="elements">
            <div class="title"><i class="fas fa-file-signature"></i>Title</div>
            <div class="input">
                <input id="title" type="text" value="<%=book.Title %>" readonly="readonly" />
            </div>
        </div>
        <%--Author--%>
        <div class="elements">
            <div class="title"><i class="fas fa-user-tie"></i>Author</div>
            <div class="input">
                <input id="author" type="text" value="<%=book.Author %>" readonly="readonly" />
            </div>
        </div>
        <%--Tag--%>
        <div class="elements">
            <div class="title"><i class="fas fa-tags"></i>Tag</div>
            <div class="input">
                <input id="tag" type="text" value="<%=book.Title %>" readonly="readonly" />
            </div>
        </div>
        <%--Language--%>
        <div class="elements">
            <div class="title"><i class="fas fa-language"></i>Language</div>
            <div class="input">
                <input id="language" type="text" value="<%=book.Language %>" readonly="readonly" />
            </div>
        </div>
        <%--Description--%>
        <div class="elements">
            <div class="title"><i class="fas fa-pen"></i>Description</div>
            <div class="input">
                <textarea id="description" readonly="readonly" style="border: none;"><%=book.Description %></textarea>
            </div>
        </div>
    </div>

    <%--List of all available lenders--%>
    <div class="title-upload" style="background: #F9F7F4;">
        <i class="fas fa-info"><b>List of lenders</b></i>
        <div style="clear: both;">
        </div>
        <div class="slides-container">
            <% for (int i = 0; i < lenders.Count; i++)
                { %>
            <div class="info-book">
                <%--First info--%>
                <div class="elements">
                    <%--Lenders'name--%>
                    <div class="title trading"><i class="fas fa-user"></i>Name</div>
                    <div class="input-trading">
                        <a href="Profile.aspx?id=<%= lenders[i].Id%>">
                            <input type="text" value="<%=lenders[i].FullName%>" readonly="" /></a>
                    </div>
                    <%--Trading id--%>
                    <div class="borrow-book">
                        <input type="button" value="Borrow" data-idtrading="<%= tradings[i].id %>" />
                    </div>
                </div>
                <%--Second info--%>
                <div class="elements">
                    <%--Email--%>
                    <div class="title"><i class="fas fa-envelope"></i>Email</div>
                    <div class="input">
                        <input type="email" name="email" value="<%=lenders[i].Email%>" readonly="" />
                    </div>
                </div>
                <%--Third info--%>
                <div class="elements">
                    <%--Lenders' address--%>
                    <div class="title"><i class="fas fa-address-card"></i>Address</div>
                    <div class="input">
                        <input type="text" value="<%= lenders[i].Address %>" readonly="" />
                    </div>
                </div>
                <%--Fourth info--%>
                <div class="elements">
                    <%--Phone number--%>
                    <div class="title"><i class="fas fa-phone-square"></i>Phone number</div>
                    <div class="input">
                        <input type="text" value="<%= lenders[i].PhoneNum %>" readonly="" />
                    </div>
                </div>
                <%--Fifth info--%>
                <div class="elements">
                    <%--Link facebook--%>
                    <div class="title"><i class="fab fa-facebook"></i>Facebook</div>
                    <div class="input">
                        <input type="text" value="<%=lenders[i].LinkFacebook %>" readonly="" />
                    </div>
                </div>
                <%--Final info--%>
                <div class="elements">
                    <div class="title"><i class="fa fa-calendar"></i>Upload date</div>
                    <div class="input">
                        <input type="text" value="<%= lenders[i].CreatedDate%>" readonly="" />
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <div class="indicator">
            <button id="prev" onclick="plusSlides(-1)">&#10094; Prev</button>
            <button id="next" onclick="plusSlides(1)">Next &#10095;</button>
        </div>
    </div>
    <%--End the list of lenders--%> 
</asp:Content>
