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
            <img id="ava_img" src="<%= ViewedUser.Avatar %>" alt="avatar" />
            <asp:FileUpload ID="avatar" accept="image/png, image/jpeg" runat="server"  onchange="loadFile(event)"/>
            <asp:Label ID="errorUpload" class="error-message" runat="server" Text="" ></asp:Label>
            <asp:Button ID="uploadAvatar" runat="server" Text="Change" onclick="uploadAvatar_Click"/>
        </div>
    </form>
     

    <% if (!ReadOnly)
        { %>
    <div class="info">
        <form action="Profile.aspx" method="post">
        <input class="fullname" type="text" name="fullname" placeholder="Full name" value="<%= ViewedUser.FullName%>" required="" />
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
                    <input type="date"  name="datepicker" value="<%= ViewedUser.Dob.ToString("yyyy-MM-dd") %>" required="required" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-user"></i>Username</div>
                <div class="input">
                    <input type="text" name="username" placeholder="Username" value="<%= ViewedUser.Username %>" disabled="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-envelope"></i>Email</div>
                <div class="input">
                    <input type="email" name="email" placeholder="Email" value="<%= ViewedUser.Email %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-address-card"></i>Address</div>
                <div class="input">
                    <input type="text" name="address" placeholder="Address" value="<%= ViewedUser.Address %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-mobile"></i>Phone</div>
                <div class="input">
                    <input type="number" name="phonenumber" placeholder="Phone number" value="<%= ViewedUser.PhoneNum %>" required="" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fab fa-facebook-square"></i>Facebook</div>
                <div class="input">
                    <input type="url" name="linkfacebook" placeholder="Link facebook" value="<%= ViewedUser.LinkFacebook %>" required="" />
                </div>
            </div>
            
            <asp:Label ID="updateInfomer"  runat="server" BackColor="White"></asp:Label>
            <div class="submit-info">
                <button type="submit">Change Information</button>
            </div>
            
            </div>
            </form>
        </div>
            <%} else { %>
                <div class="info">
        <input class="fullname" type="text" name="fullname" placeholder="Full name" value="<%= ViewedUser.FullName%>" required="" disabled="disabled"/>
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
                    <input type="text" id="datepicker" value="<%= ViewedUser.Dob.ToString("MM/dd/yyyy") %>"  disabled="disabled"/>
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-user"></i>Username</div>
                <div class="input">
                    <input type="text" id="username" placeholder="Username" value="<%= ViewedUser.Username %>" disabled="disabled" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-envelope"></i>Email</div>
                <div class="input">
                    <input type="email" id="email" placeholder="Email" value="<%= ViewedUser.Email %>" disabled="disabled" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-address-card"></i>Address</div>
                <div class="input">
                    <input type="text" id="address" placeholder="Address" value="<%= ViewedUser.Address %>" disabled="disabled" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fas fa-mobile"></i>Phone</div>
                <div class="input">
                    <input type="number" id="phonenumber" placeholder="Phone number" value="<%= ViewedUser.PhoneNum %>" disabled="disabled" />
                </div>
            </div>
            <div class="elements">
                <div class="title"><i class="fab fa-facebook-square"></i>Facebook</div>
                <div class="input">
                    <input type="text" id="linkfacebook" placeholder="Link facebook" value="<%= ViewedUser.LinkFacebook %>" disabled="disabled" />
                </div>
            </div>
            
            </div>
        </div>
            <% } %>
  
    <div class="book-recently">
        <h1>Top recently book's user</h1>
        <div class="items">
            <%foreach (Model.Book book in RecentBooks) { %>
            <aside>
                <h3><%=book.Title %></h3>
                <p><%=book.Author %></p>
                <img src="<%=book.CoverImg %>" />
            </aside>
            <%} %>
           
        </div>
    </div>
    <script>
        var loadFile = function (event) {
            var output = document.getElementById('ava_img');
            output.src = URL.createObjectURL(event.target.files[0]);
        };
    </script>
</asp:Content>
