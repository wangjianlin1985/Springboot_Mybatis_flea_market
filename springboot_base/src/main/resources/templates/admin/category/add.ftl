<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|分类管理-添加分类</title>
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
              <div class="card-header"><h4>添加分类</h4></div>
              <div class="card-body">
                <form action="add" id="user-add-form" method="post" class="row">
                  <div class="form-group col-md-12">
                    <label>图标上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认图标">
                          </figure>
                        </li>
                        <input type="hidden" name="icon" id="icon">
                        <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','icon')">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">分类名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入分类名" tips="请填写分类名" />
                  </div>

                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属父类</span>
                    <select name="parentId" class="form-control" id="parentId">
                        <#if parentList??>
                            <option value="">没有父级分类</option>
                    		<#list parentList as parent>
                    		<option value="${parent.id}">${parent.name}</option>
                            </#list>
                        </#if>
                    </select>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
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
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("user-add-form")){
			return;
		}
        var name = $("#name").val();
        if (name.trim().length<2 ){
            showErrorMsg('用户名长度不能少于2!');
            return;
        }
        if (name.trim().length>18){
            showErrorMsg('用户名长度不能大于18');
            return;
        }

		var data = $("#user-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('分类添加成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});

</script>
</body>
</html>