<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../views/include/header.jsp" />
<h1>customLogout.jsp 로그아웃</h1>

//권한때문에 토큰을 줘야한다
<form action="/customLogout" method="post"> 

<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<input type="submit" value="로그아웃">
</form>
<jsp:include page="../views/include/footer.jsp" />