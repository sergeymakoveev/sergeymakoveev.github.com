---
    published: true
    layout: html.default.post
    title: Сервисы GetFavicon
    description: Онлайн-сервисы, позволяющие сформировать URL для получения favicon произвольного сайта
    categories: [blog]
    tags: [service, online, development, favicon, getfavicon, icon]
    date: 2010.02.08
---

## getfavicon.appspot.com
> [http://getfavicon.appspot.com](http://getfavicon.appspot.com "Usage")  
> [http://g.etfv.co](http://g.etfv.co "Usage")  
> [https://github.com/potatolondon/getfavicon](https://github.com/potatolondon/getfavicon "Sources")

###Описание
Сервис отдает favicon сайта `{src}`, указанного в URL запроса.

###Использование
**Формат:**

```
http://getfavicon.appspot.com/{src}
https://getfavicon.appspot.com/{src}
http://g.etfv.co/{src}
```
  
**Например:** получить favicon сайтов [http://ya.ru](http://ya.ru), [http://mail.ru](http://mail.ru), [http://rambler.ru](http://rambler.ru):

```html
<!--
    http://getfavicon.appspot.com/http://ya.ru
    https://getfavicon.appspot.com/http://mail.ru
    http://g.etfv.co/http://rambler.ru
-->
<img src="http://getfavicon.appspot.com/http://ya.ru" />
<img src="https://getfavicon.appspot.com/http://mail.ru" />
<img src="http://g.etfv.co/http://rambler.ru" />
```
**Результат:**
![favicon from http://ya.ru](http://getfavicon.appspot.com/http://ya.ru)
![favicon from http://mail.ru](http://getfavicon.appspot.com/http://mail.ru)
![favicon from http://rambler.ru](http://getfavicon.appspot.com/http://rambler.ru)

###Особенности
*   в качестве `{src}` ресурса выступает строка `{http|https}://hostname`
*   умеет получать favicon https-ресурсов:

```
http://getfavicon.appspot.com/https://ya.ru
http://g.etfv.co/https://ya.ru
```
*   корректно отрабатывает если иконка запрашивается у `https`-сайта с "самопальным" SSL-сертификатом

```
https://getfavicon.appspot.com/https://mmmail.ru
https://getfavicon.appspot.com/https://ioffice.penza-gsm.ru
```

*   корректно отрабатывает если иконка запрашивается у `http`-сайта с "безусловным" редиректом на `https`

```
https://getfavicon.appspot.com/http://mmmail.ru
https://getfavicon.appspot.com/http://ioffice.penza-gsm.ru
```

*   поддерживает `https` только на хосте [getfavicon.appspot.com](https://getfavicon.appspot.com/):

```
https://getfavicon.appspot.com/http://ya.ru
```
Таким образом, если ваш сайт доступен по `http` и `https` одновременно, будет работать "правильная" запись:

```html
<img src="//getfavicon.appspot.com/http://ya.ru" />
```
При этом браузер сам подставит в URL нужный префикс протокола.  
Если на ваш сайт обратились по `http` - иконка будет взята с адреса http://getfavicon.appspot.com/http://ya.ru ,
если страница вашего сайта была запрошена по `https` - иконка загрузится с адреса https://getfavicon.appspot.com/http://ya.ru

*   можно задавать [настройки](http://g.etfv.co/) в get-параметрах: (escaping, default icon, ...)

*   сервис отвечает с любого хоста домена **getfavicon.appspot.com** - `*.getfavicon.appspot.com`:

```
http://1.getfavicon.appspot.com/http://ya.ru
http://12.getfavicon.appspot.com/http://ya.ru
http://abc.getfavicon.appspot.com/http://ya.ru
```
Как известно при одновременной загрузке большого количества (>7) ресурсов с одного и того же хоста срабатывает ограничение браузера на количество одновременных запросов к хосту (количество зависит от реализации браузера).  
Данное свойство позволяет динамически генерировать имя хоста: **`hosthame`.getfavicon.appspot.com**, и, таким образом, обойти это ограничение, сокращая общее время загрузки страницы.



## GetFavicon by Google

###Описание
Сервис отдает favicon сайта `{src}`, указанного в URL запроса.

###Использование
Формат запроса:

```
http://www.google.com/s2/favicons?domain={src}
https://www.google.com/s2/favicons?domain={src}
```

**Пример:** получить favicon ресурса "[http://ya.ru](http://ya.ru)":

```
http://www.google.com/s2/favicons?domain=ya.ru
https://www.google.com/s2/favicons?domain=ya.ru
```

###Особенности
*   в качестве сайта `{src}` указывается домен без префикса протокола
*   поддерживает `https`:

```
https://www.google.com/s2/favicons?domain=ya.ru
```

*   **некорректно** отрабатывает если иконка запрашивается у `https`-сайта с "самопальным" SSL-сертификатом

```
https://www.google.com/s2/favicons?domain=mmmail.ru
https://www.google.com/s2/favicons?domain=ioffice.penza-gsm.ru
```



## GetFavicon by Yandex

###Описание
Сервис отдает favicon сайта `{src}`, указанного в URL запроса.

###Использование
Формат запроса:

```
http://favicon.yandex.net/favicon/{src}
https://favicon.yandex.net/favicon/{src}
http://favicon.yandex.ru/favicon/{src}
https://favicon.yandex.ru/favicon/{src} (!!!)
```

**Пример:** получить favicon сайта "[http://ya.ru](http://ya.ru)":

```
http://favicon.yandex.net/favicon/ya.ru
https://favicon.yandex.net/favicon/ya.ru
http://favicon.yandex.ru/favicon/ya.ru
https://favicon.yandex.ru/favicon/ya.ru (!!!)
```

###Особенности
*   в `{src}` можно указать несколько доменов (без префикса протокола), разделенные "прямым слешем" ( / ):

```
http://favicon.yandex.net/favicon/google.com/ya.ru/mail.ru
```

## http://geticon.org/


