
function CatNhapGioHang(maSP, soLuong, tenSP, Loai) {
    //Loại == 0 : Thêm
    //Loại == 1 : Sửa
    //Loại == 2 : Xóa
    if (Loai == 1) {
        $.ajax({
            url: '@Url.Action("SuaGioHang", "Cart")',
            type: 'POST',
            data: JSON.stringify({ 'MaSP': maSP, 'SoLuong': soLuong }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data == "true") {
                    Reload();
                }
            },
            error: function () {
            }
        });
        //    @*$.post('@Url.Action("SuaGioHang2", "Cart")', {MaSP: maSP, SoLuong: soLuong }, function (data) {
        //                if (data == "True") {
        //        $.post('@Url.Action("GioHangPartial", "Cart")', {}, function (data) {
        //            $("#SoSP").text(data);
        //        });
        //    $.post('@Url.Action("GioHangTongTien", "Cart")', {}, function (data) {
        //        $("#TongTien").text(data);
        //    });
        //}
        //});*@
    }
    else if (Loai == 0) {
        $.ajax({
            url: '@Url.Action("ThemGioHang", "Cart")',
            type: 'POST',
            data: JSON.stringify({ 'MaSP': maSP, 'SoLuong': soLuong }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data == "true") {
                    Reload();
                }
            },
            error: function () {
            }
        });
        //    @*$.post('@Url.Action("ThemGioHang2", "Cart")', {MaSP: maSP, SoLuong: soLuong }, function (data) {
        //                if (data == "True") {
        //        $.post('@Url.Action("GioHangPartial", "Cart")', {}, function (data) {
        //            $("#SoSP").text(data);
        //        });
        //    $.post('@Url.Action("GioHangTongTien", "Cart")', {}, function (data) {
        //        $("#TongTien").text(data);
        //    });
        //}
        //});*@
    }
    else if (Loai == 2) {
        $.ajax({
            url: '@Url.Action("XoaGioHang", "Cart")',
            type: 'POST',
            data: JSON.stringify({ 'MaSP': maSP, 'SoLuong': soLuong }),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data == "true") {
                    Reload();
                }
            },
            error: function () {
            }
        });


        //    @*$.post('@Url.Action("XoaGioHang", "Cart")', {MaSP: maSP}, function (data) {
        //                if (data == "True") {
        //        $.post('@Url.Action("GioHangPartial", "Cart")', {}, function (data) {
        //            $("#SoSP").text(data);
        //        });
        //    $.post('@Url.Action("GioHangTongTien", "Cart")', {}, function (data) {
        //        $("#TongTien").text(data);
        //    });
        //}
        //});*@
    }
}
function Reload() {
    $.post('@Url.Action("GioHangPartial", "Cart")', {}, function (data) {
        $("#SoSP").text(data);
        $("#TongSP").text(data);
    });
    $.post('@Url.Action("GioHangTongTien", "Cart")', {}, function (data) {
        $("#TongTien").text(data);
        $("#TongTien").text(data);
        $("#TongSoTien").text(data);
        $("#TongTienThanhToan").text(data);
        $("#SoTienThanhToan").text(data);
    });
}
