-- Example can be find here too:
-- /usr/share/doc/lsyncd/examples
-- And a great resource is written here too with nicely written examples:
-- http://axkibe.github.io/lsyncd/manual/config/file/

-- For checking the lsyncd daemon is running, enter:
-- service --status-all | grep lsyncd


-- Few remarks:
-- If target is a local directory, take care that it is an absolute pathname

settings {
   logfile    = "/tmp/lsyncd.log",
   statusFile = "/tmp/lsyncd.status",
   nodaemon   = false, -- Running as a daemon
}

-- sync {
--     default.direct,
--     source  = "/home/gil_diy/src-try",
--     target  = "/home/gil_diy/dst-try",
--     --rsync = { _extra = { "--include=a.txt", "--exclude=*" } ,
--     rsync = { _extra = {
--                           "--include=.zshrc",
--                           "--include=.tmux.conf",
--                           "--include=.vimrc",
-- 					      "--exclude=.*",
-- 					      "--exclude=*",
-- 	                    }
--             }
-- }
-- .zshrc
-- .tmux.conf
-- .vimrc

-- local formats = { ".zshrc" = true, ".tmux.conf" = true, "png" = true }

local formats = { [".zshrc"] = true, [".tmux.conf"] = true, [".vimrc"] = true }

gilop = {
	delay = 10,
	maxProcesses = 10,

	action = function(inlet)
		local event = inlet.getEvent()

		if event.isdir then
			-- ignores events on dirs
			inlet.discardEvent(event)
			return
		end

		-- extract extension and basefilename
		local p    = event.pathname
		local destDir = "/home/gil_diy/dst-try"
		local ext  = string.match(p, ".*%.([^.]+)$")
		local base = string.match(p, "(.*)%.[^.]+$")
		local cmd = ""
		local homeDir = "/home/gil_diy"

		-- autoconvert on create and modify
		if event.etype == "Create" or event.etype == "Modify" then

			if not formats[p] then
				-- an unknown extenion
				log("Normal", "not doing something on ."..p)
				inlet.discardEvent(event)
				return
			end

			-- log("Normal", "Gilco p: "..p)
			-- log("Normal", "Gilco ext: "..ext)
			-- log("Normal", "Gilco base: "..base)
			cmd = "cp " .. homeDir .. "/" .. p .. " " .. destDir
			log("Normal", "Gilco cmd: "..cmd)
			spawnShell(event, cmd)
			inlet.discardEvent(event)
			return
		end

		-- ignores other events.

	end,

}

sync{gilop, source="/home/gil_diy/src-try"} --, recursive=false
