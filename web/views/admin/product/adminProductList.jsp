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
      text-align:center;
   }
   .productPlus{
      font-size:15px;
   }
   .productListOrderBy{
      text-align:right;
   }
   .checkCss{
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
           <h2 class="ui header">상품 목록</h2>
           <hr>
                <table class="ui celled table first-col">
                   
                   <tr>
                         <td>검색분류</td>
                         <td>
                            <div class="ui selection dropdown">
                                <input type="hidden" name="select">
                                <i class="dropdown icon"></i>
                                <div class="default text">검색분류 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">상품명</div>
                                    <div class="item" data-value="1">상품코드</div>
                                    <div class="item" data-value="2">카테고리</div>
                                </div>
                            </div>
                            <input type="text" size="30" style="height:30px;" name="selectInput">
                         </td>
                   </tr>
                  <tr>
                         <td>진열상태</td>
                         <td>
                            <div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDisplay" tabindex="0" class="hidden" checked="" value="E">
                                            <label>진열함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDisplay" tabindex="0" class="hidden" value="D">
                                            <label>진열안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                         </td>
                   </tr>
                   <tr>
                         <td>판매상태</td>
                         <td>
                            <div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" tabindex="0" class="hidden" checked="" value="E">
                                            <label>판매함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" tabindex="0" class="hidden" value="D">
                                            <label>판매안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                         </td>
                   </tr>
                   <tr>
                         <td>삭제상태</td>
                         <td>
                            <div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDel" tabindex="0" class="hidden" value="D">
                                            <label>삭제함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDel" tabindex="0" class="hidden" checked="" value="E">
                                            <label>삭제안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                         </td>
                   </tr>
                </table>
                <div class="productAddBtn">
              <button class="ui blue button" id="selectProduct">검색</button>
           </div>
           <br>
           <hr>
              
              <table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th><div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div></th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>카테고리</th>
                            <th>판매가</th>
                        </tr>
                    </thead>
                    <tbody id="showProduct">
                        
                    </tbody>
                </table>
           </div>
        </div>

      
      <!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    
  /*   $(function(){
       $.ajax({
          url:"/semi/selectBigCate.product",
          type:"post",
          success:function(data){
             var $bigCateSelect = $("#bigCateSelect");
             
             for(var key in data){
                var $div = $("<div class='item' data-value='"+data[key].cateCode+"'>").text(data[key].cateName);
                
                $bigCateSelect.append($div);
             }
          },
          error:function(){
             console.log("실패");
          }
       });
    });
    
    function middleChoice(obj){
          var $catePlus = $("#catePlus");
         var $div1 = $("<div class='ui selection dropdown' id='middlePlus'>");
         var $input = $("<input type='hidden' name='middleCate'>");
         var $i = $("<i class='dropdown icon'>");
         var $div2 = $("<div class='default text'>").text("-중분류 선택");
         var $div3 = $("<div class='menu' id='middleCateSelect'>");
         
         $("#middlePlus").remove();
         
         $div1.append($input);
         $div1.append($i);
         $div1.append($div2);
         $div1.append($div3);
         $catePlus.append($div1);

         console.log(obj);
         var pCode = obj;
          $.ajax({
          url:"/semi/selectMiddleCate.product",
          type:"post",
          data:{pCode : pCode},
          success:function(data){
            var $middleCateSelect = $("#middleCateSelect");
             for(var key in data){
                var $div4 = $("<div class='item' data-value='"+data[key].cateCode+"'>").text(data[key].cateName);
                $middleCateSelect.append($div4);
            }
             $('.content-box .ui.dropdown').dropdown();
             },
             error:function(){
                console.log("실패");
             }
          });
       } */
    $(function(){
       $("#selectProduct").click(function(){
          var select = $("input[name=select]").val();
          var selectInput = $("input[name=selectInput]").val();
          var productDisplay = $("input:radio[name=productDisplay]").val();
          var productSell = $("input:radio[name=productSell]").val();
          var productDel = $("input:radio[name=productDel]").val();
          
          console.log(select);
          console.log(selectInput);
          console.log(productDisplay);
          console.log(productSell);
          console.log(productDel);
          $.ajax({
             url:"/semi/selectProductList.product",
             type:"post",
             data:{select : select,
                  selectInput : selectInput,
                  productDisplay : productDisplay,
                  productSell : productSell,
                  productDel : productDel},
             success:function(data){
                var $showProduct = $("#showProduct");
                $showProduct.html('');
                
                for(var key in data){
                   var $check = $("<td><div class='checkCss'><div class='ui fitted checkbox'><input type='checkbox' name='example'><label>");
                   var $tr = $("<tr>");
                   var $productCode = $("<td>").text(data[key].productCode);
                   var $productName = $("<td>").text(data[key].productName);
                   var $productCate = $("<td>").text(data[key].categoryName);
                   var $productPrice = $("<td>").text(data[key].productPrice);
                   
                   $tr.append($check);
                   $tr.append($productCode);
                   $tr.append($productName);
                   $tr.append($productCate);
                   $tr.append($productPrice);
                   $showProduct.append($tr);
                }
             },
             error:function(){
                console.log("실패");
             }
          });
       });
    });
    
    </script>
</body>

</html>