webpackJsonp([23],{0:function(e,t,o){(function(e){"use strict";function t(e){return e&&e.__esModule?e:{"default":e}}var n=(o(3),o(6));t(n);o(17),o(9),o(242);var i=o(4),r=o(5),a=e("body");a.prepend(i).find("script").eq(0).before(r);var f='<div class="sub-header">\n\t\t<div class="sub-header-inner">\n\t\t\t<a href="allDirectionData.html" class="active">八方数据</a>\n\t\t</div>\n\t</div>',l=function(){e(".header").append(f)},c=function(){return location.search&&location.search.slice(1)},s=function(){var t=c()||"BAS_resolve";e(".docs-left a").removeClass("active"),e(".quickStart-left a[href$='"+t+"']").addClass("active")},d=function(){var t=e("#iframe").contents().find("body").outerHeight(!0);e("#iframe").height(t)},h=function(){var e=document.getElementById("iframe");e&&(e.attachEvent?e.attachEvent("onload",function(){d()}):e.onload=function(){d()})},u=function(){var t=e("#iframe"),o=c()||"BAS_resolve",n={BAS_resolve:"accessguide/BAS_resolve.html",CRS_DATA:"accessguide/CRS_DATA.html",mobile_operators:"accessguide/mobile_operators.html"};t.attr("src",n[o]),h()},p=function(e){e<=50&&(e>0&&m?g.css("top",-e):g.css("top",0),m=!0)},A=function(t){w=e(".footer").offset().top,t>50&&(m=!1,b<t&&g.css("top","-50px"),b>t&&g.css("top","0"),b=t),w-g.offset().top<400&&g.css("top","-50px")},v=void 0,g=(e(".sub-header"),e(".header")),b=0,m=(e(".header .main"),!0),w=void 0,_=function(t){v=e(document).scrollTop(),p(v),A(v)};e(function(){e("img.lazy").lazyload(),l(),s(),u(),e(window).scroll(_)})}).call(t,o(2))},17:function(e,t,o){(function(e){"use strict";/*!
	 * Lazy Load - jQuery plugin for lazy loading images
	 *
	 * Copyright (c) 2007-2015 Mika Tuupola
	 *
	 * Licensed under the MIT license:
	 *   http://www.opensource.org/licenses/mit-license.php
	 *
	 * Project home:
	 *   http://www.appelsiini.net/projects/lazyload
	 *
	 * Version:  1.9.7
	 *
	 */
!function(e,t,o,n){var i=e(t);e.fn.lazyload=function(r){function a(){var t=0;l.each(function(){var o=e(this);if(!c.skip_invisible||o.is(":visible"))if(e.abovethetop(this,c)||e.leftofbegin(this,c));else if(e.belowthefold(this,c)||e.rightoffold(this,c)){if(++t>c.failure_limit)return!1}else o.trigger("appear"),t=0})}var f,l=this,c={threshold:0,failure_limit:0,event:"scroll",effect:"show",container:t,data_attribute:"original",skip_invisible:!1,appear:null,load:null,placeholder:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAMAAAAoyzS7AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRF////AAAAVcLTfgAAAAF0Uk5TAEDm2GYAAAAMSURBVHjaYmAACDAAAAIAAU9tWeEAAAAASUVORK5CYII="};return r&&(n!==r.failurelimit&&(r.failure_limit=r.failurelimit,delete r.failurelimit),n!==r.effectspeed&&(r.effect_speed=r.effectspeed,delete r.effectspeed),e.extend(c,r)),f=c.container===n||c.container===t?i:e(c.container),0===c.event.indexOf("scroll")&&f.bind(c.event,function(){return a()}),this.each(function(){var t=this,o=e(t);t.loaded=!1,o.attr("src")!==n&&o.attr("src")!==!1||o.is("img")&&o.attr("src",c.placeholder),o.one("appear",function(){if(!this.loaded){if(c.appear){var n=l.length;c.appear.call(t,n,c)}e("<img />").bind("load",function(){var n=o.attr("data-"+c.data_attribute);o.hide(),o.is("img")?o.attr("src",n):o.css("background-image","url('"+n+"')"),o[c.effect](c.effect_speed),t.loaded=!0;var i=e.grep(l,function(e){return!e.loaded});if(l=e(i),c.load){var r=l.length;c.load.call(t,r,c)}}).attr("src",o.attr("data-"+c.data_attribute))}}),0!==c.event.indexOf("scroll")&&o.bind(c.event,function(){t.loaded||o.trigger("appear")})}),i.bind("resize",function(){a()}),/(?:iphone|ipod|ipad).*os 5/gi.test(navigator.appVersion)&&i.bind("pageshow",function(t){t.originalEvent&&t.originalEvent.persisted&&l.each(function(){e(this).trigger("appear")})}),e(o).ready(function(){a()}),this},e.belowthefold=function(o,r){var a;return a=r.container===n||r.container===t?(t.innerHeight?t.innerHeight:i.height())+i.scrollTop():e(r.container).offset().top+e(r.container).height(),a<=e(o).offset().top-r.threshold},e.rightoffold=function(o,r){var a;return a=r.container===n||r.container===t?i.width()+i.scrollLeft():e(r.container).offset().left+e(r.container).width(),a<=e(o).offset().left-r.threshold},e.abovethetop=function(o,r){var a;return a=r.container===n||r.container===t?i.scrollTop():e(r.container).offset().top,a>=e(o).offset().top+r.threshold+e(o).height()},e.leftofbegin=function(o,r){var a;return a=r.container===n||r.container===t?i.scrollLeft():e(r.container).offset().left,a>=e(o).offset().left+r.threshold+e(o).width()},e.inviewport=function(t,o){return!(e.rightoffold(t,o)||e.leftofbegin(t,o)||e.belowthefold(t,o)||e.abovethetop(t,o))},e.extend(e.expr[":"],{"below-the-fold":function(t){return e.belowthefold(t,{threshold:0})},"above-the-top":function(t){return!e.belowthefold(t,{threshold:0})},"right-of-screen":function(t){return e.rightoffold(t,{threshold:0})},"left-of-screen":function(t){return!e.rightoffold(t,{threshold:0})},"in-viewport":function(t){return e.inviewport(t,{threshold:0})},"above-the-fold":function(t){return!e.belowthefold(t,{threshold:0})},"right-of-fold":function(t){return e.rightoffold(t,{threshold:0})},"left-of-fold":function(t){return!e.rightoffold(t,{threshold:0})}})}(e,window,document)}).call(t,o(2))},242:269});