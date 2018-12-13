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