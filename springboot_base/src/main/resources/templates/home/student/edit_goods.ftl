<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}-发布物品</title>
<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
<link media="all" href="/home/css/release_product.css" type="text/css" rel="stylesheet">
<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
  <#include "../common/top_header.ftl"/>
   <div class="container">
            <div class="main center">
                <img class="release-icon-main" src="/home/imgs/go.png" alt="">
                <div class="wave-fluid"></div>
                <div class="release-title">发布商品出售</div>
                <form action="publish" id="publish-form" method="post">
                <div class="form-wr">
                    <div class="form-must-wr">
                    	
                    	<input type="hidden" name="id" value="${goods.id}">
                    	<input id="photo" type="hidden" name="photo" value="${goods.photo}" class="required" tips="请上传图片">
                    	
                    	<div id="show-img" class="form-item l goods-title" style="height:100px;">
                            <div class="form-key">
                                <span>已上传图片</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                	<img id="uploaded-img" src="/photo/view?filename=${goods.photo}" width="100px" height="100px">
                                </div>
                            </div>
                        </div>
                    	
                    	<div class="form-item l goods-title">
                            <div class="form-key">
                                <span>选择商品图片</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                	<input type="file" id="uploadFile" />
                                </div>
                            </div>
                        </div>
                    	
                        <div class="form-item l goods-title">
                            <div class="form-key">
                                <span>商品名称</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input id="name" name="name" placeholder="商品名称长度最多50个字" maxlength="50" value="${goods.name}" type="text" class="required" tips="请填写商品名称"></div>
                            </div>
                        </div>
                        
                        <div class="form-item xl goods-desc">
                            <div class="form-key">
                                <span>商品详情</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <textarea name="describle" id="desc" placeholder="建议填写物品用途、新旧程度、原价等信息，至少6个字" class="required" tips="请填写详情描述">${goods.describle}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-item l goods-price">
                            <div class="form-key">
                                <span>出售价格</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input  class="price required" id="price"  name="price" value="${goods.price}" type="number"  tips="请填写出售价格"></div>
                            </div>
                        </div>

                        <!--选择分类信息 -->
                        <div class="form-item l goods-cat">
                            <div class="form-key">
                                <span>分类</span>
                            </div>
                             <div class="form-value">
                                <div class="form-input-wr">
								    <select id="cid" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;"> 
										<option>---请选择大类----</option> 
										<#if categoryList??>
										<#list categoryList as category>
											<#if category.parentId??>
											<#else>
											<option value="${category.id}" <#if category.id == categorys.parentId>selected</#if>>${category.name}</option>
											</#if>
										</#list>
										</#if>

								   </select> 
								   <select id="cid2" name="categoryId" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;">
								   		<option value="-1">----请选择小类----</option>
								   		<#if categoryList??>
										<#list categoryList as category>
								   		<#if category.parentId??>
										<#if category.id == goods.categoryId>
										<option value="${category.id}" pid="${category.parentId}" <#if goods.categoryId == category.id>selected</#if>>${category.name}</option>
										<#else>
										<option style="display:none;" value="${category.id}" pid="${category.parentId}">${category.name}</option>
										</#if>
										</#if>
										</#list>
										</#if>
								   </select> 
							    </div>
                            </div>
                        </div> 

                        
                    </div>
                   	<input class="form-submit" id="submit-btn" type="button" value="发布" />
                  </div>
                  </form>
            </div>
        </div>
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/> 
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/add.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#cid").change(function(){
	    var cid = $(this).val();
	    $("#cid2 option[value='-1']").prop("selected", true);
		$("#cid2 option[value!='-1']").css({'display':'none'});
		$("#cid2 option").each(function(i,e){
			if($(e).attr('pid') == cid){
				$(e).css({'display':'block'})
			}
		});
   });
   $("#submit-btn").click(function(){
   		var flag = true;
   		$(".required").each(function(i,e){
   			if($(e).val() == ''){
   				alert($(e).attr('tips'));
   				flag = false;
   				return false;
   			}
   		});
   		if(flag){
   			if($("#desc").val().length < 6){
	   			alert('详情描述不能少于6个字！');
	   			return;
	   		}

            var priceReg = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;

	   		if(!priceReg.test($("#price").val())){
	   			alert('出售价格只能输入数字！');
	   			return;
	   		}
	   		//检查分类
	   		if($("#cid2").val() == '' || $("#cid2").val() == '-1'){
	   			alert('请选择物品分类！');
	   			return;
	   		}
	   		//全部符合，准备提交表单
	   		ajaxRequest('edit','post',$("#publish-form").serialize(),function(){
	   			window.location.href="index";
	   		});
   		}
   });
   //监听文件按钮
   $("#uploadFile").change(function(){
   		uploadPhoto('uploaded-img','photo');
   })

});
function uploadPhoto(showPictureImg,input){
	//formdata
	var formData = new FormData();
	formData.append('photo',document.getElementById('uploadFile').files[0]);
	$.ajax({
		url:'/photo/upload_photo',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
				$('.loading').addClass("hide")
				if(data.code == 0){
					$("#show-img").show();
					$("#"+showPictureImg).attr('src','/photo/view?filename=' + data.data);
					$("#"+input).val(data.data);

				}else{
					data = $.parseJSON(data);
					alert(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
	});
}
</script>	
</html>