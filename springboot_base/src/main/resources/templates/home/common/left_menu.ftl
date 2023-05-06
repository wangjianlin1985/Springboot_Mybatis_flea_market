<nav class="ease2">
    <ul>
        <li class="blank-head">
            <a href="/home/index/index"></a>
        </li>

        <li class="category-12 catg">
            <a href="/home/index/index" target="_top">
                <i class="nav-icons">
                    <img src="/home/imgs/12.png" alt="全部商品"></i>
                <h3>全部商品</h3>
            </a>
        </li>
      	<#list categoryList as category>
            <#if category.parentId??>
            <#else>
        <li class="category-${category.id} catg">
            <a href="/home/goods/list?id=${category.id}" target="_top">
                <i class="nav-icons">
                    <img src="/photo/view?filename=${category.icon}" alt="${category.name}"></i>
                <h3>${category.name}</h3>
            </a>
            <div class="sub-nav">
                <span>
                    <#list categoryList as secondCategory>
                    <#if secondCategory.parentId??>
                        <#if secondCategory.parentId == category.id>
                    <a href="/home/goods/list?id=${secondCategory.id}" target="_top">${secondCategory.name}</a>
                        </#if>
                    </#if>
                    </#list>
                </span>
            </div>
        </li>
            </#if>
        </#list>
    </ul>
</nav>