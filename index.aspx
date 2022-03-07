<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="wapp.index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Shared/coursesStyles.css" rel="stylesheet" />
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <li><a href="login-auth.aspx">Login</a></li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
<div class="slideshow-container">

            <div class="mySlides fade">
                <img src="Images/1-01.png" style="width: 100%">
                <div class="text"></div>
            </div>

            <div class="mySlides fade">
                <img src="Images/1-02.png" style="width: 100%">
                <div class="text"></div>
            </div>

            <div class="mySlides fade">
                <img src="Images/1-03.png" style="width: 100%">
                <div class="text"></div>
            </div>

        </div>
        <br>

        <div style="text-align: center">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
<h1 style="margin-top:25px;">Our Recently Updated Courses</h1>
    <main>
        <div class="slide-container">
            
        <img id="slide-left" class="arrow" src="images/arrow-left.png">
            <section class="container" id="slider" style="text-align:center">
                <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                     <div class="thumbnail">
                    <img src="<%#Eval("image")%>" alt="<%#Eval("description")%>">
                    <div class="product-details">
                        <h2><%#Eval("name")%></h2>
                        <p>Start Date : <span><%#Eval("start_date")%></span</p>
                        <p>End Date :<span><%#Eval("start_date")%></span</p>
                        <p>Category :<span><%#Eval("category")%></span></p>
                        <p>Create By :<span> <%#Eval("username")%></span></p>
                        <a href="course.aspx">Learn More</a>
                    </div>
                </div>
                </ItemTemplate>  
            </asp:Repeater>  
               
            </section>
            
    <img id="slide-right" class="arrow" src="images/arrow-right.png">
        </div>
    </main>
    

    <div class="container">
            <div class="row mt-2 mb-2">
                <h1 style="text-align:center;">Our Team</h1>
            </div>
        <div class="row mb-4">

            <div class="col-md-3 col-sm-6">
                
                <div class="our-team">
                    <div class="pic">
                        <img src="Images/Jasbir_sir.jpg">
                    </div>
                    <h3 class="title">Jasbir Singh Makkar</h3>
                    <span class="post">Lecturer</span>
                    <ul class="social">
                        <li><a href="#" class="fa fa-facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus"></a></li>
                        <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
                </div>
            </div>
     
            <div class="col-md-3 col-sm-6">
                <div class="our-team">
                    <div class="pic">
                        <img src="Images/aashish.jpg">
                    </div>
                    <h3 class="title">Aashish Jha</h3>
                    <span class="post"> Lecturer</span>
                    <ul class="social">
                        <li><a href="#" class="fa fa-facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus"></a></li>
                        <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
                </div>
            </div>
    
            <div class="col-md-3 col-sm-6">
                <div class="our-team">
                    <div class="pic">
                        <img src="Images/priyanka.jpg">
                    </div>
                    <h3 class="title">Priyanka Rai</h3>
                    <span class="post"> Lecturer</span>
                    <ul class="social">
                        <li><a href="#" class="fa fa-facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus"></a></li>
                        <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="our-team">
                    <div class="pic">
                        <img src="Images/kushal.jpg">
                    </div>
                    <h3 class="title">Kushal Bhattarai</h3>
                    <span class="post">Lecturer </span>
                    <ul class="social">
                        <li><a href="#" class="fa fa-facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus"></a></li>
                        <li><a href="#" class="fab fa-linkedin"></a></li>
                    </ul>
                </div>
            </div>
    
        </div>
    </div>

    
</asp:Content>
