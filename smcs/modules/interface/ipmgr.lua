----------------------------------------
--$Id: keymgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 接口密钥管理
--
--]]

function IPShow(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "label", ["Text"] = "索引名:",},
		{["Type"] = "text", ["Name"] = "IndexName", ["Placeholder"] = "请输入索引名"},
	}
	--展示数据
	local Titles = {"索引", "IP白名单", "操作人", "操作时间", "操作"}
	--操作人员列表
	local UserInfo = UserData:Get({}, true)
	local Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local TableData = {}
	local IPWhiteList = IPWhiteListData:Get(Options)
	for _, Info in ipairs(IPWhiteList) do 
		local Data = {}
		table.insert(Data, Info.IndexName)
		table.insert(Data, Info.IPList)
		table.insert(Data, Users[Info.Operator])
		table.insert(Data, Info.SubmitTime)
		local Url = '<a href="/interface/ipedit?indexName='..Info.IndexName..'">编辑</a>'
	--	Url = Url .. '&nbsp&nbsp<a href="#" onclick="deleteKey(\''.. Info.IndexName .. '\')">删除</a>'
		table.insert(Data, Url)
		table.insert(TableData, Data)
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = false,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Filters = Filters,
		Titles = Titles,
		Users = Users,
		TableData = TableData,
		DataTable = DataTable,
	}
	Viewer:View("template/interface/ip_show.html", Params)
end

function WriteIp(self, IPList, PlatformID, IndexName)
	--[[
	local Url =	CommonData.IP_WHITE_LIST_URL .. IPList .. "&Index=" .. IndexName
	local Flag, Response = ReqOutUrl(Url)
	ngx.say(Flag, Response)
	--]]
	
	local FileName = "youmi.txt" --IndexName .. ".txt"
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/serverinfo/ipwhitelist/"..FileName,"w")
	assert(Writer,"/../gservice/interfacedata/serverinfo/ipwhitelist/"..FileName)

	Writer:write(IPList)
	Writer:flush()
	Writer:close()
end

function IPEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		Args.SubmitTime = os.date ("%Y-%m-%d %H:%M:%S")
		IPWhiteListData:Insert(Args)
		self:IPShow()
		self:WriteIp(Args.IPList, Args.PlatformID, Args.IndexName)
	else
		local Options = GetQueryArgs()
		local IPInfo = {}
		if Options.indexName and Options.indexName ~= "" then
			IPInfo = IPWhiteListData:Get(Options)
		end
		if IPInfo and IPInfo[1] then
			IPInfo = IPInfo[1]
		end
		local Params = {
			IPInfo = IPInfo,
		}
		Viewer:View("template/interface/ip_edit.html", Params)
	end
end

function IPDelete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		IPWhiteListData:Delete(Args.IndexName)
		ngx.say("1")
	end
end

DoRequest()
