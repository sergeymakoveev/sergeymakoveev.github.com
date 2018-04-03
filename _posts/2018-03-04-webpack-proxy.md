---
    published: false
    layout: html.default.post
    title: Webpack
    description: Webpack. Proxy
    categories: [blog]
    tags: [webpack, expressjs, proxy]
---

## Введение

Иногда в целях отладки возникает необходимость подручными средствами эмулировать HTTP-эндпоинт,
либо модифицировать HTTP-запрос или его ответ к локальному или внешнему ресурсу.
По "модификацией" понимается преобразование заголовков и/или тела запроса и/или ответа.
Часто в качестве "доступного" подручного средства для этого может выступить
[webpack-dev-server](https://webpack.js.org/configuration/dev-server/)


## Способы

Для подобных преобразований [webpack-dev-server](https://webpack.js.org/configuration/dev-server/)
предоставляет нам следующие возможности:
https://webpack.js.org/configuration/dev-server/#devserver-headers-

https://webpack.js.org/configuration/dev-server/#devserver-after
https://webpack.js.org/configuration/dev-server/#devserver-before

https://webpack.js.org/configuration/dev-server/#devserver-proxy

<script src="https://gist.github.com/sergeymakoveev/cc453586a59896c7605c22382d181bb7.js"></script>