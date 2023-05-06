# Springboot_Mybatis_flea_market
基于SpringBoot+Mybatis的校园二手交易跳蚤市场设计毕业源码案例设计

 ## 开发工具Eclipse或者idea都可以，数据库mysql,基于Springboot+Mybatis+Redis开发一个校园二手跳蚤市场，实现了闲置物品的价值再利用！

  其中用户可以在前台注册登录，可以发布自己的闲置物品信息，可以按照分类查询自己感兴趣的宝贝，也可以按照关键字查询宝贝。当用户查看到自己满意的宝贝后可以查看卖家联系方式，直接联系卖家购买，也可以暂时把商品加入购物车，相当于自己的收藏夹，其中这里的购物车收藏夹采用redis数据库存储，可以解决mysql数据库访问压力，当用户自己的宝贝已经销售完毕后卖家用户可以下架商品。用户个人中心可以统计已发布宝贝数量、已出售商品数量、正在出售商品数量、已下架商品数、购物车数量,用户可以修改个人账户密码信息以及基本信息。

  管理员登录后台后可以在首页查看系统日志信息，后台用户设计是基于权限角色管理，实现技术采用的是基于拦截器实现，后台包括资源菜单管理，角色信息管理，用户信息管理，数据库连接池监控，商品分类含二级分类管理，商品信息管理可以删除违规商品，学生信息管理可以冻结非法账户，商品评论信息管理，新闻公告管理，站点信息设置等！

用户账号：171240260401 密码：123456

管理员账号：zs 密码：123456
