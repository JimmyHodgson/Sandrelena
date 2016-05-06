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

    $("#btnlogin").click(function () {
        var user = $('#uLogin').prop('value');
        var pass = $('#uPassword').prop('value');

        if (user == "" || pass == "") {
            $('#warning').html("enter your credentials");

            $('#warning').removeClass("hidden").removeClass("label-danger").addClass("label-warning");
        }
        else if (user != pass) {
            $('.modal-content').effect("shake");
            $('#warning').html("username or password not valid");

            $('#warning').removeClass("hidden").removeClass("label-warning").addClass("label-danger");
        }
        else {
            $('#warning').html("welcome");

            $('#warning').removeClass("label-warning").removeClass("label-danger").addClass("label-success");
        }
    });
});