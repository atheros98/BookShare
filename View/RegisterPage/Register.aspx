<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="View.Register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="register.css">
    <script type="text/javascript" src="dateProcessing.js"></script>
</head>
<body>
    <form action="/Register">
        <div class="content-wrapper">

            <div class="container">
                <h1>Register</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>

                <label for="name"><b>Full Name</b></label>
                <input type="text" placeholder="Enter FullName" name="fullName" required />

                <label for="DOB"><b>DOB</b></label>
                <br />
                <input id="birthDay" type="date"  name="birthDay" onchange="TDate()" required />
                <br />

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" required />

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required />

                <label for="psw-repeat"><b>Repeat Password</b></label>
                <input type="password" placeholder="Repeat Password" name="psw-repeat" required />
                <hr>
                <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

                <button type="submit" class="registerbtn">Register</button>
            </div>

            <div class="container signin">
                <p>Already have an account? <a href="#">Sign in</a>.</p>
            </div>
        </div>

    </form>
    <script>
        /*Display default date is the current date*/
        getCurrentDate();
        /*Set the max date value to Today*/
        setMaxDate();
    </script>


</body>
</html>
