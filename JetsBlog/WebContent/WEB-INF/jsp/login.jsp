<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 
<link href="css/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/userpanel.css">
<link rel="stylesheet" type="text/css" href="css/jquery.ui.all.css">
</head>
<body class="login">
            <form class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" action="login" method="post">                                                                                                                                                                                                                
<div class="login_m">
<div class="login_logo">
<div class="login_boder"> 

<div class="login_padding" id="login_model">
            <font color="red">${requestScope.message }</font>
  <h2>USERNAME</h2>
  <label>
    <input type="text" id="loginname" name="loginname" class="txt_input txt_input2" onfocus="if (value ==&#39;Your name&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;Your name&#39;}" value="Your name">
  </label>
  <h2>PASSWORD</h2>
  <label>
    <input type="password" name="password" id="password" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
  </label>
	
 
  <p class="forgot"><a id="iforget" href="javascript:void(0);">Forgot your password?</a></p>
  <div class="rem_sub">
  <div class="rem_sub_l">
  <input type="checkbox" name="checkbox" id="save_me">
   <label for="checkbox">Remember me</label>
   </div>
    <label>
      <input type="submit" class="sub_button" name="button" id="button" value="SIGN-IN" style="opacity: 0.7;">
    </label>
  </div>
</div>


<div id="forget_model" class="login_padding" style="display:none">
<br>

   <h1>Forgot password</h1>
   <br>
   
</div>


<!--login_padding  Sign up end-->
</div><!--login_boder end-->
</div><!--login_m end-->


              </form>
</body>
</html>