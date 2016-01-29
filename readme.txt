概述
1.smcs
运营中心网站，负责管理的所有界面和操作，独立的服务器中运行
2.cmcs
放在游戏服务器中，和游戏服务器的master进程在同一物理机
主要负责从游戏服务器中获取日志，数据或运行脚本等功能，只能由smcs的接口调用

安装配置
1.配置3rd/Makefile 中路径
2.进入3rd目录，运行make
3.cd smcs 运行setupsmcs.sh 来设置smcs/smcs.conf 中相关路径
4.cd cmcs 运行setupcmcs.sh 游戏路径 来设置cmcs/cmcs.conf 中相关路径
5.对于smcs，安装和配置好mysql，使用base/initdb.sql建立好数据库，配置smcs.conf中数据库连接

启动
cd smcs
./smcssvr.sh start|stop|reload

cd cmcs
./cmcssvr.sh start|stop|reload

smcs编写服务说明
======================================
一、目录说明
mainframe.html	运营中心框架页面
smcs.conf	运营中心nginx的基础配置
smcssvr.sh	启动脚本
+base
|--database.lua	mysql数据库操作接口封装
|--initdb.sql	数据库设计文档
|--init.lua	初始化模块和基础API
|--viewer.lua	模版解释模块
+conf
|--nginx.conf	nginx配置文件
+custom_conf
|--custom_modules.conf	可显示模块的nginx location配置文件，由系统生成
+admin
|--funcmgr.lua	模块管理，生成页面导航菜单，根据录入的模块配置生成nginx配置文件
|--header.lua	用于生成页面中头部信息栏，暂时没有内容
|--login.lua	处理账号登录操作，密码验证，生成session等
|--modulesdata.lua	模块管理的数据操作封装
|--permissiondata.lua	权限管理的数据封装，获取用户分组，所有权限等数据
|--permissionmgr.lua	分组与权限管理模块，创建分组，分配账号分组，设置分组权限等
|--userdata.lua	账号数据操作封装
|--usermgr.lua	账号管理
+include
|--inc_header.html	html header部分css设定，给其它模版include
|--inc_position.html	功能界面位置和操作提示模版，给其它模版include
+interface
|--send_alert.lua	发送通知消息的接口，现可以按分组发送rtx信息
+lib
|--iconv.so	中文编码转换库
|--rds/parser.so	数据库结果转换成luatable的库
+modules
|--+server
|  |--serverdata.lua	服务器数据操作封装
|  |--servermgr.lua	服务器信息管理，包括分区管理，服务器分区关系管理
|--...其它功能模块
+template	显示模版文件
+script	导航菜单树形显示的js
+img	图片

二、可用API
1.lua_nginx中可以用api，参考：http://wiki.nginx.org/HttpLuaModuleZh#Introduction
  对于常用和复杂的逻辑，可以封装到系统自身的API中
2.自定义的方法，主要在base/init.lua中定义，现可用内容有：
  可用模块：
  Viewer	模版解释
  DB	数据库操作，在写数据库操作模块时用到
  UserData	封装了账号相关数据操作
  ServerData	封装了服务器数据信息相关的操作
  其它模块视具体情况使用
  可用方法：
  GetPostArgs()	返回post的参数table
  GetQueryArg(ArgName, ToGBK)	返回指定名字的get方式参数，可以强制转换成GBK编码
  DoRequest(Force)	需要响应请求的模块的统一请求入口，Force=true跳过权限校验
  UriEncode(Str)	把字符串编码成链接安全方式
  UriDecode(Str)	解码
  GetSession(Key)	获取指定名字的session值
  SetSession(Key,Value)	设定session，没有值的会new一个
  ReqOutUrl(Url, Params)	访问外部链接
  GetCmcsFile(SvrId, FileName, ParamTbl)	根据服务器id，获取指定文件名的文件
  ExecuteCmcsShell(SvrId, ShellName, ParamStr)	根据服务器id，执行该服务器中的一个脚本，参数是脚本需要的参数

三、编写smcs功能模块说明
1.新加的功能模块，非系统框架本身的内容，都放在modules目录下，子目录名字根据具体需求自定义
2.建立模块的lua文件
3.用于响应请求的lua文件最后一行调用DoRequest()方法，默认需要进行权限检验
4.编写每种请求的处理方法，原则：
  a.请求显示的方法用Req前缀
  b.请求执行操作的用Do前缀
5.需要显示页面的，需写对应的模版文件，放在template目录下
6.调用Viewr:View("template/xxx.html")即可显示
7.需要给模版显示的参数，只需定义成全局变量即可在模版中使用
8.模块编写好后，登录管理中心，选择模块管理，填写location，处理方法等信息，选择显示的才会在导航菜单中显示
9.选择【角色权限管理】-【角色管理】在对应角色的设置权限中把刚加的模块权限设置好
10.选择【重新加载配置】选项另模块生效，或者执行启动脚本的reload
可参考admin/usermgr.lua和modules/server/servermgr.lua

四、写smcs模版说明
现在只实现了简单的模版处理，基本够用
1.$代码$ 可用于html代码之间，会显示代码中的值
2.#lua代码 必须占用一行，执行lua代码，通常用于流程控制
3.#include("xxx.html")	在该行插入指定文件的内容
4.可用模块为全局模块、方法和变量，所以，调用模块只需把变量定义为全局即可在模版中使用


cmcs编写服务说明
======================================
一、目录说明
cmcs.conf
cmcssvr.sh
+base	基础文件，是smcs的简化版
+conf
+lib
+logs
+modules
|--execute.lua	执行脚本的响应方法
|--fileop.lua	进行文件操作的处理方法
+shell	多数功能将会使用脚本方式实现，考虑扩展功能是可以执行shell，也可以执行lua脚本

二、编写cmcs功能模块说明
1.多数功能可以利用脚本方式实现，脚本放在shell目录下
2.如果必须新加的功能，仿照smcs功能模块编写的方式写
3.配置cmcs.conf把location等信息加入配置中，reload配置

