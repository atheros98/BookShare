<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Box.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Presentation.admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1>Admin Login</h1>
        <input type="text" name="usernameTxt" required="required" placeholder="Admin Username" />
        <input type="password" name="passwordTxt" required="required" placeholder="Password" />
        <asp:Label ID="errorTxt" CssClass="error-message" runat="server" Text=""></asp:Label>
        <asp:Button ID="submit" runat="server" Text="Login" OnClick="submit_Click" />
    </form>
</asp:Content>
