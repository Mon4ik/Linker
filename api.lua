local api = {}
-- {path = "rom", icon = nil}
function api.Create(linkName, filePath, iconPath) --return table{bool Error, string InvalidArgument}
	if     type(linkName) ~= "string" then
		local err = {true, "linkName"}
	elseif type(filePath) ~= "string" then
		local err = {true, "filePath"}
	else
		local err = {false}
		if iconPath == nil then
			iconPath = "nil"
		end
		local lnk = fs.open(linkName, "w")
		lnk.write("{path = \"".. filePath .."\", icon = "..iconPath.."}")
		lnk.close()	
		local err = {false}
	end
	return err
end
function api.openLnk(lnkFile)
	if type(lnkFile) ~= "string" then
		local err = {true, "linkName"}
	else
		local err = {false}
		local file = fs.open(lnkFile, "r")
		local data = file.readAll()
		file.close()
		local dataa = assert(loadstring("return "..data))()
		if fs.isDir(dataa.path) then
			shell.setDir(dataa.path)
		else
			shell.run(dataa.path)
		end
	end
	return err
end
function api.getIconPath(lnkFile)
	if type(lnkFile) ~= "string" then
		local err = {true, "linkName"}
	else
		local err = {false}
		local file = fs.open(lnkFile, "r")
		local data = file.readAll()
		file.close()
		local data = assert(loadstring("return "..data))()
		return data.icon
	end
	return err
end
function api.getPath(lnkFile)
	if type(lnkFile) ~= "string" then
		local err = {true, "linkName"}
	else
		local err = {false}
		local file = fs.open(lnkFile, "r")
		local data = file.readAll()
		file.close()
		local data = assert(loadstring("return "..data))()
		return data.path
	end
	return err
end
return api