command Lang8 :call <SID>Lang8Start()

function! s:Lang8Start()
  set nonu
  ruby lang8_run
endfunction

ruby << EOF
class Lang8
  def initialize(email, password)
    require 'kconv'
    require 'rubygems'
    require 'mechanize'

    @email, @password = email, password
    @agent = WWW::Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
  end

  def login
    page = @agent.get 'http://lang-8.com/'
    form = page.forms[0]
    form.username = @email
    form.password = @password
    @agent.submit form
  end

  def post(title, body)
    page = @agent.get "http://lang-8.com/?a=page_h_diary_add"
    form = page.forms.find {|f| f.method == 'POST' }
    form.lang_option = '2-2' # Language: English
    form.subject = title
    form.body = body
    form.radiobuttons.value('5').check # Show with all Internet Users
    page = @agent.submit form
    page = @agent.submit page.forms.find {|f| f.method == 'POST' }
  end

  def get_latest
    page = @agent.get 'http://lang-8.com/?m=pc&a=page_fh_diary_list&l=en'
    title = (page/'.heading').first.innerText
    [title, "http://lang-8.com/" << page.links[41].uri.to_s.toutf8[2..-1]]
  end
end

def lang8_run
  return if VIM.evaluate('confirm("really?")') == 0

  endline = VIM.evaluate %[line("$")]
  title   = VIM.evaluate %[getline(1)]
  body    = VIM.evaluate %[join(getline(2, #{endline}), "\n")]

  #l = Lang8.new 'ujihisa+hehehe@gmail.com', 'sxVtNYTB'
  l = Lang8.new 'ujihisa@gmail.com', 'sxVtNYTB'
  l.login
  l.post title.toutf8, body.toutf8
  l.get_latest.reverse.each do |line|
    VIM.evaluate %[append(#{endline}, \"#{line.chomp}\")]
  end
end
EOF
