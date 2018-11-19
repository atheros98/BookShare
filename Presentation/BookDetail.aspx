<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="Presentation.BookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/bookDetail.css">
    <link rel="stylesheet" type="text/css" href="css/imageSlideShow.css">
    <%
        int count = 0;
    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div>
            <%--Use for index button borrow--%>
            <input type="hidden" id="pointerId" name="pointerId" value="0"/>
            <%--===========================--%>
            <div class="book-title">
                <h2><%=book.Title%></h2>
            </div>
            <%--Show ratings stars--%>
            <div class="rate-book">
                <div class="rate">
                    <select id="rate">
                        <option value="1">1 Star</option>
                        <option value="2">2 Star</option>
                        <option value="3" selected>3 Star</option>
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
                <img src="<%=book.CoverImg %>" />
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
            <%--                                             LENDERS                                                   --%>
            <%--List of all available tradings--%>
            <div class="title-upload" style="background: #F9F7F4;">
                <i class="fas fa-info"><b>List of lenders</b></i>
                <div style="clear: both;">
                </div>

                <%--Using slider to display all the tradings'details--%>
                <% for (int i = 0; i < tradings.Count; i++)
                    { %>
                <div class="slides-container">
                    <%--Slide show for trading images--%>

                    <div class="slide-container-block">
                        <%--Image slideShow--%>
                        <%for (int j = 0; j < tradings[i].TradedImages.Count; j++)
                            { %>
                        <!-- Slideshow container -->
                        <div class="slideshow-container">
                            <div class="mySlides fade">
                                <div class="numbertext"><%=j+1 %> / <%=tradings[i].TradedImages.Count %></div>
                                <img src="<%=tradings[i].TradedImages[j]%>" style="width: 200px" />
                            </div>
                            <%--<a class="prevImage" onclick="plusSlidesImage(-1)">&#10094;</a>
                    <a class="nextImage" onclick="plusSlidesImage(1)">&#10095;</a>--%>
                        </div>
                        <br>
                        <%}%>
                        <div style="text-align: center">
                            <%int prevSlider = 0;
                                for (int j = 0; j < tradings[i].TradedImages.Count; j++)
                                {
                            %>
                            <%--Count number of the previous slider--%>
                            <%if (i == 0)
                                {
                                    prevSlider = 0;
                            %>
                            <%}
                                else
                                {
                                    prevSlider = tradings[i - 1].TradedImages.Count;
                                }
                            %>
                            <span class="dot" onclick="currentSlideImage(<%=prevSlider + j + 1%>)"></span>
                            <%}%>
                        </div>

                    </div>
                    <%--//////////////////////////////////////////////////////////////////////////--%>
                    <div class="info-book">
                        <%--Lenders'name + borrow button info--%>
                        <div class="elements">
                            <%--Lenders'name--%>
                            <div class="title trading"><i class="fas fa-user"></i>Name</div>
                            <div class="input-trading">
                                <a href="Profile.aspx?id=<%= lenders[i].Id%>">
                                    <input type="text" value="<%=lenders[i].FullName%>" readonly="" /></a>
                            </div>
                            <%--Trading id--%>
                            <div class="borrow-book">
                                <%--<input type="hidden" value="<%=  %>" name="tradingId" />--%>
                                <asp:Button ID="submitBtn" runat="server" OnClick="borrowBtn_Click" Text="Borrow" />
                            </div>
                        </div>
                        <%--Book info--%>
                        <div class="elements">
                            <%--Book--%>
                            <div class="title"><i class="fas fa-envelope"></i>Description</div>
                            <div class="input">
                                <input type="text" name="description" value="<%=tradings[i].Description%>" readonly="" />
                            </div>
                        </div>
                        <%--Email info--%>
                        <div class="elements">
                            <%--Email--%>
                            <div class="title"><i class="fas fa-envelope"></i>Email</div>
                            <div class="input">
                                <input type="email" name="email" value="<%=lenders[i].Email%>" readonly="" />
                            </div>
                        </div>
                        <%--Lenders' address info--%>
                        <div class="elements">
                            <%--Lenders' address--%>
                            <div class="title"><i class="fas fa-address-card"></i>Address</div>
                            <div class="input">
                                <input type="text" value="<%= lenders[i].Address %>" readonly="" />
                            </div>
                        </div>
                        <%--Phone number info--%>
                        <div class="elements">
                            <%--Phone number--%>
                            <div class="title"><i class="fas fa-phone-square"></i>Phone number</div>
                            <div class="input">
                                <input type="text" value="<%= lenders[i].PhoneNum %>" readonly="" />
                            </div>
                        </div>
                        <%--Link facebook info--%>
                        <div class="elements">
                            <%--Link facebook--%>
                            <div class="title"><i class="fab fa-facebook"></i>Facebook</div>
                            <div class="input">
                                <input type="text" value="<%=lenders[i].LinkFacebook %>" readonly="" />
                            </div>
                        </div>
                        <%--Upload time info--%>
                        <div class="elements">
                            <div class="title"><i class="fa fa-calendar"></i>Upload date</div>
                            <div class="input">
                                <input type="text" value="<%= tradings[i].CompletedTime%>" readonly="" />
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                <div class="indicator">
                    <button id="prev" onclick="plusSlides(-1)">&#10094; Prev</button>
                    <button id="next" onclick="plusSlides(1)">Next &#10095;</button>
                </div>
            </div>
            <%--End the list of lenders--%>
        </div>
    </form>

    <script>
        //Lenders slideShow
        var slideIndex = 0;
        showSlides(slideIndex);

        //Use for both lenders
        function plusSlides(n) {
            showSlides(slideIndex += n);
            document.getElementById("pointerId").value = slideIndex;
            console.log(document.getElementById("pointerId").value);
        }
        //Used for lenders
        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("slides-container");
            var length = slides.length;


            var prev = document.getElementById("prev");
            var next = document.getElementById("next");
            //Check range for next and prev button
            if (length == 0) {
                next.disabled = true;
                prev.disabled = true;
            } else {
                if (n === length - 1) {
                    next.disabled = true;

                } else {
                    next.disabled = false;
                }
                if (n === 0) {
                    prev.disabled = true;
                } else {
                    prev.disabled = false;
                }
            }
            
            //Hide all lenders
            for (i = 0; i < length; i++) {

                slides[i].style.display = "none";
            }
            //Show the current lender
            slides[slideIndex].style.display = "block";
        }

        //====================================================================================


        //====================================================================================
        //Image slideShow
        var slideIndexImage = 1;
        showSlidesImage(slideIndexImage);

        // Next/previous controls
        function plusSlidesImage(n) {
            showSlidesImage(slideIndexImage += n);
        }

        // Thumbnail image controls
        function currentSlideImage(n) {
            showSlidesImage(slideIndexImage = n);
        }

        function showSlidesImage(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            console.log(slides.length);
            console.log("current slide: " + n);
            //if (n > slides.length)
            //{
            //    slideIndexImage = 1
            //}
            //if (n < 1)
            //{
            //    slideIndexImage = slides.length
            //}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndexImage - 1].style.display = "block";
            dots[slideIndexImage - 1].className += " active";
        }
    </script>
</asp:Content>
