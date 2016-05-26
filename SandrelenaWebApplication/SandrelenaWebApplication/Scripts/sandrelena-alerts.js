$(document).on('show.bs.modal', '.modal', function () {
    var zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function () {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
});

$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

function showAlert(element, title, message) {
    console.log('El método showAlert se ejecutó.');
    console.log(element + ' ' + title + ' ' + message);
    $(element + ' .alert-title').html(title);
    $(element + ' .alert-message').html(message);

    $(element).modal('show');
}

function confirmModal(callback) {
    showAlert('#cw-alert', 'Confirm', '¿Esta seguro que quiere realizar esta acción?');

    $("#btn-confirm").off().on('click', function () {
        $("#cw-alert").modal('hide');
        callback(true);

    });
    $("#btn-deny").off().on('click', function () {
        $("#cw-alert").modal('hide');
        callback(false);

    });
}