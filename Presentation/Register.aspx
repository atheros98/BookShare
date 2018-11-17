<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Presentation.Register" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
    <script type="text/javascript" src="javascript/dateProcessing.js"></script>
    <script type="text/javascript" src="javascript/checkPassword.js"></script>

</head>
<body>
    <form runat="server">
        <div class="content-wrapper">
            <div class="container">
                <h1>Register</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>
                <%--Input name--%>
                <label for="name"><b>Full Name</b></label>
                <input type="text" placeholder="Enter Full Name" name="fullName" required />
                <%--Input DOB--%>
                <label for="DOB"><b>DOB</b></label>
                <br />
                <input id="birthDay" type="date"  name="birthDay" onchange="TDate()" required />
                <br />
                <%--Input Email--%>
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" required />
                <%--Input Username--%>
                <label for="username"><b>User Name</b></label>
                <input type="text" placeholder="Enter User Name" name="userName" required />
                <%--Input password--%>
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required />
                <%--Confirm password--%>
                <label for="psw-repeat"><b>Repeat Password</b></label>
                <input type="password" placeholder="Repeat Password" name="psw-repeat" onkeyup="check();" required />
                <span id='message'></span>
                <hr>

                <%--<%--Input Address--%>
                <label for="address"><b>Address</b></label>
                <input type="text" placeholder="Enter Address" name="address" />
                <%--Input Phone Number--%>
                <label for="phoneNum"><b>Phone Number</b></label>
                <input type="text" placeholder="Enter Phone Number" name="phoneNum" />
                <%--Input Link Facebook--%>
                <label for="facebook"><b>Facebook</b></label>
                <input type="text" placeholder="Enter Facebook" name="facebook" />
                <asp:Label ID="Label1" CssClass="confirm-msg" Text="" runat="server"/>
                <%--Terms and Privacy--%>
                <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

                <asp:Button cssclass="registerbtn" id="submitBtn" runat="server" OnClick="submitBtn_Click" Text="Register"/>
            </div>

            <div class="container signin">
                <p>Already have an account? <a href="Login.aspx">Sign in</a>.</p>
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
