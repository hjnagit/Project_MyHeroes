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
		
 		//alert('클릭'+txt);
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
	 			//alert('성공');
	 			$.ajax({
	 				url  : "/ajax/chatAll",
	 				type : "get",
	 				dataType: "JSON",
	 				success: function(data) {
	 		 			//alert('성공'+data);
	 		 			
	 		 			$(data).each(function(idx, item){
	 		 				$('#gat').html("");
	 						$('#get').append(item.chat_bno+"/"+item.user_id+"/"+item.chat_regdate+"/<br>"+item.chat_content+"<br>");
	 						
	 						
	 					});
	 					
	 		 		},
	 		 		error: function(request,status) {
	 			    	console.log("request.status : "+ request.status);
	 			    	console.log("request.responseText : "+ request.responseText);
	 			    	//console.log(error);
	 			    	alert('실패');
	 			    }
	 			});
				
	 		},
	 		error		: function(request,status) {
		    	console.log("request.status : "+ request.status);
		    	console.log("request.responseText : "+ request.responseText);
		    	//console.log(error);
		    	alert('디비저장실패');
		    }
			
		});//ajax
		
		
	});//클릭
	
	
	window.onload = function(){
		$.ajax({
			url  : "/ajax/chatAll",
			type : "get",
			dataType: "JSON",
			success: function(data) {
	 			//alert('성공'+data);
	 			
	 			$(data).each(function(idx, item){
	 				$('#gat').html("");
					$('#get').append(item.chat_bno+"/"+item.user_id+"/"+item.chat_regdate+"/<h4>"+item.chat_content+"</h4>");
					
					
				});
				
	 		},
	 		error: function(request,status) {
		    	console.log("request.status : "+ request.status);
		    	console.log("request.responseText : "+ request.responseText);
		    	//console.log(error);
		    	alert('실패');
		    }
		});
	}
	
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
// 	var objDiv = document.getElementById("get");
// 	objDiv.scrollTop = objDiv.scrollHeight;
	$('#get').scrollTop($('#get')[0].scrollHeight);
</script>


<h1>나랑 경기 같이 볼래...?</h1>
<fieldset>
<!-- <div id="get"></div> -->
</fieldset>

<div id="get" class="get" style="height: 300px; overflow: scroll"> 
<!-- <div class="scroll" style="height: 300px; overflow: overlay">  -->
<!--   <div id="get"></div> -->
<!--   <div style="height: 200px; background: orange">orange</div> -->
<!--   <div style="height: 200px; background: yellow">yellow</div> -->
</div>
<form id="fr">
<input type="text" name="chat_content" id="chat_content" placeholder="나도 글쓸래" required="required" autofocus="autofocus">
<input type="hidden" name="user_id" id="user_id" value="글쓴이">
<button type="submit" id="btnInsert">등록</button>
</form>



<jsp:include page="../include/footer.jsp" />