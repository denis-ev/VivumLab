(window.webpackJsonp=window.webpackJsonp||[]).push([[48],{119:function(e,t,r){"use strict";r.r(t),r.d(t,"frontMatter",(function(){return c})),r.d(t,"metadata",(function(){return i})),r.d(t,"rightToc",(function(){return s})),r.d(t,"default",(function(){return l}));var n=r(3),o=r(7),a=(r(0),r(232)),c={id:"tor",title:"Tor",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Tor",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},i={unversionedId:"core/tor",id:"core/tor",isDocsHomePage:!1,title:"Tor",description:"Tor",source:"@site/docs/core/Tor.md",slug:"/core/tor",permalink:"/docs/core/tor",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Tor",sidebar:"docs",previous:{title:"Terraform",permalink:"/docs/core/terraform"},next:{title:"AdGuard Home",permalink:"/docs/software/adguardhome"}},s=[{value:"Install Tor",id:"install-tor",children:[]},{value:"Web Access",id:"web-access",children:[]},{value:"SSH Access",id:"ssh-access",children:[]}],u={rightToc:s};function l(e){var t=e.components,r=Object(o.a)(e,["components"]);return Object(a.b)("wrapper",Object(n.a)({},u,r,{components:t,mdxType:"MDXLayout"}),Object(a.b)("h1",{id:"tor"},"Tor"),Object(a.b)("p",null,"Tor is much more than privacy. Running a tor instance can fix some issues for you. Some such issues include:"),Object(a.b)("ul",null,Object(a.b)("li",{parentName:"ul"},"you don't have a domain"),Object(a.b)("li",{parentName:"ul"},"issues with your DNS"),Object(a.b)("li",{parentName:"ul"},"ports aren't mapped correctly somewhere in your network, and you can't access your services remotely")),Object(a.b)("p",null,"For more information on Tor, you can have a look ",Object(a.b)("a",Object(n.a)({parentName:"p"},{href:"https://duckduckgo.com/?q=what+is+tor"}),"here")),Object(a.b)("h2",{id:"install-tor"},"Install Tor"),Object(a.b)("p",null,"Download Tor from the ",Object(a.b)("a",Object(n.a)({parentName:"p"},{href:"https://www.torproject.org/"}),"Tor Project")," website, and follow their instructions."),Object(a.b)("h2",{id:"web-access"},"Web Access"),Object(a.b)("p",null,"Every service has the Tor URL, in its own documentation. VivumLab should deply your own copy of the software documentation. Try accessing them at 'docs.yourdomain'."),Object(a.b)("h2",{id:"ssh-access"},"SSH Access"),Object(a.b)("p",null,"SSH access via Tor is absolutely possible with ",Object(a.b)("a",Object(n.a)({parentName:"p"},{href:"https://duckduckgo.com/?q=torify"}),"Torify"),", and is typically bundled with the a 'Tor' installation,\nTo verify that you have 'Torify', and can connect to Tor with Torify, run ",Object(a.b)("inlineCode",{parentName:"p"},"torify curl ifconfig.me")),Object(a.b)("p",null,"Once that is verified, SSH (the normal way) into your server and append the following lines to your ",Object(a.b)("inlineCode",{parentName:"p"},"~/.ssh/config")," file:"),Object(a.b)("pre",null,Object(a.b)("code",Object(n.a)({parentName:"pre"},{}),"Host *.onion\n   ProxyCommand /usr/bin/nc -xlocalhost:9150 -X5 %h %p\n")),Object(a.b)("p",null,"Once that is done, you can ssh to your server with ",Object(a.b)("inlineCode",{parentName:"p"},"torify ssh <your_ssh_user>@<your_tor_ssh_domain>")))}l.isMDXComponent=!0},232:function(e,t,r){"use strict";r.d(t,"a",(function(){return p})),r.d(t,"b",(function(){return m}));var n=r(0),o=r.n(n);function a(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function c(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function i(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?c(Object(r),!0).forEach((function(t){a(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):c(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function s(e,t){if(null==e)return{};var r,n,o=function(e,t){if(null==e)return{};var r,n,o={},a=Object.keys(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||(o[r]=e[r]);return o}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(n=0;n<a.length;n++)r=a[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(o[r]=e[r])}return o}var u=o.a.createContext({}),l=function(e){var t=o.a.useContext(u),r=t;return e&&(r="function"==typeof e?e(t):i(i({},t),e)),r},p=function(e){var t=l(e.components);return o.a.createElement(u.Provider,{value:t},e.children)},b={inlineCode:"code",wrapper:function(e){var t=e.children;return o.a.createElement(o.a.Fragment,{},t)}},d=o.a.forwardRef((function(e,t){var r=e.components,n=e.mdxType,a=e.originalType,c=e.parentName,u=s(e,["components","mdxType","originalType","parentName"]),p=l(r),d=n,m=p["".concat(c,".").concat(d)]||p[d]||b[d]||a;return r?o.a.createElement(m,i(i({ref:t},u),{},{components:r})):o.a.createElement(m,i({ref:t},u))}));function m(e,t){var r=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var a=r.length,c=new Array(a);c[0]=d;var i={};for(var s in t)hasOwnProperty.call(t,s)&&(i[s]=t[s]);i.originalType=e,i.mdxType="string"==typeof e?e:n,c[1]=i;for(var u=2;u<a;u++)c[u]=r[u];return o.a.createElement.apply(null,c)}return o.a.createElement.apply(null,r)}d.displayName="MDXCreateElement"}}]);