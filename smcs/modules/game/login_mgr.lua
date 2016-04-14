----------------------------------------
--$Id: login_mgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 一键登录逻辑
--]]

function SimulateLogin(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--先从玩家信息表中查询获得玩家信息
		local Name = string.strip(Args.Name or "")
		if Name == "" then 
			self:ShowView("角色名不能为空")
			return 
		end
		local Options = {
			PlatformID = Args.PlatformID, 
			HostID = Args.HostID, 
			RealName = Name,
		}
		local UserInfo = UserInfoData:Get(Options)
		if #UserInfo ~= 1 then
			self:ShowView("不存在此账号或者账号存在多个")
			return 
		end
		--获得客户端地址
		local ClientUrl = nil
		local TagInfo = ServerData:GetHostTagInfo(Args.HostID) 
		if TagInfo and TagInfo[1] then
			ClientUrl = TagInfo[1].clienturl
		end
		if not ClientUrl or ClientUrl == "" then
			self:ShowView("客户端地址不存在，请联系技术")
			return
		end
		--获得服编号
		local ServerMark = nil
		local ServerInfo = ServerData:GetServer({HostID = Args.HostID})
		if ServerInfo and ServerInfo[1] then
			ServerMark = ServerInfo[1].servmark
		end
		local NowTime = os.time()
		--记录此次操作
		self:InsertOperation(Args.PlatformID, Args.HostID, UserInfo[1].Urs, NowTime)
		local Sign = self:GenerateSign(Args.PlatformID, UserInfo[1].Urs, NowTime)
		--开始生成链接
		local Strs = string.split(UserInfo[1].Urs, "_")

		local NewUrs = table.concat( Strs, "_", 2)
		local UrsParams = {
			"account=" .. NewUrs,
			"gmtime=" .. NowTime,
			"isgm=" .. 1,
			"server=" .. Args.HostID,
			"game=ZSZS",
			"gmsign=" .. string.upper(Sign),
			"pf=" .. Args.PlatformID,
			"serverid=" .. ServerMark,
		}
		if Options.PlatformID == "dw" then
			table.insert(UrsParams, "dwservId=" .. ServerMark)
		end
		if string.find(ClientUrl, "?") then --之前有?号所以直接拼接&
			ClientUrl = ClientUrl .. "&" .. table.concat(UrsParams, "&")
		else
			ClientUrl = ClientUrl .. "?" .. table.concat(UrsParams, "&")
		end
		ngx.redirect(ClientUrl)
	else
		self:ShowView()
	end
end

function ShowView(self, ExtStr)
	ExtMsg = ExtStr
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--展示数据
	Titles = {"ID", "平台", "服", }
	TableData = {}
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/simulate_login.html")
end

function InsertOperation(self, PlatformID, HostID, Urs, Time)
	Time = os.date("%Y-%m-%d %H:%M:%S", Time)
	local User = UserData:GetUserById(GetSession("UserId"))
	local Operator = User and User["account"] or ""
	local Args = {
		PlatformID = PlatformID,
		HostID = HostID,
		Urs = Urs,
		Time = Time,
		Operator = Operator
	}
	SimulateLoginData:Insert(Args)
end

--生成登陆密钥
function GenerateSign(self, PlatformID, Urs, Time)
	local Key = CommonFunc.GetInterfaceKey(PlatformID, "simulate_key")
	local Str = Urs .. Time .. Key
	local MD5Str = ngx.md5(Str)
	return MD5Str 
end

--生成登陆密钥
function GeneratePlatformSign(self, PlatformID, Urs, Time)
	local Key = CommonFunc.GetInterfaceKey(PlatformID, "simulate_key")
	local Str = PlatformID .. "_" .. Urs .. Time .. Key
	local MD5Str = ngx.md5(Str)
	return MD5Str 
end

--外服验证,基本原理与一键登录一样
--账号规则是yh01-yh99
function VerifyServer(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		--随机生成账号
		local Urs = "yh" .. string.format("%02d",math.random(1,99))
		--获得客户端地址
		local ClientUrl = nil
		local TagInfo = ServerData:GetHostTagInfo(Args.HostID) 
		if TagInfo and #TagInfo ==1 then
			ClientUrl = TagInfo[1].clienturl
		end
		if not ClientUrl or ClientUrl == "" then
			self:ShowVerifyView("客户端地址不存在，请联系技术")
			return
		end
		--获得服编号
		local ServerMark = nil
		local ServerInfo = ServerData:GetServer({HostID = Args.HostID})
		if ServerInfo and ServerInfo[1] then
			ServerMark = ServerInfo[1].servmark
		end
		local NowTime = os.time()
		--记录此次操作
		self:InsertOperation(Args.PlatformID, Args.HostID, Urs, NowTime)
		local Sign = self:GeneratePlatformSign(Args.PlatformID, Urs, NowTime)
		--开始生成链接
		local UrsParams = {
			"account=" .. Urs,
			"gmtime=" .. NowTime,
			"isgm=" .. 2,
			"server=" .. Args.HostID,
			"game=ZSZS",
			"gmsign=" .. string.upper(Sign),
			"pf=" .. Args.PlatformID,
			"serverid=" .. ServerMark,
		}
		if Args.PlatformID == "dw" then
			table.insert(UrsParams, "dwservId=" .. ServerMark)
		end
		if string.find(ClientUrl, "?") then --之前有?号所以直接拼接&
			ClientUrl = ClientUrl .. "&" .. table.concat(UrsParams, "&")
		else
			ClientUrl = ClientUrl .. "?" .. table.concat(UrsParams, "&")
		end
		ngx.redirect(ClientUrl)
	else
		self:ShowVerifyView()
	end
end

function ShowVerifyView(self, ExtStr)
	ExtMsg = ExtStr
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	Servers = CommonFunc.GetServers(Options.PlatformID)
	--展示数据
	Titles = {"ID", "平台", "服", }
	TableData = {}
	DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	Viewer:View("template/game/verify_server.html")
end
DoRequest()
