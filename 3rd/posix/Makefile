# makefile for POSIX library for Lua

# change these to reflect your Lua installation
ifndef LUAINC
	LUAINC= ../lua-5.1.5_coco-1.1.7/src
endif
LUALIB= $(LUAINC)
LUABIN=  $(LUAINC)
LUA= $(LUAINC)/luajit

CC=gcc

# no need to change anything below here
CFLAGS= -fPIC $(INCS) $(WARN) -g -O2 $G
WARN= -pedantic -Wall
INCS= -I$(LUAINC)

MYNAME= posix
MYLIB= l$(MYNAME)

OBJS= $(MYLIB).o

T= $(MYLIB).so
STATIC=lib$(MYLIB).a

all:	test

test:	$T $(STATIC)
	$(LUABIN)/lua -ll$(MYNAME) test.lua > /dev/null

$T:	$(OBJS)
	$(CC) -o $@ -shared $(OBJS)
$(STATIC):$(OBJS)
	ar cru $@ $(OBJS)

$(OBJS): modemuncher.c

tree:	$T
	$(LUABIN)/lua -l$(MYNAME) tree.lua .

clean:
	rm -f $(OBJS) $T $(STATIC) core core.* a.out

x:
	@echo "$(MYNAME) library:"
	@grep '},' $(MYLIB).c | cut -f2 | tr -d '{",' | sort | column

xx:
	@echo "$(MYNAME) library:"
	@fgrep '/**' $(MYLIB).c | cut -f2 -d/ | tr -d '*' | sort | column

# distribution

FTP= $(HOME)/public/ftp/lua
D= $(MYNAME)
A= $(MYLIB).tar.gz
TOTAR= Makefile,README,$(MYLIB).c,$(MYNAME).lua,test.lua,modemuncher.c,tree.lua

tar:	clean
	tar zcvf $A -C .. $D/{$(TOTAR)}

distr:	tar
	mv $A $(FTP)

diff:	clean
	tar zxf $(FTP)/$A
	diff $D .

.stamp:	$(FTP)/$A
	touch --reference=$(FTP)/$A $@

# eof

