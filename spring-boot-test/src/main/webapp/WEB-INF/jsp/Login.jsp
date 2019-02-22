<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="img/logo.png" type="image/png">
<title>毕业论文管理系统</title>
</head>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link href="css/ui-choose.css" rel="stylesheet" />
	<style>

    .demo-table {
        border-collapse: collapse;
        width: 100%;
    }

    .demo-table tr td {
        padding: 8px 10px;
        font: 16px/1.8 normal 'microsoft yahei';
        vertical-align: top;
    }
    .ui-input {
        vertical-align: top;
        height: 18px;
        font-size: 16px;
        line-height: 20px;
        border: 1px solid #aaa;
        padding: 6px 8px;
        border-radius: 3px;
    }
    </style>
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div style="margin-top: 20px;margin-left: 36%;">
			<img src="img/logo_home.png" style="float: left;width: 55px;height: 55px;"/>
			
			<p style="float: left;line-height: 50px;">
				<font  style="font-family: '仿宋';font-weight: bold;color: #505050;font-size: 24px;">毕业论文管理系统</font>
				<font style="font-size: 20px;">|广东科技学院</font>
			</p>
		</div>
		
		<div class="container" style="margin-top: 15%">
			<h1 id="welcome" style="position:absolute;left:45%;top:33%">Welcome</h1>
			
			<form class="form" action="javascript:;">
				<input id="id" type="text" placeholder="Username">
				<input id="password" type="password" placeholder="Password">
				  <table class="demo-table">
				    <tr>			
				      <td><ul class="ui-choose" id="uc_01" >
				          <li>学生</li>
				          <li>教师</li>
				          <li>专家</li>
				          <li>学院</li>
				        </ul></td>
				    </tr>
				  </table>
				<button id="login-button" onclick="signIn()">Login</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			
		</ul>
	</div>
</div>



<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery.js"></script>
<script src="js/ui-choose.js"></script>
<script src="assets/plugins/sweetalert/sweetalert2.all.js"></script>
<script>
// 将所有.ui-choose实例化
$('.ui-choose').ui_choose();

// uc_01 ul 单选
var uc_01 = $('#uc_01').data('ui-choose'); 
uc_01.click = function(index, item) {
    console.log('click', index, item.text())
}
uc_01.change = function(index, item) {
    console.log('change', index, item.text())
}

</script>


<script>
	//获取用户身份
       $(document).ready(function(){
              var choose=$("#uc_01 li");
              $("#uc_01 li").click(function(){//点击事件
                   var count=$(this).index();//获取li的下标
                   var result=choose.eq(count).text();
                   $("#login-button").val(result);
              }) 
       })

</script>

<script>
function signIn(){
	
	var id = $("#id").val();
	var password = $("#password").val();
	var choice = $("#login-button").val();
	if(choice==""){
		alert("请选择您的身份");
		return false;
	}	
	if(id=="" || password==""){
		alert("账号和密码不能为空");
		return false;
	}
	$("form").css("display","none");
	$("#welcome").animate({top:'45%'});
	$.ajax({
		url : "${pageContext.request.contextPath}/signIn" ,
		type : "post",
		data : JSON.stringify({"userId":id,"userPwd":password,"userType":choice}),
		contentType:"application/json;charset=UTF-8",
		dataType:"json",
		success : function(data){				
			  if(data){	
				  if(choice=="学生"){
					  setTimeout(function(){
					  window.location.href="${pageContext.request.contextPath}/studentHome";
					  },1000);
				  }
				  if(choice=="教师"){
					  setTimeout(function(){
					  window.location.href="${pageContext.request.contextPath}/teacherHome";
					  },1000);
				  }
				  if(choice=="专家"){
					  setTimeout(function(){
					  window.location.href="${pageContext.request.contextPath}/expertHome";
					  },1000);
				  }
				  if(choice=="学院"){
					  setTimeout(function(){				  
					  window.location.href="${pageContext.request.contextPath}/adminHome";
					  },1000);
				  }
			  }else{				  
				  alert("账号或者密码错误，请重新登录！");
				  window.location.href="${pageContext.request.contextPath}/Login.jsp"

			}  
		}
		
	}); 
	}
</script>
</body>
</html>