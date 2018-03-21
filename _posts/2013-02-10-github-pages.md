---
    published: true
    layout: html.default.post
    title: Github Pages
    categories: [blog]
    tags: [service, github, github pages, blog, markdown, maruku, jekyll, yaml]
---

[GitHub]: http://github.com "GitHub"

## Intro
*   [GitHub Pages - Websites for you and your projects](https://pages.github.com/)
*   [GitHub Pages Basics](https://help.github.com/categories/github-pages-basics/)
*   [Customizing GitHub Pages](https://help.github.com/categories/customizing-github-pages/)

## Presentations
*   [Shower Presentation Engine](https://shwr.me/)
    [![GitHub stars](https://img.shields.io/github/stars/shower/shower.svg)](https://github.com/shower/shower)
    [![npm](https://img.shields.io/npm/v/shower.svg) ![npm](https://img.shields.io/npm/dm/shower.svg)](https://www.npmjs.com/package/shower)  
    Remote control for Shower
    [![GitHub stars](https://img.shields.io/github/stars/lahmatiy/shower-remote-control.svg)](https://github.com/lahmatiy/shower-remote-control)
    [![npm](https://img.shields.io/npm/v/shower-remote-control.svg) ![npm](https://img.shields.io/npm/dm/shower-remote-control.svg)](https://www.npmjs.com/package/shower-remote-control)


## Github pages as blog engine

## Jekyll

*   [Jekyll: basic site structure](https://github.com/mojombo/jekyll/wiki/usage)
*   [Продвинутый Jekyll](https://habrahabr.ru/post/336266/)

### yaml

* <https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter>

## Markdown posts

*   [Markdown](http://daringfireball.net/projects/markdown/syntax "Markdown syntax")
*   [GFM](http://github.github.com/github-flavored-markdown/ "GitHub Flavored Markdown")
*   [Maruku](http://maruku.rubyforge.org/maruku.html "Maruku - интерпретатор markdown-разметки")
*   [Maruku/Basik Markdown](http://maruku.rubyforge.org/markdown_syntax.html "Basic Markdown syntax")
*   [kramdown Syntax](http://kramdown.gettalong.org/syntax.html)  
    — Особенности синтаксиса kramdown:
    [часть 1(http://prgssr.ru/articles/osobennosti-sintaksisa-kramdown-chast-1.html)
    [часть 2](http://prgssr.ru/articles/osobennosti-sintaksisa-kramdown-chast-2.html)  
    — [Дополнительные возможности kramdown](http://prgssr.ru/articles/dopolnitelnye-vozmozhnosti-kramdown.html)  

### On/Off markdown for HTML-elements
`markdown="0|1"`

### Syntax highlighting

#### Js highlighters
*   [SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/)
*   [google-code-prettify](http://google-code-prettify.googlecode.com/svn/trunk/styles/index.html)
*   [Highlight.js](http://softwaremaniacs.org/soft/highlight/)

**_config.yml**:
```
pygments: false
markdown: redcarpet
````

#### Pygments

[Pygments](http://pygments.org/)

**_config.yml**:
```
pygments: true
```

#### Liquid
https://github.com/Shopify/liquid/wiki/Liquid-for-Designers
https://github.com/mojombo/jekyll/wiki/Liquid-Extensions

#### GFM

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

### Tools
https://github.com/badges/shields
http://shields.io/