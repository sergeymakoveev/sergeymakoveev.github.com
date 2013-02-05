---

published: true

layout: post

title: Services: GetFavicon

categories: [services]

tags: [service, online, development, favicon, getfavicon]

---

#Описание
Сервис отдает favicon ресурса, указанного в `{URL}` запроса.

#Использование
Формат запроса:
```
http://getfavicon.appspot.com/{URL}
http://g.etfv.co/{URL}
```
Например, получить favicon ресурса "[http://ya.ru](http://ya.ru)":
```
http://getfavicon.appspot.com/http://ya.ru
http://g.etfv.co/http://ya.ru
```
#Особенности
*   поддерживает `https:` только на хосте [getfavicon.appspot.com](https://getfavicon.appspot.com/):
    https://getfavicon.appspot.com/http://ya.ru
Таким образом, если ваш сайт доступен по `http:` и `https:` одновременно, будет работать "правильная" запись:

```html
<img src="//getfavicon.appspot.com/http://ya.ru" />
```
При этом браузер сам подставит в URL нужный префикс протокола.  
Если на ваш сайт обратились по `http:` иконка будет взята с адреса http://getfavicon.appspot.com/http://ya.ru ,
если страница вашего сайта была запрошена по `https:` - иконка загрузится с адреса https://getfavicon.appspot.com/http://ya.ru

*   умеет получать favicon https-ресурсов:
    http://getfavicon.appspot.com/https://ya.ru
    http://g.etfv.co/https://ya.ru

*   можно задавать [настройки](http://g.etfv.co/) в get-параметрах: (escaping, default icon, ...)
*   
http://asdasdasd.getfavicon.appspot.com/http://ya.ru

#Недостатки
*   не поддерживает

#Links
*   [Home page](http://g.etfv.co/)
*   [Исходники на GitHub](https://github.com/potatolondon/getfavicon)
