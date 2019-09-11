
$("#UserNameDK").on('input', function () {
    if ($(this).val().length <= 5) {
        $(this).css("border-color", "#FF0000");
        //  $('#submit').addClass("btn-info disabled");
        $('#submit').addClass("btn-info disabled");
        $("#error_nameDK").text("*Tên đăng nhập ít nhất 6 ký tự");
    }
    else {

        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $('#submit').removeClass("btn-info disabled");
        $("#error_nameDK").text("");

    }
});

$("#UserNameDK").focusout(function () {
    if ($("#UserNameDK").val().length >= 6) {
        $.post("/User/Check_User_Already", { TenDN: $("#UserNameDK").val() }, function (cc) {
            if (cc == "False") {
                $("#error_nameDK").text("");
            }
            else {
                $("#error_nameDK").text("*Tên đăng nhập đã có người dùng, vui lòng chọn tên khác");
                $(this).css("border-color", "#2eb82e");
                $('#submit').addClass("btn-info disabled");
            }
        });
    }
});

$("#EmailDK").focusout(function () {
    if ($("#EmailDK").val().length >= 6) {
        $.post("/User/Check_Email_Already", { Email: $("#EmailDK").val() }, function (cc) {
            if (cc == "False") {
                $("#error_EmailDK").text("");
            }
            else {
                $("#error_EmailDK").text("*Email đã có người dùng, vui lòng chọn tên khác");
                $(this).css("border-color", "#2eb82e");
                $('#submit').addClass("btn-info disabled");
            }
        });
    }
});




$("#PassFirtDK").on('input', function () {
    if ($(this).val().length <= 5) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_passfirtDK").text("*Nhập ít nhất 6 ký tự");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_passfirtDK").text("");

    }
});
$("#FullNameDK").on('input', function () {
    if ($(this).val().length == 0) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_fullnameDK").text("*Vui lòng nhập tên bạn");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_fullnameDK").text("");

    }
});
$("#PassSecondDK").on('input', function () {
    if ($(this).val() != $("#PassFirtDK").val()) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_passsecondDK").text("*Không khớp mật khẩu");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_passsecondDK").text("");

    }
});
$("#EmailDK").on('input', function () {
    if ($(this).val() == "") {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_EmailDK").text("*Hãy nhập email hợp lệ , nó rất quan trọng!");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_EmailDK").text("");
    }
});
$("#dob").on('input', function () {
    if ($(this).val() == '') {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_dob").text("* Bạn chưa nhập ngày sinh!");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_dob").text("");
    }
});
$("#gender").on('input', function () {
    $(this).css("border-color", "#2eb82e");

});
$("#AddressDK").on('input', function () {
    if ($(this).val() == '') {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_addressDK").text("* Bạn chưa nhập địa chỉ");
    }
    else {
        $(this).css({ "border-color": "#2eb82e" });
        $('#submit').removeClass("btn-info disabled");
        $("#error_addressDK").text("");

    }
});
$("#phoneDK").on('input', function () {
    $pho = $("#phoneDK").val();
    if ($(this).val() == '') {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Bạn phải nhập số điện thoại!");
    }
    else if ($pho.length <= 9) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Số điện thoại ít nhất 10 số");
    }
    else if (!$.isNumeric($pho)) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Có vẻ như bạn đã nhập sai");
    }
    else {
        $(this).css({ "border-color": "#2eb82e" });
        $('#submit').removeClass("btn-info disabled");
        $("#error_phoneDK").text("");
    }

});
$("#submit").click(function () {

    var check = 0;
    if ($("#UserNameDK").val().length >= 6) {
        $.post("/User/Check_User_Already", { TenDN: $("#UserNameDK").val() }, function (cc) {
            if (cc == "False") {
                $("#error_nameDK").text("");
                check++;
            }
            else {
                $("#error_nameDK").text("*Tên đăng nhập đã có người dùng, vui lòng chọn tên khác");
                $(this).css("border-color", "#2eb82e");
                $('#submit').addClass("btn-info disabled");
                check--;
            }
        });
    }
    if ($("#UserNameDK").val().length <= 5) {
        $(this).css("border-color", "#FF0000");
        //  $('#submit').addClass("btn-info disabled");
        $('#submit').addClass("btn-info disabled");
        $("#error_nameDK").text("*Tên đăng nhập ít nhất 6 ký tự");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $('#submit').removeClass("btn-info disabled");
        $("#error_nameDK").text("");
        check++;
    }

    if ($("#PassFirtDK").val().length <= 5) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_passfirtDK").text("*Nhập ít nhất 6 ký tự");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_passfirtDK").text("");
        check++;
    }

    if ($("#FullNameDK").val().length == 0) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_fullnameDK").text("*Vui lòng nhập tên bạn");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_fullnameDK").text("");
        check++;
    }

    if ($("#PassSecondDK").val() != $("#PassFirtDK").val()) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_passsecondDK").text("*Không khớp mật khẩu");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_passsecondDK").text("");
        check++;

    }

    if ($("#EmailDK").val().length == 0) {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_EmailDK").text("*Hãy nhập email hợp lệ , nó rất quan trọng!");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_emailDK").text("");
        check++;
    }

    if ($("#dob").val() == '') {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_dob").text("* Bạn chưa nhập ngày sinh!");
        check--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#submit').removeClass("btn-info disabled");
        $("#error_dob").text("");
        check++;
    }

    if ($("#AddressDK").val() == '') {
        $(this).css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_addressDK").text("* Bạn chưa nhập địa chỉ");
        check--;
    }
    else {
        $(this).css({ "border-color": "#2eb82e" });
        $('#submit').removeClass("btn-info disabled");
        $("#error_addressDK").text("");
        check++;

    }

    $pho = $("#phoneDK").val();
    if ($("#phoneDK").val() == '') {
        $("#phoneDK").css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Bạn phải nhập số điện thoại!");
        check--;
    }
    else if ($pho.length <= 9) {
        $("#phoneDK").css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Số điện thoại ít nhất 10 số");
        check--;
    }
    else if (!$.isNumeric($pho)) {
        $("#phoneDK").css("border-color", "#FF0000");
        $('#submit').addClass("btn-info disabled");
        $("#error_phoneDK").text("* Có vẻ như bạn đã nhập sai");
        check--;
    }
    else {
        $("#phoneDK").css({ "border-color": "#2eb82e" });
        $('#submit').removeClass("btn-info disabled");
        $("#error_phoneDK").text("");
        check++;
    }
    if (check == 8) {
        $.post("/User/RegisterResult", { TenDN: $("#UserNameDK").val(), MatKhau: $("#PassFirtDK").val(), Ten: $("#FullNameDK").val(), Email: $("#EmailDK").val(), NgaySinh: $("#dob").val(), DiaChi: $("#AddressDK").val(), GioiTinh: $("#gender").val(), SDT: $("#phoneDK").val() }, function (data) {
            if (data == "True") {
                Mess("Đăng ký thành công , chúc bạn có những phút giây vui vẻ");
                $.ajax({
                    url: '/User/LoginResult',
                    type: 'POST',
                    data: {
                        TenDN: $("#UserNameDK").val(),
                        MatKhau: $("#PassFirtDK").val(),
                        LuuPhienDN: "true",
                        URL: "/quan-ly-tai-khoan"
                    },
                    success: function (data) {
                        window.location.replace("/quan-ly-tai-khoan");
                        console.log("Done");
                    },
                    error: function () {
                        $("#KetQuaDangNhap").text("Đăng nhập không thành công , vui lòng kiểm tra lại thông tin");
                    }
                });
            }
            else {
                Mess("Hiện tại không thể đăng ký , vui lòng thử lại sau");
            }
        });
    }
});
