<%@page import="com.kh.semi.customer.board.model.vo.Board"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>FAQ 작성</title>


	<!-- Semantic UI CSS CDN -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<!-- Common css -->
	<link href="/semi/css/customer/common/main.css" rel="stylesheet">
	<!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    
	<style type="text/css">
		.first-col td:first-child{
			width: 160px;
		}
		
		#title{
			width: 500px;
		}

	</style>


</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>
	
	<!-- 작성하기 역시 관리자만 접근 가능하다. -->

	<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>

	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">UPDATE
			BOARD</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>게시글 수정</b>
			</div>
			<div class="four wide column" align="right">
			</div>
		</div>
		<br>
		
		<form action="" method="post" encType="multipart/form-data" name="updateFAQ">
		<input type="hidden" name="boardId" value="<%= b.getBoardId() %>">
		<table class="ui celled table first-col">

		<tbody>
			<tr>
				<td>제목</td>
				<td>
					<div class="ui selection dropdown">
                        <input type="hidden" name="categ" id="categ" value="<%= b.getBoardCate() %>">
                        <i class="dropdown icon"></i>
                        <div class="default text">검색목록선택</div>
                        <div class="menu">
                            <div class="item" data-value="1">주문관련</div>
                            <div class="item" data-value="2">결제관련</div>
                            <div class="item" data-value="3">배송관련</div>
                            <div class="item" data-value="4">교환/환불/반품관련</div>
                            <div class="item" data-value="5">적립금관련</div>
                            <div class="item" data-value="6">품절관련</div>
                            <div class="item" data-value="7">쿠폰관련</div>
                            <div class="item" data-value="8">기타</div>
                        </div>
                    </div>
					<div class="ui input">
						<input type="text" name="title" id="title" value="<%= b.getBoardTitle() %>">
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<div class="ui input">
						<input type="text" value="<%=loginUser.getUserId()%>" name="userId" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>수정일</td>
				<td>
					<div class="ui input">
						<input type="date" name="date" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div class="ui form">
						<div class="field">
							<textarea name="content" id="content"><%= b.getBoardContent() %></textarea>
						</div>

					</div>
				</td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file"></td>
				</tr>
			
			</tfoot>
		</table>

		<div align="center">
			<button onclick="updateBtn(); return false;" class="ui secondary button">수정하기</button>
			<button onclick="location.href='<%= request.getContextPath()%>/selectFAQList.bo'; return false;" class="ui button">취소하기</button>
		</div>
		</form>
		<br>
		<hr>
		<br> <br> <br>


	</div>
	



	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

	<script>
		//첨부파일 기능 제거
		$(function(){
			$("tfoot").hide();
		});
	
		//컨텐츠 박스의 드롭다운 실행
		$('.content .ui.dropdown').dropdown();
		
		function updateBtn(){
			if($("#categ").val() != "" && $("#title").val() != "" && $("#content").val() != ""){
				updateFAQ.action = "<%= request.getContextPath() %>/updateFAQ.bo";
				updateFAQ.submit();
			} else {
				if($("#categ").val() == "") {
					alert("카테고리를 선택하세요.");
				} else if($("#title").val() == ""){
					alert("제목을 입력하세요.");
				} else if($("#content").val() == "") {
					alert("내용을 입력하세요.");
				}
			}
			
		}
		
		
		
	</script>

	<%} else{ 
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
		request.getRequestDispatcher("views/customer/common/errorPage.jsp");
	}%>

</body>

</html>