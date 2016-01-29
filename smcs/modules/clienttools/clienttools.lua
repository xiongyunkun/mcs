----------------------------------------------
--$Id: clienttools.lua 3691 2014-05-13 03:37:42Z zork $
----------------------------------------------
--[[
-- 客户端管理工具
--
--]]

function ReqSyncClientSource(self)
	ngx.say("请先确认资源已经上传完svn<br>")
	ngx.say("<a href=/client/syncsource>执行同步资源</a>")
end

function DoSyncClientSource(self)
	local Resulte = ExecuteCmcsShell(2,"sync_client_src.sh") 	
	Resulte = string.gsub(Resulte,"\n","\n<br>")
	ngx.say(Resulte)
end

DoRequest()
