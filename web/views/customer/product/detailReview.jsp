<%@page import="com.kh.semi.customer.product.model.vo.ReviewList"%>
<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.board.model.vo.Board"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kh.semi.customer.product.model.vo.ReviewOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <% 
   HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap");
   
   	
   Board b = (Board)hmap.get("b");
   ArrayList<Attachment> atList = (ArrayList<Attachment>)hmap.get("atList");
   ArrayList<ReviewList> reList = (ArrayList<ReviewList>)hmap.get("reList");
   

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
#insertTitle {
   font-size: 15px;
   margin-top: 40px;
}

.insertBox {
   text-align: center; border : 1px solid lightgray;
   width: 850px;
   margin-left: auto;
   margin-right: auto;
   height: 200px;
   border: 1px solid lightgray;
}

.reviewText {
   margin-left: 200px;
}

.updateDeleteBtn{
	margin-right:200px;
}
</style>
</head>

<body>

   <%@ include file="/views/customer/common/mainNav.jsp"%>


   <div class="content">
      <br> <br>
      <div align="center"
         style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">
         <%=b.getUserId() %> 의 REVIEW</div>
      <br> <br>
      <div class="insertBox">
         <div id="insertTitle">
            <p>키 : <%=reList.get(0).getHeight() %> cm</p>
            <p>몸무게 : <%=reList.get(0).getWeight() %> kg</p>
            <p>평소사이즈 : <%=reList.get(0).getUserSize() %></p>
  <%--           <p>선택한 옵션<%=reoption.getOptionName() %></p> --%>
         </div>
         <br> <br>
         <!-- <div id="insertSubTitle">
            <p>서비스 이용 및 개인정보 수집, 이용에 동의해주세요</p>
         </div> -->
      </div>
      <div class="reviewText">
         <br>
         <br>
         <P><%=b.getBoardContent() %></P>
         
         <% if(atList!=null){ 
		
		for(Attachment a : atList) { 
		System.out.println("이거"+a.getFilePath()+a.getChangeName());
		
		%>
		 <img src="/semi/views/images/InsertReview_uploadFiles/<%=a.getChangeName() %>" width="200px">
		
		
		<%}} %>
		
       <br> <br>
         

      <div class="updateDeleteBtn" align="right">
					
			 <button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/product/updateReview.jsp';">수정하기</button>
			&nbsp;
			<button class="ui brown basic mini button">삭제하기</button> 
		</div>
      <br> <br>
      
      </div>
      
   </div>


   <%@ include file="/views/customer/common/mainFooter.jsp"%>


   <!-- J-query CDN -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <!-- Semantic UI JS CDN -->
   <script
      src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
   <!-- jQuery Custom Scroller CDN -->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

   <!-- Common js -->
   <script src="/semi/js/customer/common/main.js"></script>




</body>

</html>