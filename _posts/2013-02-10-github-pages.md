---
    published: true
    layout: html.default.post
    title: Github Pages
    categories: [blog]
    tags: [service, github, github pages, blog, markdown, maruku, jekyll, yaml]
---

[GitHub]: http://github.com "GitHub"

##Intro
Любой репозиторий в [GitHub][] 
##Github pages as blog engine
##Jekyll site engine

* [Jekyll: basic site structure](https://github.com/mojombo/jekyll/wiki/usage)

###yaml

* https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter

##Markdown posts

*   [Markdown](http://daringfireball.net/projects/markdown/syntax "Markdown syntax")
*   [GFM](http://github.github.com/github-flavored-markdown/ "GitHub Flavored Markdown")
*   [Maruku](http://maruku.rubyforge.org/maruku.html "Maruku - интерпретатор markdown-разметки")
*   [Maruku/Basik Markdown](http://maruku.rubyforge.org/markdown_syntax.html "Basic Markdown syntax")

###On/Off markdown for HTML-elements
`markdown="0|1"`

###Syntax highlighting

####Js highlighters
*   [SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/)
*   [google-code-prettify](http://google-code-prettify.googlecode.com/svn/trunk/styles/index.html)
*   [Highlight.js](http://softwaremaniacs.org/soft/highlight/)

**_config.yml**:
```
pygments: false
markdown: redcarpet
````

####Pygments

[Pygments](http://pygments.org/)

**_config.yml**:
```
pygments: true
```

####Liquid
https://github.com/Shopify/liquid/wiki/Liquid-for-Designers
https://github.com/mojombo/jekyll/wiki/Liquid-Extensions

####GFM

**_config.yml**:
```
pygments: false
markdown: redcarpet
```

#### Use GitHub Gist
<script src="http://gist.github.com/118964.js"></script>


### Comments
    http://disqus.com

### CDN
    http://cdnjs.com/
    http://www.bootstrapcdn.com
