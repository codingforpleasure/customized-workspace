

function FolderExists(strFolderName)
	local fileHandle, strError = io.open(strFolderName,"r")
	if fileHandle ~= nil then
		io.close(fileHandle)
		return true
	else
		print(strError)
		if string.match(strError,"No such file or directory") then
			return false
		else
			return true
		end
	end
end


settings {
   logfile    = "/tmp/lsyncd_backup_to_thumbdrive.log",
   statusFile = "/tmp/lsyncd_backup_to_thumbdrive.status",
   nodaemon   = true, -- Running as a daemon
}

homeDir = os.getenv("HOME")
username = os.getenv("USER")
thumbDriveName = "KINGSTON"
targetFolder = "/media/" .. username .."/" .. thumbDriveName


if FolderExists(targetFolder) == false then
else
	print("Thumbdrive " .. thumbDriveName .. "is not plugged in, can't backup your data.")
	os.exit()
end



-- Backing-up all android-projects
sync {
    default.direct,
    source = homeDir .. "/AndroidStudioProjects",
    target = targetFolder,
}
