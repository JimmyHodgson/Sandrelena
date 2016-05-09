$(document).ready(function () {
    $('.datepicker').datepicker({ format: 'yyyy/mm/dd', autoclose: true });
    $('.modal-dialog').draggable({ handle: ".modal-header" });
})