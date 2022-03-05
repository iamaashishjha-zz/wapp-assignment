<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="wapp.course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    All Courses
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
body{margin-top:20px;
background:#f1f2f7;
}

/*panel*/
.panel {
    border: none;
    box-shadow: none;
}

.panel-heading {
    border-color:#eff2f7 ;
    font-size: 16px;
    font-weight: 300;
}

.panel-title {
    color: #2A3542;
    font-size: 14px;
    font-weight: 400;
    margin-bottom: 0;
    margin-top: 0;
    font-family: 'Open Sans', sans-serif;
}


/*product list*/

.prod-cat li a{
    border-bottom: 1px dashed #d9d9d9;
}

.prod-cat li a {
    color: #3b3b3b;
}

.prod-cat li ul {
    margin-left: 30px;
}

.prod-cat li ul li a{
    border-bottom:none;
}
.prod-cat li ul li a:hover,.prod-cat li ul li a:focus, .prod-cat li ul li.active a , .prod-cat li a:hover,.prod-cat li a:focus, .prod-cat li a.active{
    background: none;
    color: #ff7261;
}

.pro-lab{
    margin-right: 20px;
    font-weight: normal;
}

.pro-sort {
    padding-right: 20px;
    float: left;
}

.pro-page-list {
    margin: 5px 0 0 0;
}

.product-list img{
    width: 100%;
    border-radius: 4px 4px 0 0;
    -webkit-border-radius: 4px 4px 0 0;
}

.product-list {
    position: relative;
    
}
.pro-img-box {
    position: relative;
    max-width: 100%;
  height: auto;
  object-fit: fill;

}



.adtocart {
    background: #fc5959;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #fff;
    display: inline-block;
    text-align: center;
    border: 3px solid #fff;
    left: 45%;
    bottom: -25px;
    position: absolute;
}

.adtocart i{
    color: #fff;
    font-size: 25px;
    line-height: 42px;
}

.pro-title {
    color: #5A5A5A;
    display: inline-block;
    margin-top: 20px;
    font-size: 16px;
}

.product-list .price {
    color:#fc5959 ;
    font-size: 15px;
}

.pro-img-details {
    margin-left: -15px;
}

.pro-img-details img {
    width: 100%;
}

.pro-d-title {
    font-size: 16px;
    margin-top: 0;
}

.product_meta {
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    padding: 10px 0;
    margin: 15px 0;
}

.product_meta span {
    display: block;
    margin-bottom: 10px;
}
.product_meta a, .pro-price{
    color:#fc5959 ;
}

.pro-price, .amount-old {
    font-size: 18px;
    padding: 0 10px;
}

.amount-old {
    text-decoration: line-through;
}

.quantity {
    width: 120px;
}

.pro-img-list {
    margin: 10px 0 0 -15px;
    width: 100%;
    display: inline-block;
}

.pro-img-list a {
    float: left;
    margin-right: 10px;
    margin-bottom: 10px;
}

.pro-d-head {
    font-size: 18px;
    font-weight: 300;
}
</style>

    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="nav" runat="server">
    <li><asp:Button ID="btnDashboard" runat="server" Text="Dashboard"  CssClass="button" OnClick="btnDashboard_Click"/></li>
    <li><asp:Button ID="btnLogout" runat="server" Text="Log Out" CssClass="button" OnClick="btnLogout_Click" /></li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
    <div class="container bootdey">
        <h1>Our Courses</h1>
    <div class="col-md-3">
        <!-- <section class="panel">
            <div class="panel-body">
                <input type="text" placeholder="Keyword Search" class="form-control" />
            </div>
        </section>  -->
        <section class="panel">
            <header class="panel-heading">
                Category
            </header>
            <div class="panel-body">
                <ul class="nav prod-cat">
                    <li>
                        <a href="#" class="active"><i class="fa fa-angle-right"></i> Programming</a>
                        <ul class="nav">
                            <li class="active"><a href="#">- Asp .net</a></li>
                            <li><a href="#">- Python</a></li>
                            <li><a href="#">- C programming</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right"></i> Data Science</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right"></i> Information technology </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right"></i> Health </a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-angle-right"></i> Business</a>
                    </li>
                </ul>
            </div>
        </section>
        <!-- <section class="panel">
            <header class="panel-heading">
                Price Range
            </header>
            <div class="panel-body sliders">
                <div id="slider-range" class="slider"></div>
                <div class="slider-info">
                    <span id="slider-range-amount"></span>
                </div>
            </div>
        </section>



        <section class="panel">
            <header class="panel-heading">
                Filter
            </header>
            <div class="panel-body">
                <form role="form product-form">
                    <div class="form-group">
                        <label>Brand</label>
                        <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                            <option>Wallmart</option>
                            <option>Catseye</option>
                            <option>Moonsoon</option>
                            <option>Textmart</option>
                        </select>
                        <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">Wallmart</span></span>
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                            <option>White</option>
                            <option>Black</option>
                            <option>Red</option>
                            <option>Green</option>
                        </select>
                        <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">White</span></span>
                    </div>
                    <div class="form-group">
                        <label>Type</label>
                        <select class="form-control hasCustomSelect" style="-webkit-appearance: menulist-button; width: 231px; position: absolute; opacity: 0; height: 34px; font-size: 12px;">
                            <option>Small</option>
                            <option>Medium</option>
                            <option>Large</option>
                            <option>Extra Large</option>
                        </select>
                        <span class="customSelect form-control" style="display: inline-block;"><span class="customSelectInner" style="width: 209px; display: inline-block;">Small</span></span>
                    </div>
                    <button class="btn btn-primary" type="submit">Filter</button>
                </form>
            </div>
        </section>

    -->
        <section class="panel">
            <header class="panel-heading">
                Most Popular Courses
            </header>
            <div class="panel-body">
                <div class="best-seller">
                    <article class="media">
                        <a class="pull-left thumb p-thumb">
                            <img src="asp.png" />
                        </a>
                        <div class="media-body">
                            <a href="#" class="p-head">ASP .net</a>
                            <p>ASP.NET is an open-source, server-side web-application framework designed for web development to produce dynamic web pages.</p>
                        </div>
                    </article>
                    <article class="media">
                        <a class="pull-left thumb p-thumb">
                            <img src="python.jpg" />
                        </a>
                        <div class="media-body">
                            <a href="#" class="p-head">Python</a>
                            <p>  Python is a high-level general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.</p>
                        </div>
                    </article>
                   
                </div>
            </div>
        </section>
    </div>
    <div class="col-md-9">
       

        <div class="row product-list">
            <div class="container py-4">
            <asp:Repeater ID="Repeater1" runat="server">  
                <ItemTemplate>  
                    <div class="col-md-4">
                <section class="panel">
                    <div class="pro-img-box">
                        <img src="asp.png" alt="" />
                        <asp:Image ID="imgCourse" runat="server" ImageUrl='<%# Eval("image") %>'/>
                        <a href="#" class="adtocart" runat="server" onserverclick="btnBuyCourse_Click">
                            <i class="fa fa-shopping-cart">
                            </i>
                        </a>
                    </div>
                    <div class="panel-body text-center">
                        <h4>
                            <a href="#" class="pro-title">
                               <%#Eval("name")%>
                            </a>
                        </h4>
                        <asp:Label ID="lblCourseId" runat="server" Visible="false" Text='<%# Eval("courseId") %>'></asp:Label>
                        <p class="price">Category : <%#Eval("category")%> </p>
                        <p class="price">Created By: <%#Eval("username")%> </p>
                        <p class="price">Start Date : <%#Eval("start_date")%> </p>
                        <p class="price">End Date: <%#Eval("end_date")%> </p>
                    </div>
                </section>
            </div>
                      
                </ItemTemplate>  
            </asp:Repeater>  
        </div>
        </div>
    </div>
</div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</asp:Content>
