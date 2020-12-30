(window.webpackJsonp=window.webpackJsonp||[]).push([[53],{124:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return o})),n.d(t,"rightToc",(function(){return c})),n.d(t,"default",(function(){return s}));var a=n(3),r=n(7),b=(n(0),n(232)),i={id:"homebridge",title:"HomeBridge",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"HomeBridge",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},o={unversionedId:"software/homebridge",id:"software/homebridge",isDocsHomePage:!1,title:"HomeBridge",description:"HomeBridge",source:"@site/docs/software/homebridge.md",slug:"/software/homebridge",permalink:"/docs/software/homebridge",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"HomeBridge",sidebar:"docs",previous:{title:"Home Assistant",permalink:"/docs/software/homeassistant"},next:{title:"Homedash",permalink:"/docs/software/homedash"}},c=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling homebridge",id:"enabling-homebridge",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],l={rightToc:c};function s(e){var t=e.components,n=Object(r.a)(e,["components"]);return Object(b.b)("wrapper",Object(a.a)({},l,n,{components:t,mdxType:"MDXLayout"}),Object(b.b)("h1",{id:"homebridge"},"HomeBridge"),Object(b.b)("p",null,Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://homebridge.io/"}),"HomeBridge")," HomeKit support for the impatient"),Object(b.b)("p",null,Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(b.b)("br",null)),Object(b.b)("h2",{id:"information"},"Information"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(b.b)("br",null),"\n",Object(b.b)("strong",{parentName:"p"},"Current Image Version:")," latest"),Object(b.b)("h2",{id:"setup"},"SETUP"),Object(b.b)("h3",{id:"enabling-homebridge"},"Enabling homebridge"),Object(b.b)("h4",{id:"command"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.enable True"))),Object(b.b)("h4",{id:"file-alteration"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  enable: True\n")),Object(b.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h2",{id:"first-run"},"FIRST RUN"),Object(b.b)("p",null,"!!! ",Object(b.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(b.b)("br",null),"\n!!! Below are some ",Object(b.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(b.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(b.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(b.b)("p",null,"Navigate to ",Object(b.b)("em",{parentName:"p"},"https://False/admin")),Object(b.b)("p",null,"Create an account with your desired username; as this is the first user, homebridge makes this account the administrator."),Object(b.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(b.b)("ol",null,Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(b.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(b.b)("li",{parentName:"ol"},"make some changes")),Object(b.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(b.b)("ol",{start:3},Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))," to complete the changes")),Object(b.b)("h2",{id:"access"},"ACCESS"),Object(b.b)("p",null,"homebridge (HTTPS) link: ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://homebridge.vivumlab.xyz/"}),"https://homebridge.vivumlab.xyz/"),"\nhomebridge (HTTP) link: ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"http://homebridge.vivumlab.xyz/"}),"http://homebridge.vivumlab.xyz/")),Object(b.b)("h2",{id:"options"},"OPTIONS"),Object(b.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-1"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.https_only True"))),Object(b.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  https_only: True\n")),Object(b.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h3",{id:"auth"},"AUTH"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-2"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.auth True"))),Object(b.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  auth: True\n")),Object(b.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h3",{id:"domain"},"DOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(b.b)("h4",{id:"command-3"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.domain homebridge.com"))),Object(b.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  domain: homebridge.com\n")),Object(b.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: homebridge")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(b.b)("h4",{id:"command-4"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.subdomain media"))),Object(b.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  subdomain: media\n")),Object(b.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h3",{id:"version"},"VERSION"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: latest")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(b.b)("h4",{id:"command-5"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set homebridge.version 2.7"))),Object(b.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"homebridge\n  version: 2.7\n")),Object(b.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=homebridge"))),Object(b.b)("h2",{id:"need-more-help"},"Need more help?"),Object(b.b)("p",null,"Further information regarding services can be found. ",Object(b.b)("br",null),"\nGeneral Information can be found in the ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(b.b)("br",null),"\nAdditional assistance can be found on our ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}s.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return u}));var a=n(0),r=n.n(a);function b(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){b(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function c(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},b=Object.keys(e);for(a=0;a<b.length;a++)n=b[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var b=Object.getOwnPropertySymbols(e);for(a=0;a<b.length;a++)n=b[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var l=r.a.createContext({}),s=function(e){var t=r.a.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},p=function(e){var t=s(e.components);return r.a.createElement(l.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},d=r.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,b=e.originalType,i=e.parentName,l=c(e,["components","mdxType","originalType","parentName"]),p=s(n),d=a,u=p["".concat(i,".").concat(d)]||p[d]||m[d]||b;return n?r.a.createElement(u,o(o({ref:t},l),{},{components:n})):r.a.createElement(u,o({ref:t},l))}));function u(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var b=n.length,i=new Array(b);i[0]=d;var o={};for(var c in t)hasOwnProperty.call(t,c)&&(o[c]=t[c]);o.originalType=e,o.mdxType="string"==typeof e?e:a,i[1]=o;for(var l=2;l<b;l++)i[l]=n[l];return r.a.createElement.apply(null,i)}return r.a.createElement.apply(null,n)}d.displayName="MDXCreateElement"}}]);