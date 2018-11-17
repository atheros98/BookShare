showSlides(slideIndex);
function plusSlides(n) {
    showSlides(slideIndex += n);
}
function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("info-book");
    var length = slides.length;

    console.log(slideIndex);
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    //Check range for next and prev button
    if (n === length - 1) {
        next.disabled = true;

    } else {
        next.disabled = false;
    }
    if (n === 1) {
        prev.disabled = true;
    } else {
        prev.disabled = false;
    }
    //Hide all lenders
    for (i = 1; i < length; i++) {

        slides[i].style.display = "none";
    }
    //Show the current lender
    console.log(slideIndex);
    slides[slideIndex].style.display = "block";
}