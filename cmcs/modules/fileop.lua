---------------------------------------------
--$Id: fileop.lua 67056 2015-05-25 12:00:31Z xiongyunkun $
---------------------------------------------
--[[
--	Get the game server file
--]]

function GetFile(self)
	local Args = GetPostArgs()
	local FileName = Args.filename
	local ParamStr = Args.param
	if not FileName then
		ngx.say("no filename")
		return
	end
	local ParamTbl = {}
	if ParamStr then
		for k, v in string.gmatch(ParamStr..",","(.-)=(.-),") do
			ParamTbl[k] = v
		end
	end
	local BaseGamePath = GetGamePath()
	local fl = io.open(BaseGamePath..FileName, "r")
	if not fl then
		ngx.say("file "..BaseGamePath..FileName.." not found")
		return
	end
	local Context = fl:read("*a")
	fl:close()
	ngx.say("Ok")
	ngx.say(Context)
end

function GetGameFile(self)
    local Args = GetPostArgs()
    local FilePaths = Args.FilePaths
    local HostID = Args.HostID
    local Results = {}
    local BasePath = GetBasePath()
	local HostDir = BasePath .. "/../../" .. HostID .. "/"
    FilePaths = string.split(FilePaths, ",")
    for _, FilePath in ipairs(FilePaths) do
        local fl = io.open(HostDir..FilePath, "r")
        if not fl then
            Results[FilePath] = ""
        else
            local Context = fl:read("*a")
            Results[FilePath] = Context
            fl:close()
        end
    end
    ngx.say(Serialize(Results))
end

function GetLog(self)
	local Args = GetPostArgs()
	local FileNames = Args.FileNames
	local HostID = Args.HostID
	local StartTimes = Args.StartTimes
	local EndTimes = Args.EndTimes or ""
	FileNames = string.split(FileNames, ",")
	StartTimes = string.split(StartTimes, ",")
	EndTimes = string.split(EndTimes, ",")
	local BasePath = GetBasePath()
	local Results = {}
	for Index, FileName in ipairs(FileNames) do
		local Context = ""
		local ShellFullName = BasePath.."/shell/get_log.sh"
		local LogResultName = string.gsub(FileName, "/", "_")
		local ShellOutPath = string.format("/log_result/%s_%d_%d", LogResultName,os.time(),math.random(100,999))
		local ShellOut = BasePath .. ShellOutPath
		local ShellParam = HostID .. ' "' .. FileName .. '" "' 
			.. (StartTimes[Index] or "") .. '" "' .. (EndTimes[Index] or '') .. '"'
		local ShellCmd = ShellFullName.." "..ShellParam.." > "..ShellOut
		local Ret = os.execute(ShellCmd)
		if not Ret or Ret > 0 then
			Context = "shell error code:"..Ret .. "cmd:".. ShellCmd
		    os.execute("rm "..ShellOut)
		    return
		end
		Context = self:GetFileBySubRequest(ShellOutPath)
		os.execute("rm "..ShellOut)
		Results[FileName] = Context
	end
	ngx.say(Serialize(Results))
end

function GetFileBySubRequest(self, Path)
	local Res = ngx.location.capture(Path)
	if Res.status ~= ngx.HTTP_OK then
		return ""
	else
		return Res.body
	end
end

DoRequest()
