-------------------------------------
--$Id: header.lua 3697 2014-05-13 03:51:38Z zork $
-------------------------------------
--[[
--header info
--]]

function ReqHeader(self)
	Viewer:View("template/header.html")
end

DoRequest()
