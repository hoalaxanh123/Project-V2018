//5:23 3/7/2018
var check1 = 0, check2 = 0;

$("#AD_Login_KQ").text("").delay(2000);

$("#AD_Login_User").on('input', function () {
    if ($(this).val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $("#error_AD_Login_User").text("*Tên đăng nhập có 6 - 50 ký tự");
        check1 = 0;
    }
    else {

        $(this).css("border-color", "#2eb82e");
        $("#error_AD_Login_User").text("");
        check1 = 1;
    }
});
$("#AD_Login_Pass").on('input', function () {
    if ($(this).val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $("#error_AD_Login_Pass").text("*Mật khẩu có 6 - 50 ký tự");
        check2 = 0;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        check2 = 1;
        $("#error_AD_Login_Pass").text("");
    }
});

$("#AD_LoginForm").submit(function (event) {
    if ((check1 + check2) != 2) {
        event.preventDefault();
        $.alert("Bạn chưa nhập đủ thông tin");
        if (check1 == 0) {
            $("#error_AD_Login_Pass").text("*Mật khẩu có 6 - 50 ký tự");
        }
        else {
            $("#error_AD_Login_User").text("*Tên đăng nhập có 6 - 50 ký tự");
        }
    }
});
