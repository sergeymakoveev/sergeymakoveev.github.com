---

published: true

layout: post

title: Тренды фронтэнда. Javascript APIs для мобильных устройств

categories: [javascript]

tags: [js, api, js api, frontend, html, interface, mdn, mozilla, w3c]

---
Презентация к докладу [http://goo.gl/2CkWb][presentation]

В настоящее время нельзя не заметить общую тенденцию к миграции сервисов и приложений в веб, что подкрепляется появлением множества онлайн-сервисов, которые <s>претендуют называться</s> однозначно можно назвать веб-приложениями. Как следствие, теряют популярность standalone-приложения, функционал которых не предусматривает связи с массовыми веб-сервисами. Таким приложением приходится либо видоизменяться, добавляя в себя функционал для интеграции с внешним миром, либо мигрировать в веб.

Интересны разные пути развития приложений и сервисов. Яркими примерами являются [Adobe][adobe] с его [Adobe Creative Cloud][adobe creative cloud], Microsoft с его SkyDrive и Microsoft Office Web App - здесь популярные приложения мигрировали в веб. Другой путь развития - развитие сервисов, когда веб-сервисы, набирая популяность, «обрастают» приложениями - GMail, Youtube.

Таким образом, приложение (сервис), целью которого является «быть качественным, удобным и популярным», в настоящее время содержит в своей структуре:

*   клиентские приложения для популярных OS (iOS, Android, Windows, Linux, ...);
*   расширения для популярных браузеров;
*   букмарклеты для популярных браузеров;
*   веб-клиента;
*   общий бэкэнд, в котором, наряду с основным функционалом, реализованы собственное api и средства интеграции с внешними сервисами.

Совершенно очевидно что:

*   для развития и поддержки подобного приложения требуются усилия слаженной команды разработчиков, включающей в себя специалистов с опытом разработки приложений под соответствующие платформы, одновременно обладающих опытом и знаниями в смежных областях (это как минимум знание архитектуры веб-приложений и технологий, применяемых для их реализации);
*   возрастают "накладные расходы" на поддержание инфраструктуры самого процесса разработки (для каждого составляющего этой структуры требуется написание всего спектра тестов - юнит, функциональных, нагрузочных; ведение отдельного баг-трекера, и т.д. ...);
*   многократно усложняется введение нового функционала в сервис (поддержка которого должна быть одновременно и единообразно реализована во всех его структурных частях);
*   подобная структура изначально расположена к появлению ошибок в следствии рассогласования взаимодействия ее составляющих, вызванных в первую очередь разнообразием клиентских приложений и разнообразием их версий на устройствах пользователей.

Бесспорно что трудоемкость и, как следствие, стоимость поддержки и развития такого приложения будет несравнимо больше по-сравнению с «pure-web-application». Структура такого приложения выглядит гораздо лаконичней:

*   веб-итерфейс;
*   клиентские приложения для популярных OS, расширения и букмарклеты для популярных браузеров представляют собой тривиальную "оболочку", в которую "упакован" веб-интерфейс;
*   общий бэкэнд, +api, +средства интеграции с внешними сервисами.

При такой структуре сервиса исключаются практически все минусы, перечисленные выше, в силу того, что при реализации всех частей структуры используются мономорфные технологии (js, css, html), и, следовательно, мономорфная инфраструктура самого процесса разработки и команда разработчиков.

Здесь возникает естественный вопрос - почему подобная практика не используется повсеместно?
Ответ прост: до недавнего времени веб-интерфейсы не могли составить достойную конкуренцию интерфейсам, реализованным при помощи нативных средств каждой из платформ.



# JavaScript APIs
Еще в июле 2009 года в рамках World Wide Web Consortium (W3C) была создана "[Device APIs Working Group (DAP)][w3c-dap]", целью которой является создание client-side API для взаимодействия веб-приложений с сервисами устройств (камера, календарь, контакты, ...). [Здесь][w3c-dap-roadmap] можно увидеть текущие направления разработок группы. Некоторые из них уже реализованы в браузерах.

**Внимание**: тестовые примеры написаны для [Firefox mobile beta][firefox mobile beta].



## Battery Status API
Служит для отображения информации о состоянии батарей клиентской машины.  
Реализован с браузерным префиксом.

{% highlight js linenos %}

    //объект, содержащий информацию о батареях
    var battery = navigator.battery ||
                  navigator.webkitBattery ||
                  navigator.mozBattery;
    
    //battery.level - уровень заряда батарей (значение в диапазоне 0...1)
    var onlevelchange = function(e) {
        console.warn("Battery level change: ", battery.level);
    };
    //levelchange - событие изменения уровня заряда
    battery.addEventListener("levelchange", onlevelchange);
    
    //battery.charging - статус заряда (true - заряжается, false - не заряжается)
    var onchargingchange = function() {
        console.warn("Battery charge change: ", battery.charging);
    };
    //chargingchange - событие изменения статуса заряда
    battery.addEventListener("chargingchange", onchargingchange);
    
    //battery.chargingTime - оставшееся время до полного заряда
    var onchargingtimechange = function() {
        console.warn("Battery charge time change: ", battery.chargingTime);
    };
    //chargingchange - событие изменения времени до полного заряда
    battery.addEventListener("chargingtimechange", onchargingtimechange);
    
    //battery.dischargingTime - оставшееся время до полного разряда
    var ondischargingtimechange = function() {
        console.warn("Battery discharging time change: ", battery.dischargingTime);
    };
    //dischargingtimechange - событие изменения времени до полного разряда
    battery.addEventListener("dischargingtimechange", ondischargingtimechange);

{% endhighlight %}

**Пример**:
[David Walsh/Battery Status API/Example](http://davidwalsh.name/demo/battery-api.php).

**Источники**:
[W3C Battery Status API](http://www.w3.org/TR/battery-status/),
[MDN/window.navigator.battery](https://developer.mozilla.org/en-US/docs/DOM/window.navigator.battery),
[David Walsh/Battery Status API](http://davidwalsh.name/battery-api).



##Vibration API
Предназначен для управления вибросигналом устройства.

<input type="button" value="vibrate 1 sec"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate(1000);
       " />

{% highlight js linenos %}
    
    //вибросигнал длительностью 1 сек
    navigator.vibrate(1000);
    
{% endhighlight %}

<input type="button" value="vibrate 0.5 sec, wait 0.1 sec, vibrate 0.3 sec"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate([500, 100, 300]);
       " />

{% highlight js linenos %}

    //последовательность: вибросигнал 0.5 сек, пауза 1 сек, вибросигнал 0.3 сек
    navigator.vibrate([500, 1000, 300]);

{% endhighlight %}

<input type="button" value="vibrate many times"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate( ('111111111111111111'+
                                    '111111111111111111').split('')
                                                         .map(function(){ return 300;}) )
       " />

{% highlight js linenos %}
    
    //последовательность множества сигналов
    navigator.vibrate( ('111111111111111111'+
                        '111111111111111111').split('')
                                             .map(function(){ return 300; }) );
    
{% endhighlight %}

<input type="button" value="vibrate stop"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate(0);
       " />

{% highlight js linenos %}
    
    //остановить вибросигнал
    navigator.vibrate(0);
    
{% endhighlight %}

<input type="button" value="vibrate 10 sec"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate(10000);
       " />

{% highlight js linenos %}
    
    //вибросигнал длительностью 10 сек
    navigator.vibrate(10000);
    
{% endhighlight %}

<input type="button" value="vibrate stop"
       onclick="
            if( 'vibrate' in navigator )
                navigator.vibrate([]);
       " />

{% highlight js linenos %}
    
    //остановить вибросигнал
    navigator.vibrate([]);
    
{% endhighlight %}

**Примеры**:
[Vibration API example](https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.vibration.html),
[David Walsh/Vibration API/Example](http://davidwalsh.name/demo/vibrate.php).

**Источники**:
[W3C Vibration API](http://www.w3.org/TR/vibration/),
[MDN/window.navigator.vibrate](https://developer.mozilla.org/en-US/docs/DOM/window.navigator.vibrate),
[David Walsh/Vibration API](http://davidwalsh.name/vibration-api)



##Screen Orientation API
Предназначен для получения событий изменения ориентации экрана устройства, информации о текущем состоянии ориентации экрана.  
Реализован с браузерным префиксом.

{% highlight js linenos %}
    // screen.orientation - текущее значение ориентации экрана
    
    console.log("orientation: " + screen.mozOrientation);
    
    // screen.onorientationchange - событие изменения ориентации экрана устройства
    
    screen.addEventListener(
        "mozorientationchange",
        function() {
            console.log("orientation: " + screen.mozOrientation);
        }
    );
{% endhighlight %}

**Пример**:
[Screen Orientation API example](https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.screenorientation.html).

**Источники**:
[W3C/Screen Orientation API](http://www.w3.org/TR/screen-orientation/),
[MDN/orientationchange event](https://developer.mozilla.org/en-US/docs/Mozilla_event_reference/orientationchange).




##Device Orientation API
Предназначен для получения событий изменения ориентации устройства.

{% highlight js linenos %}
    // window.ondeviceorientation - событие смены ориентации устройства
    // e.alpha, e.beta, e.gamma - текущее значение ориентации экрана
    //                            по осям x, y, z соответственно
    window.addEventListener(
        "deviceorientation",
        function(e){
            console.log(e.alpha, e.beta, e.gamma);
        }
    );
{% endhighlight %}

**Примеры**:
[Device Orientation API example](https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.deviceorientation.html),
[Opera/compass](http://people.opera.com/richt/release/demos/orientation/marinecompass/).

**Источники**:
[W3C/deviceorientation](http://www.w3.org/TR/orientation-event/#deviceorientation/),
[MDN/Orientation and motion data explained](https://developer.mozilla.org/en-US/docs/DOM/Orientation_and_motion_data_explained),
[Opera/Orientation API](http://dev.opera.com/articles/view/w3c-device-orientation-api/).



##Device Motion API
Предназначен для получения событий датчика-акселерометра о перемещении устройства.

<pre>// window.ondevicemotion - событие перемещения устройства
// ускорение по осям x, y, z соответственно:
// e.acceleration.x, e.acceleration.y, e.acceleration.z
// значение ускорения по осям x, y, z (с учетом гравитации) соответственно:
// e.accelerationIncludingGravity.x, e.accelerationIncludingGravity.y, e.accelerationIncludingGravity.z
// значение угловой скорости вращения по осям z, x, y (в градусах) соответственно:
// e.rotationRate.alpha, e.rotationRate.beta, e.rotationRate.gamma
window.addEventListener( "devicemotion",
                         function(e){ console.dir(e.acceleration);
                                      console.dir(e.accelerationIncludingGravity);
                                      console.dir(e.rotationRate); }; );
</pre>
**Пример**:
[Device Motion API example](https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.devicemotion.html)

**Источники**:
[W3C/devicemotion](http://www.w3.org/TR/orientation-event/#devicemotion),
[MDN/Orientation and motion data explained](https://developer.mozilla.org/en-US/docs/DOM/Orientation_and_motion_data_explained),
[MDN/devicemotion](https://developer.mozilla.org/en-US/docs/Mozilla_event_reference/devicemotion),
[Opera/Orientation API](http://dev.opera.com/articles/view/w3c-device-orientation-api/).



##Ambient Light Events
Предназначены для получения событий датчика освещенности устройства.

<pre>window.addEventListener(
    "devicelight",
    //e.value - значение освещенности в люксах
    function(e){ console.log(e.value); }
);
window.addEventListener(
    'lightlevel',
    // e.value = ("normal"|"dim"|"bright")
    function(e) { console.log('lightlevel: ' + e.value); }
);
</pre>
**Примеры**:
<a href="https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.ambientlight.html" target="_blank">Ambient Light API example</a>,
<a href="http://dl.dropbox.com/u/8727858/mozilla/light/light.html" target="_blank">Doug Turner/Ambient Light Events/Example</a>.

**Источники**:
<a href="http://www.w3.org/TR/ambient-light/" target="_blank">W3C Ambient Light Events</a>,
<a href="https://developer.mozilla.org/en-US/docs/DOM/DeviceLightEvent" target="_blank">MDN/DeviceLightEvent</a>,
<a href="http://dougturner.wordpress.com/2012/03/26/device-light-sensor/" target="_blank">Doug Turner/Ambient Light Events</a>.



##Proximity Events
События датчика приближения устройства.
<pre>window.addEventListener(
    "deviceproximity",
    function(e){console.log(
        e.value, // текущая дистанция до датчика в сантиметрах (!)
        e.min,   // минимальное значение, которое может определить датчик (==0)
        e.max    // максимальное значение, которое может определить датчик
    )}
);
window.addEventListener(
    "userproximity",
    function(e){console.log(
        e.near //true - близко, false - далеко
    )}
);
</pre>
**Примеры**:
<a href="https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.proximity.html" target="_blank">Proximity Events example</a>,
<a href="http://dl.dropbox.com/u/8727858/mozilla/proximity/pro.html" target="_blank">Doug Turner/Device Proximity/Exapmle</a>.

**Источники**:
<a href="http://www.w3.org/TR/proximity/" target="_blank">W3C Proximity Events</a>,
<a href="https://developer.mozilla.org/en-US/docs/DOM/DeviceProximityEvent" target="_blank">MDN/DeviceProximityEvent</a>,
<a href="https://developer.mozilla.org/en-US/docs/DOM/UserProximityEvent" target="_blank">MDN/UserProximityEvent</a>,
<a href="https://dougturner.wordpress.com/2012/03/22/device-proximity-sensor/" target="_blank">Doug Turner/Device Proximity</a>,
<a href="http://dougturner.wordpress.com/2012/05/15/user-proximity-sensor-4/" target="_blank">Doug Turner/User Proximity</a>.



##Page Visibility API
Позволяет определить отображается ли страница на экране устройства.<br />
Реализован с браузерным префиксом.
<pre>
// Поля, содержащие состояние отображаемости страницы:
// document.hidden = (true|false)
// document.visibilityState = ("hidden"|"visible"|"prerender"|"unloaded")

console.log( document.mozHidden, document.mozVisibilityState );

// Событие смены состояния отображаемости страницы:
// document.onvisibilitychange = function(e){ ... }

document.addEventListener( 'mozvisibilitychange',
                           function(){console.log( document.mozHidden,
                                                   document.mozVisibilityState );} );
</pre>
**Примеры**:
<a href="https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.pagevisibility.html" target="_blank">Page Visibility API example</a>,
<a href="http://davidwalsh.name/demo/page-visibility.php" target="_blank">David Walsh/Page Visibility API/Example</a>,
<a href="http://www.samdutton.com/pageVisibility/" target="_blank">Mozilla/Page Visibility API/Example</a>.

**Источники**:
<a href="http://www.w3.org/TR/page-visibility/" target="_blank">W3C Page Visibility</a>,
<a href="http://davidwalsh.name/page-visibility" target="_blank">David Walsh/Page Visibility API</a>,
<a href="https://developers.google.com/chrome/whitepapers/pagevisibility" target="_blank">Chrome/Page Visibility API</a>,
<a href="https://developer.mozilla.org/en-US/docs/DOM/Using_the_Page_Visibility_API" target="_blank">MDN/Page Visibility API</a>.



##Fullscreen API
Предоставляет возможности работы с полноэкранным режимом.
Реализован с браузерным префиксом.

<pre>
// доступность полноэкранного режима:
// document.fullScreenEnabled = (true|false)

console.log('fullScreenEnabled :', document.mozFullScreenEnabled );

// вывод DOM-ноды в полноэкранном режиме:
// el.requestFullScreen();

document.mozRequestFullScreen();

// элемент, выведенный в полноэкранном режиме:
// document.fullscreenElement

console.log('fullscreenElement:', document.mozFullscreenElement);

// выход из полноэкранного режима:
// document.cancelFullScreen();

document.mozCancelFullScreen();
</pre>
<b>Примеры</b>:
<a href="https://c9.io/sergeymakoveev/examples/workspace/2013.01.trends-of-frontend/api.fullscreen.html" target="_blank">Fullscreen API/Example</a>,
<a href="https://developer.mozilla.org/samples/domref/fullscreen.html" target="_blank">MDN/Fullscreen API/Example</a>,
<a href="http://davidwalsh.name/demo/fullscreen.php" target="_blank">David Walsh/Fullscreen API/Example</a>.
<br />
<b>Источники</b>:
<a href="http://www.w3.org/TR/fullscreen/" target="_blank">W3C Fullscreen</a>,
<a href="https://developer.mozilla.org/en-US/docs/DOM/Using_fullscreen_mode" target="_blank">MDN/Using fullscreen mode</a>,
<a href="http://davidwalsh.name/fullscreen" target="_blank">David Walsh/Fullscreen API</a>.



#Итог
Обобщая развитие веб-стандартов в сфере фронтенд-технологий (css, js, html), можно увидеть общую тенденцию инновационных разработок, конечной целью которых является становление веб-интерфейсов как стандарта де-факто в качестве интерфейсов приложений.
Уже сейчас можно воспользоваться новыми API при помощи [Modernizr](http://modernizr.com/download/).


#Links
<ul>
<li><a href="https://developer.mozilla.org/en-US/docs/Mozilla_event_reference" target="_blank">MDN/Mozilla event reference</a>;</li><li><a href="https://developer.mozilla.org/en-US/docs/tag/DOM" target="_blank">MDN/DOM</a>;</li>
<li><a href="https://developer.mozilla.org/en-US/docs/Mozilla_event_reference" target="_blank">MDN/Mozilla event reference</a>;</li>
<li><a href="http://www.opera.com/docs/specs/productspecs/" target="_blank">Opera/Web specifications</a>;</li>
<li><a href="http://html5demos.com/" target="_blank">HTML 5 Demos and Examples</a>;</li>
<li><a href="http://davidwalsh.name/" target="_blank">David Walsh</a>;</li>
<li><a href="https://dougturner.wordpress.com/" target="_blank">Doug Turner</a>;</li>
<li><a href="https://hacks.mozilla.org/" target="_blank">hacks.mozilla.org</a>;</li>
<li><a href="http://web-standards.ru/category/articles/" target="_blank">Веб-стандарты/Статьи;</a></li>
<li><a href="http://www.w3.org/2009/dap/#roadmap" target="_blank">W3C Device APIs Working Group</a>;</li>
<li><a href="https://dvcs.w3.org/hg/dap/file/" target="_blank">W3C Device APIs Working Group/Mercurial</a>;</li>
<li><a href="http://modernizr.com/download/" target="_blank">Modernizr</a>.</li>
</ul>

[presentation]: http://goo.gl/2CkWb
[w3c-dap]: http://www.w3.org/2009/dap/
           "Device APIs Working Group (DAP)"
[w3c-dap-roadmap]: http://www.w3.org/2009/dap/#roadmap
                   "Device APIs Working Group (DAP): направления"
[firefox mobile beta]: https://play.google.com/store/apps/details?id=org.mozilla.firefox_beta
                       "Google Play: Firefox mobile beta"
[adobe]: https://adobe.com
         "Adobe"
[adobe creative cloud]: https://creative.adobe.com
                        "Adobe Creative Cloud"
