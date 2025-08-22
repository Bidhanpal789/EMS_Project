// Preloader
$(document).ready(function () {
    // Hide preloader after 1 second
    setTimeout(function () {
        $('.preloader').addClass('hidden');
    }, 1000);

    // Bootstrap collapse events to show/hide backdrop
    var $sidebar = $('#sidebar');
    var $backdrop = $('.sidebar-backdrop');

    $sidebar.on('show.bs.collapse', function () {
        $backdrop.css('display', 'block');
    });

    $sidebar.on('hide.bs.collapse', function () {
        $backdrop.css('display', 'none');
    });
});