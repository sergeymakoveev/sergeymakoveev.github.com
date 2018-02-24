---
    published: false
    layout: html.secon.post
    title: Вебкомпоненты&#58; 4 года спустя
    description: SECON'2017. Доклад
    categories: [blog]
    tags: [web components, html templates, html imports, shadow dom, custom elements, polymer]
---


## Актуальность

Под термином [вебкомпоненты](https://developer.mozilla.org/en-US/docs/Web/Web_Components)
понимают совокупность четырех стандартов:
[Shadow DOM](https://www.w3.org/TR/shadow-dom/),
[Custom Elements](https://www.w3.org/TR/custom-elements/),
[HTML Templates](https://www.w3.org/TR/html-templates/)
 (теперь в составе стандарта [HTML5](https://www.w3.org/TR/html5/semantics-scripting.html#the-template-element)),
[HTML Imports](https://www.w3.org/TR/html-imports/)

Вебкомпоненты предоставляют нативные (браузерные) средства разработки пользовательских компонент,
cодержат средства описания шаблона, стилей и логики компонента,
а также механизм их инкапсуляции в единую независимую сущность.

[Пилотные варианты](https://www.w3.org/TR/2013/WD-components-intro-20130606/) этих спецификаций
были реализованы 4 года назад в Google Chrome

За прошедшее время произошли глобальные изменения в архитектуре веб-приложений:
*   устарела концепция «веб-сайт»  
    (где преимущественно используется серверный рендеринг страниц,
     фронтенд-технологии применяются для интерфейсных улучшений);
*   на смену ей пришла концепция «веб-приложение»,  
    в которой произошло разделение бекенда и фронтенда как независимых частей приложения,
    которые взаимодействуют через API.

Для построения фронтенда как независимой архитектурной части веб-приложения
стало необходимо:
*   применять общепринятые архитектурные принципы и решения  
    (модели, контроллеры, представления, роутинги, хранилище состояния);
*   выделять в приложении модули и компоненты

Все это послужило толчком  для создания средств реализации этих принципов и решений.
Появились и широко используются:
*   таск-менеджеры (Grunt/Gulp);
*   системы сборки (Webpack/Rollup);
*   транспайлеры (Babel/TypeScript);
*   css-препроцессоры (LESS/SASS/SCSS/PostCSS);
*   библиотеки «CSS-in-JS»;
*   высокопроизводительные js-фреймворки (Angular/React/Vue/...),  
    предоставляющие свои реализации архитектурных решений.

Это нивелировало актуальность вебкомпонентов
и сейчас необходимость их применения кажется довольно сомнительной.  
Действительно, все перечисленные выше средства в совокупности
позволяют решить задачи разработки структурированных веб-приложений и UI-компонент с инкапсулированными
шаблоном, стилями, логикой и состоянием.

Какое место претендуют занять вебкомпоненты в современном стеке фронтенд-технологий?
Зачем и как применять вебкомпоненты в jquery/angular/react/<ваш_фреймворк>-приложениях?


## Динамика развития

Развитие фронтенд-тулинга форсировало прогресс браузерных технологий:
ускорилась разработка w3c/ecmascript-стандартов и их имплементация в браузерах.  
Стек стандартов вебкомпонентов тоже не остался без внимания.  

За прошедшие 5 лет с момента экспериментальной реализации вебкомпонентов в Google Chrome:
*   вышли новые версии спецификаций
    [Shadow DOM v1](http://caniuse.com/#feat=shadowdomv1) и
    [Custom Elements v1](http://caniuse.com/#feat=custom-elementsv1)
*   [HTML Templates](http://caniuse.com/#feat=template)
    были реализованы во всех основных браузерах, кроме IE
*   вышел [Polymer v.2](https://www.polymer-project.org/2.0/docs/about_20)

-----------------------------------------------------|------------------------------------------------------------------------------------------------------------
[Shadow DOM v1](http://caniuse.com/#feat=shadowdomv1) &nbsp;|[<i class="fa fa-chrome"/> <i class="fa fa-opera"/>](https://www.chromestatus.com/features/4667415417847808) [<i class="fa fa-safari"/>](https://webkit.org/status/#feature-shadow-dom)
[Custom Elements v1](http://caniuse.com/#feat=custom-elementsv1) &nbsp;|[<i class="fa fa-chrome"/> <i class="fa fa-opera"/>](https://www.chromestatus.com/features/4696261944934400) [<i class="fa fa-firefox"/>](https://platform-status.mozilla.org/#custom-elements) [<i class="fa fa-safari"/>](https://webkit.org/status/#feature-custom-elements)
[HTML Templates](http://caniuse.com/#feat=template) &nbsp;|[<i class="fa fa-chrome"/> <i class="fa fa-opera"/>](https://www.chromestatus.com/features/5207287069147136) [<i class="fa fa-firefox"/>](https://platform-status.mozilla.org/#html-templates) [<i class="fa fa-safari"/>](https://webkit.org/status/#feature-template-element) [<i class="fa fa-edge"/>](https://developer.microsoft.com/en-us/microsoft-edge/platform/status/templateelement/)
[HTML Imports](http://caniuse.com/#feat=imports) &nbsp;|[<i class="fa fa-chrome"/> <i class="fa fa-opera"/>](https://www.chromestatus.com/features/5144752345317376)
[Polymer v2](https://www.polymer-project.org/2.0/docs/about_20) &nbsp;|[<i class="fa fa-chrome"/> <i class="fa fa-opera"/> <i class="fa fa-firefox"/> <i class="fa fa-safari"/> <i class="fa fa-edge"/> <i class="fa fa-internet-explorer"/>](https://www.polymer-project.org/2.0/docs/about_20#browser-support-and-polyfills)


### Shadow DOM

Это своего рода "базовая" спецификация вебкомпонентов, которая отвечает за создание изолированных dom-деревьев.
Благодаря механизмам изоляции, реализованным в ней, становится возможным создавать независимые компоненты,
шаблоны, стили и логика работы которых не влияют на другие компоненты и их внешнее окружение.

Эта спецификация претерпела наибольшие [изменения](https://hayato.io/2016/shadowdomv1/).

*   создание shadow root  
    v.0: `element.createShadowRoot()`  
    v.1: `element.attachShadow({ mode: ... })`
*   поддержка множественных shadow root  
    v.0: поддерживается  
    v.1: не поддерживается
*   closed shadow root  
    v.0: не поддерживается, shadow root постоянно доступен извне: `e.shadowRoot`  
    v.1: режим задается: `element.attachShadow({ mode: 'open' || 'closed' })`  
    работа геттеров `e.shadowRoot`, `e.assignedSlot` зависит от режима
*   **shadow host**  
    v.0: любой элемент может стать shadow host  
    v.1: [список элементов регламентирован](https://dom.spec.whatwg.org/#dom-element-attachshadow)
*   механизм распределения контента -
    позиции отображения контента из другого дерева:  
    v.0: Insertion points  
    v.1: Slots


### Custom Elements

В этой спецификации произошли следующие "знаковые" [изменения](https://github.com/shawnbot/custom-elements):

*   появление в браузерах поддержки es6 классов позволяет описывать
    пользовательский элемент в виде класса:  
    `class MyElementClass extends HTMLElement {}`

*   регистрация элемента  
    v.0: `document.registerElement('my-element', MyElementClass)`  
    v.1:  
    — `customElements.define('my-element', MyElementClass)`  
    <!-- — `document.createElement('my-element', MyElementClass)` // TODO: проверить  -->

*   появился метод получения промиса момента регистрации элемента:  
    `customElements.whenDefined('my-element')`

*   определение конструктора класса элемента по его имени:  
    `customElements.get('my-element')`

*   изменился жизненный цикл элемента:
  
{: .table }
&nbsp;                 | Custom Elements v0         | Custom Elements v1
-----------------------|----------------------------|---------------------------
создание экземпляра    | `createdCallback`          | `constructor`
добавление в DOM       | `attachedCallback`         | `connectedCallback`
изменение атрибутов    | `attributeChangedCallback` | `attributeChangedCallback`
добавление в чужой DOM | —                          | `adoptedCallback`
удаление из DOM        | `detachedCallback`         | `disconnectedCallback`


### HTML Templates

Изначально самостоятельный стандарт [HTML Templates](https://www.w3.org/TR/html-templates/)
теперь включен в стандарт [HTML5](https://www.w3.org/TR/html5/)
в качестве секции "[The template element](https://www.w3.org/TR/html5/semantics-scripting.html#the-template-element)".

Реализована поддержка во всех актуальных браузерах.


### HTML Imports

Наиболее противоречивый и спорный стандарт.
Реализован только Google Chrome.


## JS-фреймворки: проблемы миграции

Рано или поздно любой проект сталкивается с проблемой миграции на новую версию
application-фреймворка или миграции на новый application-фреймворк.
Наиболее распространенные причины миграции:  
— развитие application-фреймворков динамично, хочется использовать
самый прогрессивный  
— заказчики продукта определяют использумый стек фреймворков и технологий.  

Проблемы накатывают лавиной:  
— выбор application-фреймворка подразумевает и выбор ui-фреймворка
  (для Angular-приложения - ui-фреймворк на Angular, ...)
— смена фреймворка приложения приводит к замене наработанной базы ui-компонент  
— издержки на адаптацию, стилизацию, отладку и тестирование  

На практике произошло:  
— purejs ➛ jquery  
— jquery ➛ KnockoutJS / jquery ➛ AngularJS / jquery ➛ ReactJS / jquery ➛ Angular2  
— AngularJS ➛ Angular2

Причем заказчик считает что:  
— необходимые ui-компоненты можно заимствовать из числа уже реализованных  
— задача сводится к тривиальной стилизации  
— доводы о трудозатратах на разработку не убедительны  

Таким образом, от пректа к проекту, повторяется процесс разработки ui-библиотеки.
И практически каждый фронтендер делал свою реализацию dropdown/datepicker/...
на vanila-js/JQuery/Angular/React/...

Написаны десятки UI-фреймворков, содержащие тысячи компонент.  
Подсчет человеко-часов, затраченных на этот титанический труд,
не поддается оценке.  

Почему не написан UI-фреймворк, который можно использовать
с любым фреймворком уровня приложения?  

Один UI-фреймворк всеже есть и все мы его используем
— это нативные UI-компоненты браузера.


## Нативные UI-компоненты браузера

~~~html
<button />
<input type="text"/>
<input type="checkbox" />
<input type="radio" />
<textarea />
<select />
<video />
...
~~~

Используя каждый из этих элементов вы не сомневаетесь будет ли он работать
с вашим фреймворком.

Что под капотом этого "фреймворка"?

Если открыть отладчик, включить **Show user agent shadow DOM**
и проинспектировать стандартные компоненты браузера,
вы увидете что "под капотом" скрываются вебкомпоненты.  

Почему эти компоненты работают везде?
— реализованы на более низком уровне, чем js-фреймворк  
— используется Shadow DOM для изоляции собственного DOM-дерева и его стилей  
— взаимодействие компонента с внешней средой осуществляется через js-api и api атрибутов тега компонета

Имплементация в браузерах стека стандартов Web Components предоставляет стандартное api, позволяющее
использовать эти «низкоуровневые» инструменты для создания собственных компонент.

Т.о. произошел очередной виток в развитии технологий фронтенда — браузерные стандарты
«догоняют» ушедшие вперед возможности фронтенд-тулинга. 


## Web Components vs JS-framework

Давайте внимательно прочитаем название: "веб-**компоненты**".
Не "веб-роутер" или "веб-фреймворк", а "веб-**компоненты**".
Название "говорящее".

Вебкомпоненты в первую очередь предназначены решить задачи компонентного подхода
— разработки независимых пользовательских компонент.

Относительно современных js-фреймворков по функционалу вебкомпоненты наиболее близки к ReactJS:
*   "из коробки" не содержат механизмов, типичных для application-фреймворков (фреймворков уровня приложения),
    таких как Angular, Ember: роутинги, контроллеры, модели, хранилища состояния, ...
*   предоставляют лишь инструменты для создания компонент, не более того

**Основное назначение application-фреймворка:**  
— предоставить средства создания инфраструктуры приложения.

**Назначение вебкомпонентов:**  
— предоставить средства создания компонент.

Поэтому сравнения **Web Components vs JS-framework** в общем некорректны.


## Web Components или JS-framework?

Вам не придется делать этот выбор.  
Нет необходимости отказываться от любимого фреймворка в пользу вебкомпонентов и наоборот.

Вебкомпоненты по своей сути можно использовать с любым
js-фреймворком уровня приложения и ui-фреймворком:

*   с точки зрения фреймворка вебкомпоненты ничем не должны отличаться от нативных,
    т.к. реализуются на более низком уровне, чем фреймфорк (механизмами браузера)
*   фреймворки используют virtual DOM, реализованный уровнем выше, чем Shadow DOM 
*   Shadow DOM вебкомпонентов не прозрачен для virtual DOM
*   вебкомпоненты работают со своим Shadow DOM, не влияют на virtual DOM фреймворка
*   внутренние процессы вебкомпонентов процессы изолированы от внешнего влияния и 
    сами не влияют на внешнюю среду фреймворка
*   взаимодействие с внешней средой фреймворка через js-api вебкомпонента и его атрибуты

Использование библиотеки ui-вебкомпонент стало бы разумным решением.  
Вебкомпоненты предоставляют возможность использовать единую оттестированную,
стабильную ui-билиотеку, которую можно использовать в качестве bootstrap
для любого web-приложения.


## [Polymer: миссия](https://www.polymer-project.org/2.0/docs/devguide/feature-overview)

Polymer предоставляет возможность использовать вебкомпоненты уже сегодня.  

Возможности:

*   **создание пользовательских элементов**:  
    — регистрация пользовательского элемента, его ассоциация с именем и классом, описывающим
      жизненный цикл и логику работы элемента  
    — управление жизненным циклом элемента  
    — использование property-api элемента для его интеграции с Polymer data system

*   **использование Shadow DOM** в polymer-компонентах позволяет создать:  
    — изолировать DOM-дерево пользовательского элемента  
    — создать DOM-дерево пользовательского элемента на основе DOM-template

*   **система событий**  
    — декларативный синтаксис для добавления event listeners для элементов shadow DOM дерева  
    — библиотека для обработки событий-жестов

*   **Data system**
    — data binding для свойств и атрибутов  
    — property observers  
    — computed properties.

<!-- 11 -------------------------------------------------------------------- -->

## [Polymer: улучшения в 2.0](https://www.polymer-project.org/2.0/docs/about_20)

*   **улучшена функциональная совместимость с библиотеками и фреймворками**  
    — убрана необходимость использования Polymer.dom для манипуляций с DOM  
    — код Shadow DOM-полифила «[shady DOM](https://github.com/webcomponents/shadydom)» выведен из Polymer  
    — для манипуляций с DOM используется стандартный API спецификации Shadow DOM  

*   **улучшения в Data system**  
    — упрощение распространения данных через/между элементами  
    — упрощение отладки распространения данных

*   **стандартизация**  
    — поддержка спецификаций Shadow DOM v.1, Custom Elements v.1  
    — использование ES6 классов и стандартных методов спецификации Custom Elements v.1 для описания polymer-компонента  
    — жизненный цикл polymer-компонента соответствует Custom Elements v.1  


## [Polymer: под капотом](https://www.webcomponents.org/polyfills/)

Пока поддержка стека Web Components реализована не всеми браузерами, Polymer использует набор полифилов,
объединенных в пакет [webcomponents-lite.js](https://github.com/WebComponents/webcomponentsjs):

— полифилы Shadow DOM:
    [Shady DOM](https://github.com/webcomponents/shadydom),
    [Shady CSS](https://github.com/webcomponents/shadycss)  
— полифилы
    [Custom Elements](https://github.com/webcomponents/custom-elements),
    [HTML Imports](https://github.com/webcomponents/html-imports),
    [HTML Templates](https://github.com/webcomponents/template)

[Shady DOM](https://www.polymer-project.org/blog/shadydom):
зачем понадобился еще один полифил Shadow DOM?  
Главная задача полифилов Shadow DOM заключается в изоляции теневого DOM (исключение влияния извне и наоборот).  

*   существующие полифилы Shadow DOM достаточно сложны и медленны в работе.  
*   Shady DOM представляет собой shim для Shadow DOM  
    (т.е. более легковесное чем полифил)
*   реализует (с некоторыми ограничениями) изоляцию теневого дерева
    без потерь производительности
*   предоставляет API в соответствии со спецификацией Shadow DOM.

Все эти полифилы реализованы с учетом:
— минимизации потерь производительности  
— максимальной совместимости по API со стеком стандартов Web Components
— перехода на использования браузерных реализаций вебкомпонентов при их наличии
— упрощения использования Polymer с другими библиотеками и фреймворками

Совместимость по API со стеком стандартов Web Components позволяет
переключаться на использования браузерных реализаций вебкомпонентов
при их наличии.


## [Polymer: CLI](https://www.polymer-project.org/2.0/docs/tools/polymer-cli)

Входит в тренд предоставление CLI-клиента для фреймворка.
Впервые CLI был реализован в Ember (2013), затем Angular (2015), Polymer (2016)

*   предоставляет boilerplate-генератор для 2-х типов проектов: компонент и приложение
*   предоставляет линтер, development server, test runner, сборщик проекта
*   использует Bower для управления зависимостями  
    ( для плоского дерева зависимостей Bower упрощаются относительные пути в импортах компонент )


### Библиотеки UI-компонент

[WEBCOMPONENTS.ORG](https://www.webcomponents.org/)  
— единый репозиторий UI-компонент, созданных на базе технологий вебкомпонентов и Polymer:

*   [PolymerElements](https://www.webcomponents.org/author/PolymerElements)  
    (elements.polymer-project.org)
*   [GoogleWebComponents](https://www.webcomponents.org/author/GoogleWebComponents)  
    компоненты для работы с сервисами Google
    (входил в состав elements.polymer-project.org)
*   [Vaadin](https://www.webcomponents.org/author/vaadin)

*   https://www.ag-grid.com/  
    https://github.com/ag-grid/ag-grid-webcomponent-example  
    https://github.com/ag-grid/ag-grid-webcomponent

### Кто использует вебкомпоненты/Polymer?

*   Google  
    — толкает локомотив прогресса, основной разработчик стандартов  
    — давно использует вебкомпоненты/Polymer в своих продуктах
*   пользователи Angular2  
    — режим изоляции шаблонов "Shadow DOM"
*   [Vaadin](https://vaadin.com) и его [компоненты](https://www.webcomponents.org/author/vaadin)  
    — Works on any HTML5 based stack  
    — Supports Polymer and Angular 2 data binding


## Web Components / Polymer : примеры

### Проекты:
*   {: .fragment .highlight-current-blue .no-border}
    [Google Earth](https://www.google.com/earth/)  
    — [анонс](https://react-etc.net/entry/the-new-google-earth-is-powered-by-web-components-and-portable-native-client)
*   {: .fragment .highlight-current-blue .no-border}
    Новый интерфейс Youtube:  
    — [анонс](https://react-etc.net/entry/youtube-is-being-rebuilt-on-web-components-and-polymer),
      [как включить](https://lifehacker.ru/2017/02/22/new-youtube-design/)
*   {: .fragment .highlight-current-blue .no-border}
    [Youtube Gaming](https://gaming.youtube.com/)
*   {: .fragment .highlight-current-blue .no-border}
    [Google Music](https://play.google.com/music/listen),
    [Google Sites](https://sites.google.com),
    [Polymer's Element Catalog](https://elements.polymer-project.org/),
    [Polymer Summit](https://www.polymer-project.org/summit),
    [Zeplin.io](https://zeplin.io/)
*   {: .fragment .highlight-current-blue .no-border}
    [Who's using Polymer?](https://github.com/Polymer/polymer/wiki/Who%27s-using-Polymer%3F)

### Примеры:
*   {: .fragment .highlight-current-blue .no-border}
    [WEBCOMPONENTS.ORG](https://www.webcomponents.org/)
*   {: .fragment .highlight-current-blue .no-border}
    Polymer Summit on Codelabs Google Developers:
    [2015](https://codelabs.developers.google.com/polymer-summit),
    [2016](https://codelabs.developers.google.com/polymer-summit-2016)
*   {: .fragment .highlight-current-blue .no-border}
    PWA [Google I/O 2016](https://events.google.com/io2016/):  
    — [анонс](https://developers.google.com/web/showcase/2016/iowa2016),
      [исходники](https://github.com/GoogleChrome/ioweb2016)
*   {: .fragment .highlight-current-blue .no-border}
    PWA [Polymer News](https://news.polymer-project.org):  
    — [анонс](https://www.polymer-project.org/blog/2017-02-13-news-),
      [документация к проекту](https://news-docs.polymer-project.org/),
      [исходники](https://github.com/Polymer/news/tree/2.0-preview)

## Ссылки

*   [Custom Elements v1: Reusable Web Components](https://developers.google.com/web/fundamentals/getting-started/primers/customelements)
*   [Shadow DOM v1: Self-Contained Web Components](https://developers.google.com/web/fundamentals/getting-started/primers/shadowdom)
*   [Позвольте представить, Shadow DOM API на основе слотов](https://habrahabr.ru/post/304112/)
*   [About Polymer 2.0](https://www.polymer-project.org/2.0/docs/about_20)
*   [Теневой DOM (Shady DOM)](https://habrahabr.ru/post/259187/)
*   Диалог:  
    — [Невыполненные обещания веб-компонентов](https://medium.com/web-standards/broken-promise-of-web-components-6b8641b390cb)  
    — [Размышления по поводу невыполненных обещаний веб-компонентов](https://medium.com/web-standards/regarding-broken-promise-of-web-components-385d63de4959)
*   [полная коллекция ссылок к докладу](/2017/02/secon.webcomponents.links/)
