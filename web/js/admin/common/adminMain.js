$('#sticky1').sticky(); //네이바 상단 고정

// $('.ui.sidebar').sidebar('setting', 'transition', 'overlay');
// $('#menu').click(function () {  //사이드바 오픈 버튼
//     $('.ui.sidebar').sidebar('toggle');
// });
// $(function(){
//     $('.pusher').css('overflow', 'initial');
// });

/* 사이드바 */
$(document).ready(function () {
    $("#adminSidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('.overlay').on('click', function () {
        $('#adminSidebar').removeClass('active');
        $('.overlay').removeClass('active');
    });

    $('#sidebarCollapse').on('click', function () {
        $('#adminSidebar').addClass('active');
        $('.overlay').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
});