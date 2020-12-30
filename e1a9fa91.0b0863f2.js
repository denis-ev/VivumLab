(window.webpackJsonp=window.webpackJsonp||[]).push([[136],{210:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return l})),n.d(t,"rightToc",(function(){return c})),n.d(t,"default",(function(){return p}));var r=n(3),a=n(7),b=(n(0),n(232)),i={id:"turtl",title:"Turtl",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Turtl",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},l={unversionedId:"software/turtl",id:"software/turtl",isDocsHomePage:!1,title:"Turtl",description:"Turtl",source:"@site/docs/software/turtl.md",slug:"/software/turtl",permalink:"/docs/software/turtl",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Turtl",sidebar:"docs",previous:{title:"Trilium",permalink:"/docs/software/trilium"},next:{title:"Ubooquity",permalink:"/docs/software/ubooquity"}},c=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling turtl",id:"enabling-turtl",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],o={rightToc:c};function p(e){var t=e.components,n=Object(a.a)(e,["components"]);return Object(b.b)("wrapper",Object(r.a)({},o,n,{components:t,mdxType:"MDXLayout"}),Object(b.b)("h1",{id:"turtl"},"Turtl"),Object(b.b)("p",null,Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"https://github.com/turtl/server"}),"Turtl")," Turtl is a note taking app with desktop and mobile apps."),Object(b.b)("p",null,Object(b.b)("img",Object(r.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(r.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(r.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(b.b)("br",null)),Object(b.b)("h2",{id:"information"},"Information"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(b.b)("br",null),"\n",Object(b.b)("strong",{parentName:"p"},"Current Image Version:")," None"),Object(b.b)("h2",{id:"setup"},"SETUP"),Object(b.b)("h3",{id:"enabling-turtl"},"Enabling turtl"),Object(b.b)("h4",{id:"command"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.enable True"))),Object(b.b)("h4",{id:"file-alteration"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  enable: True\n")),Object(b.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h2",{id:"first-run"},"FIRST RUN"),Object(b.b)("p",null,"You must then download a desktop client or Android or iOS app. Get the newest version here ",Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"https://github.com/turtl/desktop/releases"}),"https://github.com/turtl/desktop/releases")),Object(b.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(b.b)("ol",null,Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(b.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(b.b)("li",{parentName:"ol"},"make some changes")),Object(b.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(b.b)("ol",{start:3},Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))," to complete the changes")),Object(b.b)("h2",{id:"access"},"ACCESS"),Object(b.b)("p",null,"turtl (HTTPS) link: ",Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"https://turtl.vivumlab.xyz/"}),"https://turtl.vivumlab.xyz/"),"\nturtl (HTTP) link: ",Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"http://turtl.vivumlab.xyz/"}),"http://turtl.vivumlab.xyz/")),Object(b.b)("h2",{id:"options"},"OPTIONS"),Object(b.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-1"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.https_only True"))),Object(b.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  https_only: True\n")),Object(b.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h3",{id:"auth"},"AUTH"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-2"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.auth True"))),Object(b.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  auth: True\n")),Object(b.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h3",{id:"domain"},"DOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(b.b)("h4",{id:"command-3"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.domain turtl.com"))),Object(b.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  domain: turtl.com\n")),Object(b.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: turtl")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(b.b)("h4",{id:"command-4"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.subdomain media"))),Object(b.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  subdomain: media\n")),Object(b.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h3",{id:"version"},"VERSION"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: None"),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(b.b)("h4",{id:"command-5"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set turtl.version 2.7"))),Object(b.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(r.a)({parentName:"pre"},{}),"turtl\n  version: 2.7\n")),Object(b.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=turtl"))),Object(b.b)("h2",{id:"need-more-help"},"Need more help?"),Object(b.b)("p",null,"Further information regarding services can be found. ",Object(b.b)("br",null),"\nGeneral Information can be found in the ",Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(b.b)("br",null),"\nAdditional assistance can be found on our ",Object(b.b)("a",Object(r.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}p.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return s})),n.d(t,"b",(function(){return O}));var r=n(0),a=n.n(r);function b(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){b(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function c(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},b=Object.keys(e);for(r=0;r<b.length;r++)n=b[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var b=Object.getOwnPropertySymbols(e);for(r=0;r<b.length;r++)n=b[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var o=a.a.createContext({}),p=function(e){var t=a.a.useContext(o),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},s=function(e){var t=p(e.components);return a.a.createElement(o.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return a.a.createElement(a.a.Fragment,{},t)}},m=a.a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,b=e.originalType,i=e.parentName,o=c(e,["components","mdxType","originalType","parentName"]),s=p(n),m=r,O=s["".concat(i,".").concat(m)]||s[m]||u[m]||b;return n?a.a.createElement(O,l(l({ref:t},o),{},{components:n})):a.a.createElement(O,l({ref:t},o))}));function O(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var b=n.length,i=new Array(b);i[0]=m;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l.mdxType="string"==typeof e?e:r,i[1]=l;for(var o=2;o<b;o++)i[o]=n[o];return a.a.createElement.apply(null,i)}return a.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"}}]);