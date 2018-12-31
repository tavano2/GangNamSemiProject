<%@page import="com.kh.semi.customer.product.model.vo.ReallyProduct"%>
<%@page import="com.kh.semi.customer.product.model.vo.Option"%>
<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="com.kh.semi.customer.product.model.vo.Product"%>
<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
	PageInfo propi = (PageInfo) request.getAttribute("propi");
	int listCount = propi.getListCount();
	int currentPage = propi.getCurrentPage();
	int maxPage = propi.getMaxPage();
	int startPage = propi.getStartPage();
	int endPage = propi.getEndPage();
	
	ArrayList<Product> listQnA = (ArrayList<Product>) request.getAttribute("listQnA");
	PageInfo piQnA = (PageInfo) request.getAttribute("piQnA");
	int listCountQnA = piQnA.getListCount();
	int currentPageQnA = piQnA.getCurrentPage();
	int maxPageQnA = piQnA.getMaxPage();
	int startPageQnA = piQnA.getStartPage();
	int endPageQnA = piQnA.getEndPage();
	
	//상품 상세 페이지
 	ReallyProduct pro = (ReallyProduct)request.getAttribute("pro");
	ArrayList<Attachment> detailAttachmentList = (ArrayList<Attachment>)request.getAttribute("detailAttachmentList");
	ArrayList<Option> detailOptionList = (ArrayList<Option>)request.getAttribute("detailOptionList");
	 
	//상품이름, 판매가,상품상세글, 옵션12, 상품이미지1메인,2상품이미지 34
	Attachment titleImg = detailAttachmentList.get(0);
	Attachment detailImg1 = detailAttachmentList.get(1);
	Attachment detailImg2 = detailAttachmentList.get(2);
	Attachment detailImg3 = detailAttachmentList.get(3);
	
	//Option option1 = detailOptionList.get(0);
	//Option option2 = detailOptionList.get(1);
	
	
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



<style>
/* TOP 사진과 옆 테이블 묶은것 */
.contextBox {
	/* margin: 100px; */
	margin-left: auto;
	margin-right: auto;
	margin-top: 120px;
	/* background: lightgoldenrodyellow;   */
	max-width: 950px;
}
/* top 테이블 줄색깔 */
.segment {
	border: 1px solid white;
	border: none;
}

/* top 이미지 div */
.detailTopImgsize {
	background-size: inherit;
	margin-left: auto;
	margin-right: auto;
	margin-left: 100px;
}

.nine {
	/* background-color: lightblue; */
	
}

/* by it now 버튼 */
.buyBtn {
	width: 100%;
}
/* by it Now DIV */
.buyBtnDiv {
	margin-bottom: 5px;
	margin-top: 5px;
}

.cartBtn {
	width: 190px;
	margin-right: auto;
	margin-left: auto;
}

.contextTop {
	width: 100%;
	height: 600px;
	text-align: center;
	padding-top: 150px;
	/*  border: 1px solid lightcoral; */
}

.detailImg {
	width: 100%;
	/*  border: 1px solid lightblue; */
}

.sizeChart {
	width: 100%;
	/*  border: 1px solid lightgreen; */
}

.first-col tr:first-child {
	/* width: 200px; */
	background-color: #f9fafb;
	text-align: center;
}

.second-col td:first-child {
	/* width: 200px; */
	background-color: #f9fafb;
}

.first-col {
	text-align: center;
}

.second-col tr, td {
	text-align: center;
	/* border:none; */
	border: 1px solid white;
}

.detailBottom1 {
	width: 100%;
	/* border: 1px solid lightpink; */
}

.first-col td:first-child {
	width: 200px;
	background-color: #f9fafb;
}
.productName{
	color:lightgray;
	font-size:30px;
	font-weight:bold;
	font-famaily:Sans-Serif;
}
</style>

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<div class="contextBox">

			<div class="ui equal width grid">

				<div class="nine wide column">
					<img src="<%=titleImg.getFilePath() %><%=titleImg.getChangeName() %>"
						class="detailTopImgsize" width="400" height="500">


				</div>

				<div class="seven wide column">
					<table class="ui celled table">
						<tr>
							
                             
						<br><br><br>
                        	<p class="productName"><%=pro.getProductName() %></p>  
						</tr>
						<hr>
						<tr>
							
								상품 간단 설명쓰 : <%=pro.getProductMemo() %> <br><br>
							
						<hr>
							사이즈  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="ui selection dropdown">
								<!-- <input type="hidden" name="gender"> -->
								<i class="dropdown icon"></i>
								<div class="default text">[필수]옵션을 선택해 주세요</div>
								<div class="menu">
								
								
								<!-- <%-- <% for(Option opp : detailOptionList){
								int i=0;
								if(		opp.getOptionNum().equals("OP000021")||opp.getOptionNum().equals("OP000022")||
										opp.getOptionNum().equals("OP000023")||opp.getOptionNum().equals("OP000024")||
										opp.getOptionNum().equals("OP000025")||opp.getOptionNum().equals("OP000026")||
										opp.getOptionNum().equals("OP000027")||opp.getOptionNum().equals("OP000028")){ 
								%>
									

									<div class="item" data-value="i"><%=opp.getOptionName() %></div>
								<!-- 	<div class="item" data-value="1">화이트</div>
									<div class="item" data-value="2">랜덤</div> -->
										
									<% i++;}%>   --%>-->
								
						<% for(Option opp : detailOptionList) {%>
								<% int i=0; %>
								<% if(opp.getOptionNum().equals("OP000021")||opp.getOptionNum().equals("OP000022")||
										opp.getOptionNum().equals("OP000023")||opp.getOptionNum().equals("OP000024")||
										opp.getOptionNum().equals("OP000025")||opp.getOptionNum().equals("OP000026")||
										opp.getOptionNum().equals("OP000027")||opp.getOptionNum().equals("OP000028")){ %>
								
									<div class="item" data-value="i"><%=opp.getOptionName() %></div>
								
									
									<%}} %>
									
								</div>
							</div>
							<br> 색상  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="ui selection dropdown">
								 <input type="hidden" name="gender">  
								<i class="dropdown icon"></i>
								<div class="default text">[필수]옵션을 선택해 주세요</div>
								<div class="menu">
								<% for(Option opp2 : detailOptionList) {%>
								<% int j=0; %>
								<% if(opp2.getOptionNum().equals("OP000001")||opp2.getOptionNum().equals("OP000002")||
										opp2.getOptionNum().equals("OP000003")||opp2.getOptionNum().equals("OP000004")||
										opp2.getOptionNum().equals("OP000005")||opp2.getOptionNum().equals("OP000006")||
										opp2.getOptionNum().equals("OP000007")||opp2.getOptionNum().equals("OP000008")||
										opp2.getOptionNum().equals("OP000009")||opp2.getOptionNum().equals("OP000010")||
										opp2.getOptionNum().equals("OP000011")||opp2.getOptionNum().equals("OP000012")||
										opp2.getOptionNum().equals("OP000013")||opp2.getOptionNum().equals("OP000014")||
										opp2.getOptionNum().equals("OP000015")||opp2.getOptionNum().equals("OP000016")||
										opp2.getOptionNum().equals("OP000017")||opp2.getOptionNum().equals("OP000018")||
										opp2.getOptionNum().equals("OP000019")||opp2.getOptionNum().equals("OP000020")
										){ %>
								
									<div class="item" data-value="j"><%=opp2.getOptionName() %></div>
									<%}} %>
									
								</div>
							</div>
							<br>
							<hr><br>
							<p align="center">퐁 금액 : <%=pro.getProductPrice() %>  won</p> &nbsp;&nbsp;&nbsp;&nbsp;<br>
							<!-- <div class="buyBtnDiv">
								<button class="ui brown button buyBtn">By it Now</button>
							</div> -->
							<div class="cartBtnDiv">
								<button class="ui grey basic button cartBtn">CART</button>
								&nbsp;&nbsp;
								<button class="ui grey basic button cartBtn"
									onclick="wishListBtn();">♡WISH LIST</button>
							</div>

						</tr>
					</table>
				</div>
			</div>

			<hr>
			<div class="contextTop">

				상품상세 :  <%=pro.getProductDmemo() %> 
				<input type="hidden" id="productCode" value=<%=pro.getProductCode() %>>
			</div>


			<div class="detailImg">
				<img src="<%=detailImg1.getFilePath() %><%=detailImg1.getChangeName() %>"
					class="detailTopImgsize" width="700px">
			</div>

			<div class="sizeChart">
				<img src="<%=detailImg2.getFilePath() %><%=detailImg2.getChangeName() %>"
					class="detailTopImgsize" width="700px">
				<table class="ui celled table first-col">

					<tr>
						<td>어깨</td>
						<td>가슴</td>
						<td>암홀</td>
						<td>팔단면</td>
						<td>팔길이</td>
						<td>총장</td>

					</tr>
					<tr>
						<td>40.5</td>
						<td>51.5</td>
						<td>25</td>
						<td>19</td>
						<td>61</td>
						<td>62</td>
					</tr>
				</table>
				&nbsp;&nbsp;&nbsp;&nbsp; 단위: cm<br> <br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp; Color : 레드,브라운<br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp; Fitting Size : free size<br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp; Merry : 159cm / 45kg / 25-26inch /
				230-235mm<br> <br> &nbsp;&nbsp;&nbsp;&nbsp; Fabric :
				폴리100%<br> <br> &nbsp;&nbsp;&nbsp;&nbsp; Eun jung : 165cm
				/ 50kg / 27inch / 250mm<br> <br>

				<table class="ui celled table second-col">

					<tr>
						<td>안감</td>
						<td class="active">있음</td>
						<td>없음</td>
						<td>전체안감</td>
						<td>부분안감</td>
						<td>기모</td>
						<td>양털</td>

					</tr>
					<tr>
						<td>두께감</td>
						<td>두꺼움</td>
						<td class="active">적당함</td>
						<td>얇음</td>
						<td></td>
						<td></td>
						<td></td>

					</tr>
					<tr>
						<td>비침</td>
						<td>비침있음</td>
						<td>조금비침</td>
						<td class="active">비침없음</td>
						<td>밝은 색만 비침</td>
						<td></td>
						<td></td>

					</tr>
					<tr>
						<td>촉감</td>
						<td class="active">보드라움</td>
						<td>적당함</td>
						<td>조금까슬함</td>
						<td></td>
						<td></td>
						<td></td>

					</tr>
					<tr>
						<td>신축성</td>
						<td>신축성좋음</td>
						<td class="active">조금있음</td>
						<td>신축성없음</td>
						<td></td>
						<td></td>
						<td></td>

					</tr>

				</table>
				<img src="<%=detailImg3.getFilePath() %><%=detailImg3.getChangeName() %>" width="100%">

			</div>
			<div class="detailBottom1">
				<h3>리뷰게시판</h3>
				<table class="ui brown table" id="ReviewlistArea">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>평점</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Product ppp : list) {
								//System.out.print("다 불러와라 ㅠㅠ" + ppp);
						%>
						<tr>
							<td><%=ppp.getBoardNum()%></td>
							<td><%=ppp.getBoardTitle()%>
								<button onclick="detailReview();">클릭쓰</button></td>
							<td><%=ppp.getUserId()%></td>
							<td>별다섯</td>
						<input type="hidden" value="<%=ppp.getBoardId() %>">
						</tr>
						
						<%
							}
						%>


					</tbody>
				</table>
				<div align="right">
					<button class="ui brown basic mini button"
						onclick=ReviewClick();>작성하기</button>
					&nbsp;
				</div>

				<!-- 페이징 넘버 -->
				<div class="ui container center aligned">
					<div aria-label="Pagination Navigation" role="navigation"
						class="ui pagination menu">
						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPage=1'">«</a>


						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPage=<%=currentPage - 1%>'"><</a>
						<%
							for (int p = startPage; p <= endPage; p++) {
						%>
						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPage=<%=p%>'"><%=p%></a>

						<%
							}
						%>

						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPage=<%=currentPage + 1%>'">></a>

						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPage=<%=maxPage%>'">»</a>
					</div>
				</div>





			</div>
			<br>
			<div class="detailBottom1">
				<h3>상품문의</h3>
				<table class="ui brown table" id="QnAlistArea">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(Product pQnA:listQnA){
								//System.out.print("상품문의 리스트 불러와랑"+pQnA);
						%>
							
						<tr>
							<td><%=pQnA.getBoardNum()%></td>
							<td><%=pQnA.getBoardTitle() %></td>
							<td><%=pQnA.getUserId() %></td>
							<td><%=pQnA.getBoardDate() %></td>
							<%-- <td><%=pQnA.getBoardId() %></td> --%>

							<input type="hidden" value="<%=pQnA.getBoardId() %>">

						</tr>
						
						
					<%
							} %>
					
						
					</tbody>
				</table>
				
			
				<div align="right">
					<button class="ui brown basic mini button"
						onclick="location.href='/semi/views/customer/product/reviewInsertBoard.jsp';">작성하기</button>
					&nbsp;
				</div>

					<!-- 페이징 넘버 -->
				<div class="ui container center aligned">
					<div aria-label="Pagination Navigation" role="navigation"
						class="ui pagination menu">
						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPageQnA=1'">«</a>


						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPageQnA=<%=currentPageQnA - 1%>'"><</a>
						<%
							for (int p = startPageQnA; p <= endPageQnA; p++) {
						%>
						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPageQnA=<%=p%>'"><%=p%></a>

						<%
							}
						%>

						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPageQnA=<%=currentPageQnA + 1%>'">></a>

						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item"
							onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?currentPageQnA=<%=maxPageQnA%>'">»</a>
					</div>
				</div>
				
				
				
				<!-- /////////////////////////////////////////////// -->
				 <div class="ui container center aligned search-box">
                    

                    <div class="ui top attached tabular menu">
                            <a class="item active" data-tab="1">리뷰 게시판</a>
                            <a class="item" data-tab="2">상품 문의</a>
                            
                    </div>
                          <div class="ui bottom attached tab segment" data-tab="1">
                            리뷰 게시판
                          </div>
                          <div class="ui bottom attached tab segment active" data-tab="2">
                                상품 문의

                          </div>
            		</div>




			</div>

		</div>
	</div>





	<br>
	<br>
	<br>
	
	


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
	

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({
			action : 'select'
		});
		$('.menu .item').tab();
	</script>

	<script>
		$('.contextBox .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
		function wishListBtn() {
			location.href = "/semi/views/customer/product/wishList.jsp";
		}
		function detailReview() {
			location.href = "/semi/views/customer/product/detailReview.jsp";
		}
		function detailQnA() {
			location.href = "/semi/views/customer/product/detailQnA.jsp";

		}
		
		
	</script>
	<!-- QnA상세보기  -->
	<script>
		$(function(){
			$("#QnAlistArea td").click(function(){
				var num = $(this).parent().children().eq(0).text();
				var pQnABoardId = $(this).parent().find("input").val();

				//console.log(num);
				console.log(pQnABoardId);
				
				//글번호와 함께
				location.href="<%=request.getContextPath()%>/SelectOneQnA.no?num="+num+"&pQnABoardId="+pQnABoardId;

			});
			
			//리뷰 상세페이징
			$("#ReviewlistArea td").click(function(){
				var reviewRum =$(this).parent().find("input").val();
				
			
				console.log(reviewRum);
				
				location.href="<%=request.getContextPath()%>/selectReview.pd?reviewRum="+reviewRum;
			
			
			
			})
		});
		
		//review 작성하기
		function ReviewClick(){
<%-- 			location.href="<%=request.getContextPath()%>/selectReviewOption.pd?product=<%=pro.getProductCode()%>"; --%>	
				location.href="<%=request.getContextPath()%>/selectReviewOption.pd?productCode="+'PD000003';
		
		}
	
	</script>
	
</body>

</html>