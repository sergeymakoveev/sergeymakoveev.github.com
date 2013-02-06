---
    published: true
    layout: post
    title: Сервисы GetFavicon
    categories: [blog]
    tags: [service, online, development, favicon, getfavicon]
---



## getfavicon.appspot.com
> [http://getfavicon.appspot.com](http://getfavicon.appspot.com "Usage")  
> [http://g.etfv.co](http://g.etfv.co "Usage")  
> [https://github.com/potatolondon/getfavicon](https://github.com/potatolondon/getfavicon "Sources")

###Описание
Сервис отдает favicon ресурса `{src}`, указанного в URL запроса.

###Использование
Формат запроса:

```
http://getfavicon.appspot.com/{src}
https://getfavicon.appspot.com/{src}
http://g.etfv.co/{src}
```

Например, получить favicon ресурса "[http://ya.ru](http://ya.ru)":

```
http://getfavicon.appspot.com/http://ya.ru
https://getfavicon.appspot.com/http://ya.ru
http://g.etfv.co/http://ya.ru
```

###Особенности
*   в качестве `{src}` ресурса выступает строка `{http|https}://hostname`
*   умеет получать favicon https-ресурсов:

```
http://getfavicon.appspot.com/https://ya.ru
http://g.etfv.co/https://ya.ru
```
*   корректно отрабатывает если иконка запрашивается у `https://`-ресурса с "самопальным" SSL-сертификатом

```
https://getfavicon.appspot.com/https://mmmail.ru
https://getfavicon.appspot.com/https://ioffice.penza-gsm.ru
```

*   корректно отрабатывает если иконка запрашивается у `http://`-ресурса с "безусловным" редиректом на `https://`

```
https://getfavicon.appspot.com/http://mmmail.ru
https://getfavicon.appspot.com/http://ioffice.penza-gsm.ru
```

*   поддерживает `https:` только на хосте [getfavicon.appspot.com](https://getfavicon.appspot.com/):

```
https://getfavicon.appspot.com/http://ya.ru
```
Таким образом, если ваш сайт доступен по `http:` и `https:` одновременно, будет работать "правильная" запись:

```html
<img src="//getfavicon.appspot.com/http://ya.ru" />
```
При этом браузер сам подставит в URL нужный префикс протокола.  
Если на ваш сайт обратились по `http:` - иконка будет взята с адреса http://getfavicon.appspot.com/http://ya.ru ,
если страница вашего сайта была запрошена по `https:` - иконка загрузится с адреса https://getfavicon.appspot.com/http://ya.ru

*   можно задавать [настройки](http://g.etfv.co/) в get-параметрах: (escaping, default icon, ...)
*   сервис отвечает с любого хоста домена **getfavicon.appspot.com** - `*.getfavicon.appspot.com`:

```
http://1.getfavicon.appspot.com/http://ya.ru
http://12.getfavicon.appspot.com/http://ya.ru
http://abc.getfavicon.appspot.com/http://ya.ru
```
Таким образом, при одновременной загрузке большого количества иконок срабатывает ограничение браузера на количество одновременных запросов к одному и тому же хосту (количество зависит от реализации браузера).  
Данное свойство позволяет динамически генерировать имя хоста: **`hosthame`.getfavicon.appspot.com**, и, таким образом, обойти это ограничение, сокращая общее время загрузки страницы.



### GetFavicon by Google

####Описание
Сервис отдает favicon ресурса `{src}`, указанного в URL запроса.

####Использование
Формат запроса:

```
http://www.google.com/s2/favicons?domain={src}
https://www.google.com/s2/favicons?domain={src}
```

Например, получить favicon ресурса "[http://ya.ru](http://ya.ru)":

```
http://www.google.com/s2/favicons?domain=ya.ru
https://www.google.com/s2/favicons?domain=ya.ru
```

####Особенности
*   в качестве ресурса `{src}` указывается домен без префикса протокола
*   поддерживает `https:`:

```
https://www.google.com/s2/favicons?domain=ya.ru
```

*   **некорректно** отрабатывает если иконка запрашивается у `https://`-ресурса с "самопальным" SSL-сертификатом

```
https://www.google.com/s2/favicons?domain=mmmail.ru
https://www.google.com/s2/favicons?domain=ioffice.penza-gsm.ru
```



### GetFavicon by Yandex

####Описание
Сервис отдает favicon ресурса `{src}`, указанного в URL запроса.

####Использование
Формат запроса:

```
http://favicon.yandex.net/favicon/{src}
https://favicon.yandex.net/favicon/{src}
http://favicon.yandex.ru/favicon/{src}
https://favicon.yandex.ru/favicon/{src} (!!!)
```

Например, получить favicon ресурса "[http://ya.ru](http://ya.ru)":

```
http://favicon.yandex.net/favicon/ya.ru
https://favicon.yandex.net/favicon/ya.ru
http://favicon.yandex.ru/favicon/ya.ru
https://favicon.yandex.ru/favicon/ya.ru (!!!)
```

####Особенности
*   в качестве ресурса `{src}` можно указать несколько доменов (без префикса протокола):

```
http://favicon.yandex.net/favicon/google.com/ya.ru/mail.ru
```

### http://geticon.org/
