<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}后台管理系统主页</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href=""><img src="/admin/images/logo-1.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                
                <div class="edit-avatar">
                  <#if user.image??>
	            		<#if user.image?length gt 0>
	            		<img src="/photo/view?filename=${user.image}" id="show-img" class="img-avatar">
	            		<#else>
	            		<img src="/admin/images/default-head.jpg" id="show-img" class="img-avatar">
	            		</#if>
	              </#if>
                  <input type="file" id="select-file" style="display:none;" onchange="upload('show-img','image')">
                  <div class="avatar-divider"></div>
                  <div class="edit-avatar-content">
                    <button class="btn btn-default" id="add-pic-btn">修改头像</button>
                    <p class="m-0">选择一张你喜欢的图片，上传图片大小不能超过2M。</p>
                  </div>
                </div>
                <hr>
                <form method="post" action="update_userinfo" class="site-form" id="update-user">
                    <input type="hidden" name="id" id="id" value="${user.id }">
                  <input type="hidden" name="image" id="image" value="${user.image!""}">
                  <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" name="username" id="username" value="${user.username}" disabled="disabled" />
                  </div>
                  <div class="form-group">
                    <label for="nickname">手机</label>
                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="输入您的手机号码" value="${user.mobile!""}">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="请输入正确的邮箱地址" value="${user.email!""}">
                  </div>
                  <button type="button" class="btn btn-primary" id="submit-btn">保存</button>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//监听上传图片按钮
    $("#add-pic-btn").click(function(){
        $("#select-file").click();
    });

    $("#submit-btn").click(function(){
        if(!checkForm("update-user")){
            return;
        }
        var id=$("#id").val();
        var image = $("#image").val();
        var username = $("#username").val();
        var mobile = $("#mobile").val();
        var email=$("#email").val();
        var myreg = /^(((13[0-9]{1})|159|153)+\d{8})$/;
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (username.length<2&& username.length>18){
            showErrorMsg('用户名长度只能在2-18位之间')
        }
        if (mobile.length!=11){
            showErrorMsg('手机号码为11位数字!');
            return;
        }
        if(!myreg.test(mobile)){
            showErrorMsg('请输入正确的手机号码!');
            return;
        }
        if (!reg.test(email)){
            showErrorMsg('请输入正确的邮箱格式!');
            return;
        }

        //向后台发送请求
        $.ajax({
            url:'/system/update_userinfo',
            type:'PUT',
            data:{id:id,image:image,username:username,mobile:mobile,email:email},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    window.location.href = 'userinfo';
                }else{
                    showErrorMsg(data.msg);
                }
            },
            error:function(data){
                alert('网络错误!');
            }
        });
    });


});



</script>
</body>
</html>