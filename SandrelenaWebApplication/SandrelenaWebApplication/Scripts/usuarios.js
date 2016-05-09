$(document).ready(function () {
    var datepicker = $.fn.datepicker.noConflict();
    $.fn.bootstrapDP = datepicker;

    $('.datepicker').bootstrapDP({ format: 'yyyy/mm/dd', autoclose: true });
    $('.modal-dialog').draggable({ handle: ".modal-header" });
})