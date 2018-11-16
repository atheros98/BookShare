//Check confirmation password
var check = function () {
    
    var firstPass = document.getElementsByName("psw")[0].value;
    var secondPass = document.getElementsByName("psw-repeat")[0].value;


    if (firstPass == secondPass) {
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'matching';

        document.getElementById('submitBtn').disabled = false;
    } else {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'not matching';

        document.getElementById('submitBtn').disabled = true;
    }
}