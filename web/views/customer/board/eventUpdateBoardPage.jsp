<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">


<style type="text/css">
[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
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

	<%
		if (loginUser != null) {
	%>

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
				<button class="ui brown basic mini button"
					onclick="location.href='<%=request.getContextPath()%>/eventDetailPage.bo?board_num=<%=hmap.get("board_num")%>' ">이전으로</button>
			</div>
		</div>
		<br>
		<form action="<%=request.getContextPath()%>/updateEventPageComplete.bo"
			method="post" encType="multipart/form-data">
			<table class="ui celled table first-col">
				<tbody>
					<tr>
						<td>제목</td>
						<td>
							<div class="ui input">
								<input type="text" name="title"
									value=<%=hmap.get("board_title")%>>
								<input type="hidden" name="bno" value="<%=hmap.get("board_num") %>">
								<input type="hidden" name="bid" value="<%=hmap.get("board_id") %>">
							</div>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<div class="ui input">
								<input type="text" value=<%=hmap.get("user_id")%>
									name="user_id" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="date" name="date"
							value="<%=hmap.get("modify_date")%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<div class="ui form">
								<div class="field">
									<label>Text</label>
									<textarea name="content"><%=hmap.get("board_content")%></textarea>
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
				<button type="submit" class="ui secondary button">수정하기</button>
				<button type="reset" class="ui button">취소하기</button>
			</div>
		</form>
		<br>
		<hr>
		<br> <br> <br>





	</div>

	<%
		} else {
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	%>

	<%
		}
	%>


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