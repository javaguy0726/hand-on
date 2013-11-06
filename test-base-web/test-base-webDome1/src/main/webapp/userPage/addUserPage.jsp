<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src='JS/jquery-1.4.1.min.js'></script>
<script type="text/javascript">
	$(function() {
		//添加文本框的失焦事件
		$("#username")
				.blur(
						function() {
							//$("#username").val() 获得文本框的值，  判断是否为空  不为空时
							if ($("#username").val().length > 0) {
								// url 发送请求 type 请求方式， data 传梯的参数。  datatype 返回类型。  
								//success 成功返回  绑定function data 接收返回的结果。
								$
										.ajax({
											'url' : 'ValidationuserName.action',
											'type' : 'post',
											'data' : {'username' : $("#username").val()},
											'datatype' : 'json',
											'success' : function(data) {
												if (data != "true") {
													document
															.getElementById("prompt").innerHTML = "You can use the user name!";
													return true;
												} else {
													$("#prompt")
															.text(
																	"User names exist, please re-enter!");
													document.all['prompt'].style.color = "#ff0000";
													$("#username").val("");
													return false;
												}
											}
										});

							} else {
								alert("Username can not be empty!");
								return false;
							}
						});

	});

	function onfocusText(id, str) {
		document.getElementById(id).innerHTML = str;
		document.all['prompt'].style.color = "#ff0000";
	}

	function onClickSubmit() {
		var userName = document.getElementById("username").value;
		var passWord1 = document.getElementById("passWord").value;
		var passWord2 = document.getElementById("cfPassword").value;
		var age = document.getElementById("age").value;
		 if(userName.length<=0){
			 alert("请输aaaaaa用户名");
			 return false;
		 }
		if (passWord1.length <= 0) {
			alert("密码不能为空");
			return false;
		}
		if (passWord2.length <= 0) {
			alert("重复的密码不能为空！");
			return false;
		}
		if (passWord1 != passWord2) {
			alert("两次输入的密码不一致");
			return false;
		}
		if (age.length <= 0) {
			alert("年龄不能为空");
			return false;
		}
	}
</script>

</head>
<%
	String name = (String) request.getSession().getAttribute("name");
	System.out.print(name);
%>
<body>
	<form action="AddUser.do" method="post">
		<table>
			<tr>
				<td colspan="3"><h2>Fill in the user registration
						information</h2></td>
			</tr>

			<tr>
				<td>userName</td>
				<td><input type="text" name="userName" id="username"
					onfocus="onfocusText('prompt','Please enter your user name!!!')" /></td>
				<td><span id="prompt"></span></td>
			</tr>

			<tr>
				<td>passWord</td>
				<td><input type="password" name="passWord" id="passWord" /></td>
				<td><span></span></td>
			</tr>
			<tr>
				<td>confirm passWord</td>
				<td><input type="password" name="cfPassword" id="cfPassword" /></td>
				<td></td>
			</tr>
			<tr>
				<td>sex</td>
				<td><input type="radio" name="sex" id="sex1" value="male"
					checked="checked" />male <input type="radio" name="sex" id="sex2"
					value="female" />female</td>
				<td><span></span></td>
			</tr>
			<tr>
				<td>age</td>
				<td><input type="text" name="age" id="age" /></td>
				<td><span></span></td>
			</tr>

			<tr>
				<td>country</td>
				<td><select name="country" id="country">
						<c:forEach items="${countryList}" var="lis">
							<option>${lis.country}</option>
						</c:forEach>
				</select></td>
				<td></td>
			</tr>

			<tr>
				<td>address</td>
				<td><select name="address" id="address">

				</select></td>
				<td><span></span></td>
			</tr>

			<tr>
				<td colspan="3"><input type="submit" name="submit" id="submit"
					value="Submit" onclick="return onClickSubmit();" /></td>
			</tr>
		</table>
	</form>
</body>
</html>