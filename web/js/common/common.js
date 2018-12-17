//금액 천 단위로 콤마 찍기
function numComma(num){
	var numStr = String(num);
	return numStr.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,"$1,");
}