<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="TestImageSlideShow.aspx.cs" Inherits="Presentation.TestImageSlideShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/imageSlideShow.css">
    <script type="text/javascript" src="javascript/imageSlideShow.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <!-- Slideshow container -->
        <div class="slideshow-container">

            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <img src="images/bookCover/pic1.jpg" style="width: 100%">
                <div class="text">Caption Text</div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <img src="images/bookCover/pic2.jpg" style="width: 100%">
                <div class="text">Caption Two</div>
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <img src="images/bookCover/pic3.jpg" style="width: 100%">
                <div class="text">Caption Three</div>
            </div>

            <a class="prevImage" onclick="plusSlidesImage(-1)">&#10094;</a>
            <a class="nextImage" onclick="plusSlidesImage(1)">&#10095;</a>

        </div>
        <br>

        <div style="text-align: center">
            <span class="dot" onclick="currentSlideImage(1)"></span>
            <span class="dot" onclick="currentSlideImage(2)"></span>
            <span class="dot" onclick="currentSlideImage(3)"></span>
        </div>
    </div>

    <script>
        
    </script>
</asp:Content>
