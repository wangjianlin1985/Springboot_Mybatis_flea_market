<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, goodsCategory-scalable=no" />
    <title>${siteName!""}|商品分类管理-${title!""}</title>
<#include "../common/header.ftl"/>
    <style>
        td{
            vertical-align:middle;
        }
    </style>
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="index.html"><img src="/admin/images/logo-1.png" title="${siteName!""}" alt="${siteName!""}" /></a>
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
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="list" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                名称 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">名称</a> </li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="${name!""}" name="name" placeholder="请输入名称">
                                        <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                                    </div>
                                </form>
                <#include "../common/third-menu.ftl"/>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th>分类图标</th>
                                            <th>分类名称</th>
                                            <th>分类父类</th>
                                            <th>添加时间</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                      <#if pageResult.content?size gt 0>
                      <#list pageResult.content as category>
                      <tr>
                          <td style="vertical-align:middle;">
                              <label class="lyear-checkbox checkbox-primary">
                                  <input type="checkbox" name="ids[]" value="${category.id}"><span></span>
                              </label>
                          </td>
                          <td style="vertical-align:middle;">
                        	<#if category.icon??>
                        		<#if category.icon?length gt 0>
                        		<img src="/photo/view?filename=${category.icon}" width="30px" height="30px">
                                <#else>
                        		<img src="/admin/images/default-category-icon.png" width="30px" height="30px">
                                </#if>
                            </#if>
                          </td>
                          <td style="vertical-align:middle;">${category.name}</td>
                          <td style="vertical-align:middle;">

                          <#if category.parentId??>
                        <#if category.parentId?length gt 0>
                            <#list parentList as parent>
                            <#if category.parentId == parent.id >
                                ${parent.name}
                            </#if>
                            </#list>
                         <#else>
                             <td style="vertical-align:middle;">null</td>
                        </#if>
                        </#if>
                          </td>
                          <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${category.createTime?string('dd.MM.yyyy HH:mm:ss')}</font></td>
                          </tr>
                      </#list>
                      <#else>
                    <tr align="center"><td colspan="6">这里空空如也！</td></tr>
                      </#if>
                                        </tbody>
                                    </table>
                                </div>
               <#if pageResult.total gt 0>
                <ul class="pagination ">
                  <#if pageResult.currentPage == 1>
                  <li class="disabled"><a href="list?name=${name!""}&currentPage=1"><span>第一页</span></a></li>
                  <#else>
                    <li><a href="list?name=${name!""}&currentPage=${pageResult.currentPage-1}">上一页</a></li>
                  </#if>
                    <li><span>第【${pageResult.currentPage}】页</span></li>
                    <#if pageResult.currentPage == pageResult.totalPage>
                  <li class="disabled"><a href="list?name=${name!""}&currentPage=${pageResult.totalPage}"><span>最后一页</span></a></li>
                    <#else>
                    <li><a href="list?name=${name!""}&currentPage=${pageResult.currentPage+1}">下一页</a></li>
                    </#if>
                    <li><span>共${pageResult.totalPage}页,${pageResult.total}条数据</span></li>
                </ul>
               </#if>
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

    });
    function del(url){
        if($("input[type='checkbox']:checked").length != 1){
            showWarningMsg('请选择一条数据进行删除！');
            return;
        }
        var id = $("input[type='checkbox']:checked").val();
        $.confirm({
            title: '确定删除？',
            content: '删除后数据不可恢复，请慎重！',
            buttons: {
                confirm: {
                    text: '确认',
                    action: function(){
                        deleteReq(id,url);
                    }
                },
                cancel: {
                    text: '关闭',
                    action: function(){

                    }
                }
            }
        });
    }
    //打开编辑页面
    function edit(url){
        if($("input[type='checkbox']:checked").length != 1){
            showWarningMsg('请选择一条数据进行编辑！');
            return;
        }
        window.location.href = url + '?id=' + $("input[type='checkbox']:checked").val();
    }
    //调用删除方法
    function deleteReq(id,url){
        $.ajax({
            url:url,
            type:'DELETE',
            data:{id:id},
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    showSuccessMsg('分类删除成功!',function(){
                        $("input[type='checkbox']:checked").parents("tr").remove();
                    })
                }else{
                    showErrorMsg(data.msg);
                }
            },
            error:function(data){
                alert('网络错误!');
            }
        });
    }
</script>
</body>
</html>