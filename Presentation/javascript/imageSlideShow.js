
var slideIndexImage = 1;
showSlidesImage(slideIndexImage);

function plusSlidesImage(n) {
    showSlidesImage(slideIndexImage += n);
}

function currentSlideImage(n) {
    showSlidesImage(slideIndexImage = n);
}

function showSlidesImage(n) {
    console.log(n);
    
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    //Log using for debugging
    console.log("slide length: " + slides.length);
    //Check range of slide
    if (n > slides.length)
    {
        slideIndexImage = 1
    }
    if (n < 1)
    {
        slideIndexImage = slides.length - 1
    }
    //Hide all images and dots
    for (i = 0; i < slides.length; i++)
    {
        slides[i].style.display = "none";  
    }
    for (i = 0; i < dots.length; i++)
    {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    //Display the current image and highlight the current block
    slides[slideIndexImage - 1].style.display = "block";
    dots[slideIndexImage - 1].className += " active";
}
