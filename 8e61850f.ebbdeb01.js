(window.webpackJsonp=window.webpackJsonp||[]).push([[88],{160:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return b})),n.d(t,"metadata",(function(){return l})),n.d(t,"rightToc",(function(){return s})),n.d(t,"default",(function(){return c}));var a=n(3),r=n(7),i=(n(0),n(232)),b={id:"simply-shorten",title:"Simply-Shorten",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Simply-Shorten",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},l={unversionedId:"software/simply-shorten",id:"software/simply-shorten",isDocsHomePage:!1,title:"Simply-Shorten",description:"Simply-Shorten",source:"@site/docs/software/simply-shorten.md",slug:"/software/simply-shorten",permalink:"/docs/software/simply-shorten",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Simply-Shorten",sidebar:"docs",previous:{title:"SickChill",permalink:"/docs/software/sickchill"},next:{title:"Snibox",permalink:"/docs/software/snibox"}},s=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling simply_shorten",id:"enabling-simply_shorten",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],o={rightToc:s};function c(e){var t=e.components,n=Object(r.a)(e,["components"]);return Object(i.b)("wrapper",Object(a.a)({},o,n,{components:t,mdxType:"MDXLayout"}),Object(i.b)("h1",{id:"simply-shorten"},"Simply-Shorten"),Object(i.b)("p",null,Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"https://github.com/draganczukp/simply-shorten"}),"Simply-Shorten")," A simple selfhosted URL shortener with no name because naming is hard"),Object(i.b)("p",null,Object(i.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(i.b)("br",null),"\n",Object(i.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(i.b)("br",null),"\n",Object(i.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(i.b)("br",null)),Object(i.b)("h2",{id:"information"},"Information"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(i.b)("br",null),"\n",Object(i.b)("strong",{parentName:"p"},"Current Image Version:")," latest"),Object(i.b)("h2",{id:"setup"},"SETUP"),Object(i.b)("h3",{id:"enabling-simply_shorten"},"Enabling simply_shorten"),Object(i.b)("h4",{id:"command"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.enable True"))),Object(i.b)("h4",{id:"file-alteration"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  enable: True\n")),Object(i.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h2",{id:"first-run"},"FIRST RUN"),Object(i.b)("p",null,"!!! ",Object(i.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(i.b)("br",null),"\n!!! Below are some ",Object(i.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(i.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(i.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(i.b)("p",null,"Navigate to ",Object(i.b)("em",{parentName:"p"},"https://False/admin")),Object(i.b)("p",null,"Create an account with your desired username; as this is the first user, simply_shorten makes this account the administrator."),Object(i.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(i.b)("ol",null,Object(i.b)("li",{parentName:"ol"},"run ",Object(i.b)("strong",{parentName:"li"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(i.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(i.b)("li",{parentName:"ol"},"make some changes")),Object(i.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(i.b)("ol",{start:3},Object(i.b)("li",{parentName:"ol"},"run ",Object(i.b)("strong",{parentName:"li"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))," to complete the changes")),Object(i.b)("h2",{id:"access"},"ACCESS"),Object(i.b)("p",null,"simply_shorten (HTTPS) link: ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"https://simply_shorten.vivumlab.xyz/"}),"https://simply_shorten.vivumlab.xyz/"),"\nsimply_shorten (HTTP) link: ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"http://simply_shorten.vivumlab.xyz/"}),"http://simply_shorten.vivumlab.xyz/")),Object(i.b)("h2",{id:"options"},"OPTIONS"),Object(i.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(i.b)("p",null,Object(i.b)("em",{parentName:"p"},"Default: False")," ",Object(i.b)("br",null),"\n",Object(i.b)("em",{parentName:"p"},"Options: True/False")),Object(i.b)("h4",{id:"command-1"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.https_only True"))),Object(i.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  https_only: True\n")),Object(i.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h3",{id:"auth"},"AUTH"),Object(i.b)("p",null,Object(i.b)("em",{parentName:"p"},"Default: False")," ",Object(i.b)("br",null),"\n",Object(i.b)("em",{parentName:"p"},"Options: True/False")),Object(i.b)("h4",{id:"command-2"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.auth True"))),Object(i.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  auth: True\n")),Object(i.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h3",{id:"domain"},"DOMAIN"),Object(i.b)("p",null,Object(i.b)("em",{parentName:"p"},"Default: False")," ",Object(i.b)("br",null),"\n",Object(i.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(i.b)("h4",{id:"command-3"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.domain simply_shorten.com"))),Object(i.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  domain: simply_shorten.com\n")),Object(i.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(i.b)("p",null,Object(i.b)("em",{parentName:"p"},"Default: simply_shorten")," ",Object(i.b)("br",null),"\n",Object(i.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(i.b)("h4",{id:"command-4"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.subdomain media"))),Object(i.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  subdomain: media\n")),Object(i.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h3",{id:"version"},"VERSION"),Object(i.b)("p",null,Object(i.b)("em",{parentName:"p"},"Default: latest")," ",Object(i.b)("br",null),"\n",Object(i.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(i.b)("h4",{id:"command-5"},"Command:"),Object(i.b)("p",null,Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab set simply_shorten.version 2.7"))),Object(i.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(i.b)("p",null,"set the appropriate service settings in ",Object(i.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(i.b)("p",null,"eg."),Object(i.b)("pre",null,Object(i.b)("code",Object(a.a)({parentName:"pre"},{}),"simply_shorten\n  version: 2.7\n")),Object(i.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(i.b)("p",null,"run: ",Object(i.b)("strong",{parentName:"p"},Object(i.b)("inlineCode",{parentName:"strong"},"vlab update_one service=simply_shorten"))),Object(i.b)("h2",{id:"need-more-help"},"Need more help?"),Object(i.b)("p",null,"Further information regarding services can be found. ",Object(i.b)("br",null),"\nGeneral Information can be found in the ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(i.b)("br",null),"\nAdditional assistance can be found on our ",Object(i.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}c.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return O}));var a=n(0),r=n.n(a);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function b(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?b(Object(n),!0).forEach((function(t){i(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):b(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},i=Object.keys(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var o=r.a.createContext({}),c=function(e){var t=r.a.useContext(o),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},p=function(e){var t=c(e.components);return r.a.createElement(o.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},u=r.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,i=e.originalType,b=e.parentName,o=s(e,["components","mdxType","originalType","parentName"]),p=c(n),u=a,O=p["".concat(b,".").concat(u)]||p[u]||m[u]||i;return n?r.a.createElement(O,l(l({ref:t},o),{},{components:n})):r.a.createElement(O,l({ref:t},o))}));function O(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var i=n.length,b=new Array(i);b[0]=u;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l.mdxType="string"==typeof e?e:a,b[1]=l;for(var o=2;o<i;o++)b[o]=n[o];return r.a.createElement.apply(null,b)}return r.a.createElement.apply(null,n)}u.displayName="MDXCreateElement"}}]);