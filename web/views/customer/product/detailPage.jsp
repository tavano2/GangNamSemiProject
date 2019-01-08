<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.kh.semi.customer.product.model.vo.ReallyProduct"%>
<%@page import="com.kh.semi.customer.product.model.vo.Option"%>
<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="com.kh.semi.customer.product.model.vo.Product"%>
<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Product> listReview = (ArrayList<Product>) request.getAttribute("list");
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
	
	//옵션 HashMap
	HashMap<String, ArrayList<Option>> productOption = new HashMap<String, ArrayList<Option>>();
	
	for(Option op : detailOptionList){
		if(!productOption.containsKey(op.getOptionSnum())){
			productOption.put(op.getOptionMemo(), null);
		}
	}
	
	for(String key : productOption.keySet()){
		ArrayList<Option> opList = new ArrayList<Option>();
		
		for(Option op : detailOptionList){
			if(op.getOptionMemo().equals(key)){
				Option opCopy = new Option();
				
				opCopy.setOptionSnum(op.getOptionSnum());
				opCopy.setProductCode(op.getProductCode());
				opCopy.setOptionMemo(op.getOptionMemo());
				opCopy.setOptionNum(op.getOptionNum());
				opCopy.setOptionName(op.getOptionName());
				
				opList.add(opCopy);
			}
		}
		
		productOption.put(key, opList);
	}
	
	/* for(String key : productOption.keySet()){
		for(Option op : productOption.get(key)){
			System.out.println(op);
		}
	} */
	
	if(detailAttachmentList.size()>0){
		
	//상품이름, 판매가,상품상세글, 옵션12, 상품이미지1메인,2상품이미지 34
	Attachment titleImg = detailAttachmentList.get(0);
	Attachment detailImg1 = detailAttachmentList.get(1);
	Attachment detailImg2 = detailAttachmentList.get(2);
	Attachment detailImg3 = detailAttachmentList.get(3);
	

	}
	//Option option1 = detailOptionList.get(0);
	//Option option2 = detailOptionList.get(1);
	
%>

<%!
	public String comma(int price){
		return new DecimalFormat("#,###").format(price);
	}
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

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



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
	width: 185px;
	margin-right: auto;
	margin-left: auto;
}

.contextTop {
	width: 100%;
	/* height: 600px; */
	text-align: center;
	padding-top: 150px;
	/*  border: 1px solid lightcoral; */
}

.detailImg {
	width: 100%;
	text-align: center;
	/*  border: 1px solid lightblue; */
}

.sizeChart {
	width: 100%;
	text-align: center;
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

.second-col tr, .second-col td {
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
	color:gray;
	font-size:30px;
	font-weight:bold;
	font-famaily:Sans-Serif;
}

.upDown {
	width: 50px;
	bottom: 6%;
	right: 3%;
	position: fixed;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
   -webkit-appearance: none;
    margin: 0;
}
</style>

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>

	<div class="upDown">
		<button class="big circular ui icon button" style="margin-bottom: 10px;" onclick="scrollUp();">
		  	<i class="chevron up icon"></i>
		</button>
		<button class="big circular ui icon button" onclick="scrollDown();">
		  	<i class="chevron down icon"></i>
		</button>
	</div>
	

	<div class="content">
		<div class="contextBox">
		
		<form action="" method="post" name="selectProduct" id="selectProduct">
			<input type="hidden" id="productCode" name="productCode" value="<%=pro.getProductCode()%>">
			<table>
				<tr>
					<td rowspan="2"  style="vertical-align: top;">
					
				<% if(detailAttachmentList.size()>0){
					Attachment titleImg = detailAttachmentList.get(0);

					%>
	
						<img src="<%=titleImg.getFilePath() %><%=titleImg.getChangeName() %>"
							class="detailTopImgsize" width="500" height="500">
							
							<%} %>
					</td>
					<td style="vertical-align: top;">
						<table style="margin-left: 45px; width: 400px;">
							<tr>
								<td colspan="2" style="border-bottom: 1px solid lightgrey; padding-bottom: 10px;">
	                        		<p class="productName" id="productName"><%=pro.getProductName() %></p>
	                        		
	                        	<td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 20px; padding-bottom: 20px; height: 140px; vertical-align: top; border-bottom: 1px solid lightgrey;">
									<%=pro.getProductMemo() %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: bottom;">
						<table id="optionTable" style="margin-left: 45px; width: 390px;">
							<tr style="height:40px;">
								<td style="width:160px;"><b>판매가</b></td>
								<td style="text-align: right;"><%=comma(pro.getProductPrice()) %> won</td>
							</tr>
							<% for(String key : productOption.keySet()){ %>
							<tr style="height:40px;">
								<td>
									<label class="optionMemo">
										<%= productOption.get(key).get(0).getOptionMemo().split("\\[")[0] %>
									</label>
								</td>
								<td>
									<div class="ui selection fluid dropdown">
	                                	<input type="hidden" name="optionNum" onchange="optionSelect();">
	                                	<i class="dropdown icon"></i>
	                                	<div class="default text">필수 선택</div>
	                                	<div class="menu optionSel">
	                                   		<% for(Option op : productOption.get(key)){ %>
	                                   		<div class="item" data-value="<%= op.getOptionNum() %>"><%= op.getOptionName() %></div>
	                                       	<% } %>
	                      				</div>
	                         		</div>
	                    		</td>
	          				</tr>
							<% } %>
							<tr><td colspan="2" style="height: 10px; border-bottom: 1px solid lightgrey;"></td></tr>
							<tr><td colspan="2" style="height: 10px;"></td></tr>
							
							<tr>
								<td colspan="2">
									<table id="appendProduct" style="width: 390px;">
										
										<!-- 상품 추가 -->
									</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="height:50px; padding: 25px 0;">
									<div class="ui grid">
										<div class="eight wide column">
											<b>총 금액</b>
										</div>
										<div class="eight wide column right aligned" id="totalPrice">
											0 won
										</div>
									</div>
									
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<table style="text-align: center; width: 390px;">
										<tr>
											<td>
												<!-- <div class="buyBtnDiv">
													<button class="ui brown button buyBtn">By it Now</button>
												</div> -->
												<div class="cartBtnDiv">
													<button class="ui grey basic button cartBtn" onclick="insertCart(); return false;">Add to CART</button>
												</div>
											</td>
											<td>
												<div class="cartBtnDiv">
													<div class="ui grey basic button cartBtn" id="addWishListBtn"><span><i class="heart outline icon"></i>WISH LIST</span></div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="cartBtnDiv">
													<button class="ui grey basic button cartBtn" style="width: 378px;" onclick="location.href='<%=request.getContextPath()%>/selectCartList.pd'; return false;">CART</button>
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							
						</table>
					</td>
				</tr>
			</table>
		</form>

			<div class="contextTop">

				<%=pro.getProductDmemo() %>
			</div>


			<div class="detailImg">
			
			
	
				<% if(detailAttachmentList.size()>0){
					Attachment detailImg1 = detailAttachmentList.get(1);

					%>
				<img src="<%=detailImg1.getFilePath() %><%=detailImg1.getChangeName() %>"
					class="detailTopImgsize" width="950px"> 
					
				<%} %>
			</div>

			<div class="sizeChart">
			
				<% if(detailAttachmentList.size()>0){
					Attachment detailImg2 = detailAttachmentList.get(2);

					%>
			
				<img src="<%=detailImg2.getFilePath() %><%=detailImg2.getChangeName() %>"
					class="detailTopImgsize" width="950px">
					
					<%} %>
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
				
			
	
				<% if(detailAttachmentList.size()>0){
					Attachment detailImg3 = detailAttachmentList.get(3);

					%>
				<img src="<%=detailImg3.getFilePath() %><%=detailImg3.getChangeName() %>" width="100%">
				<%} %>
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
							for (Product ppp : listReview) {
								//System.out.print("다 불러와라 ㅠㅠ" + ppp);
						%>
						<tr>
							<td><%=ppp.getBoardNum()%></td>
							<td><%=ppp.getBoardTitle()%></td>
							<td><%=ppp.getUserId()%></td>
							<td>별다섯</td>
						<input type="hidden" value="<%=ppp.getBoardId() %>">
						</tr>
						
						<%
							}
						%>


					</tbody>
					
					<tfoot>
						<tr>
							<th colspan="4">
							
								<!-- 페이징 넘버 -->
								<div class="ui center aligned">
									<div aria-label="Pagination Navigation" role="navigation"
										class="ui pagination menu reviewPaging">
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPage=1'"><i class="angle double left icon"></i></a>
				
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPage=<%=currentPage - 1%>'"><i class="angle left icon"></i></a>
										<%
											for (int p = startPage; p <= endPage; p++) {
										%>
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPage=<%=p%>'"><%=p%></a>
				
										<%
											}
										%>
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPage=<%=currentPage + 1%>'"><i class="angle right icon"></i></a>
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPage=<%=maxPage%>'"><i class="angle double right icon"></i></a>
									</div>
								</div>
							
							</th>
						</tr>
					</tfoot>
				</table>
				<div align="right">
					<button class="ui brown basic mini button"
						onclick=ReviewClick();>작성하기</button>
					&nbsp;
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
					
					<tfoot>
						<tr>
							<th colspan="4">
							
								<!-- 페이징 넘버 -->
								<div class="ui center aligned">
									<div aria-label="Pagination Navigation" role="navigation"
										class="ui pagination menu QnAPaging">
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPageQnA=1'"><i class="angle double left icon"></i></a>
				
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPageQnA=<%=currentPageQnA - 1%>'"><i class="angle left icon"></i></a>
										<%
											for (int p = startPageQnA; p <= endPageQnA; p++) {
										%>
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPageQnA=<%=p%>'"><%=p%></a>
				
										<%
											}
										%>
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPageQnA=<%=currentPageQnA + 1%>'"><i class="angle right icon"></i></a>
				
										<a aria-current="false" aria-disabled="false" tabindex="0"
											value="1" aria-label="First item" type="firstItem" class="icon item"
											onclick="location.href='<%=request.getContextPath()%>/reviewNoticeList.no?code=<%=pro.getProductCode()%>&currentPageQnA=<%=maxPageQnA%>'"><i class="angle double right icon"></i></a>
									</div>
								</div>
								
							</th>
						</tr>
					</tfoot>
					
				</table>
				
			
				<div align="right">
					<button class="ui brown basic mini button"
						onclick="location.href='/semi/views/customer/product/reviewInsertBoard.jsp?code=<%=pro.getProductCode()%>';">작성하기</button>
					&nbsp;
				</div>

					
				
				
				
				<!-- /////////////////////////////////////////////// -->
		<!-- 		 <div class="ui container center aligned search-box">
                    

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


 -->

			</div>

		</div>
	</div>





	<br>
	<br>
	<br>
	
	


	<%@ include file="/views/customer/common/mainFooter.jsp"%>

	<div class="ui tiny modal">
		<div class="header">
	      	알림
	    </div>
	    <div class="content" style="width: auto; padding-left:0;">
	      	<div class="ui input big fluid transparent">
	        	<input type="text" id="cartMsg" style="text-align: center;" readonly>
	        </div>
	    </div>
	    <div class="actions" id="cartModalBtns">
	    	<div class="ui grid">
	    		<div class="eight wide column left aligned">
		    		<div class="ui positive button">
			       		쇼핑계속하기
			      	</div>
	    		</div>
	    		
	    		<div class="eight wide column right aligned">
	    			<div class="ui positive right labeled icon button" id="cartModal" onclick="location.href='<%=request.getContextPath()%>/selectCartList.pd'">
			        	장바구니로 이동
			        	<i class="shopping cart icon"></i>
			      	</div>
	    		</div>
	    	</div>
	      	
		</div>
	</div>

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
	<!-- Comma js -->
	<script src="/semi/js/common/common.js"></script>

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({
			action : 'select'
		});
		$('.menu .item').tab();
		
		$('#cate_nav').sticky({
			context: '.content'
		});
	</script>

	<script>
		$('.contextBox .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
		
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
			$("#QnAlistArea td").mouseenter(function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'})
			}).mouseout(function(){
				$(this).parent().css({'background':'white'})
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				var pQnABoardId = $(this).parent().find("input").val();

				//console.log(num);
				console.log(pQnABoardId);
				
				//글번호와 함께
				location.href="<%=request.getContextPath()%>/SelectOneQnA.no?num="+num+"&pQnABoardId="+pQnABoardId+"&productCode=<%=pro.getProductCode()%>";

			});
			
			//리뷰 상세페이징
			$("#ReviewlistArea td").mouseenter(function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'})
			}).mouseout(function(){
				$(this).parent().css({'background':'white'})
			}).click(function(){
				var reviewRum =$(this).parent().find("input").val();
				
			
				console.log(reviewRum);
				
				location.href="<%=request.getContextPath()%>/selectReview.pd?reviewRum="+reviewRum+"&productCode=<%=pro.getProductCode()%>";
			
			})
			
			
			//페이지버튼 Active
			$(".reviewPaging").children().eq(<%= currentPage + 1 %>).addClass('active');
			$(".QnAPaging").children().eq(<%= currentPageQnA + 1 %>).addClass('active');
		});
		
		//review 작성하기
		function ReviewClick(){
<%-- 			location.href="<%=request.getContextPath()%>/selectReviewOption.pd?product=<%=pro.getProductCode()%>"; --%>	
				
				
				$.ajax({
					url:"<%=request.getContextPath()%>/hasOrderDnum.pd?productCode=<%=pro.getProductCode()%>",
					success:function(data){
						console.log(data);
						if(data=="Y"){
							location.href="<%=request.getContextPath()%>/selectReviewOption.pd?productCode=<%=pro.getProductCode()%>&boardId=420";
						}else{
							swal("주문자만 작성할 수 있습니다!");
						}
					}
				});
		
		}
	
	</script>
	
	
	<!-- 카트로 -->
	<script>
		function optionSelect(){
			var chk = true;
			var optionNum = $("input[name='optionNum']");
			
			for(var i=0; i<optionNum.length; i++){
				if($(optionNum[i]).val() == ""){
					chk = false;
				}
			}
			
			if(chk){
				var option = "";
				var optionNumStr = "";
				
				for(var i=0; i<optionNum.length; i++){
					//console.log($(optionNum[i]).parent().find("[data-value='"+$(optionNum[i]).val()+"']").text());
					option += $(optionNum[i]).parent().find("[data-value='"+$(optionNum[i]).val()+"']").text();
					optionNumStr += $(optionNum[i]).val();
					if(i<optionNum.length-1)  {
						option += ", ";
						optionNumStr += ", ";
					}
				}
				//console.log(option);
				//console.log(optionNumStr);
				
				var chk2 = true;
				var prodSelectOption = $("[name='prodSelectOption']");
				
				for (var i=0; i<prodSelectOption.length; i++){
					if($(prodSelectOption[i]).val() == optionNumStr){
						chk2 = false;
					}
				}
				
				if(chk2){
					var $tr = $("<tr>")
					var $td1 = $("<td style='width: 220px;'>").html("<span style='color:lightgray;'>"+ $("#productName").text() + "</span><br> - " + "<span style='color:gray;'>" + option + "</span>");
					$td1.append($("<input type='hidden' class='prodSelectOption' name='prodSelectOption' value='"+optionNumStr+"'>"));
					var $input = $("<div class='ui input'>").append("<input type='number' value='1' min='1' name='prodSelectAmount' class='prodSelectAmount' onchange='totalPriceCal();' style='width:30px; height: 30px; text-align: center; padding: 5px 5px; margin-right:5px;'>");
					var $plusBtn = $("<button class='ui compact icon button' onclick='plusAmountBtn(this); return false;'>").append("<i class='plus icon'></i>");
					var $minusBtn = $("<button class='ui compact icon button' onclick='minusAmountBtn(this); return false;'>").append("<i class='minus icon'></i>");
					var $delBtn = $("<button class='ui compact icon button' onclick='delProdBtn(this); return false;'>").append("<i class='trash alternate icon'></i>");
					var $td2 = $("<td align='right'>").append($input).append($plusBtn).append($minusBtn).append($delBtn);
					
					$tr.append($td1);
					$tr.append($td2);
					$("#appendProduct").append($tr);
					
					totalPriceCal();
				} else {
					alert("이미 같은 옵션을 추가하셨습니다.");
				}
				
				$('#optionTable .ui.dropdown').dropdown('restore defaults');
			}
		}
		
		function delProdBtn(btn){
			$(btn).parent().parent().remove();
			totalPriceCal();
		}
		
		function plusAmountBtn(btn){
			var val = Number($(btn).parent().find(".prodSelectAmount").val())+1;
			if(val < 100){
				$(btn).parent().find(".prodSelectAmount").val(val);
				totalPriceCal()
			}
		}
		
		function minusAmountBtn(btn){
			var val = Number($(btn).parent().find(".prodSelectAmount").val())-1;
			if(val > 0){
				$(btn).parent().find(".prodSelectAmount").val(val);
				totalPriceCal()
			}
		}
		
		function totalPriceCal(){
			var totalAmount = 0;
			
			for(var i=0; i<$(".prodSelectAmount").length; i++){
				totalAmount += Number($($(".prodSelectAmount")[i]).val());
			}
			
			$("#totalPrice").text(numComma(totalAmount * Number(<%= pro.getProductPrice() %>)) + " won");
		}
		
		function insertCart(){
			var selectProduct = $("#selectProduct").serialize();
			
			if($(".prodSelectAmount").length > 0){
				$.ajax({
					url: "<%= request.getContextPath() %>/insertCart.pd",
					type: "post",
					data: selectProduct,
					success: function(data){
						if(data[0] == "Y"){
							$("#cartMsg").val(data[1]);
							$("#cartModal").show();
							$("#cartModal").html("장바구니로 이동<i class='shopping cart icon'></i>");
							$("#cartModal").off();
							$("#cartModal").click(function(){
								location.href = "<%=request.getContextPath()%>/selectCartList.pd";
							});
						} else {
							$("#cartMsg").val(data[1]);
							$("#cartModal").show();
							$("#cartModal").html("로그인하기<i class='user icon'></i>");
							$("#cartModal").off();
							$("#cartModal").click(function(){
								location.href = "<%=request.getContextPath()%>/views/customer/member/memberLogin.jsp";
							});
						}
						
						$('.tiny.modal').modal('show');
					}, error: function(){
						console.log("실패 ㅠㅠ");
					}
				});
			} else {
				$("#cartMsg").val("옵션을 선택하세요.");
				$("#cartModal").hide();
				
				$('.tiny.modal').modal('show');
			}
			
		}
		
		<%if(loginUser != null) {%>
		$(function(){
			var productCode = "<%= pro.getProductCode() %>";
			
			$.ajax({
				url: "<%= request.getContextPath() %>/selectWishList.pd",
				type: "post",
				data: {productCode:productCode},
				success: function(result){
					if(result > 0){
						$("#addWishListBtn").html("<span style='color: red;'><i class='heart icon'></i>WISH LIST</span>");
						
						$("#addWishListBtn").click(deleteWishList);
					} else {
						$("#addWishListBtn").html("<span><i class='heart outline icon'></i>WISH LIST</span>");
						
						$("#addWishListBtn").click(insertWishList);
					}
				}, error: function(){
					console.log("실패");
				}
			});
		});
		
		var insertWishList = function() {
			var productCode = "<%= pro.getProductCode() %>";
			
			$.ajax({
				url: "<%= request.getContextPath() %>/insertWishList.pd",
				type: "post",
				data: {productCode:productCode},
				success: function(data){
					$("#addWishListBtn").html("<span style='color: red;'><i class='heart icon'></i>WISH LIST</span>");
					
					$("#addWishListBtn").off();
					$("#addWishListBtn").click(deleteWishList);
				}, error: function(){
					console.log("실패");
				}
			});
			
			return false;
		}
		
		var deleteWishList = function() {
			var productCode = "<%= pro.getProductCode() %>";
			
			$.ajax({
				url: "<%= request.getContextPath() %>/deleteWishListInDetail.pd",
				type: "post",
				data: {productCode:productCode},
				success: function(data){
					$("#addWishListBtn").html("<span><i class='heart outline icon'></i>WISH LIST</span>");
					
					$("#addWishListBtn").off();
					$("#addWishListBtn").click(insertWishList);
				}, error: function(){
					console.log("실패");
				}
			});
			
			return false;
		}
		
		<%}%>
		
	</script>
	
	<script>
		//스크롤 이동
		function scrollUp(){
			$("html,body").animate({ scrollTop: 0 }, "slow");
		}
			
		
		function scrollDown(){
			$("html,body").animate({ scrollTop: $(document).height() }, "slow");
		}
	</script>
	
</body>



</html>