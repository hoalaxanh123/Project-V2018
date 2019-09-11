$("#TTTK_TenThat").on('input', function () {
    if ($(this).val().length == 0) {
        $(this).css("border-color", "#FF0000");
        check1 = 0;
        $("#error_TTTK_TenThat").text("*Vui lòng nhập tên bạn");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        check1 = 1;
        $("#error_TTTK_TenThat").text("");
    }
});

$("#TTTK_Email").on('input', function () {
    if ($(this).val() == "") {
        $(this).css("border-color", "#FF0000");
        check2 = 0;
        $("#error_TTTK_Email").text("*Hãy nhập email hợp lệ , nó rất quan trọng!");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        check2 = 1;
        $("#error_TTTK_Email").text("");
    }
   
});

$("#TTTK_Email").focusout(function () {
    if ($("#TTTK_Email").val().length >= 6) {
        $.post("/User/Check_Email_Already", { Email: $("#TTTK_Email").val() }, function (cc) {
            if (cc == "False") {
                $("#error_TTTK_Email").text("");
                check2 = 1;
            }
            else {
                $("#error_TTTK_Email").text("*Email đã có người dùng, vui lòng chọn tên khác");
                $(this).css("border-color", "#2eb82e");
                check2 = 0;
            }
        });
    }
});






$("#TTTK_GioiTinh").on('input', function () {
    $(this).css("border-color", "#2eb82e");

});
$("#TTTK_DiaChi").on('input', function () {
    if ($(this).val() == '') {
        $(this).css("border-color", "#FF0000");
        check3 = 0;
        $("#error_TTTK_DiaChi").text("* Bạn chưa nhập địa chỉ");
    }
    else {
        $(this).css({ "border-color": "#2eb82e" });
        check3 = 1;
        $("#error_TTTK_DiaChi").text("");

    }
   
});
$("#TTTK_SDT").on('input', function () {
    $pho = $("#TTTK_SDT").val();
    if ($(this).val() == '') {
        $(this).css("border-color", "#FF0000");
        check4 = 0;
        $("#error_TTTK_SDT").text("* Bạn phải nhập số điện thoại!");
    }
    else if ($pho.length <= 9) {
        $(this).css("border-color", "#FF0000");
        check4 = 0;
        $("#error_TTTK_SDT").text("* Số điện thoại ít nhất 10 số");
    }
    else if (!$.isNumeric($pho)) {
        $(this).css("border-color", "#FF0000");
        check4 = 0;
        $("#error_TTTK_SDT").text("* Có vẻ như bạn đã nhập sai");
    }
    else {
        $(this).css({ "border-color": "#2eb82e" });
        check4 = 1;
        $("#error_TTTK_SDT").text("");
    }
   
});
$("#TTTK_btn_submit").click(function () {
    $.post("/User/ChangeUserInfoResult", {
        Ten: $("#TTTK_TenThat").val(), Email: $("#TTTK_Email").val(), NgaySinh: $("#TTTK_NgaySinh").val(),
        DiaChi: $("#TTTK_DiaChi").val(), GioiTinh: $("#TTTK_GioiTinh").val(), SDT: $("#TTTK_SDT").val()
    }, function (data) {
        if (data == "True") {
            $("#TTTK_TB").text("Thay đổi thành công");
            Mess("Thay đổi thông tin cá nhân thành công");
        }
        else {
            $("#TTTK_TB").text("Đã sảy ra lỗi ,vui lòng thử lại sau");
            Mess("Đã sảy ra lỗi ,vui lòng thử lại sau");
        }
    })
});


