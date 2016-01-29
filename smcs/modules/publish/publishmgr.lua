----------------------------------------------
--$Id: publishmgr.lua 50924 2015-03-16 12:37:54Z zork $
----------------------------------------------
--[[
-- publish manager
-- 1.version add del, include client version
-- 2.new machine
-- 3.new game server
-- 4.game server publish
-- 5.publish version to game server
-- 6.shutdown game server
-- 7.startup game server
-- 8.publish client
--]]
local VersionData = require("model.server.version_data")
local MachineData = require("model.server.machine_data")

function ReqVersionList(self, Msg)
	ClientVersions = VersionData:GetAllVersion(VersionData.VersionType.CLIENT)
	ServerVersions = VersionData:GetAllVersion(VersionData.VersionType.SERVER)
	ExtMsg = Msg
	Viewer:View("template/publish/versionlist.html")
end

function ReqAddVersion(self)
	Viewer:View("template/publish/addversion.html")
end

function DoAddVersion(self)
	local Args = GetPostArgs()
	if not Args.version then
		self:ReqVersionList("must have version")	
		return
	end
	local Ret, Err = VersionData:AddVersion(Args)
	self:ReqVersionList(Err)
end

function DoDelVersion(self)
	local Version = GetQueryArg("version")
	local Ret, Err = VersionData:DelVersion(Version)
	self:ReqVersionList(Err)
end

-- 请求发布服务器版本
function ReqPubVersion(self)

end

-- 执行发布服务器版本
function DoPubVersion(self)

end

-- 执行发布客户端版本
function DoPubClientVersion(self)

end

-- machine manager
local STATUS_OFF=3
local STATUS_ERR=4
function ReqMachineList(self, Msg)
	local Platformid = GetQueryArg("platformid")
	MachineData:UpdateMachineData()
	MachineList = MachineData:GetMachineList(Platformid)
	local Servers = ServerData:GetAllServers()
	MachineInfo = {}
	for _, Server in ipairs(Servers) do
		if not MachineInfo[Server.address] then
			MachineInfo[Server.address] = {GameCount=0,OnCount=0,OffCount=0,ErrCount=0}
		end
		local Info = MachineInfo[Server.address]
		Info.GameCount = Info.GameCount + 1
		local IsOn = true
		if Server.status == STATUS_OFF then
			Info.OffCount = Info.OffCount + 1
			IsOn = false
		end
		if Server.status == STATUS_ERR then
			Info.ErrCount = Info.ErrCount + 1
			IsOn = false
		end
		if IsOn then
			Info.OnCount = Info.OnCount + 1
		end
	end
	--获得平台列表
	PlatformList = PlatformData:GetPlatform()
	Platforms = {}
	for _, Platform in ipairs(PlatformList) do
		Platforms[Platform.PlatformID] = Platform.PlatformName
	end
	ExtMsg = Msg
	Viewer:View("template/publish/machinelist.html")
end

-- 执行初始化机器工具
local INIT_MACHINE_CMD = "cd shell && ./smcs_new_machine.sh %s &"
local CHECKFILE="new_machine_ret"
local FINISHURI="publishmgr/doinitmachinedone"
function DoInitMachine(self)
	CheckFile = CHECKFILE
	FinishUri = FINISHURI
	Address = GetQueryArg("address")
	local file = io.open("shell/"..CHECKFILE, "r")
	if file then
		file:close()
		self:ReqMachineList("init machine is doing")
		return
	end
	os.execute(string.format(INIT_MACHINE_CMD, Address))
	Viewer:View("template/publish/viewprogress.html")
end

function DoCheckProgress(self)
	local CheckFile = GetQueryArg("checkfile")
	local file = io.open("shell/"..CheckFile,"r")
	if not file then
		ngx.say("progress done")	
		return
	end
	local Msg = file:read("*a")
	file:close()
	Msg = string.gsub(Msg,"\n","<br>")
	ngx.say(Msg)
end

function DoInitMachineDone(self)
	local Address = GetQueryArg("address")
	local file = io.open("shell/"..CHECKFILE, "r")
	local ErrMsg
	if file then
		local Msg = file:read("*a")	
		file:close()
		-- 统计: IP数 %d, 完成 %d, 错误 %d,
		if string.match(Msg, "任务完成") and string.match(Msg,"错误 0,") then
			local Ret, Err = MachineData:UpdateMachineInfo({address=Address,inited=1})	
			if Err then
				ErrMsg = Err
			end
		end
		os.execute("rm shell/"..CHECKFILE)
	end
	self:ReqMachineList(ErrMsg)
end

-- 执行删除机器
function DoDelMachine(self)
	local Address = GetQueryArg("address")
	local Servers = ServerData:GetAllServers()
	for _, Server in ipairs(Servers) do
		if Server.address == Address then
			self:ReqMachineList("该机器还有逻辑服务器存在，不能删除")
			return
		end
	end
	MachineData:DelMachine(Address)	
	self:ReqMachineList()
end

-- 执行修改机器信息
function DoModifyMachine(self)
	local Args = GetPostArgs()
	if not Args.address then
		self:ReqMachineList("没有指定机器")
		return
	end
	local Ret, Err = MachineData:UpdateMachineInfo(Args)
	self:ReqMachineList(Err)
end

-- 列出未初始化或未正式发布的逻辑服务器列表
function ReqNotInitServerList(self, Msg)
	
end

-- 执行初始化逻辑服务器
function DoInitGameServers(self)

end

-- 执行发布逻辑服务器
function DoPubGameServers(self)

end

-- 请求关闭服务器
function ReqServerShutdown(self)

end

-- 执行关闭服务器
function DoServerShutdown(self)

end

-- 请求启动服务器
function ReqServerStartup(self)

end

-- 执行关闭服务器
function DoServerStartup(self)

end

DoRequest()

