" Vim-BloggerBeta Preamble"{{{
" Make sure the Vim was compiled with +python before loading the script...
if !has("python")
        finish
endif

" Only load this plugin if it's not already loaded.
if (exists('g:BloggerLoaded'))
    finish
endif
let g:BloggerLoaded = 1

if ((exists('g:Blog_Use_Markdown')) && g:Blog_Use_Markdown == 1)
    let g:Blog_Use_Markdown = 1
else
    let g:Blog_Use_Markdown = 0
endif
"}}}

" Setup Vim-BloggerBeta Custom Commands"{{{
:command! BlogPost :call BloggerPost()
:command! BlogDraft :call BloggerDraft()
:command! -nargs=? BlogIndex :call BloggerIndex("<args>")
:command! -nargs=? BlogQuery :call BloggerIndexLabel("<args>")
:command! -nargs=? BlogDelete :call BloggerDelete("<args>")
"}}}

" Setup Vim-BloggerBeta Custom Mappings"{{{
nmap <leader>bi :BlogIndex<CR>
nmap <leader>bd :BlogDelete<CR>
"}}}

" Vim Functions (These simply call their Python counterparts below)"{{{
function! BloggerDelete(args)
python << EOF
Delete()
EOF
endfunction

function! BloggerPost()
python << EOF
Post()
EOF
endfunction

function! BloggerDraft()
python << EOF
Post(True)
EOF
endfunction

function! BloggerEdit(args)
python << EOF
import vim
num = vim.eval('a:args')
EditPost(num)
EOF
endfunction

function! BloggerIndex(args)
python << EOF
import vim
num = vim.eval('a:args')
GetPosts(num)
EOF
endfunction

function! BloggerIndexLabel(args)
python << EOF
import vim
labels = vim.eval('a:args').split(",")
GetPostsByLabel(labels)
EOF
endfunction

function! TestPost()
python << EOF
import vim
TestPost()
EOF
endfunction

function! TestEdit()
python << EOF
import vim
TestEdit()
EOF
endfunction
"}}}

" Python Preamble {{{
python << EOF
import httplib2, re, urlparse
import xml.dom.minidom as minidom
import vim, sys

BLOGGER_POSTS = []
#BLOGID = vim.eval("g:Blog_ID")

vim.command("let path = expand('<sfile>:p:h')")
PYPATH = vim.eval('path')
sys.path += [r'%s' % PYPATH]
import html2text
import markdown
#}}}

def GetPostsByLabel(labels):  #{{{
    global BLOGGER_POSTS
    global BLOGID

    try:
        blogURI = vim.eval("g:Blog_URI")
    except vim.error:
        print "Error: g:Blog_URI variable not set."
        return

    #BLOGID = _getBlogID(blogURI)
    BLOGID = vim.eval("g:Blog_ID")

    h = httplib2.Http()

    if not len(labels):
        print "Specify labels to query..."

    BLOGGER_POSTS = []


    labellist = ''
    for label in labels:
        labellist += "/%s" % label.strip()

    uri = 'http://beta.blogger.com/feeds/%s/posts/default/-%s' % (BLOGID, labellist)

    print "Retrieving posts..."
    auth = authenticate(h)
    if auth:
        headers = {'Content-Type': 'application/atom+xml', 'Authorization': 'GoogleLogin auth=%s' % auth.strip()}
        response, content = h.request(uri, "GET", headers=headers)
    else:
        response, content = h.request(uri, "GET")
    if response['status'] == '200':
         postsFromXML(content)
    else:
        print "Error getting post feed."

    num = 5
    if int(num) > len(BLOGGER_POSTS)-1:
        num = len(BLOGGER_POSTS)
    for i in range(int(num)):
        if BLOGGER_POSTS[i]['draft']:
            print str(i+1) + ': **DRAFT** ', BLOGGER_POSTS[i]['title'].encode('UTF-8')
        else:
            print str(i+1) + ':', BLOGGER_POSTS[i]['title'].encode('UTF-8')
    vim.command('let choice = input("Enter number or ENTER: ")')
    pychoice = vim.eval('choice')
    if pychoice.isdigit():
        EditPost(pychoice)
# }}}

def GetPosts(num=5):  #{{{
    global BLOGGER_POSTS
    global BLOGID

    try:
        blogURI = vim.eval("g:Blog_URI")
    except vim.error:
        print "Error: g:Blog_URI variable not set."
        return

    #BLOGID = _getBlogID(blogURI)
    BLOGID = vim.eval("g:Blog_ID")

    h = httplib2.Http()

    BLOGGER_POSTS = []


    uri = 'http://www.blogger.com/feeds/%s/posts/full' % BLOGID

    print "Retrieving posts..."
    auth = authenticate(h)
    if auth:
        headers = {'Content-Type': 'application/atom+xml', 'Authorization': 'GoogleLogin auth=%s' % auth.strip()}
        response, content = h.request(uri, "GET", headers=headers)
    else:
        response, content = h.request(uri, "GET")
    if response['status'] == '200':
         postsFromXML(content)
    else:
        print "Error getting post feed."

    if not len(BLOGGER_POSTS):
        print "You have no blog posts to index."
        return

    if num:
        if int(num) > len(BLOGGER_POSTS):
            num = len(BLOGGER_POSTS)
        elif int(num) < 1:
            print "Invalid post number."
            return
    else:
        num = 5
    for i in range(num):
        if BLOGGER_POSTS[i]['draft']:
            print str(i+1) + ':', BLOGGER_POSTS[i]['title'].encode('UTF-8') + '        **DRAFT**'
        else:
            print str(i+1) + ':', BLOGGER_POSTS[i]['title'].encode('UTF-8')
    vim.command('let choice = input("Enter number or ENTER: ")')
    pychoice = vim.eval('choice')
    if pychoice.isdigit():
        EditPost(pychoice)
# }}}

def EditPost(num): # 
    global BLOGGER_POSTS
    global ACTIVE_POST

    if int(num) > len(BLOGGER_POSTS):
        print "Invalid post number."
        return

    # Don't overwrite any currently open buffer.. TODO:What's the best way?
    tmp_blog_file = vim.eval("tempname() . '.blogger'")
    if vim.current.buffer.name: # Does this buffer have a name? 
        if not vim.current.buffer.name.endswith(".blogger"):
            vim.command('e! %s' % tmp_blog_file)
    else: # buffer has no name, just open the tmp one for now...
        vim.command('e! %s' % tmp_blog_file)

    postnum = int(num) - 1
    vim.command('set foldmethod=marker')
    vim.command('set nomodified')
    vim.current.buffer[:] = []
    vim.current.buffer[0] = '@@EDIT%s@@' % postnum
    title = BLOGGER_POSTS[postnum]['title']
    vim.current.buffer.append(str(title.encode('UTF-8')))
    vim.current.buffer.append('')
    if not (vim.eval("g:Blog_Use_Markdown") == '0'):
        use_markdown = True
    else:
        use_markdown = False
    if use_markdown:
        content = html2text.html2text(BLOGGER_POSTS[postnum]['content'])
    else:
        content = BLOGGER_POSTS[postnum]['content']
    for line in str(content.encode('UTF-8')).split('\n'):
        vim.current.buffer.append(line)
    cat_str = '@@LABELS@@ ' + ', '.join(BLOGGER_POSTS[postnum]['categories'])
    vim.current.buffer.append(str(cat_str))
    ACTIVE_POST = postnum

    vim.command('set nomodified')
# 
        
def Post(draft=False):  # {{{
    import vim

    global BLOGGER_POSTS
    global BLOGID

    h = httplib2.Http()

    try:
        blogURI = vim.eval("g:Blog_URI")
    except vim.error:
        print "Error: g:Blog_URI variable not set."
        return

    #BLOGID = _getBlogID(blogURI)
    BLOGID = vim.eval("g:Blog_ID")
    uri = 'http://www.blogger.com/feeds/%s/posts/full' % BLOGID

    categories = []
    has_labels = False
    numlines = len(vim.current.buffer)
    match = re.search('^@@LABELS@@ (.*)', vim.current.buffer[numlines-1])
    if match:
        categories = match.group(1).split(',')
        has_labels = True

    postnum = None
    match = re.search('^@@EDIT(\d*)@@$', vim.current.buffer[0])
    if not (vim.eval("g:Blog_Use_Markdown") == '0'):
        use_markdown = True
    else:
        use_markdown = False
    if match:
        postnum = int(match.group(1))
        subject = vim.current.buffer[1]
        if has_labels:
            if use_markdown:
                body = markdown.markdown('\n'.join(vim.current.buffer[3:-1]))
            else:
                body = '\n'.join(vim.current.buffer[3:-1])
        else:
            if use_markdown:
                body = markdown.markdown('\n'.join(vim.current.buffer[3:]))
            else:
                body = '\n'.join(vim.current.buffer[3:])
    else:
        subject = vim.current.buffer[0]
        if has_labels:
            if use_markdown:
                body = markdown.markdown('\n'.join(vim.current.buffer[2:-1]))
            else:
                body = '\n'.join(vim.current.buffer[2:-1])
        else:
            if use_markdown:
                body = markdown.markdown('\n'.join(vim.current.buffer[2:]))
            else:
                body = '\n'.join(vim.current.buffer[2:])

    if not postnum == None:
        # it's an update
        post = BLOGGER_POSTS[postnum]
        post['title'] = subject
        post['content'] = body
    else:
        post = {}
        post['title'] = subject
        post['content'] = body

    post['categories'] = categories
    if draft:
        entry = draftToXML(post)
    else:
        entry = postToXML(post)

    if not postnum == None:
        updatePost(post['edit_url'], entry)
        return

    auth = authenticate(h)
    if auth:
        headers = {'Content-Type': 'application/atom+xml', 'Authorization': 'GoogleLogin auth=%s' % auth.strip()}
        response, content = h.request(uri, 'POST', body=entry, headers=headers)

        # follow redirects
        while response['status'] == '302':
            response, content = h.request(response['location'], 'POST', body=entry, headers=headers)

        if response['status'] == '201':
            post = postsFromXML(content, True)
            vim.current.buffer[0:0] = [ '@@EDIT%s@@' % post ]
            print "Post successful!"
        else:
            print "Post failed: %s %s" % (response['status'], content)
    else:
        print "Authorization failed."
# }}}

def Delete(): # {{{
    h = httplib2.Http()
    global BLOGGER_POSTS

    postnum = None
    match = re.search('^@@EDIT(\d*)@@$', vim.current.buffer[0])
    if match:
        postnum = int(match.group(1))
    else:
        print "You must run :BlogIndex to get a new list first."

    if not postnum == None:
        post = BLOGGER_POSTS[postnum]
        vim.command('let choice = input("Delete `%s`?: ")' % post['title'])
        pychoice = vim.eval('choice')
        if not pychoice.lower() == 'yes':
            return
        auth = authenticate(h)
        if auth:
            headers = {'Content-Type': 'application/atom+xml', 'Authorization': 'GoogleLogin auth=%s' % auth.strip()}
            response, content = h.request(post['edit_url'], 'DELETE', headers=headers)

            # follow redirects
            while response['status'] == '302':
                response, content = h.request(response['location'], 'DELETE', headers=headers)

            if response['status'] == '200':
                print "Entry successfully deleted."
            else:
                print "Deletion failed: %s %s" % (response['status'], content)
        else:
            print "Authorization failed."
# }}}

def updatePost(uri, post): # {{{
    h = httplib2.Http()

    auth = authenticate(h)
    if auth:
        headers = {'Content-Type': 'application/atom+xml', 'Authorization': 'GoogleLogin auth=%s' % auth.strip()}
        response, content = h.request(uri, 'PUT', body=post, headers=headers)

        # follow redirects
        while response['status'] == '302':
            response, content = h.request(response['location'], 'PUT', body=post, headers=headers)

        if response['status'] == '200':
            print "Entry successfully updated."
        else:
            print "Update failed: %s %s" % (response['status'], content)
    else:
        print "Authorization failed."
# }}}

def authenticate(h):   #{{{
    global GOOGLE_AUTH

    try:
        account = vim.eval("g:Gmail_Account")
    except vim.error:
        print "Error: g:Gmail_Account variable not set."
        return

    try:
        password = vim.eval("g:Gmail_Password")
    except vim.error:
        print "Error: g:Gmail_Password variable not set."
        return

    auth_uri = 'https://www.google.com/accounts/ClientLogin'
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    myrequest = "Email=%s&Passwd=%s&service=blogger&service=dcraven-Vim-Blogger-0.1" % (account, password)
    response, content = h.request(auth_uri, 'POST', body=myrequest, headers=headers)
    if response['status'] == '200':
        GOOGLE_AUTH = re.search('Auth=(\S*)', content).group(1)
        return GOOGLE_AUTH
    else:
        return None
#}}}

def draftToXML(post, post_is_new=True):  #{{{
    if post_is_new:
        entry = """<?xml version="1.0"?>
            <entry xmlns="http://www.w3.org/2005/Atom">
            <app:control xmlns:app='http://purl.org/atom/app#'>
                <app:draft>yes</app:draft>
            </app:control>
              <title type="text">%s</title>
              <content type="xhtml">%s</content>
              %s
            </entry>""" % (post['title'], post['content'], getCategoriesXML(post))
    else:
        entry = """<?xml version="1.0"?>
            <entry xmlns="http://www.w3.org/2005/Atom">
            <app:control xmlns:app='http://purl.org/atom/app#'>
                <app:draft>yes</app:draft>
            </app:control>
              <id>%s</id>
              <link rel='edit' href='%s'/>
              <updated>%s</updated>
              <title type="text">%s</title>
              <content type="xhtml">%s</content>
              %s
            </entry>""" % (post['id'], post['edit_url'], post['updated'], post['title'], post['content'], getCategoriesXML(post))

    return entry
#}}}

def postToXML(post, post_is_new=True):  #{{{
    if post_is_new:
        entry = """<?xml version="1.0"?>
            <entry xmlns="http://www.w3.org/2005/Atom">
              <title type="text">%s</title>
              <content type="xhtml">%s</content>
              %s
            </entry>""" % (post['title'], post['content'], getCategoriesXML(post))
    else:
        entry = """<?xml version="1.0"?>
            <entry xmlns="http://www.w3.org/2005/Atom">
              <id>%s</id>
              <link rel='edit' href='%s'/>
              <updated>%s</updated>
              <title type="text">%s</title>
              <content type="xhtml">%s</content>
              %s
            </entry>""" % (post['id'], post['edit_url'], post['updated'], post['title'], post['content'], getCategoriesXML(post))

    return entry
#}}}

def getCategoriesXML(post):  #{{{
    cat_str = ''
    for category in post['categories']:
        if not category.strip() == '':
            cat_str = cat_str + '<category scheme="http://www.blogger.com/atom/ns#" term="%s"/>' % category
    return cat_str
#}}}

def postsFromXML(content, new=False):#{{{
    global BLOGGER_POSTS

    doc = minidom.parseString(content)
    for entryNode in doc.getElementsByTagName('entry'):
        post = {}
        for node in entryNode.getElementsByTagName('link'):
            post[node.getAttribute('rel')+"_url"] = node.getAttribute('href')
        titleNode = entryNode.getElementsByTagName('title')[0]
        post['title'] = _getTextDataFromNode(titleNode)
        contentNode = entryNode.getElementsByTagName('content')[0]
        post['content'] = _getTextDataFromNode(contentNode)
        idNode = entryNode.getElementsByTagName('id')[0]
        post['id'] = _getTextDataFromNode(idNode)
        updatedNode = entryNode.getElementsByTagName('updated')[0]
        post['updated'] = _getTextDataFromNode(updatedNode)
        categoryNodes = entryNode.getElementsByTagName('category')
        categories = []
        for node in categoryNodes:
            label = node.getAttribute('term').strip()
            if not label == '':
                categories.append(label)
        post['categories'] = categories
        if entryNode.getElementsByTagName('app:draft'):
            post['draft'] = True
        else:
            post['draft'] = False
        if new:
            BLOGGER_POSTS.insert(0, post)
            return 0
        else:
            BLOGGER_POSTS.append(post)
#}}}

def _getTextDataFromNode(node):  # {{{
    for n in node.childNodes:
        if n.nodeType == minidom.Node.TEXT_NODE:
            return n.data
    return None
#}}}

def _getBlogID(uri):#{{{
    """Attempt to retrieve the blogID from the given URI"""
    global BLOGID

    if BLOGID:
        return BLOGID
    else:
        con = httplib2.Http()
        response, content = con.request(uri, 'GET')
        match = re.search('blogID=(\d*)', content)
        if match:
            return match.group(1)
        else:
            return None
#}}}

EOF
