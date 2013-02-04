---

published: true

layout: post

title: Github pages as blog engine

categories: [services]

tags: [service, github, github pages, blog, markdown, maruku, jekyll, yaml]

---

#Intro
#Github pages as blog engine
#jekyll templates
#yaml
#Markdown posts

[Markdown]: http://daringfireball.net/projects/markdown/syntax
            "Markdown syntax"
[GFM]: http://github.github.com/github-flavored-markdown/
       "GitHub Flavored Markdown"
[Maruku]: http://maruku.rubyforge.org/maruku.html
          "Maruku - интерпретатор markdown-разметки"

##On/Off markdown for HTML-elements
`markdown="0|1"`

##Syntax highlighting

###Js
http://alexgorbatchev.com/SyntaxHighlighter/
http://google-code-prettify.googlecode.com/svn/trunk/styles/index.html
http://softwaremaniacs.org/soft/highlight/

**_config.yml**:
```
pygments: false
markdown: redcarpet


###Pygments

**_config.yml**:
```
pygments: true
```

###GFM

**_config.yml**:
```
pygments: false
markdown: redcarpet
```




## Comments
    http://disqus.com