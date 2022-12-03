<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script> -->
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
//     $(document).ajaxSend(function(e, xhr, options) {
//         xhr.setRequestHeader(header, token);
//         alert("내가 실행된다");
//     });
});
$(document).ready(function() {
	
	$('#btnInsert').click(function(){
		
// 		var fr1 = $('#fr').serialize;
		
		var txt = {
				chat_content : $('#chat_content').val(),
				user_id : $('#user_id').val(),
			};
		
 		alert('클릭'+txt);
		console.log(txt);
		
		$.ajax({
	 		url  : "/with/insertAjax",
// 	 		beforeSend: function(xhr){
// 	 	        xhr.setRequestHeader(header, token);
// 	 	        alert("내가 실행된다");
// 	 	    },
	 		type : "get",
// 	 		contentType: "application/json",
// 			data: JSON.stringify(txt),
			data: txt,
			dataType: "text",
	 		success 	: function(data) {
	 			alert('성공');
	 			//alert('성공'+data);
				
	 		},
	 		error		: function(request,status) {
		    	console.log("request.status : "+ request.status);
		    	console.log("request.responseText : "+ request.responseText);
		    	//console.log(error);
		    	alert('디비저장실패');
		    }
			
		});//ajax
		
		
	});//클릭

	
});

// function insert(){
// 	var fr1 = $('#fr').serialize;
	
// 	$.ajax({
// 		alert('성공');
// // 		url  : "/with/insert",
// // 		type : "POST",
// // 		data : fr1,
// // 		dataType:"json",
// // 		success 	: function(data) {
// // 			alert('성공');
			
// // 		},
// // 		error: function(rror){
// // 			alert(error);
// // 		},
		
// 	});
// }

</script>


<h1>나랑 경기 같이 볼래...?</h1>


<form id="fr">
<input type="text" name="chat_content" id="chat_content" placeholder="나도 글쓸래">
<input type="hidden" name="user_id" id="user_id" value="글쓴이">
<button type="submit" id="btnInsert">등록</button>
</form>



<jsp:include page="../include/footer.jsp" />