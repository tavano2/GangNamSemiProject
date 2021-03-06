<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.product.model.vo.ReviewOption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	ArrayList<ReviewOption> reviewOption = (ArrayList<ReviewOption>)request.getAttribute("reviewOption");
	
	String optionAll="";
	for(int i=0; i<reviewOption.size();i++){
		if(i==0){
			optionAll += reviewOption.get(i).getOptionName();
		}else{
			optionAll += ","+reviewOption.get(i).getOptionName();
		}
	}
	
	String boardId = request.getParameter("boardId");
	String productCode = request.getParameter("productCode");
	
	%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">
<style type="text/css">



[type="date"] {
            background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
        }
        [type="date"]::-webkit-inner-spin-button {
            display: none;
        }
        [type="date"]::-webkit-calendar-picker-indicator {
            opacity: 0;
        }
        input {
            border: 1px solid #c4c4c4;
            border-radius: 3px;
            background-color: #fff;
            padding: 8px 5px;
        }


</style>


</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>
	
	<!-- 작성하기 역시 관리자만 접근 가능하다. -->

	<%if(loginUser != null){ %>

	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">Review 
			BOARD</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>리뷰게시글 작성</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button"
					onclick="location.href='/semi/index.jsp';">메인으로</button>
			</div>
		</div>
		<br>
		
		<form action="<%=request.getContextPath() %>/insertReview.pd" method="post" encType="multipart/form-data" id="insertReviewForm">
		<table class="ui celled table first-col">

		<tbody>
		<tr>
				<td>주문번호</td>
				<td>
					<div class="ui input">
						<input type="hidden" value="<%=boardId %>" name="boardId">
						<input type="hidden" value="<%=productCode %>" name="productCode">
 						<input type="text" value="<%=reviewOption.get(0).getOrderDnum()%>" name="userProductNum" style="background-color:transparent;border:0 solid black; width:250px;"  readonly>
 					</div>
				</td>
			</tr>
		<tr>
				<td>작성자</td>
				<td>
					<div class="ui input">
						<input type="text" value="<%=loginUser.getUserId()%>" name="userId" style="background-color:transparent;border:0 solid black; width:250px;" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>선택한 옵션</td>
				<td>
					<div class="ui input">
					
					<%for(int i=0;i<reviewOption.size();i++){%>
					
					
					
						<input type="hidden" value="<%=reviewOption.get(i).getOptionNum()%>" name="selectOptionArray">
 						
						
					<% }%> 
						<input type="text" value="<%=optionAll %>"name="selectOption" style="background-color:transparent;border:0 solid black; width:250px;" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<div class="ui input">
						<input type="text" id="titleId" name="title" style="width:800px;">
					</div>
				</td>
			</tr>
			
			<tr>
				<td>키</td>
				<td>
					<div class="ui input">
						<input type="text" id="HeightId" name="youHeight" style="width:300px;" placeholder="~cm(숫자만입력하세요 (제발))">
					</div>
				</td>
			</tr>
			<tr>
				<td>몸무게</td>
				<td>
					<div class="ui input">
						<input type="text" id="weightId" name="youWeight" style="width:300px;" placeholder="~kg(숫자만입력하세요 (제발))">
					</div>
				</td>
			</tr>
			<tr>
				<td>평소사이즈</td>
				<td>
					<div class="ui input">
						<input type="text" id="sizeId" name="youSize" style="width:300px;" placeholder="S/M/L">
					</div>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<div class="ui form">
						<div class="field">
							<textarea id="contentId" name = "content"></textarea>
						</div>

					</div>
				</td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file1"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file2"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file3"></td>
				</tr>
			
			</tfoot>
		</table>

		<div align="center">
			<button type="button" id="insertBtn" class="ui secondary button">등록하기</button>
			<button type="reset" class="ui button">취소하기</button>

		</div>
		</form>
		<br>
		<hr>
		<br> <br> <br>





	</div>
	
	<%} else{ 
		
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
		request.getRequestDispatcher("views/customer/common/errorPage.jsp");
	%>
		<h2>로그인 하게용</h2>
	<%} %>


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

		$("#insertBtn").click(function(){
		
			if(($("#contentId").val()=="")){
				swal("내용을 입력해주세요!");
				if($("#sizeId").val()==""){
					swal("사이즈를 입력해주세요!");
					if($("#weightId").val()==""){
						swal("몸무게을 입력해주세요!");
						if($("#HeightId").val()==""){
							swal("키를 입력해주세요!");
							if($("#titleId").val()==""){
								swal("제목을 입력해주세요!");
							}
						}
					}
				}
				
			}else{
				swal("리뷰게시판 등록 감사합니다^_^")
				.then((value) => {	
				$("#insertReviewForm").submit();
			});
			}
				
			
		});
	
	</script>

</body>

</html>
