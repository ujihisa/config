def rm(f)
  @runtime ||= Time.now.to_i
  return if !File.exist?(f)
  mv f, "#{ENV['HOME']}/.Trash/#{File.basename(f)}_#{@runtime}"
end

desc 'initialize task'
task :initialize => [:symlink_dir, :symlink_file, :erb]

task :symlink_dir do
  %w[vim/ftplugin vim/after].each do |src|
    dest = "~/.vim/#{src[/[^\/]+$/]}"
    src, dest = File.expand_path(src), File.expand_path(dest)
    rm dest
    ln_s src, dest
  end
end

task :symlink_file do
  FileList['_*'].each do |src|
    next if /\.erb$/ =~ src
    dest = "#{ENV['HOME']}/.#{src[1..-1]}"
    src, dest = File.expand_path(src), File.expand_path(dest)
    # src: _vimrc, dest: ~/.vimrc
    rm dest
    ln_s src, dest
  end
end

desc 'erb'
task :erb do
  FileList['_*.erb'].each do |src|
    dest = File.expand_path('~') + "/.#{src.match(/^_(.*?)\.erb$/)[1]}"
    rm dest
    sh "erb -r ./secret.rb #{src} > #{dest}"
  end
end
