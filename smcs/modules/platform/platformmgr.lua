----------------------------------------
--$Id: platformmgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- platform list manager
--
--]]
local MsgList = {
[1] = "平台ID不能为空",
}

Status = {
	[1] = "可用",
	[2] = "停用",
}

function ReqPlatformList(self, Msg)
	PlatformList = PlatformData:GetPlatform()	
	ExtMsg = Msg
	Viewer:View("template/platform/platformlist.html")
end

function DoUpdatePlatform(self)
	local PlatformID = GetQueryArg("PlatformID")
	if ngx.var.request_method == "POST" then
		--处理post过来的数据，记录入库
		local Args = GetPostArgs() 
		local Msg = nil
		if not Args.PlatformID then 
			Msg = MsgList[1]
		else
			local Res, Msg = PlatformData:UpdatePlatform(Args)
		end
		self:ReqPlatformList(Msg)
		return
	end
	--如果是Get请求则是打开编辑页面
	PlatformInfo = nil
	if PlatformID then
		PlatformInfo = PlatformData:GetPlatform(PlatformID)
	end
	if PlatformInfo and PlatformInfo[1] then
		PlatformInfo = PlatformInfo[1]
	end
	Viewer:View("template/platform/editplatform.html")
end

function DoDelPlatform(self)
	local Args = GetPostArgs()
	local PlatformID = Args.PlatformID
	if ngx.var.request_method == "POST" then
		local Res, Err = PlatformData:DelPlatform(PlatformID)
		if not Err then
			ngx.say("1")
		else
			ngx.say("0")
		end
	end
	return
end

DoRequest()
