----------------------------------
--$Id: execute.lua 65473 2015-05-18 02:30:32Z xiongyunkun $
----------------------------------
--[[
-- Execute a shell and return the shell result
--
--]]

local GAME_DIR = "/home/wgame/"

function DoShell(self)
	local Args = GetPostArgs()
	local ShellName = Args.shellname
	local ShellParam = Args.shellparam or ""
	if not ShellName then
		ngx.say("must have shellname")
		return
	end
	local BasePath = GetBasePath()
	local ShellOut = string.format("%s/shell/%s_%d_%d",BasePath,ShellName,os.time(),math.random(100,999))
	local ShellFullName = BasePath.."/shell/"..ShellName
	local BufferOutput = "stdbuf -oL -eL "
	local Ret = os.execute(BufferOutput..ShellFullName.." "..ShellParam.." > "..ShellOut)
	if not Ret or Ret > 0 then
		ngx.say("shell error code:"..Ret)
		os.execute("rm "..ShellOut)
		return
	end
	local fl = io.open(ShellOut,"r")
	if not fl then
		ngx.say("get shell result error")
		os.execute("rm "..ShellOut)
		return
	end
	local Context = fl:read("*a")
	fl:close()
	ngx.say("OK")
	ngx.say(Context)
	os.execute("rm "..ShellOut)
end

--执行GM指令
function DoGMShell(self)
	local Args = GetPostArgs()
	local ShellName = Args.shellname
	local ShellParam = Args.shellparam or ""
    local IsPend = Args.IsPend or "" --是否挂起等待结果，默认不用挂起
    local ParamMap = string.split(ShellParam, ";")
    local NewShellParam = table.concat(ParamMap, " ")
    if not ShellName then
        ngx.say("must have shellname")
        return
    end
    local BasePath = GetBasePath()
    local ShellOut = string.format("%s/shell/%s_%d_%d",BasePath,ShellName,os.time(),math.random(100,999))
    local ShellFullName = BasePath.."/shell/"..ShellName
   --ngx.say(ShellFullName.." "..NewShellParam.." > "..ShellOut)
    local Ret = os.execute(ShellFullName.." "..NewShellParam.." > "..ShellOut)
    if not Ret or Ret > 0 then
        ngx.say("shell error code:"..Ret)
        os.execute("rm "..ShellOut)
        return
    end
    local fl = io.open(ShellOut,"r")
    if not fl then
        ngx.say("get shell result error")
        os.execute("rm "..ShellOut)
		return
    end
    local Context = fl:read("*a")
    fl:close()
    os.execute("rm "..ShellOut)
    if IsPend == "" then
        ngx.say("OK")
        ngx.say(Context)
    else
        --挂起等待
        local Result = ""
        local N = 2 -- 初始等待2秒
        while(true) do
            os.execute("sleep " .. N)
            Result = GetGMResult(ParamMap[1], ParamMap[5], ParamMap[2])
            if Result or N >= 3 then --如果有结果或者等待时间超过3秒后则退出
                break
            end
            N = N + 1
        end
        ngx.say(Serialize(Result))
    end
end

-- 获得GM指令执行结果
function GetGMResult(HostID, TransID, GsID)
	if tonumber(GsID) == -1 then
		GsID = 0 --只从0进程拿数据
	end
	local TimeStamp = string.sub(TransID, 1, 10) --获得时间戳
	local Date = os.date("%Y%m%d",tonumber(TimeStamp))
	local FilePath = GAME_DIR .. HostID .. "/logic/dat/shellcmddata/done" .. Date .. "_" .. GsID .. ".lua"
	local fl = io.open(FilePath,"r+")
	if not fl then --还没有结果，直接返回
		ngx.say(FilePath .. "file not exist")
		return 
	end
	local Context = fl:read("*a")
	fl:close()
	Context = loadstring("return {" .. Context .."}")()
	for Key, Value in pairs(Context) do
		--这里因为Key里面的字符串有时候不能正常解析，所以采用字符串匹配的方式，只要有TransID='TransID'就认为有值
		local TransContent = "TransID='" .. TransID .. "'"
		if string.find(Key, TransContent) then 
			--获取执行结果
			return Value
		end
	end
	return 
end

DoRequest()
