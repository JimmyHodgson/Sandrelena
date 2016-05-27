$(document).ready(function () {

    $(".customSelect").select2();
    $('b[role="presentation"]').hide();
    $('.select2-selection__arrow').append('<i class="fa fa-angle-down"></i>');

    $('.modal-dialog').draggable({ handle: ".modal-header" });

    $('#frm_agr').on('hidden.bs.modal', function (e) {
        $('.modal-dialog').css('top', 'auto');
        $('.modal-dialog').css('left', 'auto');
    });

})