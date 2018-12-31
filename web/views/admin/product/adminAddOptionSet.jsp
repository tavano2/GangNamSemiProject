<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>

   <!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
<style>
   .productAddBtn{
      margin-left:370px;
   }
   .productPlus{
      font-size:15px;
   }
   .productListOrderBy{
      text-align:right;
   }
   .optionSquare1{
      width:400px;
      height:400px;
      border:1px solid lightgray;
   }
   .optionSquare2{
      width:350px;
      height:350px;
      border:1px solid lightgray;
      background:lightgray;
      margin-left:10px;
      margin-top:25px;
   }
   .iconDiv{
      margin-top:170px;
   }
   .iconSpan{
      font-size:60px;
   }
   .optionSquare3{
      margin-left:10px;
      margin-top:10px;
   }
   
</style>
</head>

<body>
   
   <!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarProduct.jsp" %>
    
    <div class="wrapper">
       <!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

          <div class="content">
           <div class="content-box">
           <h2 class="ui header">옵션세트등록(상품연동형 옵션)</h2>
           <hr>
           <table class="ui celled table first-col">
            <tr>
               <td>옵션세트 코드</td>
               <td>자동생성</td>
            </tr>                 
            <tr>
               <td>옵션세트 설명</td>
               <td><input type="text" size="20"></td>
            </tr>
            </table>
            <h2 class="ui header">옵션세트 구성</h2>
            <hr>
            <br>
            <div class="ui grid square">
           <!-- <div class="four wide column"></div>
           <div class="four wide column"></div>
           <div class="four wide column"></div>
           <div class="four wide column"></div> -->
                 <div class="optionSquare1">
                    <div class="optionSquare2">
                       <div class="optionSquare3">
                       <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">옵션명</div>
                                <div class="menu">
                                    <div class="item" data-value="0">옵션명</div>
                                    <div class="item" data-value="1">옵션코드</div>
                                </div>
                                
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="ui black button">전체목록</button>
                            <br>
                            <br>
                            <input type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <button class="ui black button">검색</button>
                     
                           </div>
                    </div>
                 </div>
                 <div class="square iconDiv">
                    <span class="iconSpan"><i class="arrow circle right icon"></i></span><br><br>
                    <span class="iconSpan"><i class="arrow circle left icon"></i></span>
                 </div>
                 <div class="optionSquare1">
                 <div class="optionSquare2">
                    
                 </div>
                 </div>
              </div>
              <br>
              <br>
              <br>
                <div class="productAddBtn">
              <button class="ui black button">등록</button>
              <button class="ui white button">취소</button>
           
           </div>
           </div>
        </div>

      
      <!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
    
    <script>
    $('#sticky1').sticky(); //네이바 상단 고정
    $('#menu').click(function () {  //사이드바 오픈 버튼
        $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
    })
    $('.content-box .ui.dropdown').dropdown();  //컨텐츠 박스의 드롭다운 실행
    $('.content-box .ui.menu .item').on('click', function () {  //컨텐츠 박스의 메뉴 아이템 클릭시 active
        $('.ui .item').removeClass('active');
        $(this).addClass('active');

    });
    $('.ui.radio.checkbox')
  .checkbox();
    
    </script>
</body>

</html>