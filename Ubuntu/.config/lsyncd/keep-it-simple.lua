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

-- 1) Backing-up all relevant precious dot files
--    Notice the 'filter' feature was added into the latest revision 2.2.3,
--    So you should build from source and not from debian package manager.
--    I'm using (Lua 5.2.4)
sync {
    default.rsync,
    source = "/home/gil_diy/playground_for_lsyncd/src-try",
    target = "/home/gil_diy/playground_for_lsyncd/dst-try",
    delay = 3,
    filter = {
        '+ /.tmux.conf',
        '+ /.zshrc',
        '+ /.vimrc',
        '- /**',
    },
    rsync = {
        binary = "/home/gil_diy/playground_for_lsyncd/handler.sh"
    }
}
