var gmine_run=[];var gmine_mouseover_list=[];var gmine_site=gmine_site||"default";function GMineClickLog(c){var a=null;if(!c){c=window.event}a=c.srcElement||c.target||null;var b=a;GMineLog(b,"click",c)}function GMineMouseOutLog(b){var a=document.activeElement;GMineLog(a,"mouseout",b)}function GMineMouseOverLog(b){var a=document.activeElement;GMineLog(a,"mouseover",b)}function GMineBlurLog(b){var a=document.activeElement;GMineLog(a,"blur",b)}function GMineLog(d,h,j){if(!d){return}var j=j||null;var a=0;var c="";var n=d.className||"";if(n&&"gmine_no_log"==n.toLowerCase()){return}var g=d.tagName||"";var b="";if(g){g=g.toLowerCase();if("a"==g||"iframe"==g||"object"==g||"embed"==g){}else{if(d.parentNode){b=d.parentNode.tagName.toLowerCase()}if("a"==b){}else{return}}}var l="";var f=document.getElementById("gmine");var m=0;var e=0;while("body"!=d.tagName.toLowerCase()){e++;m=d.getAttribute("gmine");if(m){m=parseInt(m,10);break}d=d.parentNode}if(m){if("click"==h||"blur"==h){gmine_run[m]=1}else{if("mouseout"==h){if(gmine_run[m]){return false}}else{if("mouseover"==h){if(!gmine_mouseover_list[m]){GMineClearActive(d)}else{gmine_mouseover_list[m]=1}return false}}}if("blur"==h||"mouseout"==h){GMineClearActive(d)}if(gmine_site){var k=d.className;if(window.ActiveXObject){a=j.button-Math.ceil(j.button/2)+1}else{a=j.button+1}if(3!=a){c=ad_get_cookie("ip_ck");if(-1!==k.indexOf("gmine_ad_direct")){l="//ca.zol.com.cn/drclk?s="+gmine_site+"&on="+gmine_site+"&id="+m+"&type="+h+"&mouse_button="+a+"&timestamp="+Math.random()}else{l="//ca.zol.com.cn/cgrclk?s="+gmine_site+"&on="+gmine_site+"&id="+m+"&type="+h+"&mouse_button="+a+"&ip_ck="+c+"&timestamp="+Math.random()}f.src=l}else{}}}}function GMineClearActive(b){var f=b.id||Math.random();var d=null;var c="";if(f){c=f+"_Focus";d=document.getElementById(c);if(!d){var a=document.createElement("img");a.id=c;a.tabIndex="-1";a.width="0px";a.height="0px";a.className="gmine_no_log";b.appendChild(a);d=document.getElementById(c)}try{d.setActive()}catch(g){try{d.focus()}catch(g){}}}}function GMineClick(){}GMineClick.prototype={"getElementsByClassName":function(a,g){var root=document;g=g||"*";var k=a.split(",");var e=k[0]||"";var d=k[1]||"";var l=root.getElementsByTagName(g);var h=[];for(var f=0;f<l.length;f++){for(var c=0,b=l[f].className.split(" ");c<b.length;c++){if(b[c]==e||b[c]==d){h.push(l[f]);break}}}return h},"addevent":function(c,b,a){if(document.attachEvent){if(c){c.attachEvent("on"+b,a)}else{window.attachEvent("on"+b,a)}}else{if(document.addEventListener){if(c){c.addEventListener(b,a,false)}else{window.addEventListener(b,a,false)}}}},"init":function(){document.write('<img id="gmine" width="1px" height="0px"  style="display:none;"  />');var f=this.getElementsByClassName("gmine_ad,gmine_ad_direct");var d=f.length;for(var e=0;e<d;e++){this.addevent(f[e],"mousedown",GMineClickLog);var a=f[e].getElementsByTagName("iframe");var b=a.length;for(var c=0;c<b;c++){this.addevent(a[c],"blur",GMineBlurLog);this.addevent(a[c],"mouseover",GMineMouseOverLog);this.addevent(a[c],"mouseout",GMineMouseOutLog)}}}};if("undefined"!=typeof adsLoad){adsLoad("run")}if("undefined"==typeof gmine_obj){var gmine_obj=new GMineClick();gmine_obj.init()}if("undefined"==typeof ad_get_cookie){function ad_get_cookie(b){var a=document.cookie;var g=a.split("; ");var f=g.length;var e="";var d=null;for(var c=0;c<f;c++){d=g[c].split("=");if(b==d[0]){e=d[1];break}}return e}};
