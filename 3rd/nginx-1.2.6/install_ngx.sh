export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0

./configure --add-module=../ngx_devel_kit --add-module=../lua-nginx-module --add-module=../drizzle-nginx-module

