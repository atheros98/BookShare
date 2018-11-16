/*Get Current date*/
function getCurrentDate() {
    document.getElementById('birthDay').valueAsDate = new Date();
}

/*Set Max date to Today*/
function setMaxDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("birthDay").setAttribute("max", today);
}

/*Set Max date to Today*/
function TDate() {
    var UserDate = document.getElementById("birthDay").value;
    var ToDate = new Date();

    if (new Date(UserDate).getTime() > ToDate.getTime()) {
        alert("The Date must be Sonner or Equal to today date");
        document.getElementById("birthDay").valueAsDate = new Date();

        return false;
    }
    return true;
}