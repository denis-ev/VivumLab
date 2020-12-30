(window.webpackJsonp=window.webpackJsonp||[]).push([[150],{224:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return b})),n.d(t,"metadata",(function(){return c})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return p}));var a=n(3),i=n(7),r=(n(0),n(232)),b={id:"digikam",title:"Digikam",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Digikam",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},c={unversionedId:"software/digikam",id:"software/digikam",isDocsHomePage:!1,title:"Digikam",description:"Digikam",source:"@site/docs/software/digikam.md",slug:"/software/digikam",permalink:"/docs/software/digikam",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Digikam",sidebar:"docs",previous:{title:"Darksky",permalink:"/docs/software/darksky"},next:{title:"Docs",permalink:"/docs/software/docs"}},l=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling digikam",id:"enabling-digikam",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"ADMINISTRATOR SETUP",id:"administrator-setup",children:[]},{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],o={rightToc:l};function p(e){var t=e.components,n=Object(i.a)(e,["components"]);return Object(r.b)("wrapper",Object(a.a)({},o,n,{components:t,mdxType:"MDXLayout"}),Object(r.b)("h1",{id:"digikam"},"Digikam"),Object(r.b)("p",null,Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://www.digikam.org/"}),"Digikam")," Professional Photo Management with the Power of Open Source"),Object(r.b)("p",null,Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(r.b)("br",null)),Object(r.b)("h2",{id:"information"},"Information"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(r.b)("br",null),"\n",Object(r.b)("strong",{parentName:"p"},"Current Image Version:")," stable"),Object(r.b)("h2",{id:"setup"},"SETUP"),Object(r.b)("h3",{id:"enabling-digikam"},"Enabling digikam"),Object(r.b)("h4",{id:"command"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.enable True"))),Object(r.b)("h4",{id:"file-alteration"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  enable: True\n")),Object(r.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h2",{id:"first-run"},"FIRST RUN"),Object(r.b)("p",null,"!!! ",Object(r.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(r.b)("br",null),"\n!!! Below are some ",Object(r.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(r.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(r.b)("h3",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(r.b)("p",null,"Navigate to ",Object(r.b)("em",{parentName:"p"},Object(r.b)("a",Object(a.a)({parentName:"em"},{href:"https://digikam.vivumlab.xyz/admin"}),"https://digikam.vivumlab.xyz/admin"))),Object(r.b)("p",null,"Create an account with your desired username; as this is the first user, digikam makes this account the administrator."),Object(r.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(r.b)("ol",null,Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(r.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(r.b)("li",{parentName:"ol"},"make some changes")),Object(r.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(r.b)("ol",{start:3},Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))," to complete the changes")),Object(r.b)("h2",{id:"access"},"ACCESS"),Object(r.b)("p",null,"digikam (HTTPS) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://digikam.vivumlab.xyz/"}),"https://digikam.vivumlab.xyz/"),"\ndigikam (HTTP) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"http://digikam.vivumlab.xyz/"}),"http://digikam.vivumlab.xyz/")),Object(r.b)("h2",{id:"options"},"OPTIONS"),Object(r.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-1"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.https_only True"))),Object(r.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  https_only: True\n")),Object(r.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h3",{id:"auth"},"AUTH"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-2"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.auth True"))),Object(r.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  auth: True\n")),Object(r.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h3",{id:"domain"},"DOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(r.b)("h4",{id:"command-3"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.domain digikam.com"))),Object(r.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  domain: digikam.com\n")),Object(r.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: digikam")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(r.b)("h4",{id:"command-4"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.subdomain media"))),Object(r.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  subdomain: media\n")),Object(r.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h3",{id:"version"},"VERSION"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: stable")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(r.b)("h4",{id:"command-5"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set digikam.version 2.7"))),Object(r.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"digikam\n  version: 2.7\n")),Object(r.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=digikam"))),Object(r.b)("h2",{id:"need-more-help"},"Need more help?"),Object(r.b)("p",null,"Further information regarding services can be found. ",Object(r.b)("br",null),"\nGeneral Information can be found in the ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(r.b)("br",null),"\nAdditional assistance can be found on our ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}p.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return s})),n.d(t,"b",(function(){return u}));var a=n(0),i=n.n(a);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function b(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?b(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):b(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,i=function(e,t){if(null==e)return{};var n,a,i={},r=Object.keys(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var o=i.a.createContext({}),p=function(e){var t=i.a.useContext(o),n=t;return e&&(n="function"==typeof e?e(t):c(c({},t),e)),n},s=function(e){var t=p(e.components);return i.a.createElement(o.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return i.a.createElement(i.a.Fragment,{},t)}},d=i.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,r=e.originalType,b=e.parentName,o=l(e,["components","mdxType","originalType","parentName"]),s=p(n),d=a,u=s["".concat(b,".").concat(d)]||s[d]||m[d]||r;return n?i.a.createElement(u,c(c({ref:t},o),{},{components:n})):i.a.createElement(u,c({ref:t},o))}));function u(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var r=n.length,b=new Array(r);b[0]=d;var c={};for(var l in t)hasOwnProperty.call(t,l)&&(c[l]=t[l]);c.originalType=e,c.mdxType="string"==typeof e?e:a,b[1]=c;for(var o=2;o<r;o++)b[o]=n[o];return i.a.createElement.apply(null,b)}return i.a.createElement.apply(null,n)}d.displayName="MDXCreateElement"}}]);