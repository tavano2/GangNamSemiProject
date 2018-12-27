<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<% Product SelectOneQnA = (Product)request.getAttribute("SelectOneQnA"); 
ArrayList<Product> SelectReplyList =(ArrayList<Product>) request.getAttribute("SelectReplyList");
%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

<style>
.detailQnAText{
margin-left:200px;
}
hr{
width:800px;
text-align:center;

}
.content{

/*  border: 1px solid lightcoral;  */
}
.updateDeleteBtn{
margin-right:200px;
}
.replyBtn{
width:80px;
height:50px;
}



</style>
</head>

<body>

   <%@ include file="/views/customer/common/mainNav.jsp"%>


   <div class="content">
   
   <br> <br>
      <div align="center"
         style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">
         QnA</div>
      <br> <br>
      <hr>
      <br>
      
      <div class="detailQnAText">
         <div class="ui comments">
            <div class="comment">
               <a class="avatar"> <img src="/semi/views/images/products/person.JPG">
               </a>
               <div class="content">
                  <a class="author"><%=SelectOneQnA.getBoardContent() %></a>
                  <br>
                 <input type="hidden" id="replyhiddenId" value="<%=SelectOneQnA.getBoardId() %>">
               </div>
            </div>
         </div>

      </div>
      
      <br><br>
      
      <%
      	if(loginUser !=null && loginUser.getUserId().equals("admin")){
      %>
      
      
      <div class="detailQnAText">
         <div class="ui comments">
            <div class="comment">
               <a class="avatar"> <img src="/semi/views/images/products/person1.JPG">
               </a>
               <div class="content">
               <tabel>
               <tr>
               	
               </tr>
               <tr></tr>
                  <textarea rows="3" cols="80" id="replyContent"></textarea>
                   <button class="ui grey basic button replyBtn"
									id="replyBtn">등록</button>
								
               </div>
            </div>
         </div>
      </div>
      
      <%
      	}
      %>
      
        <div id="replySelectArea">
					<table id="rereply" border="1" align=""></table>
		</div>
      
      <br><br>
      <hr>
      <div class="updateDeleteBtn" align="right">
					
			 <button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/product/updateQnA.jsp';">수정하기</button>
			&nbsp;
			<button class="ui brown basic mini button">삭제하기</button> 
		</div>
      <br> <br>




   </div>


   <%@ include file="/views/customer/common/mainFooter.jsp"%>


   <!-- J-query CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- Semantic UI JS CDN -->
   <script
      src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   <!-- jQuery Custom Scroller CDN -->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

   <!-- Common js -->
   <script src="/semi/js/customer/common/main.js"></script>
   
   <script>
   		$(function(){
   			$("#replyBtn").click(function(){
   				var replyContent = $("#replyContent").val();
   				var replyhiddenId= $("#replyhiddenId").val();
   				console.log(replyContent);
   				console.log(replyhiddenId);
   				
   			 	$.ajax({
   					url:"/semi/insertReply.re",
   					data:{replyContent:replyContent,replyhiddenId:replyhiddenId},
   					type:"post",
   					success:function(data){
   						console.log(data)
   						
   						var $rereply=$("#rereply");
   						$rereply.html('');
   						
   						for(var key in data){
   							var $tr = $("<tr>");
   							var $replyContentTd = $("<td>").text(data[key].boardContent).css("width","400px");
   							var $replyhiddenId = $("<td>").text(data[key].boardDate).css("width","100px");
   							//var $rr = $("<td>").text("dfdf").css("width","100px");
   							
   							//$tr.append($rr);
   							$tr.append($replyContentTd);
   							$tr.append($replyhiddenId);
   							
   							$rereply.append($tr);
   						}
   						
   					},error:function(){
						console.log('실패');
					}
   				}) 
   				
   				
   			});
   		});
   
   
   </script>

</body>

</html>