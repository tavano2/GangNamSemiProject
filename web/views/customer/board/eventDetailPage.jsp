<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<% HashMap<String,Object> hmap = (HashMap<String,Object>)request.getAttribute("hmap"); 

%>
	
	
	
	
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


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">DEATIL
			BOARD</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>게시글 내용</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button"
					onclick="location.href='<%=request.getContextPath()%>/eventPageList.bo' ">이전으로</button>
			</div>
		</div>
		<br>
		<table class="ui celled table first-col">

			<tr>
				<td>제목</td>
				<td>
					<div class="ui input">
						<input type="text" value="<%=hmap.get("board_title")%>" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<div class="ui input">
						<input type="text" value="<%=hmap.get("user_id")%>" readonly>
					</div>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="date" name="date" value="<%=hmap.get("modify_date") %>" readonly></td>
			</tr>
			<%if(hmap.get("file_id") != null) {%>
			<tr>
				<td>첨부 파일 받기</td>
				<td>
				<%=hmap.get("origine_name") %> &nbsp;
				<div class="ui button" onclick="location.href='<%=request.getContextPath()%>/fileDwonload.bo?num=<%=hmap.get("file_id")%>' ">첨부파일 다운받기</div></td>
			</tr>
			<%} %>
			<tr>
				<td>내용</td>
				<td>
					<div class="ui form">
						<div class="field">
							<label>Text</label>
							<textarea><%=hmap.get("board_content")%></textarea>
						</div>

					</div>
				</td>
			</tr>
			<tfoot>
				<th colspan="2">
					<div class="ui grid">
						<div class="twelve wide column"></div>
						<div class="four wide column" align="right">
						<%if (loginUser != null && loginUser.getUserId().equals("admin")) {%>
							<button class="ui brown basic mini button"
								onclick="location.href ='<%=request.getContextPath()%>/updateEventPage.bo?board_num=<%=hmap.get("board_num")%>' ">수정하기</button>
							<button class="ui brown basic mini button" onclick="">삭제하기</button>
						<%} %>
						</div>
					</div>
				</th>
			</tfoot>


		</table>

		
		<br>
		<hr>
		<br> <br> <br>
	
	

	
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