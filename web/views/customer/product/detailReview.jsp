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
}
</style>
</head>

<body>

   <%@ include file="/views/customer/common/mainNav.jsp"%>


   <div class="content">
      <br> <br>
      <div align="center"
         style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">
         YESOL'S REVIEW</div>
      <br> <br>
      <div class="insertBox">
         <div id="insertTitle">
            <p>키 : 157 cm</p>
            <p>몸무게 : 45~49 kg</p>
            <p>평소사이즈 : M</p>
            <p>선택한 옵션 색상 : 핑크</p>
         </div>
         <br> <br>
         <!-- <div id="insertSubTitle">
            <p>서비스 이용 및 개인정보 수집, 이용에 동의해주세요</p>
         </div> -->
      </div>
      <div class="reviewText">
         <br>
         <br>
         <P>옷이뻐영 배송 빨라영 !옷이뻐영 배송 빨라영 !옷이뻐영 배송 빨라영 !</P>

         <img src="/semi/views/images/products/review.jpg" width="200px"> <img
            src="/semi/views/images/products/review.jpg" width="200px"><img
            src="/semi/views/images/products/review.jpg" width="200px"> 
            <img src="/semi/views/images/products/review.jpg" width="200px"> 
            <br> <br>
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