//showSlides(slideIndex);
//showSlidesBlock(slideIndex);
function plusSlides(n) {
    showSlidesBlock(slideIndex += n);
    showSlides(slideIndex += n);
}
//Used for lenders
function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("info-book");
    var length = slides.length;

    console.log("here1:" + slides.length);
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
    slides[slideIndex].style.display = "block";
}
//Used for slide-image-block
//Put in this file because two this function use the same prev and next button to change
function showSlidesBlock(n) {
    
    var iII;
    var slidesII = document.getElementsByClassName("slide-container-block");
    var lengthII = slidesII.length - 1;

    console.log("here2:" + slidesII.length);
    //var prevII = document.getElementById("prev");
    //var nextII = document.getElementById("next");
    //Check range for next and prev button
    //if (n === length - 1) {
    //    next.disabled = true;

    //} else {
    //    next.disabled = false;
    //}
    //if (n === 1) {
    //    prev.disabled = true;
    //} else {
    //    prev.disabled = false;
    //}
    //Hide all lenders
    for (iII = 0; iII < length; iII++) {
        slidesII[iII].style.display = "none";
    }
    //Show the current lender
    slidesII[slideIndex].style.display = "block";
}