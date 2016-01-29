function DoSendAlert(self)
	local TargetGroups = GetQueryArg("tgid")	
	if not TargetGroups or TargetGroups == "" then
		return
	end
	TargetGroups = ","..TargetGroups..","
	local ToAll = string.match(TargetGroups,",0,")
	local Msg = GetQueryArg("msg",true)
	local Title = GetQueryArg("title",true)

	local AllUser = UserData:GetAllUsers()
	local UserMap = {}
	for _, User in pairs(AllUser) do
		UserMap[User.id] = User
	end
	local AllGroupInfo = PermissionData:GetAllGroupInfo()
	local NeedSendRtx = {}
	for _, GInfo in pairs(AllGroupInfo) do
		if (ToAll or string.match(TargetGroups, ","..GInfo.groupid..",")) and UserMap[GInfo.userid] then
			NeedSendRtx[UserMap[GInfo.userid].rtx] = true
		end
	end

	if string.len(Msg) > 500 then
		Msg = string.sub(Msg,1,500)
	end

	local rtxurl = "rtxurl....."
	--"?receiver=%s&msg=%s&title=%s"

	local sendurl = ngx.escape_uri(rtxurl)
	Msg = ngx.escape_uri(Msg)
	Title = ngx.escape_uri(Title)
	for Account, _ in pairs(NeedSendRtx) do
		local resp = ngx.location.capture("/proxy?host="..sendurl,{method=ngx.HTTP_POST,body="receiver="..Account.."&msg="..Msg.."&title="..Title})
		if resp.status ~= ngx.HTTP_OK then
			error("false")
		end
		ngx.say(resp.body)
	end
end

DoRequest(true)
