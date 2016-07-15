CUR_PATH:=$(shell pwd)/$(lastword $(MAKEFILE_LIST))
CUR_PATH:=$(shell dirname $(CUR_PATH))
LUAJIT_LIB=$(CUR_PATH)/LuaJIT-2.1-20150622/src
LUAJIT_INC=$(CUR_PATH)/LuaJIT-2.1-20150622/src
export LUAJIT_LIB
export LUAJIT_INC
NGX_DEVEL_KIT=$(CUR_PATH)/ngx_devel_kit
NGX_LUA=$(CUR_PATH)/ngx_lua-0.9.16
NGX_DRIZZLE=$(CUR_PATH)/drizzle-nginx-module-0.1.9
NGX_PATH=$(CUR_PATH)/nginx-1.7.10
LUA_RDS=$(CUR_PATH)/lua-rds-parser
LUA_ICONV=$(CUR_PATH)/lua-iconv-7
PCRE=$(CUR_PATH)/pcre-8.32
DRIZZLE=$(CUR_PATH)/drizzle7-2011.07.21

all:
	-(test -f ../cmcs/lib/iconv.so || test -f ../smcs/lib/iconv.so) || (cd $(LUA_ICONV) && make && cp iconv.so ../../cmcs/lib && cp iconv.so ../../smcs/lib )
	-(test -f ../smcs/lib/rds/parser.so) || (cd $(LUA_RDS) && make LUA_INCLUDE_DIR=$(LUAJIT_INC) LUA_LIB_DIR=$(LUAJIT_LIB) && mkdir ../../smcs/lib/rds && cp parser.so ../../smcs/lib/rds/)
	-(test -f /usr/local/lib/libpcre.so) || (cd $(PCRE) && chmod a+x configure && ./configure && make && make install)
	-(test -f /usr/local/lib/libdrizzle.so) || (cd $(DRIZZLE) && chmod a+x configure && ./configure --without-server && make libdrizzle-1.0 && make install-libdrizzle-1.0)
	-(test -f ../nginx_bin/nginx) || (cd $(NGX_PATH) && chmod a+x configure && ./configure --add-module=$(NGX_DEVEL_KIT) --add-module=$(NGX_LUA) --add-module=$(NGX_DRIZZLE) && make && cp objs/nginx $(CUR_PATH)/../nginx_bin/)
	
clean:
	-cd $(NGX_PATH) && $(MAKE) clean
	-cd $(LUA_RDS) && $(MAKE) clean
	-cd $(LUA_ICONV) && $(MAKE) clean
	-cd $(PCRE) && $(MAKE) clean
	-cd $(DRIZZLE) && $(MAKE) clean
install:

