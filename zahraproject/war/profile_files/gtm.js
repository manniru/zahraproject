// Copyright 2012 Google Inc. All rights reserved.
// Container Version: 12
(function(w,g){w[g]=w[g]||{};w[g].e=function(s){return eval(s);};})(window,'google_tag_manager');(function(){
var k=this,aa=null;/*
 jQuery v1.9.1 (c) 2005, 2012 jQuery Foundation, Inc. jquery.org/license. */
var ba=/\[object (Boolean|Number|String|Function|Array|Date|RegExp)\]/,ca=function(a,c){return Object.prototype.hasOwnProperty.call(Object(a),c)},da=function(a){var c;if(!(c=!a)){var d;if(null==a)d=String(a);else{var b=ba.exec(Object.prototype.toString.call(Object(a)));d=b?b[1].toLowerCase():"object"}c="object"!=d||a.nodeType||a==a.window}if(c)return!1;try{if(a.constructor&&!ca(a,"constructor")&&!ca(a.constructor.prototype,"isPrototypeOf"))return!1}catch(e){return!1}for(var f in a);return void 0===
f||ca(a,f)};var ea=function(){},s=function(a){return"function"==typeof a},x=function(a){return"[object Array]"==Object.prototype.toString.call(Object(a))},fa=function(a,c){if(Array.prototype.indexOf){var d=a.indexOf(c);return"number"==typeof d?d:-1}for(var b=0;b<a.length;b++)if(a[b]===c)return b;return-1},ga=function(a){return a?a.replace(/^\s+|\s+$/g,""):""},ha=function(a){return Math.round(Number(a))||0},ia=function(a){var c=[];if(x(a))for(var d=0;d<a.length;d++)c.push(String(a[d]));return c},y=function(){this.prefix=
"gtm.";this.w={}};y.prototype.set=function(a,c){this.w[this.prefix+a]=c};y.prototype.get=function(a){return this.w[this.prefix+a]};y.prototype.contains=function(a){return void 0!==this.get(a)};
var ja=function(a,c,d){try{return a["13"](a,c||ea,d||ea)}catch(b){}return!1},ka=function(a,c){function d(b,c){a.contains(b)||a.set(b,[]);a.get(b).push(c)}for(var b=ga(c).split("&"),e=0;e<b.length;e++)if(b[e]){var f=b[e].indexOf("=");0>f?d(b[e],"1"):d(b[e].substring(0,f),b[e].substring(f+1))}},la=function(a){var c=a?a.length:0;return 0<c?a[c-1]:""},ma=function(a){for(var c=0;c<a.length;c++)a[c]()},na=function(){var a=this;this.p=!1;this.K=[];this.J=[];this.ya=function(){a.p||ma(a.K);
a.p=!0};this.xa=function(){a.p||ma(a.J);a.p=!0}},oa=function(){this.M=[];this.o=0};oa.prototype.addListener=function(a){this.M.push(a)};var pa=function(a,c){if(!c.p){a.o++;var d=function(){0<a.o&&a.o--;0<a.o||ma(a.M)};c.K.push(d);c.J.push(d)}},qa=(new Date).getTime();var A=window,B=document,D=function(a,c){var d=A[a],b="var "+a+";";if(k.execScript)k.execScript(b,"JavaScript");else if(k.eval)if(null==aa&&(k.eval("var _et_ = 1;"),"undefined"!=typeof k._et_?(delete k._et_,aa=!0):aa=!1),aa)k.eval(b);else{var e=k.document,f=e.createElement("script");f.type="text/javascript";f.defer=!1;f.appendChild(e.createTextNode(b));e.body.appendChild(f);e.body.removeChild(f)}else throw Error("goog.globalEval not available");A[a]=void 0===d?c:d;return A[a]},F=function(a,c,d){return("http:"==
A.location.protocol?c:a)+d},ra=function(a){var c=B.getElementsByTagName("script")[0];c.parentNode.insertBefore(a,c)},sa=function(a,c){c&&(a.addEventListener?a.onload=c:a.onreadystatechange=function(){a.readyState in{loaded:1,complete:1}&&(a.onreadystatechange=null,c())})},I=function(a,c,d){var b=B.createElement("script");b.type="text/javascript";b.async=!0;b.src=a;sa(b,c);d&&(b.onerror=d);ra(b)},ta=function(a,c){var d=B.createElement("iframe");d.height="0";d.width="0";d.style.display="none";d.style.visibility=
"hidden";ra(d);sa(d,c);void 0!==a&&(d.src=a);return d},J=function(a,c,d){var b=new Image(1,1);b.onload=function(){b.onload=null;c&&c()};b.onerror=function(){b.onerror=null;d&&d()};b.src=a},K=function(a,c,d,b){a.addEventListener?a.addEventListener(c,d,!!b):a.attachEvent&&a.attachEvent("on"+c,d)},L=function(a){A.setTimeout(a,0)},ua=!1,M=[],va=function(a){if(!(a&&"readystatechange"==a.type&&"interactive"!=B.readyState&&"complete"!=B.readyState||ua)){ua=!0;for(var c=0;c<M.length;c++)M[c]()}},wa=0,xa=
function(){if(!ua&&140>wa){wa++;try{B.documentElement.doScroll("left"),va()}catch(a){A.setTimeout(xa,50)}}},ya=!1,za=[],Aa=function(){if(!ya){ya=!0;for(var a=0;a<za.length;a++)za[a]()}};var Ba=new y,Ca=new y,Da=ea,N=[],Ea=!1,Fa=function(a){var c=!1;return function(){!c&&s(a)&&L(a);c=!0}},Ha=function(){for(var a=!1;!Ea&&0<N.length;){Ea=!0;var c;var d=N.shift(),b=void 0;for(b in d)if(d.hasOwnProperty(b)){var e=b,f=d[b];Ba.set(e,f);for(var g=Ga,h=f,m={},n=m,l=e.split("."),q=0;q<l.length-1;q++)n=n[l[q]]={};n[l[l.length-1]]=h;g(m,Ca.w)}var p=d.event;if(p){var r=Fa(d.eventCallback),E=d.eventTimeout;E&&A.setTimeout(r,Number(E));c=Da(p,r)}else c=!1;a=c||a;Ea=!1}return!a},O=function(a,c){if(2==
c){for(var d=Ca.w,b=a.split("."),e=0;e<b.length;e++){if(void 0===d[b[e]])return;d=d[b[e]]}return d}return Ba.get(a)},Ga=function(a,c){for(var d in a)if(ca(a,d)){var b=a[d];x(b)?(x(c[d])||(c[d]=[]),Ga(b,c[d])):da(b)?(da(c[d])||(c[d]={}),Ga(b,c[d])):c[d]=b}};var Ia={customPixels:["nonGooglePixels"],html:["customScripts","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],customScripts:["html","customPixels","nonGooglePixels","nonGoogleScripts","nonGoogleIframes"],nonGooglePixels:[],nonGoogleScripts:["nonGooglePixels"],nonGoogleIframes:["nonGooglePixels"]},Ja={customPixels:["customScripts","html"],html:["customScripts"],customScripts:["html"],nonGooglePixels:["customPixels","customScripts","html","nonGoogleScripts","nonGoogleIframes"],
nonGoogleScripts:["customScripts","html"],nonGoogleIframes:["customScripts","html","nonGoogleScripts"]},Ka=function(a,c){for(var d=[],b=0;b<a.length;b++)d.push(a[b]),d.push.apply(d,c[a[b]]||[]);return d},La=function(){var a=O("gtm.whitelist"),c=a&&Ka(ia(a),Ia),d=O("gtm.blacklist")||O("tagTypeBlacklist"),b=d&&Ka(ia(d),Ja),e={};return function(f){var g=f&&f["13"];if(!g)return!0;if(void 0!==e[g.b])return e[g.b];var h=!0;if(a)e:{if(0>fa(c,g.b))if(g.c&&0<g.c.length)for(var m=0;m<g.c.length;m++){if(0>
fa(c,g.c[m])){h=!1;break e}}else{h=!1;break e}h=!0}var n=!1;if(d){var l;if(!(l=0<=fa(b,g.b)))e:{for(var q=g.c||[],p=new y,r=0;r<b.length;r++)p.set(b[r],!0);for(r=0;r<q.length;r++)if(p.get(q[r])){l=!0;break e}l=!1}n=l}return e[g.b]=!h||n}};var Ma=null;var _e=function(){return Ma};_e.b="e";_e.c=["google"];var _v=function(a){var c=O(a["19"].replace(/\\\./g,"."),a[""]);return void 0!==c?c:a[""]};_v.b="v";_v.c=["google"];var Na=function(){return String(O("gtm.referrer")||B.referrer)},_f=Na;_f.b="f";_f.c=["google"];
var Oa=B.createElement("a"),_u=function(a){var c=A.location,d=c.hash?c.href.replace(c.hash,""):c.href,b=O("gtm.url");b&&(Oa.href=d=String(b),c=Oa);var e=(c.protocol.replace(":","")||A.location.protocol.replace(":","")).toLowerCase();switch(a["5"]){case "protocol":d=e;break;case "host":d=(c.hostname||A.location.hostname).split(":")[0].toLowerCase();break;case "port":d=String(1*(c.hostname?c.port:A.location.port)||("http"==e?80:"https"==e?443:""));break;case "path":d="/"==c.pathname.substr(0,1)?c.pathname:"/"+c.pathname;
break;case "query":d=c.search.replace("?","");break;case "fragment":d=c.hash.replace("#","")}
return d};_u.b="u";_u.c=["google"];var _eq=function(a){return String(a["1"])==String(a["2"])};_eq.b="eq";_eq.c=["google"];var _re=function(a){return RegExp(a["2"],a[""]?"i":void 0).test(a["1"])};_re.b="re";_re.c=["google"];var _awct=function(a,c,d){I("//www.googleadservices.com/pagead/conversion_async.js",function(){var b=A.google_trackConversion;s(b)?(b({google_conversion_id:a["15"],google_conversion_label:a["17"],google_conversion_value:a["26"]||0}),c()):d()},d)};_awct.b="awct";_awct.c=["google"];var Q,Ta,Ua,Va,Wa=function(){return k.navigator?k.navigator.userAgent:null};Va=Ua=Ta=Q=!1;var Xa;if(Xa=Wa()){var Ya=k.navigator;Q=0==Xa.lastIndexOf("Opera",0);Ta=!Q&&(-1!=Xa.indexOf("MSIE")||-1!=Xa.indexOf("Trident"));Ua=!Q&&-1!=Xa.indexOf("WebKit");Va=!Q&&!Ua&&!Ta&&"Gecko"==Ya.product}var R=Ta,Za=Va,$a=Ua,cb=function(){var a=k.document;return a?a.documentMode:void 0},db;
e:{var eb="",fb;if(Q&&k.opera)var gb=k.opera.version,eb="function"==typeof gb?gb():gb;else if(Za?fb=/rv\:([^\);]+)(\)|;)/:R?fb=/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/:$a&&(fb=/WebKit\/(\S+)/),fb)var hb=fb.exec(Wa()),eb=hb?hb[1]:"";if(R){var ib=cb();if(ib>parseFloat(eb)){db=String(ib);break e}}db=eb}
var jb=db,kb={},S=function(a){var c;if(!(c=kb[a])){for(var d=0,b=String(jb).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split("."),e=String(a).replace(/^[\s\xa0]+|[\s\xa0]+$/g,"").split("."),f=Math.max(b.length,e.length),g=0;0==d&&g<f;g++){var h=b[g]||"",m=e[g]||"",n=RegExp("(\\d*)(\\D*)","g"),l=RegExp("(\\d*)(\\D*)","g");do{var q=n.exec(h)||["","",""],p=l.exec(m)||["","",""];if(0==q[0].length&&0==p[0].length)break;d=((0==q[1].length?0:parseInt(q[1],10))<(0==p[1].length?0:parseInt(p[1],10))?-1:(0==q[1].length?
0:parseInt(q[1],10))>(0==p[1].length?0:parseInt(p[1],10))?1:0)||((0==q[2].length)<(0==p[2].length)?-1:(0==q[2].length)>(0==p[2].length)?1:0)||(q[2]<p[2]?-1:q[2]>p[2]?1:0)}while(0==d)}c=kb[a]=0<=d}return c},lb=k.document,mb=lb&&R?cb()||("CSS1Compat"==lb.compatMode?parseInt(jb,10):5):void 0;if(Za||R){var nb;if(nb=R)nb=R&&9<=mb;nb||Za&&S("1.9.1")}R&&S("9");var sb=function(a,c){var d="";R&&!ob(a)&&(d='<script>document.domain="'+document.domain+'";\x3c/script>'+d);var b="<!DOCTYPE html><html><head><script>var inDapIF=true;\x3c/script>"+d+"</head><body>"+c+"</body></html>";if(pb)a.srcdoc=b;else if(qb){var e=a.contentWindow.document;e.open("text/html","replace");e.write(b);e.close()}else rb(a,b)},pb=$a&&"srcdoc"in document.createElement("iframe"),qb=Za||$a,rb=function(a,c){R&&S(7)&&!S(10)&&tb(c)&&(c=ub(c));var d=function(){a.contentWindow.goog_content=
c;a.src="javascript:window.goog_content"};R&&!ob(a)?vb(a,d):d()},ob=function(a){try{return Boolean(a.contentWindow.document)}catch(c){return!1}},wb=0,vb=function(a,c){var d="goog_rendering_callback"+wb++;window[d]=c;R&&S(6)&&!S(7)?a.src="javascript:'<script>window.onload = function() { document.write(\\'<script>(function() {document.domain = \""+document.domain+'";var continuation = window.parent.'+d+";window.parent."+d+" = null;continuation()})()<\\\\/script>\\');document.close();};\x3c/script>'":
a.src="javascript:'<script>(function() {document.domain = \""+document.domain+'";var continuation = window.parent.'+d+";window.parent."+d+" = null;continuation();})()\x3c/script>'"},tb=function(a){for(var c=0;c<a.length;++c)if(127<a.charCodeAt(c))return!0;return!1},ub=function(a){for(var c=unescape(encodeURIComponent(a)),d=Math.floor(c.length/2),b=[],e=0;e<d;++e)b[e]=String.fromCharCode(256*c.charCodeAt(2*e+1)+c.charCodeAt(2*e));1==c.length%2&&(b[d]=c.charAt(c.length-1));return b.join("")};/*
 Copyright (c) 2013 Derek Brans, MIT license https://github.com/krux/postscribe/blob/master/LICENSE. Portions derived from simplehtmlparser, which is licensed under the Apache License, Version 2.0 */

var xb,yb=function(){};(function(){function a(a,g){a=a||"";g=g||{};for(var n in c)c.hasOwnProperty(n)&&(g.da&&(g["fix_"+n]=!0),g.aa=g.aa||g["fix_"+n]);var l={Z:/^\x3c!--/,s:/^<\//,X:/^<\s*(script|style|noscript|iframe|textarea)[\s>]/i,n:/^</,Y:/^[^<]/},q={Z:function(){var b=a.indexOf("--\x3e");if(0<=b)return{content:a.substr(4,b),length:b+3}},s:function(){var c=a.match(b);if(c)return{tagName:c[1],length:c[0].length}},X:function(){var b=q.n();if(b){var c=a.slice(b.length);if(c.match(RegExp("</\\s*"+
b.tagName+"\\s*>","i"))){var d=c.match(RegExp("([\\s\\S]*?)</\\s*"+b.tagName+"\\s*>","i"));if(d)return{tagName:b.tagName,f:b.f,content:d[1],length:d[0].length+b.length}}}},n:function(){var b=a.match(d);if(b){var c={};b[2].replace(e,function(a,b,d,e,q){var g=d||e||q||f.test(b)&&b||null;c[b]=g});return{tagName:b[1],f:c,j:!!b[3],length:b[0].length}}},Y:function(){var b=a.indexOf("<");return{length:0<=b?b:a.length}}},p=function(){for(var b in l)if(l[b].test(a)){var c=q[b]();return c?(c.type=c.type||b,
c.text=a.substr(0,c.length),a=a.slice(c.length),c):null}};g.aa&&function(){var b=/^(AREA|BASE|BASEFONT|BR|COL|FRAME|HR|IMG|INPUT|ISINDEX|LINK|META|PARAM|EMBED)$/i,c=/^(COLGROUP|DD|DT|LI|OPTIONS|P|TD|TFOOT|TH|THEAD|TR)$/i,d=[];d.ba=function(){return this[this.length-1]};d.L=function(a){var b=this.ba();return b&&b.tagName&&b.tagName.toUpperCase()===a.toUpperCase()};d.va=function(a){for(var b=0,c;c=this[b];b++)if(c.tagName===a)return!0;return!1};var e=function(a){a&&"startTag"===a.type&&(a.j=b.test(a.tagName)||
a.j);return a},f=p,q=function(){a="</"+d.pop().tagName+">"+a},n={n:function(b){var e=b.tagName;"TR"===e.toUpperCase()&&d.L("TABLE")?(a="<TBODY>"+a,l()):g.Sa&&c.test(e)&&d.va(e)?d.L(e)?q():(a="</"+b.tagName+">"+a,l()):b.j||d.push(b)},s:function(a){d.ba()?g.wa&&!d.L(a.tagName)?q():d.pop():g.wa&&(f(),l())}},l=function(){var b=a,c=e(f());a=b;if(c&&n[c.type])n[c.type](c)};p=function(){l();return e(f())}}();return{append:function(b){a+=b},ea:p,Ta:function(a){for(var b;(b=p())&&(!a[b.type]||!1!==a[b.type](b)););
},clear:function(){var b=a;a="";return b},Ua:function(){return a},stack:[]}}var c=function(){var a={},b=this.document.createElement("div");b.innerHTML="<P><I></P></I>";a.Wa="<P><I></P></I>"!==b.innerHTML;b.innerHTML="<P><i><P></P></i></P>";a.Va=2===b.childNodes.length;return a}(),d=/^<([\-A-Za-z0-9_]+)((?:\s+[\w\-]+(?:\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/,b=/^<\/([\-A-Za-z0-9_]+)[^>]*>/,e=/([\-A-Za-z0-9_]+)(?:\s*=\s*(?:(?:"((?:\\.|[^"])*)")|(?:'((?:\\.|[^'])*)')|([^>\s]+)))?/g,
f=/^(checked|compact|declare|defer|disabled|ismap|multiple|nohref|noresize|noshade|nowrap|readonly|selected)$/i;a.supports=c;a.Xa=function(a){var b={Z:function(a){return"<--"+a.content+"--\x3e"},s:function(a){return"</"+a.tagName+">"},X:function(a){return b.n(a)+a.content+b.s(a)},n:function(a){var b="<"+a.tagName,c;for(c in a.f)var d=a.f[c],b=b+(" "+c+'="'+(d?d.replace(/(^|[^\\])"/g,'$1\\"'):"")+'"');return b+(a.j?"/>":">")},Y:function(a){return a.text}};return b[a.type](a)};a.Ra=function(a){var b=
{},c;for(c in a){var d=a[c];b[c]=d&&d.replace(/(^|[^\\])"/g,'$1\\"')}return b};for(var g in c)a.ua=a.ua||!c[g]&&g;xb=a})();(function(){function a(){}function c(a,b){var c,d=a&&a.length||0;for(c=0;c<d;c++)b.call(void 0,a[c],c)}function d(a,b){for(var c in a)a.hasOwnProperty(c)&&b.call(void 0,c,a[c])}function b(a,b){d(b,function(b,c){a[b]=c});return a}function e(a,b){a=a||{};d(b,function(b,c){null==a[b]&&(a[b]=c)});return a}function f(a){try{return h.call(a)}catch(b){var d=[];c(a,function(a){d.push(a)});
return d}}var g=this;if(!g.U){var h=Array.prototype.slice,m=function(){function a(b,c,d){var e="data-ps-"+c;if(2===arguments.length){var f=b.getAttribute(e);return null==f?f:String(f)}null!=d&&""!==d?b.setAttribute(e,d):b.removeAttribute(e)}function e(c,d){var f=c.ownerDocument;b(this,{root:c,options:d,m:f.defaultView||f.parentWindow,C:f,G:xb("",{da:!0}),B:[c],H:"",I:f.createElement(c.nodeName),k:[],h:[]});a(this.I,"proxyof",0)}e.prototype.write=function(){[].push.apply(this.h,arguments);for(var a;!this.r&&
this.h.length;)a=this.h.shift(),"function"===typeof a?this.ka(a):this.W(a)};e.prototype.ka=function(a){var b={type:"function",value:a.name||a.toString()};this.F(b);a.call(this.m,this.C);this.T(b)};e.prototype.W=function(a){this.G.append(a);for(var b,c=[];(b=this.G.ea())&&!/^script$/i.test(b.tagName);)c.push(b);this.ta(c);b&&this.la(b)};e.prototype.ta=function(a){var b=this.ia(a);b.S&&(b.ma=this.H+b.S,this.H+=b.pa,this.I.innerHTML=b.ma,this.ra())};e.prototype.ia=function(a){var b=this.B.length,d=[],
e=[],f=[];c(a,function(a){d.push(a.text);if(a.f){if(!/^noscript$/i.test(a.tagName)){var c=b++;e.push(a.text.replace(/(\/?>)/," data-ps-id="+c+" $1"));"ps-script"!==a.f.id&&f.push("atomicTag"===a.type?"":"<"+a.tagName+" data-ps-proxyof="+c+(a.j?"/>":">"))}}else e.push(a.text),f.push("endTag"===a.type?a.text:"")});return{A:a,Qa:d.join(""),S:e.join(""),pa:f.join("")}};e.prototype.ra=function(){for(var b,c=[this.I];null!=(b=c.shift());){var d=1===b.nodeType;if(!d||!a(b,"proxyof")){d&&(this.B[a(b,"id")]=
b,a(b,"id",null));var e=b.parentNode&&a(b.parentNode,"proxyof");e&&this.B[e].appendChild(b)}c.unshift.apply(c,f(b.childNodes))}};e.prototype.la=function(a){var b=this.G.clear();b&&this.h.unshift(b);a.src=a.f.src||a.f.La;a.src&&this.k.length?this.r=a:this.F(a);var c=this;this.sa(a,function(){c.T(a)})};e.prototype.F=function(a){a.oa=this.h;this.h=[];this.k.unshift(a)};e.prototype.T=function(a){a!==this.k[0]?this.options.error({message:"Bad script nesting or script finished twice"}):(this.k.shift(),
this.write.apply(this,a.oa),!this.k.length&&this.r&&(this.F(this.r),this.r=null))};e.prototype.sa=function(a,b){var c=this.ja(a);a.src&&(c.src=a.src,this.qa(c,b));try{this.na(c),a.src||b()}catch(d){this.options.error(d),b()}};e.prototype.ja=function(a){var b=this.C.createElement(a.tagName);d(a.f,function(a,c){b.setAttribute(a,c)});a.content&&(b.text=a.content);return b};e.prototype.na=function(a){this.W('<span id="ps-script"/>');var b=this.C.getElementById("ps-script");b.parentNode.replaceChild(a,
b)};e.prototype.qa=function(a,c){function d(){a=a.onload=a.onreadystatechange=a.onerror=null;c()}var e=this.options.error;b(a,{onload:function(){d()},onreadystatechange:function(){/^(loaded|complete)$/.test(a.readyState)&&d()},onerror:function(){e({message:"remote script failed "+a.src});d()}})};return e}();yb=function(){function c(){var a=p.shift();a&&(a.V=d.apply(null,a))}function d(e,g,l){function p(a){a=l.ha(a);r.write(a);l.fa(a)}r=new m(e,l);r.id=h++;r.name=l.name||r.id;var u=e.ownerDocument,
G={write:u.write,writeln:u.writeln};b(u,{write:function(){return p(f(arguments).join(""))},writeln:function(a){return p(f(arguments).join("")+"\n")}});var t=r.m.onerror||a;r.m.onerror=function(a,b,c){l.error({Oa:a+" - "+b+":"+c});t.apply(r.m,arguments)};r.write(g,function(){b(u,G);r.m.onerror=t;l.D();r=null;c()});return r}var h=0,p=[],r=null;return b(function(b,d,f){"function"===typeof f&&(f={D:f});f=e(f,{D:a,error:function(a){throw a;},ha:function(a){return a},fa:a});b=/^#/.test(b)?g.document.getElementById(b.substr(1)):
b.Na?b[0]:b;var h=[b,d,f];b.U={cancel:function(){h.V?h.V.abort():h[1]=a}};p.push(h);r||c();return b.U},{Pa:p,Ma:m})}()}})();
var zb=function(a,c,d){return function(){if(0<c.length){var b=c.shift(),e=zb(a,c,d);if("SCRIPT"==b.nodeName&&"text/gtmscript"==b.type){var f=B.createElement("script");f.async=!1;f.type="text/javascript";f.text=b.text||b.textContent||b.innerHTML||"";b.charset&&(f.charset=b.charset);var g=b.getAttribute("data-gtmsrc");g&&(f.src=g,sa(f,e));a.insertBefore(f,null);g||e()}else if(b.innerHTML&&0<=b.innerHTML.toLowerCase().indexOf("<script")){for(var h=[];b.firstChild;)h.push(b.removeChild(b.firstChild));a.insertBefore(b,
null);zb(b,h,e)()}else a.insertBefore(b,null),e()}else d()}},Ab=function(a){var c=B.createElement("div");c.innerHTML="A<div>"+a+"</div>";for(var c=c.lastChild,d=[];c.firstChild;)d.push(c.removeChild(c.firstChild));return d};var Bb=function(a,c,d){var b=function(){var b={D:c},f=B.createElement("div");f.style.display="none";f.style.visibility="hidden";B.body.appendChild(f);try{yb(f,a["14"],b)}catch(g){L(d)}};ua?b():M.push(b)};
var Cb=function(a,c,d){B.body?a[""]?(sb(ta(),"<script>var google_tag_manager=parent.google_tag_manager;\x3c/script>"+a["14"]),L(c)):a["25"]?Bb(a,c,d):zb(B.body,Ab(a["14"]),c)():A.setTimeout(function(){Cb(a,c,d)},200)},_html=Cb;_html.b="html";_html.c=["customScripts"];var Eb=function(a,c,d){return function(b){b=b||A.event;var e=b.target||b.srcElement||{};if("LINK_CLICK"==a){for(var f=e,g=0;f&&"a"!=String(f.tagName).toLowerCase()&&100>g;g++)f=f.parentElement;f&&"a"!=String(f.tagName).toLowerCase()&&(f=null);e=f}if(b.defaultPrevented||!1===b.returnValue||b.Ja&&b.Ja()){if(!d&&e){var h={};T(a,e,h);h.simulateDefault=!1}}else{if(e){var h={},m=T(a,e,h);h.simulateDefault=!m&&c;if(!m&&c){var n=Db(e).toLowerCase();switch(n){case "_blank":h.targetWindowName="gtm_autoEvent_"+
(new Date).getTime();h.targetWindow=A.open("",h.targetWindowName);break;case "":h.targetWindow=A.frames.self;break;case "_self":case "_parent":case "_top":h.targetWindow=A.frames[n.substring(1)];break;default:A.frames[n]||(h.targetWindowName=n),h.targetWindow=A.frames[n]||A.open("",n)}b.preventDefault&&b.preventDefault()}b.returnValue=m||!c;return m||!c}return!0}}},T=function(a,c,d){var b={"gtm.element":c,"gtm.elementClasses":c.className,"gtm.elementId":c["for"]||c.id,"gtm.elementTarget":c.formTarget||
c.target||""};switch(a){case "LINK_CLICK":b.event="gtm.linkClick";b["gtm.elementUrl"]=c.href;b.eventTimeout=2E3;b.eventCallback=Fb(c,d);break;case "FORM_SUBMIT":b.event="gtm.formSubmit";b["gtm.elementUrl"]=c.action;b.eventTimeout=2E3;b.eventCallback=Gb(c,d);break;case "CLICK":b.event="gtm.click";b["gtm.elementUrl"]=c.formAction||c.action||c.href||c.src||c.code||c.codebase||"";break;default:return!0}return A["dataLayer"].push(b)},Db=function(a){var c=a.target;if(!c)switch(String(a.tagName).toLowerCase()){case "a":case "form":c=
"_self"}return c},Fb=function(a,c,d){return function(){c.simulateDefault&&(c.targetWindow?c.targetWindow.location.href=a.href:(d=d||(new Date).getTime(),500>(new Date).getTime()-d&&A.setTimeout(Fb(a,c,d),25)))}},Gb=function(a,c,d){return function(){if(c.simulateDefault)if(c.targetWindow){var b;c.targetWindowName&&(b=a.target,a.target=c.targetWindowName);a.submit();c.targetWindowName&&(a.target=b)}else d=d||(new Date).getTime(),500>(new Date).getTime()-d&&A.setTimeout(Gb(a,c,d),25)}},Hb=function(a,
c,d){var b,e;switch(a){case "CLICK":if(B.gtmHasClickListenerTag)return;B.gtmHasClickListenerTag=!0;b="click";e=function(a){T("CLICK",a.target||a.srcElement||{},{});return!0};break;case "LINK_CLICK":b="click";e=Eb(a,!0,!0);break;case "FORM_SUBMIT":if(B.gtmHasFormSubmitListenerTag)return;B.gtmHasFormSubmitListenerTag=!0;b="submit";e=Eb(a,c||!1,d||!1);break;default:return}K(B,b,e,!1)};var Kb,Lb;
var Tb=function(a){return function(){}},Ub=function(a){return function(){}};
var $b=!1,ac=!1,_ga=function(a,c,d){function b(a){var b=[].slice.call(arguments,0);b[0]=q+b[0];l.push(b)}function e(c,d){void 0!==a[d]&&b(c,a[d])}function f(c,d){void 0!==a[d]&&b(c,Number(a[d]))}function g(a,c){if(c)for(var d=0;d<c.length;d++){var e=[a];x(c[d])?e.push.apply(e,c[d]):e.push(c[d]);"_setCustomVar"==e[0]&&void 0===e[3]||b.apply(this,e)}}function h(c,d){void 0!==a[d]&&b("_set",c,a[d])}function m(b,c){void 0!==a[c]&&(p+="&"+b+"="+a[c])}function n(a,b){p+="&"+a+"="+b}var l=D("_gaq",[]),q=
"";void 0==a[""]?q="gtm"+qa++ +".":""!==a[""]&&(q=a[""]+".");e("_setAccount","0");
h("page","21");var p="";
if(""!==p){var r=new y,E="?"==A.location.search.charAt(0)?A.location.search.substring(1):A.location.search,z="#"==A.location.hash.charAt(0)?A.location.hash.substring(1):A.location.hash;E&&ka(r,E);z&&a[""]&&ka(r,z);r.contains("gclid")&&n("gclid",la(r.get("gclid")));r.contains("gclsrc")&&n("gclsrc",la(r.get("gclsrc")));r.contains("dclid")&&n("dclid",la(r.get("dclid")));b("_set","campaignParams",p)}a["18"]&&b("_require","inpage_linkid","//www.google-analytics.com/plugins/ga/inpage_linkid.js");
e("_setCampaignTrack","3");e("_setClientInfo","4");e("_setDetectFlash","7");e("_setDetectTitle",
"8");b("_set","hitCallback",
function(){if(s(a[""]))a[""]();c()});if(a["24"]){var v=void 0==a["12"]?a["12"]:ha(a["12"]);b("_trackEvent",a["10"],a["9"],a["11"],v,a["20"]);}else if(a[""]){}else if(a[""]){}else if(a[""]){}else if(a[""]){}else if(a[""]){}else if(a[""]){}else if(a[""]){}else b("_trackPageview");
var P=function(){A._gat||d()};if(a[""])ac||(ac=!0,I(F("https://","http://","stats.g.doubleclick.net/dc.js"),P,d));else if(!$b){var X=a["6"]?".google-analytics.com/u/ga_debug.js":".google-analytics.com/ga.js";$b=!0;I(F("https://ssl","http://www",X),P,d)}};_ga.b="ga";_ga.c=["google"];
var U=[],ec={"\x00":"&#0;",'"':"&quot;","&":"&amp;","'":"&#39;","<":"&lt;",">":"&gt;","\t":"&#9;","\n":"&#10;","\x0B":"&#11;","\f":"&#12;","\r":"&#13;"," ":"&#32;","-":"&#45;","/":"&#47;","=":"&#61;","`":"&#96;","\u0085":"&#133;","\u00a0":"&#160;","\u2028":"&#8232;","\u2029":"&#8233;"},fc=function(a){return ec[a]},gc=/[\x00\x22\x26\x27\x3c\x3e]/g;U[3]=function(a){return String(a).replace(gc,fc)};var kc=/[\x00\x08-\x0d\x22\x26\x27\/\x3c-\x3e\\\x85\u2028\u2029]/g,lc={"\x00":"\\x00","\b":"\\x08","\t":"\\t","\n":"\\n","\x0B":"\\x0b","\f":"\\f",
"\r":"\\r",'"':"\\x22","&":"\\x26","'":"\\x27","/":"\\/","<":"\\x3c","=":"\\x3d",">":"\\x3e","\\":"\\\\","\u0085":"\\x85","\u2028":"\\u2028","\u2029":"\\u2029",$:"\\x24","(":"\\x28",")":"\\x29","*":"\\x2a","+":"\\x2b",",":"\\x2c","-":"\\x2d",".":"\\x2e",":":"\\x3a","?":"\\x3f","[":"\\x5b","]":"\\x5d","^":"\\x5e","{":"\\x7b","|":"\\x7c","}":"\\x7d"},mc=function(a){return lc[a]};

var sc=/['()]/g,tc=function(a){return"%"+a.charCodeAt(0).toString(16)};U[12]=function(a){var c=encodeURIComponent(String(a));sc.lastIndex=
0;return sc.test(c)?c.replace(sc,tc):c};var uc=/[\x00- \x22\x27-\x29\x3c\x3e\\\x7b\x7d\x7f\x85\xa0\u2028\u2029\uff01\uff03\uff04\uff06-\uff0c\uff0f\uff1a\uff1b\uff1d\uff1f\uff20\uff3b\uff3d]/g,vc={"\x00":"%00","\u0001":"%01","\u0002":"%02","\u0003":"%03","\u0004":"%04","\u0005":"%05","\u0006":"%06","\u0007":"%07","\b":"%08","\t":"%09","\n":"%0A","\x0B":"%0B","\f":"%0C","\r":"%0D","\u000e":"%0E","\u000f":"%0F","\u0010":"%10","\u0011":"%11","\u0012":"%12","\u0013":"%13",
"\u0014":"%14","\u0015":"%15","\u0016":"%16","\u0017":"%17","\u0018":"%18","\u0019":"%19","\u001a":"%1A","\u001b":"%1B","\u001c":"%1C","\u001d":"%1D","\u001e":"%1E","\u001f":"%1F"," ":"%20",'"':"%22","'":"%27","(":"%28",")":"%29","<":"%3C",">":"%3E","\\":"%5C","{":"%7B","}":"%7D","\u007f":"%7F","\u0085":"%C2%85","\u00a0":"%C2%A0","\u2028":"%E2%80%A8","\u2029":"%E2%80%A9","\uff01":"%EF%BC%81","\uff03":"%EF%BC%83","\uff04":"%EF%BC%84","\uff06":"%EF%BC%86","\uff07":"%EF%BC%87","\uff08":"%EF%BC%88","\uff09":"%EF%BC%89",
"\uff0a":"%EF%BC%8A","\uff0b":"%EF%BC%8B","\uff0c":"%EF%BC%8C","\uff0f":"%EF%BC%8F","\uff1a":"%EF%BC%9A","\uff1b":"%EF%BC%9B","\uff1d":"%EF%BC%9D","\uff1f":"%EF%BC%9F","\uff20":"%EF%BC%A0","\uff3b":"%EF%BC%BB","\uff3d":"%EF%BC%BD"},wc=function(a){return vc[a]};var yc=function(){this.g=[]};yc.prototype.set=function(a,c){this.g.push([a,c]);return this};yc.prototype.v=function(a,c){for(var d={},b=0;b<this.g.length;b++){var e=V(this.g[b][0],a,c),f=V(this.g[b][1],a,c);d[e]=f}return d};var W=function(a){this.index=a};W.prototype.v=function(a,c){var d=zc[this.index];if(d&&!c(d)){var b=d["16"];if(a){if(a.get(b))return;a.set(b,!0)}d=V(d,a,c);a&&a.set(b,!1);return ja(d)}};
for(var _M=function(a){return new W(a)},Bc=function(a){this.v=function(c,d){for(var b=[],e=0;e<a.length;e++)b.push(V(Ac[a[e]],c,d));return b.join("")}},_T=function(a){return new Bc(arguments)},Cc=function(a){function c(c){for(var b=1;b<a.length;b++)if(a[b]==c)return!0;return!1}this.v=function(d,b){if(a[0]instanceof W&&c(8)&&c(16))return'google_tag_manager["GTM-8JZNN"].macro('+
a[0].index+")";for(var e=String(V(a[0],d,b)),f=1;f<a.length;f++)e=U[a[f]](e);return e}},_E=function(a,c){return new Cc(arguments)},V=function(a,c,d){var b=a;if(a instanceof W||a instanceof yc||a instanceof Bc||a instanceof Cc)return a.v(c,d);if(x(a))for(var b=[],e=0;e<a.length;e++)b[e]=V(a[e],c,d);else if(a&&"object"==typeof a){var b={},f;for(f in a)a.hasOwnProperty(f)&&(b[f]=V(a[f],c,d))}return b},Dc=function(a,c){var d=c[a],b=d;if(d instanceof W||d instanceof Cc||d instanceof Bc)b=d;else if(x(d))for(var b=
[],e=0;e<d.length;e++)b[e]=Dc(d[e],c);else if("object"==typeof d){var b=new yc,f;for(f in d)d.hasOwnProperty(f)&&b.set(c[f],Dc(d[f],c))}return b},Gc=function(a,c){for(var d=c?c.split(","):[],b=0;b<d.length;b++){var e=d[b]=d[b].split(":");0==a&&(e[1]=Ac[e[1]]);if(1==a)for(var f=Ec(e[0]),e=d[b]={},g=0;g<f.length;g++){var h=Fc[f[g]];e[h[0]]=h[1]}if(2==a)for(g=0;4>g;g++)e[g]=Ec(e[g])}return d},Ec=function(a){var c=[];if(!a)return c;for(var d=0,b=0;b<a.length&&d<Hc;d+=6,b++){var e=a&&a.charCodeAt(b)||
65;if(65!=e){var f=0,f=65<e&&90>=e?e-65:97<=e&&122>=e?e-97+26:95==e?63:48<=e?e-48+52:62;1&f&&c.push(d);2&f&&c.push(d+1);4&f&&c.push(d+2);8&f&&c.push(d+3);16&f&&c.push(d+4);32&f&&c.push(d+5)}}return c},Hc=118,Ic=[_eq,_e,'event',_M(0),'Member Conversion',_html,'Nanigans Payment Conversion 44357','\x3cimg style\x3d\x22display:none\x22 src\x3d\x22//api.nanigans.com/event.php?app_id\x3d44357\x26amp;type\x3duser\x26amp;name\x3dupgrade\x26amp;user_id\x3d',_v,'Member ID','memberID',_E(_M(1),12),'\x26amp;value\x3d\x26amp;unique\x3d','Order ID','orderID',_E(_M(2),12),'\x26amp;ut1\x3d\x22\x3e',_T(7,11,12,15,16),true,19,_ga,'GA Member Payment','UA-148065-72','Member Payment URL','memberPaymentPage',_M(3),false,20,'Member Join','Nanigans Registration Tracking','\x3cimg style\x3d\x22display:none\x22 src\x3d\x22//api.nanigans.com/event.php?app_id\x3d44357\x26amp;type\x3duser\x26amp;name\x3dregistration\x26amp;user_id\x3d',_T(30,11,16),17,'UploadMemberPhoto','Nanigans Photo Upload Tracking','\x3cimg style\x3d\x22display:none\x22 src\x3d\x22//api.nanigans.com/event.php?app_id\x3d44357\x26amp;type\x3duser\x26amp;name\x3dproduct\x26amp;user_id\x3d',_T(35,11,16),18,'Cake Marketing English Member Payment','\x3ciframe src\x3d\x22https://cupidlinks.com/p.ashx?o\x3d10\x26amp;p\x3d','OVT Amount','ovtAmount',_E(_M(4),12),'\x26amp;t\x3d','\x22 height\x3d\x221\x22 width\x3d\x221\x22 frameborder\x3d\x220\x22\x3e\x3c/iframe\x3e',_T(39,42,43,15,44),13,_re,_u,'url',_M(5),'.*','_event',_M(6),'gtm.js','Nanigans Page View Tracking 44357','\x3cimg style\x3d\x22display:none\x22 src\x3d\x22//api.nanigans.com/event.php?app_id\x3d44357\x26amp;type\x3dvisit\x26amp;name\x3dlanding\x22\x3e',14,_awct,'Content 1009312584','1009312584','LEFZCMC5xAIQyMaj4QM','0',2,'GA Page Tracking',1,'Search 1009157885','1009157885','ioGKCMurgAMQ_Y2a4QM',4,'Member Gender','memberGender',_M(7),'Female','Content Female 1003582449','1003582449','TqlVCPe9uQMQ8efF3gM',3,'Facebook Payment Conversion 6006809691046','\x3cscript type\x3d\x22text/gtmscript\x22\x3evar fb_param\x3d{pixel_id:\x226006809691046\x22,value:\x220.00\x22};(function(){var a\x3ddocument.createElement(\x22script\x22);a.async\x3d!0;a.src\x3d\x22//connect.facebook.net/en_US/fp.js\x22;var b\x3ddocument.getElementsByTagName(\x22script\x22)[0];b.parentNode.insertBefore(a,b)})();\x3c/script\x3e\n\x3cnoscript\x3e\x3cimg height\x3d\x221\x22 width\x3d\x221\x22 alt\x3d\x22\x22 style\x3d\x22display:none\x22 src\x3d\x22https://www.facebook.com/offsite_event.php?id\x3d6006809691046\x26amp;value\x3d0\x22\x3e\x3c/noscript\x3e',10,'Direct Affiliate Tracking 7','\x3cscript data-gtmsrc\x3d\x22https://affiliates.cupidmedia.com/i_sale_third/7/',_E(_M(4),3),'/',_E(_M(2),3),_E(_M(8),3),'|','Member Grade','memberGrade',_E(_M(9),3),'\x22 type\x3d\x22text/gtmscript\x22\x3e\x3c/script\x3e\n\x3cnoscript\x3e\x3cimg src\x3d\x22https://affiliates.cupidmedia.com/i_track_sale/7/','\x22\x3e\x3c/noscript\x3e',_T(82,83,84,85,84,86,87,90,91,83,84,85,84,86,87,90,92),9,'GAevent','GA Event Tracking','Event Action','eventAction',_M(10),'Event Category','eventCategory',_M(11),'Event Label','eventLabel',_M(12),'Event Value','eventValue',_M(13),'Event Interaction','eventInteraction',_M(14),12,'Facebook Join Conversion 6006809695046','\x3cscript type\x3d\x22text/gtmscript\x22\x3evar fb_param\x3d{pixel_id:\x226006809695046\x22,value:\x220.00\x22};(function(){var a\x3ddocument.createElement(\x22script\x22);a.async\x3d!0;a.src\x3d\x22//connect.facebook.net/en_US/fp.js\x22;var b\x3ddocument.getElementsByTagName(\x22script\x22)[0];b.parentNode.insertBefore(a,b)})();\x3c/script\x3e\n\x3cnoscript\x3e\x3cimg height\x3d\x221\x22 width\x3d\x221\x22 alt\x3d\x22\x22 style\x3d\x22display:none\x22 src\x3d\x22https://www.facebook.com/offsite_event.php?id\x3d6006809695046\x26amp;value\x3d0\x22\x3e\x3c/noscript\x3e',11,'url hostname','host',_f,'referrer','url path','path','Member Ethnicity','memberEthnicity','Member In Days','Member Country','memberCountry','Member Age','memberAge'],Jc=[],Kc=0;Kc<Ic.length;Kc++)Jc[Kc]=Dc(Kc,Ic);var Ac=Jc,Fc=Gc(0,"13:0,13:1,16:2,1:3,2:4,13:5,16:6,13:8,16:9,19:10,16:13,19:14,14:17,25:18,23:19,13:20,16:21,0:22,16:23,19:24,21:25,18:26,3:18,4:18,7:18,8:18,22:18,6:26,23:27,2:28,16:29,14:31,23:32,2:33,16:34,14:36,23:37,16:38,16:40,19:41,14:45,23:46,13:47,13:48,16:49,1:50,2:51,16:52,1:53,2:54,16:55,14:56,23:57,13:58,16:59,15:60,17:61,26:62,23:63,16:64,23:65,16:66,15:67,17:68,23:69,16:70,19:71,1:72,2:73,16:74,15:75,17:76,23:77,16:78,14:79,23:80,16:81,16:10,16:88,19:89,14:93,23:94,2:95,16:96,24:18,16:97,19:98,9:99,16:100,19:101,10:102,16:103,19:104,11:105,16:106,19:107,12:108,16:109,19:110,20:111,23:112,16:113,14:114,23:115,16:116,5:117,13:118,16:119,16:120,5:121,16:122,19:123,16:124,19:124,16:125,19:126,16:127,19:128"),zc=Gc(1,"G,AO,Ay,ACAD,ACAAAAM,AAAAAAAG,CAAAAAAg,ACAAAAAAAAgB,AKAAAAAAAAAAg,ACAAAAAAAAAAAD,ACAAAAAAAAAAAAG,ACAAAAAAAAAAAAw,ACAAAAAAAAAAAAAG,ACAAAAAAAAAAAAAw,ACAAAAAAAAAAAAAAG,AAAAAAACAAAAAAAAAM,AAAAAAAAAAAAAAAAAw,AAAAAAACAAAAAAAAAAD,ACAAAAAAAAAAAAAAAAM,ACAAAAAAAAAAAAAAAAw,ACAAAAAAAAAAAAAAAAAD,ACAAAAAAAAAAAAAAAAAM"),Lc=Gc(1,"Z,JAAAg,JAAAAI,AAAAAAAZ,BAAAAAAAD,BAAAAAAAAAAG,JAAAAAAAAAAAAQ"),Y=Gc(1,"gBH,AA48f,gAAAAH,gAAAAwB,gACAAAy,gAAAAAAAc,AAAAAAAAgf,AAo4HAAAAgB,AAAAAAAAgIe,AAAAAAAAgIA4B,gAAAAAAAAAAAO,gAAAAAAAAAAAQM,AAo4PAAAAAAAAgJJZ,gAAAAAAAAAAAAAAAgD"),Mc=Gc(2,"B:Tw::,C:EFC::,E:I::,Y:gC::,i:AI::,AB:AAB::");var Tc=function(){var a=[];return function(c,d){if(void 0===a[c]){var b=Lc[c]&&V(Lc[c],new y,d);a[c]=[b&&ja(b),b]}return a[c]}},Uc=function(a,c){for(var d=c[0],b=0;b<d.length;b++)if(!a.i(d[b],a.d)[0])return!1;for(var e=c[2],b=0;b<e.length;b++)if(a.i(e[b],a.d)[0])return!1;return!0},Vc=Da=function(a,c){Ma=a;O("tagTypeBlacklist");for(var d={name:a,za:c||ea,t:Ec(),u:Ec(),i:Tc(),d:La()},b=0;b<Mc.length;b++)if(Uc(d,Mc[b])){for(var e=d,f=Mc[b],g=f[1],h=0;h<g.length;h++)e.t[g[h]]=!0;for(var m=f[3],h=0;h<
m.length;h++)e.u[m[h]]=!0}var n=[];for(var l=0;l<Hc;l++)if(d.t[l]&&!d.u[l])if(d.d(Y[l])){}else{n[l]=V(Y[l],new y,d.d);}d.N=n;for(var q=new oa,p=0;p<Hc;p++)if(d.t[p]&&!d.u[p]&&!d.d(Y[p])){var r=d.N[p],E=new na;E.K.push(Tb(r));E.J.push(Ub(r));pa(q,E);ja(r,E.ya,E.xa)}q.addListener(d.za);0<q.o||ma(q.M);Ma=null;return 0<d.N.length};var $={set:function(a,c){var d={};d[a]=c;A["dataLayer"].push(d)},event:function(a){Vc(a)},macro:function(a){var c;if(c=zc[a]){var d=_M(a),b=La();c=V(d,new y,b)}return c},R:{push:function(a){for(var c=arguments,d=0;d<c.length;d++)try{if(s(c[d][0]))c[d][0]();else $[c[d][0]].apply($,[].slice.call(c[d],1))}catch(b){}}},Ha:function(){var a=A["gtm"];if(a){var c=a.a;x(c)&&$.R.push.apply($.R,c);a.a=$.R;M.push(function(){$.event("gtm.dom")});za.push(function(){$.event("gtm.load")})}},Ia:function(){var a=
A.google_tag_manager;a||(a=A.google_tag_manager={});a["GTM-8JZNN"]||(a["GTM-8JZNN"]=$)}};$.Ia();$.Ha();(function(){var a=D("dataLayer",[]),c=A.google_tag_manager;M.push(function(){c.gtmDom||(c.gtmDom=!0,a.push({event:"gtm.dom"}))});za.push(function(){c.gtmLoad||(c.gtmLoad=!0,a.push({event:"gtm.load"}))});var d=a.push;a.push=function(){var b=[].slice.call(arguments,0);d.apply(a,b);for(N.push.apply(N,b);300<this.length;)this.shift();return Ha()};N.push.apply(N,a.slice(0));L(Ha)})();
if("interactive"==B.readyState||"complete"==B.readyState)va();else{K(B,"DOMContentLoaded",va);K(B,"readystatechange",va);if(B.createEventObject&&B.documentElement.doScroll){var Wc=!0;try{Wc=!A.frameElement}catch(Xc){}Wc&&xa()}K(A,"load",va)}"complete"===B.readyState?Aa():K(A,"load",Aa);var _vs="res_ts:1378772244169000,srv_cl:53328356,ds:live,cv:12";
})()