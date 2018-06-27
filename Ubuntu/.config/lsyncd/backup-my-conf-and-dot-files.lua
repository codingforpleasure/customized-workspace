-- Example can be find here too:
-- /usr/share/doc/lsyncd/examples
-- And a great resource is written here too with nicely written examples:
-- http://axkibe.github.io/lsyncd/manual/config/file/


-- Few remarks:
-- If target is a local directory, take care that it is an absolute pathname




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


homeDir=os.getenv("HOME")
destDir= "/dst-try/" -- IMPORTANT note: directory between SLASHES

-- making sure the destination folders exist, otherwise it won't copy the files from the source
if FolderExists(homeDir..destDir ..".config") == true then
else
	print(".config folder is created since it's missing.")
	os.execute("mkdir -p ".. homeDir .. destDir .. ".config")
end


print("Backing-up your files!")

settings {
   logfile    = "/tmp/lsyncd.log",
   statusFile = "/tmp/lsyncd.status",
   nodaemon   = false, -- Running as a daemon
}


-- 1) Backing-up all relevant precious dot files
sync {
    default.direct,
    source  = homeDir,
    target  = homeDir .. "/dst-try/",
    rsync = { _extra = { "--files-from=" .. homeDir .. "/.config/lsyncd/files.list" } }
}

-- 2) Backing-up all multi-tail configurations files
sync {
    default.direct,
    source  = homeDir .. "/.config/multitail/",
    target  = homeDir .. destDir .. ".config/multitail",
}

-- 3) Backing-up all existing project configuration files for tmuxinator
sync {
    default.direct,
    source  = homeDir .. "/.config/tmuxinator",
    target  = homeDir .. destDir .. ".config/tmuxinator",
}

-- 4) Backing-up all existing project configuration files for terminator
sync {
    default.direct,
    source  = homeDir .. "/.config/terminator",
    target  = homeDir .. destDir .. ".config/terminator",
}

-- 5) Backing-up sublime configurations
sync {
    default.direct,
    source  = homeDir .. "/.config/sublime-text-3/Packages/User",
    target  = homeDir .. destDir .. ".config/sublime-text-3/Packages/User",
}

-- 6) Backing-up lsyncd configurations
sync {
    default.direct,
    source  = homeDir .. "/.config/lsyncd",
    target  = homeDir .. destDir .. ".config/lsyncd",
}
