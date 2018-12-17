<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
                  <a class="author">옷 사이즈가 어떻게 되나요?옷 사이즈가 어떻게 되나요?옷 사이즈가 어떻게 되나요?옷 사이즈가 어떻게 되나요?옷 사이즈가 어떻게 되나요?옷 사이즈가 어떻게 되나요?<br>
                  궁금합니당!</a>
                  <br>
                  
               </div>
            </div>
         </div>

      </div>
      
      <br><br>
      
      <div class="detailQnAText">
         <div class="ui comments">
            <div class="comment">
               <a class="avatar"> <img src="/semi/views/images/products/person1.JPG">
               </a>
               <div class="content">
                  <a class="author">s사이즈 입니당</a>
                  <br>
                  
               </div>
            </div>
         </div>
         
         

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