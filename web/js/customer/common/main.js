/* 사이드바 */
$(document).ready(function () {
    $("#sidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('#dismiss, .overlay').on('click', function () {
        $('#sidebar').removeClass('active');
        $('.overlay').removeClass('active');
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').addClass('active');
        $('.overlay').addClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
});

/* 윈도우 사이즈 변경시 상단 네비 표시 변경 */
$(function () {
    if ($(window).width() > 760) {
        $('#top_nav').show();
    } else {
        $('#top_nav').hide();
    }
    $(window).resize(function () {
        if ($(this).width() > 760) {
            $('#top_nav').show();
        } else {
            $('#top_nav').hide();
        }
    });
});

/* 네비바 */
$('#cate_nav').sticky({
	context: '.content'
});
$('#cate_nav .ui.dropdown').dropdown({action: 'select'});