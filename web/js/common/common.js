//금액 천 단위로 콤마 찍기
function comma(price){
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}