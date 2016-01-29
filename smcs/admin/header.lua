-------------------------------------
--$Id: header.lua 3691 2014-05-13 03:37:42Z zork $
-------------------------------------
--[[
--header info
--]]

function ReqHeader(self)
	Viewer:View("template/header.html")
end

DoRequest()
