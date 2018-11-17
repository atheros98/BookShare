<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Presentation.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" media="screen" href="css/uploadbook.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Profile</h3>
    <form runat="server">
        <div class="avatar">
            <img src="<%= Request.ApplicationPath + ViewedUser.Avatar %>" alt="avatar" />
            <% if (!ReadOnly)
                { %>
            <asp:FileUpload ID="avatar" accept="image/png, image/jpeg" runat="server" />
            <asp:Label ID="errorUpload" class="error-message" runat="server" Text=""></asp:Label>
            <asp:Button ID="uploadAvatar" runat="server" Text="Change"  />
            <%} %>
        </div>
    </form>
    <div class="info">
        <input class="fullname" type="text" id="fullname" placeholder="Full name" value="<%= ViewedUser.FullName%>" required="" />
        <p>Create Date: <%= ViewedUser.CreatedDate.ToString("MM/dd/yyyy") %></p>
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
        <div class="info-book">
            <div class="elements">
                <div class="title"><i class="fas fa-birthday-cake"></i>Birthday</div>
                <div class="input">
                    <input type="text" id="datepicker" value="<%= ViewedUser.Dob.ToString("MM/dd/yyyy") %>" required="required" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-user"></i>Username</div>
                <div class="input">
                    <input type="text" id="username" placeholder="Username" value="<%= ViewedUser.Username %>" disabled="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-envelope"></i>Email</div>
                <div class="input">
                    <input type="text" id="email" placeholder="Email" value="<%= ViewedUser.Email %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-address-card"></i>Address</div>
                <div class="input">
                    <input type="text" id="address" placeholder="Address" value="<%= ViewedUser.Address %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-mobile"></i>Phone</div>
                <div class="input">
                    <input type="text" id="phonenumber" placeholder="Phone number" value="<%= ViewedUser.PhoneNum %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fab fa-facebook-square"></i>Facebook</div>
                <div class="input">
                    <input type="text" id="linkfacebook" placeholder="Link facebook" value="<%= ViewedUser.LinkFacebook %>" required="" />
                </div>
            </div>
            <% if (!ReadOnly)
                { %>
            <div class="submit-info">
                <button type="submit">Change Information</button>
            </div>
            <%} %>
        </div>
    </div>
    <div class="book-recently">
        <h1>Top recently book's user</h1>
        <div class="items">
            <aside>
                <h3>How to Win Friends and Influence People</h3>
                <p>Create Date: 22/07/2018</p>
                <img src="img/CoverBook.jpg" />
            </aside>
            <aside>
                <h3>How to Win Friends and Influence People</h3>
                <p>Create Date: 22/07/2018</p>
                <img src="img/CoverBook.jpg" />
            </aside>
        </div>
    </div>
    <script>
        $(function () {
            $("#datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
        $(document).on('click', '.submit-info button', function () {
            $.ajax({
                url: "http://localhost:40621/UserService.asmx/upadteInformation",
                contentType: 'application/json',
                data: {
                    idUser: <%= ViewedUser.Id %>,
                    fullname: JSON.stringify(document.getElementById("fullname").value),
                    birthday: JSON.stringify(document.getElementById("datepicker").value),
                    email: JSON.stringify(document.getElementById("email").value),
                    address: JSON.stringify(document.getElementById("address").value),
                    phone: JSON.stringify(document.getElementById("phonenumber").value),
                    linkFacebook: JSON.stringify(document.getElementById("linkfacebook").value)
                },
                method: 'get',
                success: function (data) {
                    console.log(data.d);
                    location.reload();
                },
                error: function () {
                    alert('error');
                }
            });
        });
    </script>
</asp:Content>
