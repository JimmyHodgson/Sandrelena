$(document).ready(function () {

    //AVOID ENTER TO SUBMIT
    $(window).keydown(function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            $("#btnlogin").click();
        }
    });

    // Prevents from closing clicking outside or ESC
    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    })
    $("#myModal").modal("show");

});