-- Example can be find here too:
-- /usr/share/doc/lsyncd/examples
-- And a great resource is written here too with nicely written examples:
-- http://axkibe.github.io/lsyncd/manual/config/file/

-- For checking the lsyncd daemon is running, enter:
-- service --status-all | grep lsyncd


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

if homeDir == nill then
    homeDir="/home/gil_diy"
end


-- -- IMPORTANT note:
-- -- pay attention to the slashes in destDir otherwise it will fail
destDir=homeDir .. "/myGitRepositories/customized-workspace/Ubuntu"

-- making sure the destination folder .config exist,
-- otherwise it won't copy the files from the source
if FolderExists(destDir .."/.config") == true then
else
	print(".config folder is created since it's missing.")
    os.execute("mkdir -p ".. destDir .. "/.config/sublime-text-3/Packages/User")
end

settings {
   logfile    = "/tmp/lsyncd.log",
   statusFile = "/tmp/lsyncd.status",
   nodaemon   = false, -- Running as a daemon
}

-- 1) Backing-up all relevant precious dot files
--    Notice the 'filter' feature was added into the latest revision 2.2.3,
--    So you should build from source and not from debian package manager.
--    I'm using (Lua 5.2.4)
sync {
    default.rsync,
    source = homeDir,
    target = destDir,
    delay = 3,
    filter = {
        '+ /.tmux.conf',
        '+ /.zshrc',
        '+ /.vimrc',
        '- /**',
    },
    rsync = {
        binary = homeDir .. "/.config/lsyncd/handler.sh"
    }
}

-- 2) Backing-up all multi-tail configurations files
sync {
    default.direct,
    source  = homeDir .. "/.config/multitail",
    target  = destDir .. "/.config/multitail",
}

-- -- 3) Backing-up all existing project configuration files for tmuxinator
sync {
    default.direct,
    source  = homeDir .. "/.config/tmuxinator",
    target  = destDir .. "/.config/tmuxinator",
}

-- 4) Backing-up all existing project configuration files for terminator
sync {
    default.direct,
    source  = homeDir .. "/.config/terminator",
    target  = destDir .. "/.config/terminator",
}

-- -- 5) Backing-up lsyncd configurations
sync {
    default.direct,
    source  = homeDir .. "/.config/lsyncd",
    target  = destDir .. "/.config/lsyncd",
}

 -- 6) Backing-up sublime configurations + snippets
 --    (Preferences.sublime-settings and linters)
sync {
    default.direct,
    source  = homeDir .. "/.config/sublime-text-3/Packages/User",
    target  = destDir .. "/.config/sublime-text-3/Packages/User",
}


 -- 7) Backing-up my useful scripts
sync {
    default.direct,
    source  = homeDir .. "/my_useful_scripts",
    target  = destDir .. "/useful-scripts",
}

 -- 7) Backing-up my PyCharm snippets for different programming languages
sync {
    default.direct,
    source  = homeDir .. "/.config/PyCharmCE2018/config/templates",
    target  = destDir .. "/.config/PyCharmCE2018/config/templates",
}
