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
<link href="./style/styleTab.css" type="text/css" rel="stylesheet" />
<base href="<%=basePath%>">
<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src='JS/jquery-1.4.1.min.js'></script>
<script type="text/javascript">

function refresh(obj) {
    obj.src = "imageServlet?"+Math.random();
}

        //創建Ajax請求對象。
                function createXML(){
                        if(window.XMLHttpRequest){
                                // code for IE7+, Firefox, Chrome, Opera, Safari
                                xmlhttp = new XMLHttpRequest();
                        }else{
                                // code for IE6, IE5
                                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                }

                //验证用户名的方法。
                function addUserAjax(){
                        var str = document.getElementById("username").value;
                        if(str.length==0){
                                document.getElementById("img").style.display="inline";
                                document.getElementById("img").src="image/inputImg.jpg";
                                document.getElementById("prompt").innerHTML="<font style='color: red;font-size:12px;'>Username can not be empty!</font>";
                                return false;
                        }
                        createXML();
                        xmlhttp.onreadystatechange=function(){
                                if(xmlhttp.readyState==4 && xmlhttp.status==200){
                                        if(xmlhttp.responseText=="true"){
                                                document.getElementById("img").style.display="inline";
                                                document.getElementById("img").src="image/successImg.jpg";
                                                document.getElementById("prompt").innerHTML="";        
                                                return true;
                                        }else{
                                                //显示错误图片。
                                                document.getElementById("img").style.display="inline";
                                                document.getElementById("img").src="image/inputImg.jpg";
                                                document.getElementById("prompt").innerHTML="<font style='color: red;font-size:12px;'>User name already exists!</font>";
                                                return false;
                                        }
                                        
                                }
                        }
                        xmlhttp.open("POST","ValidationuserName.action?name="+str,true);
                        xmlhttp.send();
                }
                
                //聚焦用户名文本框提示信息；
                function Isonfocus(){
                        //影藏图片，显示输入用户名信息；
                        document.getElementById("img").style.display="none";
                        document.getElementById("prompt").innerHTML="<font style='color: red;font-size:12px;'>Please enter your user name!</font>";
                }
                
                

                //验证密码在4-16个字符之间。
                function ump(){
                        var passWord = document.getElementById("passWord").value;
                        if(passWord.length==0){
	                        	document.getElementById("imgPwd").style.display="inline";
	                            document.getElementById("imgPwd").src="image/inputImg.jpg";
                                document.getElementById("upm").innerHTML="<font style='color: red;font-size:12px;'>Password can not be blank！</font>";
                                return false;
                        }
                        createXML();
                        xmlhttp.onreadystatechange=function(){
                                if(xmlhttp.responseText=="false"){
                                	 	document.getElementById("imgPwd").style.display="inline";
                                     	document.getElementById("imgPwd").src="image/inputImg.jpg";
                                        document.getElementById("upm").innerHTML="<font style='color: red;font-size:12px;'>Password length is only 4-16!</font>";
                                        document.getElementById("passWord").value="";
                                        return false;
                                }else{
                                        document.getElementById("upm").innerHTML="";
                                        document.getElementById("imgPwd").style.display="inline";
                                        document.getElementById("imgPwd").src="image/successImg.jpg";
                                        return true;
                                }
                        }
                        xmlhttp.open("POST", "ValidationUserPassWord.action?pw1="+passWord, true);
                        xmlhttp.send();
                }
                
                //重复密码的验证。
                function umpSecond(){
                        var passWord = document.getElementById("passWord").value;
                        var passWord2 = document.getElementById("cfPassword").value;
                        if(passWord2.length==0){
                        		document.getElementById("imgPwd2").style.display="inline";
                            	document.getElementById("imgPwd2").src="image/inputImg.jpg";
                                document.getElementById("secondpd").innerHTML="<font style='color: red;font-size:12px;'>Repeat password can not be empty!</font>";
                                 document.getElementById("passWord").focus();
                                  scroll(0,0);  
                                return false;
                        }
                        createXML();
                        xmlhttp.onreadystatechange=function(){
                                        if (xmlhttp.responseText=="NoSame"){
                                        	document.getElementById("imgPwd").style.display="inline";
                                        	document.getElementById("imgPwd").src="image/inputImg.jpg";
                                        	document.getElementById("imgPwd2").style.display="inline";
                                        	document.getElementById("imgPwd2").src="image/inputImg.jpg";
                                        document.getElementById("secondpd").innerHTML="<font style='color: red;font-size:12px;'>The two passwords do not match, please re-enter!</font>";
                                        document.getElementById("passWord").value="";
                                        document.getElementById("cfPassword").value="";
                                        //清空密码文本框，光标跳转到密码文本框中。
                                         document.getElementById("passWord").focus();
                                          scroll(0,0);  
                                        return false;
                                }else{
                                	document.getElementById("imgPwd2").style.display="inline";
                                	document.getElementById("imgPwd2").src="image/successImg.jpg";
                                        document.getElementById("secondpd").innerHTML="";
                                        return true;
                                        }
                        }
                        xmlhttp.open("POST", "ValidationSecondPassWord.action?secondPd="+passWord2+"&passWord="+passWord,true);
                        xmlhttp.send();
                }
                
                //检验年龄的合法性
                function ValidationAge(){
                        var age = document.getElementById("age").value;
                        if(age.length==0){
                        	document.getElementById("imgAge").style.display="inline";
                        	document.getElementById("imgAge").src="image/inputImg.jpg";
                                document.getElementById("userAge").innerHTML="<font style='color: red;font-size:12px;'>Age can not be blank!</font>";
                                return false;
                        }
                        createXML();
                        xmlhttp.onreadystatechange=function(){
                                if(xmlhttp.responseText=="false"){
                                	document.getElementById("imgAge").style.display="inline";
                                	document.getElementById("imgAge").src="image/inputImg.jpg";
                                        document.getElementById("userAge").innerHTML="<font style='color: red;font-size:12px;'>Age is not legitimate, please re-enter!</font>";
                                        document.getElementById("age").value="";
                                        return false;
                                }else{
                                        document.getElementById("userAge").innerHTML="";
                                        document.getElementById("imgAge").style.display="inline";
                                    	document.getElementById("imgAge").src="image/successImg.jpg";
                                        return true;
                                }
                        }
                        xmlhttp.open("POST", "ValidationAge.action?age="+age, true);
                        xmlhttp.send();
                }
                
                
                function onchangeCountry(){
                        var getCountry = document.getElementById("country").value;
                        if(getCountry!="Please Select"){
                                document.getElementById("userCountry").innerHTML="";
                        }
                        if(getCountry=="CHINA"){
                                var address =["BeiJing","TianJing","ShangHai","ChongQing","HeBei","HeNan","YunNan","LiaoNing","HeiLongJiang","HuNan","AiHui","SanDong","XinJiang","JiangSu","ZheJiang","JiangXi"
                                              ,"HuBei","GuangXi"];
                                for(var i =0;i<address.length;i++ ){
                                        //把对应的省市绑定到option中。
                                document.getElementById("address1").options.add(new Option(address[i],address[i]));  
                                        }
                                }
                        }
                
                
                //判断country 是否选择。
                function Onselect(){
                        var getCountry = document.getElementById("country").value;
                        if(getCountry=="Please Select"){
                                document.getElementById("userCountry").innerHTML="<font style='color: red;font-size:12px;'>Please select a country!</font>";
                                return false;
                        }
                        return true;
                }
                
                //验证验证码。
                function ValidaValidation(){
                        var getValida = document.getElementById("randomCode").value;
                        if(getValida.length==0){
                            document.getElementById("imgCode").style.display="inline";
                        	document.getElementById("imgCode").src="image/inputImg.jpg";
                                document.getElementById("spnCode").innerHTML="<font style='color: red;font-size:12px;'>Verification code cannot be empty！</font>";
                                return false;
                        }
                        createXML();
                        xmlhttp.onreadystatechange=function(){
                                if(xmlhttp.responseText=="true"){
                                        document.getElementById("spnCode").innerHTML="";
                                        document.getElementById("imgCode").style.display="inline";
                                    	document.getElementById("imgCode").src="image/successImg.jpg";
                                        return true;
                                }else if("false"){
                                	 document.getElementById("imgCode").style.display="inline";
                                 	document.getElementById("imgCode").src="image/inputImg.jpg";
                                        document.getElementById("spnCode").innerHTML="<font style='color: red;font-size:12px;'>Verification input is not correct!</font>";
                                        return false;
                                } 
                                
                        }
                        xmlhttp.open("POST","ValidaValidation.action?getValida="+getValida,true);
                        xmlhttp.send();
                }
                
                
                
                
                function clickSub(){
                		var spanTest=document.getElementById("prompt").textContent;
                        var str = document.getElementById("username").value;
                        var passWord2 = document.getElementById("cfPassword").value;
                        var passWord = document.getElementById("passWord").value;
                        var age = document.getElementById("age").value;
                        var getCountry = document.getElementById("country").value;
                        var getAddress = document.getElementById("address1").value;
                        var getValida = document.getElementById("randomCode").value;
                        if(str.length==0){
                                document.getElementById("prompt").innerHTML="<font style='color: red;font-size:12px;'>Username can not be empty!</font>";
                        return false;
                        }
                         if(spanTest.length!=0){
                                return false;
                        }
                         if(passWord.length==0){
                                document.getElementById("upm").innerHTML="<font style='color: red;font-size:12px;'>Password can not be blank！</font>";
                                return false;
                        }
                         if(passWord2.length==0){
                        	 
                                document.getElementById("secondpd").innerHTML="<font style='color: red;font-size:12px;'>Repeat password can not be empty!</font>";
                                return false;
                        }
                         if(age.length==0){
                                document.getElementById("userAge").innerHTML="<font style='color: red;font-size:12px;'>Age can not be blank!</font>";
                                return false;
                        }
                         if(getCountry=="Please Select"){
                                 document.getElementById("userCountry").innerHTML="<font style='color: red;font-size:12px;'>Please select a country!</font>";
                                return false;
                        }
                         if(getAddress=="Please Select"){
                                 document.getElementById("getSpnAddress").innerHTML="<font style='color: red;font-size:12px;'>Please select a address!</font>";
                                 return false;
                         }else{
                                 document.getElementById("getSpnAddress").innerHTML="";
                         }
                        if(getValida.length==0){
                       	 document.getElementById("spnCode").innerHTML="<font style='color: red;font-size:12px;'>Verification input is not correct!</font>";
                       	 return false;
                        }
                }
</script>

</head>

<body onload="document.forms[0].reset()">
	<form action="AddUser.do" method="post">
		<table>
			<tr>
				<td class="TabTd1" colspan="4"><h2>Fill in the user
						registration information</h2></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">userName</td>
				<td class="TdInputClass" style="width:50;"><input class="InputClass" type="text"
					name="userName" id="username" onblur="return addUserAjax();"
					onfocus="Isonfocus();" /></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="img" /></td>
				<td class="TdSpanClass"><span id="prompt"></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">passWord</td>
				<td><input class="InputClass" type="password" name="passWord" id="passWord"
					onblur="return ump();" /></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="imgPwd" /></td>
				<td><span id="upm"></span></td>
			</tr>
			<tr class="TrClass">
				<td class="TdClass">confirm passWord</td>
				<td><input class="InputClass" type="password" name="cfPassword" id="cfPassword"
					onblur="return umpSecond();" /></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="imgPwd2" /></td>
				<td><span id="secondpd"></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">age</td>
				<td><input class="InputClass" type="text" name="age" id="age"
					onblur="return ValidationAge();" /></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="imgAge" /></td>
				<td><span id="userAge"></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">sex</td>
				<td><input  type="radio" name="sex" id="sex1" value="male"
					checked="checked" />male <input type="radio" name="sex" id="sex2"
					value="female" />female</td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="img" /></td>
				<td><span></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">country</td>
				<td><select name="Cty" id="country"
					onchange="return onchangeCountry();" onblur="return Onselect();">
						<option selected="selected" value="Please Select">Please
							Select</option>
						<c:forEach items="${countryList}" var="lis">
							<option value="${lis.country}">${lis.country}</option>
						</c:forEach>

				</select></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="img" /></td>
				<td><span id="userCountry"></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">address</td>
				<td><select name="address" id="address1">
						<option selected="selected" value="Please Select">Please
							Select</option>
				</select></td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="img" /></td>
				<td><span id="getSpnAddress"></span></td>
			</tr>

			<tr class="TrClass">
				<td class="TdClass">Validation Code</td>
				<td><input class="InputClass" type="text" name="randomCode" id="randomCode"
					onblur="return ValidaValidation();" /> 
				</td>
				<td class="TdImgClass"><img alt="" src="" style="display: none"
					id="imgCode" /></td>
				<td><span id="spnCode"></span></td>
			</tr>
			
			<tr>
			<td class="TrClass"></td>
				<td colspan="3" style="font-size:12px; padding-top:-10px;"><img title="点击更换" onclick="javascript:refresh(this);"
					src="imageServlet" />Click on the image change the verification code.</td>
			</tr>

			<tr>
				<td></td>
				<td colspan="3" ><input type="submit" name="submit" id="submit"
					value="Submit" onclick="return clickSub();" /></td>
			</tr>
		</table>
	</form>
</body>
</html>