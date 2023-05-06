<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}</title>
<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
  <#include "../common/top_header.ftl"/>
	<#include "../common/left_menu.ftl"/> 
    <div class="container">
   		<div class="main center">
        <div class="label-wr center clearfix">
            <div id="nav-labels">
                <button id="new_pro" class="labels" style="background:rgb(75, 192, 165);color:white;width:100%;padding-left: 8px;padding-right: 8px;" >所选分类：${gc.name}</button>
            </div>
           
        </div>
        
        <div class="item-list">
            <ul class="items clearfix">
            
            	<#if pageResult??>
            	<#list pageResult.content as goods>
            	<li class="item">
                    <a href="../goods/detail?id=${goods.id}" class="img" target="_top">
                    	<img src="/photo/view?filename=${goods.photo}" alt="${goods.name}"></a>
                    <div class="info">
                        <div class="price">${goods.price}</div>
                        <div class="name">
                            <a href="../goods/detail?id=${goods.id}" target="_top">${goods.name}</a>
                        </div>
                        <div class="department"><span>${goods.student.academy}</span></div>
                        <div class="place"><span>${goods.student.school}</span></div>
                     </div>
                </li>
                </#list>
            	</#if>
            </ul>
        </div>
               <#if pageResult.total gt 0>
                <div class="pages">
                   <#if pageResult.currentPage == 1>
                  <a class="page-arrow arrow-left" href="list?id=${gc.id}&currentPage=1">首页</a>
                   <#else>
                    <a page-num href="list?id=${gc.id}&currentPage=${pageResult.currentPage-1}">上一页</a>
                   </#if>
                    <a >第【${pageResult.currentPage}】页</a>
                   <#if pageResult.currentPage == pageResult.totalPage>
                  <a class="page-arrow arrow-right" href="list?id=${gc.id}&currentPage=${pageResult.totalPage}">尾页</a>
                   <#else>
                    <a page-num href="list?id=${gc.id}&currentPage=${pageResult.currentPage+1}">下一页</a>
                   </#if>
                 <li> <a>共${pageResult.totalPage}页,${pageResult.total}条数据</a></li>
                <div>
             </#if>
    </div>
</div>
<div class="return-to-top"><a href="#"></a></div><!--返回顶部-->
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/> 
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/index.js"></script>
</html>