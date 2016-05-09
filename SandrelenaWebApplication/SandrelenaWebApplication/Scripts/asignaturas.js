$(document).ready(function () {
    $('.modal-dialog').draggable({ handle: ".modal-header" });

    $('#frm_agr').on('hidden.bs.modal', function (e) {
        $('.modal-dialog').css('top', 'auto');
        $('.modal-dialog').css('left', 'auto');
    });

})