<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

	<%@ page isELIgnored="false" %>
    <meta charset="utf-8">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
   
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet' type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css" id="theme-styles">

    <!--[if lt IE 9]>      
        <script src="js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
    <![endif]-->
    
</head>
<body>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>
    <header>
        <div class="widewrapper masthead">
            <div class="container">
                <a href="index.html" id="logo">
                    <img src="img/logo.png" alt="clean Blog">
                </a>

                <div id="mobile-nav-toggle" class="pull-right">
                    <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>

                <nav class="pull-right clean-nav">
                    <div class="collapse navbar-collapse">
                        <ul class="nav nav-pills navbar-nav">
                          
                            <li>
                                <a href="index.html">主页</a>
                            </li>
                            <li>
                                <a href="about.html">关于</a>
                            </li>
                            <li>
                                <a href="contact.html">联系</a>
                                
                            </li>                        
                        </ul>
                    </div>
                </nav>        

            </div>
        </div>

        <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a href="#">JetsBlog</a>
                </div>

                <div class="clean-searchbox">
                    <form action="#" method="get" accept-charset="utf-8">
                        <input class="searchfield" id="searchbox" type="text" placeholder="Search">
                        <button class="searchbutton" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header>

        <div class="container">
            <div class="row">
                <div class="col-md-8 blog-main">
                    <div id="tbody"class="row">
                        <c:forEach items="${articles}" var="article">
                        	<div class="col-md-12 col-sm-6">
							    <article class="blog-teaser">
								    <header>
	                                    <h3><a href="article?id=${article.id}">${article.title}</a></h3>
	                                    <span class="meta">${article.localTime}</span>
	                                    <hr>
	                                </header>
	                                <span><i>${article.keywords}</i></span>
	                                <div class="body">${article.desci}</div>
	                                <div class="clearfix">
	                                    <a href="articleDetail?id=${article.id}" class="btn btn-clean-one">阅读全文</a>
	                                </div>
							        
							    </article>
                        	</div>
						</c:forEach>
                        
                    </div>                 
                    
<form class="listForm" name="listForm" method="post" action="">
  <div class="row">
    <div class="form-inline">
      <label style="font-size:14px;margin-top:22px;">
        <strong>共<b>${page.totalCount}</b>条记录，共<b>${page.totalPage}</b>页</strong>
        &nbsp;
        &nbsp;
        <strong>每页显示</strong>
        <select class="form-control" name="pageSize">
          <option value="4"
                  <c:if test="${page.pageSize == 4}">selected</c:if> >4
          </option>
	      <option value="6"
	              <c:if test="${page.pageSize == 6}">selected</c:if> >6
	      </option>
		  <option value="8"
		          <c:if test="${page.pageSize == 8}">selected</c:if> >8
		  </option>
		  <option value="10"
		          <c:if test="${page.pageSize == 10}">selected</c:if> >10
		  </option>
		</select>
		<strong>条</strong>
		&nbsp;
		&nbsp;
		<strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
		                                class="form-control input-sm"
		                                style="width:11%"/>&nbsp;<strong>页</strong>
		&nbsp;
		<button type="submit" class="btn btn-sm btn-info">GO!</button>
		</label>
		<ul class="pagination" style="float:right;">
		  <li>
		    <a href="?pageIndex=1"><strong>首页</strong></a>
		  </li>
		  <li>
		    <c:if test="${page.pageNo > 2}">
		      <a href="?pageIndex=${page.pageCode - 1}">&laquo;</a>
		    </c:if>
		  </li>
		
		  <!-- 写关于分页页码的逻辑 -->
		  <c:choose>
		    <c:when test="${page.totalPage <= 5}">
		      <c:set var="begin" value="1"/>
		      <c:set var="end" value="${page.totalPage}"/>
		    </c:when>
		    <c:otherwise>
		      <c:set var="begin" value="${page.pageNo - 1}"/>
		      <c:set var="end" value="${page.pageNo + 3}"/>
		
		      <!-- 头溢出 -->
		      <c:if test="${begin < 1}">
		        <c:set var="begin" value="1"/>
		        <c:set var="end" value="5"/>
		      </c:if>
		
		      <!-- 尾溢出 -->
		      <c:if test="${end > page.totalPage}">
		        <c:set var="begin" value="${page.totalPage -4}"/>
		        <c:set var="end" value="${page.totalPage}"/>
		      </c:if>
		    </c:otherwise>
		  </c:choose>

		  <!-- 显示页码 -->
		  <c:forEach var="i" begin="${begin}" end="${end}">
		    <!-- 判断是否是当前页,这里用if判断实现是否被点击的页码呈现active样式 -->
		    <c:if test="${i == page.pageNo}">
		      <li class="active"><a href="javascript:void(0);">${i}</a></li>
		    </c:if>
		    <c:if test="${i != page.pageNo}">
		      <li>
		        <a href="?pageIndex=${i}">${i}</a>
		      </li>
		    </c:if>
		  </c:forEach>
		  <li>
		    <c:if test="${page.pageNo < page.totalPage}">
		      <a href="?pageIndex=${page.pageNo + 1}">&raquo;</a>
		    </c:if>
		  </li>
		  <li>
		    <a href="?pageIndex=${page.totalPage}"><strong>末页</strong></a>
		  </li>
		</ul>
	</div>
</div>
</form>
                   
                </div>
                <aside class="col-md-4 blog-aside">
                    
                    <div class="aside-widget">
                        <header>
                            <h3>Featured Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <li><a href="">Clean - Responsive HTML5 Template</a></li>
                                <li><a href="">Responsive Pricing Table</a></li>
                                <li><a href="">Yellow HTML5 Template</a></li>
                                <li><a href="">Blackor Responsive Theme</a></li>
                                <li><a href="">Portfolio Bootstrap Template</a></li>
                                <li><a href="">Clean Slider Template</a></li>
                            </ul>
                        </div>
                    </div>
                
                    <div class="aside-widget">
                        <header>
                            <h3>Related Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <li><a href="">Blackor Responsive Theme</a></li>
                                <li><a href="">Portfolio Bootstrap Template</a></li>
                                <li><a href="">Clean Slider Template</a></li>
                                <li><a href="">Clean - Responsive HTML5 Template</a></li>
                                <li><a href="">Responsive Pricing Table</a></li>
                                <li><a href="">Yellow HTML5 Template</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>Tags</h3>
                        </header>
                        <div class="body clearfix">
                            <ul class="tags">
                                <li><a href="#">HTML5</a></li>
                                <li><a href="#">CSS3</a></li>
                                <li><a href="#">COMPONENTS</a></li>
                                <li><a href="#">TEMPLATE</a></li>
                                <li><a href="#">PLUGIN</a></li>
                                <li><a href="#">BOOTSTRAP</a></li>
                                <li><a href="#">TUTORIAL</a></li>
                                <li><a href="#">UI/UX</a></li>                            
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <footer>
        <div class="widewrapper footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-user"></i>About</h3>

                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab animi laboriosam nostrum consequatur fugiat at, labore praesentium modi, quasi dolorum debitis reiciendis facilis, dolor saepe sint nemo, earum molestias quas.</p>
                       <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum, error aspernatur assumenda quae eveniet.</p>
                    </div>

                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-pencil"></i> Recent Post</h3>
                        <ul class="clean-list">
                            <li><a href="">Clean - Responsive HTML5 Template</a></li>
                            <li><a href="">Responsive Pricing Table</a></li>
                            <li><a href="">Yellow HTML5 Template</a></li>
                            <li><a href="">Blackor Responsive Theme</a></li>
                            <li><a href="">Portfolio Bootstrap Template</a></li>
                            <li><a href="">Clean Slider Template</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 footer-widget">
                        <h3> <i class="fa fa-envelope"></i>Contact Me</h3>

                        <p>Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil fugiat, cupiditate veritatis excepturi tempore explicabo.</p>
                         <div class="footer-widget-icon">
                            <i class="fa fa-facebook"></i><i class="fa fa-twitter"></i><i class="fa fa-google"></i>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="widewrapper copyright">
                Copyright 2015 More Templates
        </div>
    </footer>
    
	
</body>
</html>