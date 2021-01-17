(window.webpackJsonp=window.webpackJsonp||[]).push([[27],{229:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return O}));var a=n(0),i=n.n(a);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function b(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?b(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):b(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,i=function(e,t){if(null==e)return{};var n,a,i={},r=Object.keys(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||(i[n]=e[n]);return i}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(i[n]=e[n])}return i}var s=i.a.createContext({}),o=function(e){var t=i.a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):c(c({},t),e)),n},p=function(e){var t=o(e.components);return i.a.createElement(s.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return i.a.createElement(i.a.Fragment,{},t)}},m=i.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,r=e.originalType,b=e.parentName,s=l(e,["components","mdxType","originalType","parentName"]),p=o(n),m=a,O=p["".concat(b,".").concat(m)]||p[m]||u[m]||r;return n?i.a.createElement(O,c(c({ref:t},s),{},{components:n})):i.a.createElement(O,c({ref:t},s))}));function O(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var r=n.length,b=new Array(r);b[0]=m;var c={};for(var l in t)hasOwnProperty.call(t,l)&&(c[l]=t[l]);c.originalType=e,c.mdxType="string"==typeof e?e:a,b[1]=c;for(var s=2;s<r;s++)b[s]=n[s];return i.a.createElement.apply(null,b)}return i.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"},98:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return b})),n.d(t,"metadata",(function(){return c})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return o}));var a=n(3),i=n(7),r=(n(0),n(229)),b={id:"sui",title:"SUI",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"SUI",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},c={unversionedId:"software/sui",id:"software/sui",isDocsHomePage:!1,title:"SUI",description:"SUI",source:"@site/docs/software/sui.md",slug:"/software/sui",permalink:"/docs/software/sui",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"SUI",sidebar:"docs",previous:{title:"Statping",permalink:"/docs/software/statping"},next:{title:"Synchthing",permalink:"/docs/software/syncthing"}},l=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling sui",id:"enabling-sui",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],s={rightToc:l};function o(e){var t=e.components,n=Object(i.a)(e,["components"]);return Object(r.b)("wrapper",Object(a.a)({},s,n,{components:t,mdxType:"MDXLayout"}),Object(r.b)("h1",{id:"sui"},"SUI"),Object(r.b)("p",null,Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://github.com/WillFantom/sui"}),"SUI")," a startpage for your server and / or new tab page"),Object(r.b)("p",null,Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(r.b)("br",null)),Object(r.b)("h2",{id:"information"},"Information"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(r.b)("br",null),"\n",Object(r.b)("strong",{parentName:"p"},"Current Image Version:")," latest"),Object(r.b)("h2",{id:"setup"},"SETUP"),Object(r.b)("h3",{id:"enabling-sui"},"Enabling sui"),Object(r.b)("h4",{id:"command"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.enable True"))),Object(r.b)("h4",{id:"file-alteration"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  enable: True\n")),Object(r.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h2",{id:"first-run"},"FIRST RUN"),Object(r.b)("p",null,"!!! ",Object(r.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(r.b)("br",null),"\n!!! Below are some ",Object(r.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(r.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(r.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(r.b)("p",null,"Navigate to ",Object(r.b)("em",{parentName:"p"},"https://False/admin")),Object(r.b)("p",null,"Create an account with your desired username; as this is the first user, sui makes this account the administrator."),Object(r.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(r.b)("ol",null,Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(r.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(r.b)("li",{parentName:"ol"},"make some changes")),Object(r.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(r.b)("ol",{start:3},Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))," to complete the changes")),Object(r.b)("h2",{id:"access"},"ACCESS"),Object(r.b)("p",null,"sui (HTTPS) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://sui.vivumlab.xyz/"}),"https://sui.vivumlab.xyz/"),"\nsui (HTTP) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"http://sui.vivumlab.xyz/"}),"http://sui.vivumlab.xyz/")),Object(r.b)("h2",{id:"options"},"OPTIONS"),Object(r.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-1"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.https_only True"))),Object(r.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  https_only: True\n")),Object(r.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h3",{id:"auth"},"AUTH"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-2"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.auth True"))),Object(r.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  auth: True\n")),Object(r.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h3",{id:"domain"},"DOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(r.b)("h4",{id:"command-3"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.domain sui.com"))),Object(r.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  domain: sui.com\n")),Object(r.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: sui")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(r.b)("h4",{id:"command-4"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.subdomain media"))),Object(r.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  subdomain: media\n")),Object(r.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h3",{id:"version"},"VERSION"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: latest")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(r.b)("h4",{id:"command-5"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set sui.version 2.7"))),Object(r.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"sui\n  version: 2.7\n")),Object(r.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=sui"))),Object(r.b)("h2",{id:"need-more-help"},"Need more help?"),Object(r.b)("p",null,"Further information regarding services can be found. ",Object(r.b)("br",null),"\nGeneral Information can be found in the ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://vivumlab.com/docs"}),"documentation"),". ",Object(r.b)("br",null),"\nAdditional assistance can be found on our ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://vivumlab.com/docs/contact"}),"Contact Us")," page."))}o.isMDXComponent=!0}}]);