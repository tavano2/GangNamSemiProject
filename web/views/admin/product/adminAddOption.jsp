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
           <h2 class="ui header">옵션등록(상품연동형 옵션)</h2>
           <hr>
           <h4>기본정보 입력</h4>
           <table class="ui celled table first-col">
                 <tr>
                    <td>옵션코드</td>
                    <td>자동생성</td>
                 </tr>
                 
                 
                 <tr>
                    <td>옵션명 입력</td>
                    <td>
                       <table class="ui celled table first-col">
                          <tr>
                             <td>
                                <div class="ui fitted checkbox">
                                          <input type="checkbox" name="example"><label></label>
                                      </div>
                                   </td>
                                   <td>옵션명</td>
                          </tr>
                          <tr>
                             <td>
                                <div class="ui fitted checkbox">
                                          <input type="checkbox" name="example"><label></label>
                                      </div>
                             </td>
                             <td>
                                <input type="text" id="optionName">&nbsp;&nbsp;
                             </td>
                          </tr>
                       </table>
                    </td>
                 </tr>
                </table>
                <div class="productAddBtn">
                
              <button class="ui black button" id="insertBtn">등록</button>
              <button class="ui white button" onclick="cancelBtn();">취소</button>
           </div>
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
    
    function cancelBtn(){
    	location.href="<%=request.getContextPath()%>/views/admin/product/adminOptionManagement.jsp";
    }
    
    $(function(){
    	$("#insertBtn").click(function(){
    		var optionName = $("#optionName").val();
    		
    		$.ajax({
    			url:"/semi/insertOption.product",
    			data:{optionName : optionName},
    			type:"post",
    			success:function(data){
    				console.log("성공")
    				$("#optionName").val("");
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