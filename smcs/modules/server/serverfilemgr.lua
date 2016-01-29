----------------------------------------
--$Id: serverfilemgr.lua 66962 2015-05-25 07:13:10Z xiongyunkun $
----------------------------------------
--[[
--	获取数据文件
--	获取日志内容
--]]

-- 入口方法
function ReqGetServerData(self)
	Options = GetQueryArgs()
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	ServerTypes = CommonFunc.GetMulServerTypes()
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "<br>",},
		{["Type"] = "Host",["Multiple"] = false,},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "文件名:",},
		{["Type"] = "text",["Name"] = "FileName",},
	}
	FilterStyles = {
        ["hostID"] = {["width"] = "600px",}
    }
	FileStr = self:DoGetServerDataFile(Options)

	Viewer:View("template/server/serverfile.html")
end

function DoGetServerDataFile(self, Options)
	local Context = ""
	local Ret
	if Options.FileName and Options.FileName ~= "" and Options.HostID and Options.HostID ~= "" then
		Ret, Context = ReqCmcsByServerId(tonumber(Options.HostID), "getgamefile", {HostID=Options.HostID,FilePaths=Options.FileName})
	end
	return Context
end

function ReqGetServerFile(self)
	Options = GetQueryArgs()
	Options.StartTime = Options.StartTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time() - 86400)
	Options.EndTime = Options.EndTime or os.date("%Y-%m-%d %H:%M:%S",ngx.time())
	Platforms = CommonFunc.GetPlatformList()
	--获得服务器列表
	Servers = CommonFunc.GetServers(Options.PlatformID)
	ServerTypes = CommonFunc.GetMulServerTypes()
	--filter页面模板显示的参数
	Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "Host"},
		{["Type"] = "StartTime",["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "EndTime", ["Format"] = "yyyy-MM-dd HH:mm:ss"},
		{["Type"] = "<br>",},
		{["Type"] = "label",["Text"] = "文件名:",},
		{["Type"] = "text",["Name"] = "FileName",},
	}
	
	FileStr = self:DoGetServerLogFile(Options)

	Viewer:View("template/server/serverfile.html")
end


function DoGetServerLogFile(self)
	if not Options.FileName or Options.FileName == "" then
		return "NoFileName"
	end
	if not Options.HostID or Options.HostID == "" then
		return "No HostID"
	end
	local Args = {
		FileNames=Options.FileName,
		HostID=Options.HostID,
		StartTimes = Options.StartTime,
		EndTimes = Options.EndTime,
	}
	local Ret, Context = ReqCmcsByServerId(tonumber(Options.HostID),"getlog", Args)	
	if Context and Context ~= "" then
		--过滤替换\9这种特殊字符
		Context = string.gsub(Context, "\\9", "   ") --过滤\9
		Context = string.gsub(Context, "\\\n", "\n") --过滤每行结束时候的\
	end
	return Context or ""
end

DoRequest()
