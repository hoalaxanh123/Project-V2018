function Login(){$("#myModal").modal();}
function DangNhap(){var urll=window.location.href;var flag=0;if($("#userName").val().length<=4){$(this).css("border-color","#FF0000");$('#btn_DangNhap').addClass("btn-info disabled");$("#error_name").text("*Tên đăng nhập ít nhất 6 ký tự");flag--;}
else{$(this).css("border-color","#2eb82e");$('#btn_DangNhap').removeClass("btn-info disabled");$("#error_name").text("");flag++;}
if($("#passWord").val().length==0){$(this).css("border-color","#FF0000");$('#btn_DangNhap').addClass("btn-info disabled");$("#error_pass").text("*Mật khẩu ít nhất 6 ký tự");flag--;}
else{$(this).css("border-color","#2eb82e");$('#btn_DangNhap').removeClass("btn-info disabled");$("#error_pass").text("");flag++;}
if(flag==2){var TenDNN=$("#userName").val();var MatKhauu=$("#passWord").val();var LuuPhienDN=$("#SaveMe").is(":checked");$.ajax({url:'/User/LoginResult',type:'POST',data:{TenDN:TenDNN,MatKhau:MatKhauu,LuuPhienDN:LuuPhienDN,URL:urll},success:function(data){if(urll.indexOf('#')>0)
urll=urll.slice(0,-1);window.location.href=urll;},error:function(){$("#KetQuaDangNhap").text("Đăng nhập không thành công , vui lòng kiểm tra lại thông tin");}});}};