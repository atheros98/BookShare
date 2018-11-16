<%@ Page Title="" Language="C#" MasterPageFile="~/masterForm/MainForm.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="View.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <h3>NEWEST BOOK UPLOAD</h3>
        <section class="section-center">
           
            <div class="new-book">
                <div class="section-center-header">
                    <div class="user">
                        <a href="Profile.aspx?id=>">
                            <img src="" />
                            <p></p>
                        </a>
                    </div>
                    <div class="time">
                       
                    </div>
                </div>
                <div class="book-item">
                    <a href="BookDetails.aspx?id=1" class="book-link">
                        <div class="img">
                            <img src="" alt="" />
                        </div>
                        <div class="book-content">
                            <h2></h2>
                            <pre></pre>
                            <p></p>
                        </div>
                    </a>
                </div>
            </div>
            
        </section>
        <div class="page">
            
        </div>
    </form>
</asp:Content>
