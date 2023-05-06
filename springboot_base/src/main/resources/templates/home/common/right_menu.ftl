<aside>


       <div id="release-button1" >
         <a  href="/home/student/cart" style="color: white" id="want-buy"">购物车</a>
       </div>
    <br><br>
        <div id="release-button2" >
            <a  href="/home/student/goPublish" style="color: white" id="want-sale"> 我要卖</a>
        </div>

        <div class="helped ">
         <span class="helpers" id="order-count">999999</span>
        </div>
        
        <div class="fl-wrapper clearfix">
        <div class="wx-follow">
            <a href="javascript:void(0);" class="fl-icon">
                <img src="/home/imgs/weixin-fl.png">
            </a>
            <div class="wx-fl-qrcode">
                <p>微信关注</p>
                <#if siteSetting.code??>
                <img height="100px" height="100px" src="/photo/view?filename=${siteSetting.code}" alt="${siteSetting.siteName!""}">
                <#else>
                <img height="100px" height="100px" src="/home/imgs/wx-fl-qrcode.png">
                </#if>
                <p>${siteSetting.siteName!""}</p>
                <div class="dc-dot"></div>
            </div>
        </div>
       
    </div>
    </aside>
