----------------------------------------
--$Id: keymgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 接口密钥管理
--
--]]

function KeyShow(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "Platform",},
		{["Type"] = "label", ["Text"] = "索引名:",},
		{["Type"] = "text", ["Name"] = "IndexName", ["Placeholder"] = "请输入索引名"},
		{["Type"] = "label", ["Text"] = "密钥名称:",},
		{["Type"] = "text", ["Name"] = "KeyName", ["Placeholder"] = "请输入密钥名称"},
	}
	--展示数据
	local Titles = {"平台", "索引", "密钥名称", "密钥", "操作人", "操作时间", "操作"}
	local Channels = CommonData.ChatChannels
	--操作人员列表
	local UserInfo = UserData:Get()
	local Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local TableData = {}
	local KeyList = InterfaceKeyData:Get(Options)
	for _, KeyInfo in ipairs(KeyList) do 
		local Data = {}
		local PlatformName = Platforms[KeyInfo.PlatformID] or "全部"
		table.insert(Data, PlatformName)
		table.insert(Data, KeyInfo.IndexName)
		table.insert(Data, KeyInfo.KeyName)
		table.insert(Data, KeyInfo.Sign)
		table.insert(Data, Users[KeyInfo.Operator])
		table.insert(Data, KeyInfo.OperationTime)
		local Url = '<a href="/interface/keyedit?platformID=' .. KeyInfo.PlatformID .. '&indexName='..KeyInfo.IndexName..'">编辑</a>'
		Url = Url .. '&nbsp&nbsp<a href="#" onclick="deleteKey(\''..KeyInfo.PlatformID .. "','" .. KeyInfo.IndexName 
			.. "','" .. KeyInfo.KeyName .. "','" .. PlatformName .. '\')">删除</a>'
		table.insert(Data, Url)
		table.insert(TableData, Data)
	end
	DataTable = {
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
	}
	Viewer:View("template/interface/key_show.html", Params)
end

function KeyEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		Args.OperationTime = os.date ("%Y-%m-%d %H:%M:%S")
		InterfaceKeyData:Insert(Args)
		self:KeyShow()
	else
		local Options = GetQueryArgs()
		KeyInfo = {}
		local NewOptions = {}
		NewOptions["PlatformID"] = Options.platformID
		NewOptions["IndexName"] = Options.indexName
		if NewOptions.PlatformID and NewOptions.IndexName then
			KeyInfo = InterfaceKeyData:Get(NewOptions)
		end
		if KeyInfo and KeyInfo[1] then
			KeyInfo = KeyInfo[1]
		end
		Platforms = CommonFunc.GetPlatformList()
		local Params = {
			KeyInfo = KeyInfo,
			Platforms = Platforms,
		}
		Viewer:View("template/interface/key_edit.html", Params)
	end
end

function KeyDelete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		InterfaceKeyData:Delete(Args.PlatformID, Args.IndexName)
		ngx.say("1")
	end
end

DoRequest()
