def rm(f)
  @runtime ||= Time.now.to_i
  return if !File.exist?(f)
  mv f, "#{ENV['HOME']}/.Trash/#{File.basename(f)}_#{@runtime}"
end

desc 'initialize task'
task :initialize => [:symlink, :erb]

task :symlink do
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
