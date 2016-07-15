---------------------------------------------
--$Id: pay.lua 3697 2014-05-13 03:51:38Z zork $
---------------------------------------------
--[[
--	游戏充值模块
--]]

local RequestDir = "/logic/dat/pay/request/"

--支付充值接口，将充值相关数据写入对应服的文件中
function DoPay(self)
	local Args = GetPostArgs()
	local HostID = Args.HostID
	local OrderID = Args.OrderID
	local Flag = -1 --初始状态下交易状态为不成功
	if OrderID and OrderID ~= "" then
		--调用脚本直接将结果写入文件
		local BasePath = GetBasePath()
		local FilePath = BasePath .. "/../../" .. HostID .. RequestDir .. OrderID .. ".lua"
		local File = io.open(FilePath, "w")
		if File then
			local Content = {
				Uid = Args.Uid,
				Urs = Args.Urs,
				Name = Args.Name,
				Gold = Args.Gold,
				OrderID = OrderID,
				Time = Args.Time,
			}
			Content = Serialize(Content)
			File:write(Content)
			File:close()
			Flag = 0 --变更标志位
		end
	end
	ngx.say(Flag)
end

local FinishDir = "/logic/dat/pay/finish"
local PostUrl = GSERVICE_URL .. "/update_pay_status" --gservice接收地址
--轮询获取充值结果文件
function DoCronGetPayResult(self)
	if CronGetPayResultFlag then
		return
	end
	CronGetPayResultFlag = true
	--遍历根目录下面的所有game文件夹
	local BasePath = GetBasePath()
	local RootDir = BasePath .. "/../../"
	local Files = posix.dir(RootDir)
	table.sort(Files)
	for _, HostID in pairs(Files) do
		if HostID ~= '.' and HostID ~= '..' and HostID ~= "mcs" then
			local ResultDir = RootDir .. HostID .. FinishDir
			if posix.stat(ResultDir) then --文件夹存在，遍历下面的结果文件
				local FinishFiles = posix.dir(ResultDir)
				table.sort(FinishFiles)
				for _, FinishFile in pairs(FinishFiles) do 
					if FinishFile ~= '.' and FinishFile ~= '..' then
						--截取文件名作为OrderID
						local Strs = string.split(FinishFile, ".")
						if #Strs > 1 then
							local OrderID = Strs[1]
							local FilePath = ResultDir .. "/" .. FinishFile
							local File = io.open(FilePath, "r")
							local Result = File:read("*a")
							File:close()
							Result = string.strip(Result)
							Result = ngx.escape_uri(Result)
							--将OrderID和Result发送给gservice
							local Flag, Res = ReqOutUrl(PostUrl, {OrderID = OrderID, HostID = HostID, Status = Result})
							Res = tonumber(Res)
							if Res == 1 then
								--删除这个结果文件
								os.execute("rm " .. FilePath)
							end
						end
					end
				end
			end
		end
	end
	CronGetPayResultFlag = false

end

DoRequest()
