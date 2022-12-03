<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

	<meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>

	<title>MyHeroes</title>
<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/blog.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


</head>
<body>
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/">HEROES</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center" style="marmargin-right:50px;">
        
        <a class="btn btn-sm btn-outline-secondary" href="/customLogin">Sign up</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 text-muted" href="#"></a>
      <a class="p-2 text-muted" href="#">히어로즈</a>
      <a class="p-2 text-muted" href="#">게시판</a>
      <a class="p-2 text-muted" href="/with/games">경기보기</a>
      <a class="p-2 text-muted" href="#"></a>
    </nav>
  </div>
<hr>



