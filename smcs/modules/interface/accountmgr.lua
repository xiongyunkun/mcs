----------------------------------------
--$Id: accountmgr.lua 87658 2016-01-16 07:02:15Z xiongyunkun $
----------------------------------------
--[[
-- 接口密钥管理
--
--]]

function AccountShow(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	
	--filter页面模板显示的参数
	local Filters = {
		{["Type"] = "label", ["Text"] = "索引名:",},
		{["Type"] = "text", ["Name"] = "IndexName", ["Placeholder"] = "请输入索引名"},
	}
	--展示数据
	local Titles = {"索引", "账号白名单", "操作人", "操作时间", "操作"}
	--操作人员列表
	local UserInfo = UserData:Get()
	local Users = {}
	for _, User in ipairs(UserInfo) do
		Users[User.account] = User.name
	end
	local TableData = {}
	local AccountWhiteList = AccountWhiteListData:Get(Options)
	for _, Info in ipairs(AccountWhiteList) do 
		local Data = {}
		table.insert(Data, Info.IndexName)
		table.insert(Data, Info.AccountList)
		table.insert(Data, Users[Info.Operator])
		table.insert(Data, Info.SubmitTime)
		local Url = '<a href="/interface/accountedit?indexName='..Info.IndexName..'">编辑</a>'
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
		Servers = Servers,
		Filters = Filters,
		Users = Users,
		TableData = TableData,
		DataTable = DataTable,
		Titles = Titles,
	}
	Viewer:View("template/interface/account_show.html", Params)
end

function WriteAccount(self, AccountList, PlatformID, IndexName)
--[[
	local Url =	CommonData.ACCOUNT_WHITE_LIST_URL .. AccountList .. "&index=" .. IndexName
	local Flag, Response = ReqOutUrl(Url)
	ngx.say(Flag, Response)
--]]
	
	local FileName = IndexName .. ".txt"
	local Writer = io.open(GetBasePath().."/../gservice/interfacedata/serverinfo/accountwhitelist/"..FileName,"w")
	assert(Writer,"/../gservice/interfacedata/serverinfo/accountwhitelist/"..FileName)

	Writer:write(AccountList)
	Writer:flush()
	Writer:close()
end

function AccountEdit(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		Args.SubmitTime = os.date ("%Y-%m-%d %H:%M:%S")
		AccountWhiteListData:Insert(Args)
		self:AccountShow()
		self:WriteAccount(Args.AccountList, Args.PlatformID, Args.IndexName)
	else
		local Options = GetQueryArgs()
		AccountInfo = {}
		if Options.indexName and Options.indexName ~= "" then
			AccountInfo = AccountWhiteListData:Get(Options)
		end
		if AccountInfo and AccountInfo[1] then
			AccountInfo = AccountInfo[1]
		end
		local Params = {
			AccountInfo = AccountInfo,
		}
		Viewer:View("template/interface/account_edit.html", Params)
	end
end

function AccountDelete(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		AccountWhiteListData:Delete(Args.IndexName)
		ngx.say("1")
	end
end

DoRequest()
