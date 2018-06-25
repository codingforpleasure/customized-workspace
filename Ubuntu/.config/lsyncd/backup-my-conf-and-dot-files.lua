-- First step: Install lsyncd
-- sudo apt install lsyncd
--
-- Example can be found here too:
-- /usr/share/doc/lsyncd/examples
-- and a great resource is written here too:
-- http://axkibe.github.io/lsyncd/manual/config/file/


settings {
   logfile    = "/tmp/lsyncd.log",
   statusFile = "/tmp/lsyncd.status",
   nodaemon   = true,
}

sync {
   default.rsyncssh,
   source = "/home/gil_diy/src-try",
   host = "gilSpeedyLaptop",
   targetdir = "/home/gil_diy/dst-try",
   delete = false,
   rsync = { _extra = { "--files-from=/home/gil_diy/.config/lsyncd/files.list" } }
}