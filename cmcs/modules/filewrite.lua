---------------------------------------------
--$Id: filewrite.lua 3697 2014-05-13 03:51:38Z zork $
---------------------------------------------
--[[
--	Put ServFile To The Game Server
--]]

function PutServFile(self)
	local Args = GetPostArgs()
	local FileName = Args.filename
	local Params = UriDecode(Args.list)
	if not FileName then
		ngx.say("no filename")
		return
	end
	
	local BaseGamePath = GetGamePath()
	-- 全文更新
	local AbsFileName = BaseGamePath.."/"..FileName
	if string.match(FileName,"^/.*") then
		AbsFileName = FileName
	end
	local fl = io.open(AbsFileName, "w")
	if not fl then
---[[
		local Order = 'touch '.. AbsFileName
		local ExcuteResult = os.execute(Order)
		if ExcuteResult~=0 then
			ngx.say(AbsFileName.."文件不存在，新创建该文件失败   ".. ExcuteResult)
			return
		end
		
		ngx.say("file "..AbsFileName.." not found, new a file")
		fl = io.open(AbsFileName, "w")
--]]
	end

	fl:write(Params)
	fl:close()
end

DoRequest()
