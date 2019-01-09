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
      overflow:scroll;
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
   
   .optionList:hover{
      background:darkgray;
      cursor:pointer;
   }
   .iconSpan:hover{
      cursor:pointer;
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
               <td><input type="text" size="20" style="height:30px;" name="optionSetMemo" id="optionSetMemo"></td>
            </tr>
            </table>
            <h2 class="ui header">옵션세트 구성</h2>
            <hr>
            <br>
            <div class="ui grid square">
                 <div class="optionSquare1">
                    <div class="optionSquare2">
                       <div class="optionSquare3">
                       <div class="ui selection dropdown">
                                <input type="hidden" name="option" id="option">
                                <i class="dropdown icon"></i>
                                <div class="default text">옵션명</div>
                                <div class="menu">
                                    <div class="item" data-value="0">옵션코드</div>
                                    <div class="item" data-value="1">옵션명</div>
                                </div>
                                
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="ui black button" id="selectOptionAll" name="selectOptionAll">전체목록</button>
                            <br>
                            <br>
                            <input type="text" style="height:35px;" name="optionSelected" id="optionSelected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     		<button class="ui black button" id="selectOptionBtn" name="selectOptionBtn">검색</button>
                     		
                     		<table id="showOption">
                     			
                     		</table>
                           </div>
                    </div>
                 </div>
                 <div class="square iconDiv">
                    <span class="iconSpan" id="rightBtn"><i class="arrow circle right icon"></i></span><br><br>
                 </div>
                 <div class="optionSquare1">
                 	<div class="optionSquare2">
                    	<div class="optionSquare3">
                    		<table id="showOption1">
                    		
                    		</table>
                    	</div>
                 	</div>
                 </div>
              </div>
              <br>
              <br>
              <br>
                <div class="productAddBtn">
              <button class="ui black button" id="addBtn">등록</button>
              <button class="ui white button" onclick="cancelBtn();">취소</button>
           </div>
           </div>
        </div>
        <input type="hidden" value="" name="submitNum" id="submitNum">
        <input type="hidden" value="" name="submitName" id="submitName">

      
      <!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


	<!-- alert CDN -->
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
    
    
	var submitNum = "";
	var submitName = "";
	var num1 = "";
	var name1 = "";
	
	function issueSuccess(){
		swal("옵션세트 등록 성공!", "확인 버튼을 눌러주세요.", "success")
		.then((value) => {	
			  location.reload();		
		});
	}
	function issueFail(){
		swal("옵션세트 등록 실패!", "확인 버튼을 눌러주세요.", "success")
		.then((value) => {	
			  location.reload();		
		});
	}
	
	// 옵션 전체조회
    $(function(){
    	$("#selectOptionAll").click(function(){
    		$.ajax({
    			url:"/semi/selectOptionAll.product",
    			type:"post",
    			success:function(data){
    				console.log("성공");
    				
    				var $showOption = $("#showOption");
    				$showOption.html('');
    				
    				for(var key in data){
    					var $tr = $("<span class='optionList'><tr>");
    					var $numTd = $("<td>").text(data[key].optionNum);
    					var $nameTd = $("<td>").text(data[key].optionName);
    					var $br = $("<br>");
    					
    					$tr.append($numTd);
    					$tr.append($nameTd);
    					$tr.append($br);
    					$showOption.append($tr);
    				}
    				$(".optionList").click(function(){
    		    		$(".optionList").css({"background":"lightgray"});
    		    		$(this).css({"background":"darkgray"});
    		    		
    		    		num1 = $(this).children("td:nth-of-type(1)").text();
    		    		name1 = $(this).children("td:nth-of-type(2)").text();
    		    		console.log("선택");
    		    	});
    			},
    			error:function(){
					issueFail();
    			}
    		});
    	});
    	
    });
    
    
	// 드롭박스로 옵션 조건조회
    $(function(){
    	$("#selectOptionBtn").click(function(){
    		var optionSelected = $("#optionSelected").val();
    		var option = $("#option").val();
    		
    		console.log(option);
    		$.ajax({
    			url:"/semi/selectOption.product",
    			data : {option : option , optionSelected : optionSelected},
    			type:"post",
    			success:function(data){
    				console.log(data);
    				var $showOption = $("#showOption");
    				$showOption.html('');
    				
    				for(var key in data){
    					for(var key in data){
        					var $tr = $("<span class='optionList'><tr>");
        					var $numTd = $("<td>").text(data[key].optionNum);
        					var $nameTd = $("<td>").text(data[key].optionName);
        					var $br = $("<br>");
        					
        					$tr.append($numTd);
        					$tr.append($nameTd);
        					$tr.append($br);
        					$showOption.append($tr);
        				}
    				}
    				$(".optionList").click(function(){
    		    		$(".optionList").css({"background":"lightgray"});
    		    		$(this).css({"background":"darkgray"});
    		    		
    		    		num1 = $(this).children("td:nth-of-type(1)").text();
    		    		name1 = $(this).children("td:nth-of-type(2)").text();
    		    		console.log("선택");
    		    	});
    			},
    			error:function(){
    				console.log("실패");
    			}
    		});
    	});
    	
    	// 세트메뉴에 추가할 옵션 선택
    	$("#rightBtn").click(function(){
    		var $showOption1 = $("#showOption1");
    		
    		var $tr = $("<tr>");
    		var $num1Td = $("<td>").text(num1);
    		var $name1Td = $("<td>").text(name1);
    		
    		$tr.append($num1Td);
    		$tr.append($name1Td);
    		$showOption1.append($tr);
    		
    		if(submitNum==""){
    			submitNum += num1;
    		}else{
	    		submitNum += "," + num1;
    		}
    		if(submitName==""){
    			submitName += name1;
    		}else{
    			submitName += "," + name1;
    		}
    	});
  });
    
    $(function(){
    	$("#addBtn").click(function(){
    		var optionSetMemo = $("#optionSetMemo").val();
    		var submitNum1 = submitNum;
    		var submitName1 = submitName;
    		
    		$.ajax({
    			url:"/semi/insertOptionSet.product",
    			data:{optionSetMemo : optionSetMemo , submitNum1 : submitNum1 , submitName1 : submitName1},
    			type:"post",
    			success:function(data){
    				issueSuccess();
    				
    				console.log("성공");
    			},
    			error:function(){
    				console.log("실패");
    			}
    		});
    	});
    });
    
    function cancelBtn(){
    	location.href="<%=request.getContextPath()%>/views/admin/product/adminSetManagement.jsp";
    }
    
    
    
   
    </script>
</body>

</html>