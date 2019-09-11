document.getElementById("AD_TenDN").addEventListener("keyup", function (event) {
    event.preventDefault();
    if (event.keyCode === 13) {
        document.getElementById("AD_btnDangNhap").click();
    }
});
document.getElementById("AD_MatKhau").addEventListener("keyup", function (event) {
    event.preventDefault();
    if (event.keyCode === 13) {
        document.getElementById("AD_btnDangNhap").click();
    }
});
$("#AD_TenDN").on('input', function () {
    if ($(this).val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $('#AD_btnDangNhap').addClass("btn-info disabled");
        $("#AD_ErrorName").text("*Tên đăng nhập ít nhất 6 ký tự và tối đa 50 ký tự");
    }
    else {

        $(this).css("border-color", "#2eb82e");
        $('#AD_btnDangNhap').removeClass("btn-info disabled");
        $("#AD_ErrorName").text("");

    }
});
$("#AD_MatKhau").on('input', function () {
    if ($(this).val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $('#AD_btnDangNhap').addClass("btn-info disabled");
        $("#AD_ErrorPassWord").text("*Mật khẩu nhập ít nhất 6 ký tự và tối đa 50 ký tự");
    }
    else {

        $(this).css("border-color", "#2eb82e");
        $('#AD_btnDangNhap').removeClass("btn-info disabled");
        $("#AD_ErrorPassWord").text("");

    }
});
$("#AD_btnDangNhap").click(function () {
    var flag = 0;
    if ($("#AD_TenDN").val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $('#AD_btnDangNhap').addClass("btn-info disabled");
        $("#AD_ErrorName").text("*Tên đăng nhập ít nhất 6 ký tự và tối đa 50 ký tự");
        flag--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#AD_btnDangNhap').removeClass("btn-info disabled");
        $("#AD_ErrorName").text("");
        flag++;
    }

    if ($("#AD_MatKhau").val().length <= 4 || $(this).val().length >= 50) {
        $(this).css("border-color", "#FF0000");
        $('#AD_btnDangNhap').addClass("btn-info disabled");
        $("#AD_ErrorPassWord").text("*Mật khẩu nhập ít nhất 6 ký tự và tối đa 50 ký tự");
        flag--;
    }
    else {
        $(this).css("border-color", "#2eb82e");
        $('#AD_btnDangNhap').removeClass("btn-info disabled");
        $("#AD_ErrorPassWord").text("");
        flag++;
    }
    if (flag == 2) {
        var TenDNN = $("#AD_TenDN").val();
        var MatKhauu = $("#AD_MatKhau").val();
        $.post("Login", { TenDangNhap: TenDNN, MatKhau: MatKhauu }, function (data) {
                $("#TB").text(data);
        });
    }
});