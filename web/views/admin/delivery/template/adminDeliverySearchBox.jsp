<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

				<form action="<%=request.getContextPath() %>/adminOrderSearch.de" method="get" id="searchBox">
					<input type="hidden" name="uri" value="<%=request.getRequestURI()%>">
	                <table class="ui celled table order-search">
	                    <!-- 검색 테이블 -->
	                    <thead>
	                        <tr>
	                            <th colspan="2">&nbsp;</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td>검색어</td>
	                            <td>
	                                <div class="ui selection dropdown">
	                                    <input type="hidden" name="orderCondition">
	                                    <i class="dropdown icon"></i>
	                                    <div class="default text">검색목록선택</div>
	                                    <div class="menu">
	                                        <div class="item" data-value="1">주문번호</div>
	                                        <div class="item" data-value="2">주문자 아이디</div>
	                                        <div class="item" data-value="3">주문자 이름</div>
	                                        <div class="item" data-value="4">주문자 일반전화</div>
	                                        <div class="item" data-value="5">주문자 휴대전화</div>
	                                        <div class="divider"></div>
	                                        <div class="item" data-value="6">수령자 이름</div>
	                                        <div class="item" data-value="7">수령자 일반전화</div>
	                                        <div class="item" data-value="8">수령자 휴대전화</div>
	                                        <div class="item" data-value="9">배송지 주소</div>
	                                        <div class="divider"></div>
	                                        <div class="item" data-value="10">운송장번호</div>
	                                        <div class="item" data-value="11">메모</div>
	                                    </div>
	                                </div>
	                                <div class="ui input">
	                                    <input type="text" name="orderText">
	                                </div>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>기간</td>
	                            <td>

	                                <div class="ui pagination menu" id="selDate">
	                                    <a class="item active">오늘</a>
	                                    <a class="item">어제</a>
	                                    <a class="item">3일</a>
	                                    <a class="item">7일</a>
	                                    <a class="item">15일</a>
	                                    <a class="item">1개월</a>
	                                    <a class="item">3개월</a>
	                                    <a class="item">6개월</a>
	                                </div>

	                                <div class="date-range">
	                                	<div class="ui input">
		                                	<input type="date" id="startDate" name="startDate">
		                                </div>
		                                <span>~</span>
		                                <div class="ui input">
		                                	<input type="date" id="endDate" name="endDate">
		                                </div>
	                                </div>

	                            </td>
	                        </tr>
	                        <tr>
	                            <td>상품</td>
	                            <td>
	                                <div class="ui selection dropdown">
	                                    <input type="hidden" name="productCondition">
	                                    <i class="dropdown icon"></i>
	                                    <div class="default text">검색목록선택</div>
	                                    <div class="menu">
	                                        <div class="item" data-value="1">상품명</div>
	                                        <div class="item" data-value="2">상품코드</div>
	                                        <div class="item" data-value="3">품목코드</div>
	                                        <div class="item" data-value="4">제조사</div>
	                                    </div>
	                                </div>
	                                <div class="ui input">
	                                    <input type="text" name="productText">
	                                </div>
	                            </td>
	                        </tr>
	                        <tr id="orderState">
	                        	<td>주문상태</td>
	                        	<td>
		                        	<div class="container">
		                        		<div class="ui master checkbox">
											<input type="checkbox" checked>
											<label>전체</label>
										</div><br><br>
										<div class="chk-list">
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="productReady" checked>
												<label>상품준비중</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="deliveryReady" checked>
												<label>배송준비중</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="deliveryWating" checked>
												<label>배송대기중</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="delivering" checked>
												<label>배송중</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="deliveryComplete" checked>
												<label>배송완료</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="purchase" checked>
												<label>구매확정</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="cancel" checked>
												<label>취소</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="exchange" checked>
												<label>교환</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="returnProd" checked>
												<label>반품</label>
											</div>
											<div class="ui child checkbox">
												<input type="checkbox" name="orderState" value="refund" checked>
												<label>환불</label>
											</div>
										</div>
									</div>
	                        	</td>
	                        </tr>
	                    </tbody>
	                </table>

	                <div class="ui container center aligned search-btn">
	                    <button class="ui black button" type="submit">검색</button>
	                    <button class="ui black basic button" type="reset" onclick="activeReset();">초기화</button>
	                </div>
                </form>