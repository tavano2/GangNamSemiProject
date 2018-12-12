<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sign {
	border: 1px solid lightgray;
	width: 850px;
	margin-left: auto;
	margin-right: auto;
}

.signTitle {
	margin-top: 30px;
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 30px;
	font-size: 20px;
}

.insertContent {
	overflow: scroll;
	width: 800px;
	height: 300px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 30px;
	font-size: 12px;
}

.title {
	display: inline;
	margin-left: 30px;
	font-weight: bold;
}

.check {
	display: inline;
	float: right;
	margin-right: 30px;
}
</style>
</head>
<body>
	<div class="sign">
		<div class="signTitle">
			<div class="title">
				<span>너랑나랑옷사랑 청약철회방침 사용자 동의</span>
			</div>
			<div class="check">
				<div class="ui checkbox">
					<input type="checkbox" name="example"><label> </label>
				</div>
			</div>
		</div>
		<div class="insertContent">
			<p>①“{$mall_name}”과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일
				이내에는 청약의 철회를 할 수 있습니다. ② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및
				교환을 할 수 없습니다.</p>
			<p>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여
				포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가
				현저히 감소한 경우 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우 4. 같은 성능을
				지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</p>
			<p>③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는
				곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.</p>
			<p>④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게
				이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회
				등을 할 수 있습니다.</p>
			<p>제16조(청약철회 등의 효과)</p>
			<p>① “{$mall_name}”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의
				대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여
				고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</p>
			<p>② “{$mall_name}”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로
				재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록
				요청합니다.</p>
			<p>③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게
				청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과
				다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 “{$mall_name}”이 부담합니다.</p>
			<p>④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “몰”은 청약 철회시 그 비용을 누가 부담하는지를
				이용자가 알기 쉽도록 명확하게 표시합니다.</p>
		</div>
	</div>
</body>
</html>