function DoiMatKhau() {
    var MKCU = $("#MKCU").val();
    var MKMoi = $("#MKMoi").val();
    var XacNhanMKMoi = $("#XacNhanMKMoi").val();
    var HanhDong = $("#HanhDong").val();

    //$.ajax({
    //    url: '@Url.Action("DoiMatKhauResult", "User")',
    //    type: 'POST',
    //    data: JSON.stringify({ 'TenDN': MKCU, 'MatKhau': MKMoi, 'MatKhauDoi': XacNhanMKMoi, 'ThoatHet': HanhDong }),
    //    dataType: 'json',
    //    contentType: 'application/json; charset=utf-8',
    //    success: function (data) {
    //        if (data == "true") {
    //            Reload();
    //        }
    //    },
    //    error: function (something) {
    //        console.log(something);
    //    }
    //});

    $.ajax({
        url: '@Url.Action("LoginResult", "User")',
        type: 'POST',
        data: JSON.stringify({ 'TenDN': MKCU, 'MatKhau': MKMoi, 'LuuPhienDN': HanhDong }),
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
            if (data == "true") {
                window.location.replace(url);
            }
            else {
                $("#KetQuaDangNhap").text("Đăng nhập không thành công , vui lòng kiểm tra lại thông tin");
            }
        },
        error: function () {
        }
    });

}
var flag1 = 0, flag2 = 0, flag3 = 0;
$("#MKCU").on('input', function () {
    if ($(this).val().length <= 5 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        flag1 = 0;
        $("#error_MKCU").text("*Giới hạn ký tự : 6-50 ký tự");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        flag1 = 1;
        $("#error_MKCU").text("");
    }
    Check();
});
$("#MKMoi").on('input', function () {
    if ($(this).val().length <= 5 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        flag2 = 0;
        $("#error_MKMoi").text("*Giới hạn ký tự : 6-50 ký tự");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        flag2 = 1;
        $("#error_MKMoi").text("");
    }
    Check();
});
$("#XacNhanMKMoi").on('input', function () {
    if ($(this).val().length <= 5 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        flag3 = 0;
        $("#error_XacNhanMKMoi").text("*Giới hạn ký tự : 6-50 ký tự");
    }
    else if ($(this).val() != $("#MKMoi").val()) {
        $(this).css("border-color", "#FF0000");
        flag3 = 0;
        $("#error_XacNhanMKMoi").text("*Nhập lại mật khẩu không khớp");
    }
    else {
        $(this).css("border-color", "#2eb82e");
        flag3 = 1;
        $("#error_XacNhanMKMoi").text("");
    }
    Check();
});
function Check() {
    console.log(flag1 + flag2 + flag3);
    if (flag1 + flag2 + flag3 == 3)
        $('#btn_DoiMK').removeClass("btn-info disabled");
    else
        $('#btn_DoiMK').addClass("btn-info disabled");
}

