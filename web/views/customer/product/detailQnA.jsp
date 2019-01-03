<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<% Product SelectOneQnA = (Product)request.getAttribute("SelectOneQnA"); 
ArrayList<Product> SelectReplyList =(ArrayList<Product>) request.getAttribute("SelectReplyList");

ArrayList<Attachment>selectfileList = (ArrayList<Attachment>)request.getAttribute("selectfileList");
String num = request.getParameter("num");
String pQnABoardId = request.getParameter("pQnABoardId");

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
.attDiv{
margin-left:150px;
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
      
      <!--/////////////////////////사진 불러오기///////////////////////////////////  -->
	<%if(selectfileList.size()>0){ 
		
		for(Attachment a : selectfileList) { 
		System.out.println("이거"+a.getFilePath()+a.getChangeName());
		System.out.println("이거ss"+selectfileList);

		%>
	<div class="attDiv" align="center">
	<h2 align="center">상품의문제는 이거에요</h2>
		<img src="/semi/views/images/InsertQnA_uploadFiles/<%=a.getChangeName() %>" width="200" height="200">
		<input type="hidden" value="<%=a.getChangeName() %>" id="imgimg">
	</div><br>
	<hr>

	<%}}else{%>

	<%} %>

            <!--//////////////////////////////////////////////////////////////  -->
      
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
      
      
      
      <!--//////////////////////////해당 게시물에 댓글 불러오기////////////////////////////////////  -->
      
      <div id="testtest">
      <%if(SelectReplyList !=null ){ %>
      <% for (Product p : SelectReplyList){%>
      
      <div class="detailQnAText" id="detailQnAText">
         <div class="ui comments">
            <div class="comment">
               <a class="avatar"> <img src="/semi/views/images/products/person1.JPG">
               </a>
               <div class="content">
                  <a class="author" id="author"><%=p.getBoardContent() %></a>
                  <br>
                 <input type="hidden" id="replyhiddenId" value="<%=SelectOneQnA.getBoardId() %>">
               </div>
            </div>
         </div>

      </div>
      <%} %>
      
      <%}else{ %>
      
      
      <%} %>
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
					
			 <button class="ui brown basic mini button" 
			 onclick="location.href='<%=request.getContextPath()%>/selectforUpdate.pd?num=<%=num %>&pQnABoardId=<%=pQnABoardId%>'">수정하기</button>
			 
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
   						
   						//var $rereply=$("#rereply");
   						//$rereply.html('');
   						
   						var $testtest = $("#testtest");
   						var $replyContent = $("#replyContent");
   						$testtest.html('');
   						$replyContent.val('');
   						
   						for(var key in data){
   							
   							var $avatar = $(".avatar");
   							
   							var $detailQnAText = $("<div>").addClass("detailQnAText");
   							var $uicomments = $("<div>").addClass("ui comments");
   							var $comment = $("<div>").addClass("comment");
   							var $avatar = $("<a>").addClass("avatar");
   							var $imgTag = $("<img>").attr("src","/semi/views/images/products/person1.JPG");
   							var $content = $("<div>").addClass("content");
   							var $author = $("<a>").addClass("author").text(data[key].boardContent);
   							
   							$content.append($author);
   							$content.append($("<br>"));
   							
   							$avatar.append($imgTag);
   							
   							$comment.append($avatar);
   							$comment.append($content);
   							
   							$uicomments.append($comment);
   							
   							$detailQnAText.append($uicomments);
   							
   							 $testtest.append($detailQnAText);

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