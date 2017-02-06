// 群组命名
$(".change-name").on("click",function(){
	layer.open({
   		title: [
    	'群组名称',
      	'background-color:#337ab7; color:#fff; margin:0 0; height:50px; line-height:50px;'
    	]
    	,content: ['<form>'+
    			'<div class= "form-group" style="margin:0 auto">'+
        			'<input type= "text" class= "form-control" placeholder= "输入群组名称" style="width:90%">'+
    			'</div>'+
			  '</form>'	  
		]
		,btn: ['确定', '取消']
  	});
});

// 设定群组二维码
$(".change-code").on("click",function(){
	layer.open({
		type: 1,
		content: '<img src="/quickoa/main/Public/images/QR-bar.jpg" style="padding:20px 20px;">'
	});
});

// 发布群公告
$(".change-affiche").on("click",function(){
	layer.open({
  		style: 'border:none; background-color:#337ab7; color:#fff; letter-spacing:1px;',
  		content:'距离项目最后截止时间还剩1周的时间，希望大家多多加油，上线后我们吃好喝好耍好！',
	});
});

// 退出群组
$(".drop-out").on("click",function(){
	layer.open({
		content: "确认删除并退出群组？"
		,btn: ["取消", "删除"]
		,skin: "footer"
		,no: function(index){
			layer.open({
 				content:'Exit Successfully !',
 				skin: 'msg',
 				time :1.5
			})
		}
	});
});	


$(function(){

	// 弹出删除图标
	$(".del").on("click",function(){
		$(".closeLayer").toggle();
	});

	// 删除选定成员
	$(".closeLayer").click(function(){
		var obj = $(this);
		layer.open({
			content: "确定删除选中成员？"
			,btn: ["确定", "取消"]
			,yes: function(index){
				obj.parent().remove();
				layer.close(index);
			}
		})
	});
});


