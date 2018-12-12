$('#sticky1').sticky(); //네이바 상단 고정
$('#menu').click(function () {  //사이드바 오픈 버튼
    $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
})