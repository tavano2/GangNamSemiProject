<%@page import="com.kh.semi.admin.product.model.vo.Option"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Option> list = (ArrayList<Option>)request.getAttribute("list");
	Option op = (Option)request.getAttribute("op");
%>
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
   .optionAdd{
      text-align:center;
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
           <h2 class="ui header">옵션관리(상품연동형 옵션)</h2>
           <table class="ui celled table first-col">
           <tr>
              <td>옵션 검색</td>
              <td>
              	<input type="text" name="optionSelected" id="optionSelected" style="height:35px;">
                 <div class="ui selection dropdown">
                 	<input type="hidden" name="option" id="option">
                       <i class="dropdown icon"></i>
                        <div class="default text">옵션검색</div>
                        <div class="menu">
                            <div class="item" data-value="0">옵션코드</div>
                            <div class="item" data-value="1">옵션명</div>
                        </div>
                 </div>
                 			<button class="ui black button"  id="selectBtn">검색</button>
                  </td>
             </tr>
                    </table>
           
           <hr>
              <h2 class="ui header">옵션 목록</h2>

                <table class="ui celled table order-result">
                    <thead>
                        <tr>
                            <th colspan="3">
                                <button class="ui white button" id="deleteOption">선택항목 삭제</button>
                            </th>
                        </tr>
                        <tr>
                            <th><div class="ui fitted checkbox">
                                    <input type="checkbox" name="allCheck" id="allCheck"><label></label>
                                </div></th>
                            <th>옵션코드</th>
                            <th>옵션명</th>
                        </tr>
                    </thead>
                    <tbody id="selectBody">
                        
                    </tbody>
                </table>
                              <div class="optionAdd">
                                 <button class="ui black button" onclick="location.href='/semi/views/admin/product/adminAddOption.jsp'">옵션등록</button>
                                 </div>
              
           
           </div>
        </div>

      
      <!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    	
    
    
    function issueSuccess(){
		swal("옵션 삭제 성공!", "확인 버튼을 눌러주세요.", "success")
		.then((value) => {	
			  location.reload();		
		});
	}
	function issueFail(){
		swal("옵션 삭제 실패!", "확인 버튼을 눌러주세요.", "success")
		.then((value) => {	
			  location.reload();		
		});
	}
	
    		// ajax를 사용하여 옵션검색
		    $(function(){
		    	$("#selectBtn").click(function(){
		    		var optionSelected = $("#optionSelected").val();
		    		var option = $("#option").val();
		    		
		    		console.log(option);
		    		$.ajax({
		    			url:"/semi/selectOption.product",
		    			data : {option : option , optionSelected : optionSelected},
		    			type:"post",
		    			success:function(data){
		    				console.log("성공");
		    				var $selectBody = $("#selectBody");
		    				$selectBody.html('');
		    				for(var key in data){
		    					var $tr = $("<tr class='selectTr'>");
		    					var $checkTd = $("<td><div class='checkCss'><div class='ui fitted checkbox'><input type='checkbox' name='optionCheck'><label></label></div></div>");
		    					var $numTd = $("<td>").text(data[key].optionNum);
		    					var $nameTd = $("<td>").text(data[key].optionName);
		    					var $inputTd = $("<td><input type='hidden' value='"+ data[key].optionNum +"' name='optionCode1'>");
		    					
		    					$tr.append($checkTd);
		    					$tr.append($numTd);
		    					$tr.append($nameTd);
		    					$tr.append($inputTd);
		    					$selectBody.append($tr);
		    				}
		    			},
		    			error:function(){
		    				console.log("실패");
		    			}
		    		});
		    	});
		  });
    		
    		$(function(){
    			$("#allCheck").click(function(){
    				var checkStatus = $(this).is(":checked");
    				if(checkStatus){
    					$("input:checkbox[name=optionCheck]").prop("checked",true);
    				}else{
    					$("input:checkbox[name=optionCheck]").prop("checked",false);
    				}
    			});
    		});
    		
    		$(function(){
    			$("#deleteOption").click(function(){
    				var size = $("input:checkbox[name=optionCheck]").length;
    				var optionCode = "";
    				
    				for(var i = 0; i < size; i++){
    					var checkStatus = $("input:checkbox[name=optionCheck]").eq(i).is(":checked");
    					if(checkStatus){
    						if(optionCode == ""){
    							optionCode += $("input[name=optionCode1]").eq(i).val();
    						}else{
    							optionCode += "," + $("input[name=optionCode1]").eq(i).val();
    						}
    					}
    				}
    				$.ajax({
    					url:"/semi/deleteOption.product",
    					type:"post",
    					data:{optionCode : optionCode},
    					success:function(data){
    						issueSuccess();
    					},
    					error:function(){
    						issueFail();
    					}
    				});
    			});
    		})
    </script>
    
</body>

</html>