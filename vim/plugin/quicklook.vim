command Quicklook :call <SID>QuicklookStart()

function! s:QuicklookStart()
  ruby quicklook_run
endfunction

ruby << EOF
# view :: String -> Bool (with qlmanage)
def view(filename_like)
  filename = filename_like
  filename = File.expand_path(filename)
  unless FileTest.exists? filename
    VIM.message "#{filename} not found"
    return false
  end
  fork {
    pid = fork {
      STDERR.reopen(File.open('/dev/null', 'w'))
      exec ['qlmanage']*2, '-p', filename
    }
    sleep 2
    Process.kill(:TERM, pid)
  }
  true
end

def quicklook_run
  VIM::Buffer.current.line.gsub(/^\s+/, '').split(/\s+/).each do |filename_like|
    view(filename_like) ||
      view(File.dirname(VIM::Buffer.current.name) + filename_like)
  end
end
EOF
