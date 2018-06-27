-- Example can be find here too:
-- /usr/share/doc/lsyncd/examples
-- And a great resource is written here too with nicely written examples:
-- http://axkibe.github.io/lsyncd/manual/config/file/


-- Few remarks:
-- If target is a local directory, take care that it is an absolute pathname
-- make sure the destination folders exist, otherwise it won't copy the files from the source

print("Backing-up your files!")

settings {
   logfile    = "/tmp/lsyncd.log",
   statusFile = "/tmp/lsyncd.status",
   nodaemon   = false, -- Running as a daemon
}


-- 1) Backing-up all relevant precious dot files
sync {
    default.direct,
    source  = "/home/gil_diy/",
    target  = "/home/gil_diy/dst-try",
    rsync = { _extra = { "--files-from=/home/gil_diy/.config/lsyncd/files.list" } }
}

-- 2) Backing-up all multi-tail configurations files
sync {
    default.direct,
    source  = "/home/gil_diy/.config/multitail/",
    target  = "/home/gil_diy/dst-try/.config/multitail",
}

-- 3) Backing-up all existing project configuration files for tmuxinator
sync {
    default.direct,
    source  = "/home/gil_diy/.config/tmuxinator",
    target  = "/home/gil_diy/dst-try/.config/tmuxinator",
}

-- 4) Backing-up all existing project configuration files for terminator
sync {
    default.direct,
    source  = "/home/gil_diy/.config/terminator",
    target  = "/home/gil_diy/dst-try/.config/terminator",
}

-- 5) Backing-up sublime configurations
sync {
    default.direct,
    source  = "/home/gil_diy/.config/sublime-text-3/Packages/User",
    target  = "/home/gil_diy/dst-try/.config/sublime-text-3/Packages/User",
}

-- 6) Backing-up sublime configurations
sync {
    default.direct,
    source  = "/home/gil_diy/.config/sublime-text-3/Packages/User",
    target  = "/home/gil_diy/dst-try/.config/sublime-text-3/Packages/User",
}


-- 7) Backing-up lsyncd configurations
sync {
    default.direct,
    source  = "/home/gil_diy/.config/lsyncd",
    target  = "/home/gil_diy/dst-try/.config/lsyncd",
}
