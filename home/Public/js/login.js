$(document).ready(function () {
	$("#register_form").validate({
		rules: {
			username: {
				required: true,
				minlength: 4,
			},
			password: {
				required: true,
				minlength: 6,
			},
			confirmpassword: {
				required: true,
				minlength: 6,
				equalTo: "#password",
			}
		},
		messages: {
			username: {
				required: "用户名不能为空",
				minlength: "用户明必须由四个字符组成"
			},
			password: {
				required: "密码不能为空",
				minlength: "密码长度不能小于5个字符"
			},
			confirmpassword: {
				required: "密码不能为空",
				minlength: "密码长度不能小于5个字符",
				equalTo: "两次密码输入不一致"
			}
		}
	});

	$("#login_form").validate({
		rules: {
			username: {
				required: true
			},
			password: {
				required: true
			}
		},
		messages: {
			username: {
				required: "请填写用户名"
			},
			password: {
				required: "请填写密码"
			}
		}
	});

	//input框失去焦点是，错误信息框隐藏
	$("#username").focus(function(){
		$("#username-error").css("display","none");
	});

	//获取注册、登录按钮，点击实现显示隐藏
	$(".register_btn").click(function () {
		$(".register_form_box").show();
		$(".login_form_box").hide();
	});

	$(".login_btn").click(function () {
		$(".login_form_box").show();
		$(".register_form_box").hide();
	});

	//点击弹出二维码窗口
	$(".myPopover").popover({
		trigger:'click',
		html:true,
		content:'<img src="/quickoa/home/Public/images/blackberry.png"/>'
	});
});



