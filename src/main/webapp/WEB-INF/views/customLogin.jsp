<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../views/include/header.jsp" />
<link href="${pageContext.request.contextPath }/resources/css/signin.css" rel="stylesheet">



<div style="margin-bottom:300px; margin-top:100px;">

<form class="form-signin" action="/login" method="post">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="inputEmail" class="sr-only">Id</label>
  <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Email address" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  <input type="hidden" name="${_csrf.parameterName }"  value="${_csrf.token }">
<!--   <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button> -->
  <input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
</form>

</div>


<jsp:include page="../views/include/footer.jsp" />