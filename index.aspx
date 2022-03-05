<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="wapp.index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="Shared/coursesStyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <li><a href="login-auth.aspx">Login</a></li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">

<h1>Our Recently Updated Courses</h1>
    <main>
        <div class="slide-container">
        <img id="slide-left" class="arrow" src="images/arrow-left.png">
    <section class="container" id="slider">
        
        <div class="thumbnail">
            <img src="Images/1.png" alt="">
            <div class="product-details">
                <h2>Asp .Net</h2>
                <p> <span>  </span> </p>
                <a href="#">Enroll Now</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/2.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/3.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/4.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/5.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/6.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        <div class="thumbnail">
            <img src="Images/7.png" alt="">
            <div class="product-details">
                <h2>Demo Product</h2>
                <p> <span>$39.99</span> $29.99</p>
                <a href="#">Add to Cart</a>
            </div>
        </div>
        
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
