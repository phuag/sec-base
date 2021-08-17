sec-base
==========================

cloud学习项目

后端仅提供REST数据,前端单页面应用组织方式,页面子功能菜单通过前端路由实现

##Contribution

_I appreciate any contribution for this project, including suggestions, documentation improvements, reporting issues, forks and bugfixs,  etc. I have found there are some unrelated issues added, before you file an issue, please **READ THE STEPS IN THIS README.md**  carefully_.

**在你提交 ISSUE 前，请务必确认已经严格完成了本文中描述的操作步骤**。

Thanks.

##后端

  * 技术选择
  
    spring-cloud
    
    nacos + spring gateway + spring-boot-admin 

    mybatis + mybatispuls + druid

    spring-security + oauth2

    redis
    
  * 运行及开发环境
  
    JDK 8 +  Apache Maven


##前端（vue）

   * vue 2 + vue-router + vuex + element-ui
 
        
##前后端结合

    采用前后端分离，前后端分别运行，前端可以将静态资源发布到静态容器中
    
      vue 2最终的前端代码需要编译打包，仅将前端build后输出文件放到resource/static下
      源码放在frontend中，输出路径配置在frontend/config/index.js中，编译打包命令：
      在frontend目录中运行 npm run build 
    
    
##运行

    
    前端，需要先编译打包前端代码，编译完成后发布到静态容器中
    后端：
    方式1: 运行Application类
    方式2：通过spring-boot的maven插件将整个工程打成一个可运行jar包,java -jar命令运行jar
    方式3: 通过spring-boot的maven插件将整个工程打成一个war包,发布到tomcat等容器中运行