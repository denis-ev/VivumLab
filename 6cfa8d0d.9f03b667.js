(window.webpackJsonp=window.webpackJsonp||[]).push([[63],{135:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return o})),n.d(t,"rightToc",(function(){return c})),n.d(t,"default",(function(){return s}));var a=n(3),b=n(7),r=(n(0),n(232)),i={id:"bookstack",title:"Bookstack",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Bookstack",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},o={unversionedId:"software/bookstack",id:"software/bookstack",isDocsHomePage:!1,title:"Bookstack",description:"Bookstack",source:"@site/docs/software/bookstack.md",slug:"/software/bookstack",permalink:"/docs/software/bookstack",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Bookstack",sidebar:"docs",previous:{title:"Bitwarden",permalink:"/docs/software/bitwarden"},next:{title:"BulletNotes",permalink:"/docs/software/bulletnotes"}},c=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling bookstack",id:"enabling-bookstack",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],l={rightToc:c};function s(e){var t=e.components,n=Object(b.a)(e,["components"]);return Object(r.b)("wrapper",Object(a.a)({},l,n,{components:t,mdxType:"MDXLayout"}),Object(r.b)("h1",{id:"bookstack"},"Bookstack"),Object(r.b)("p",null,Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://www.bookstackapp.com/"}),"Bookstack")," Simple & Free Wiki Software"),Object(r.b)("p",null,Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(r.b)("br",null),"\n",Object(r.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(r.b)("br",null)),Object(r.b)("h2",{id:"information"},"Information"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(r.b)("br",null),"\n",Object(r.b)("strong",{parentName:"p"},"Current Image Version:")," 0.29.2"),Object(r.b)("h2",{id:"setup"},"SETUP"),Object(r.b)("h3",{id:"enabling-bookstack"},"Enabling bookstack"),Object(r.b)("h4",{id:"command"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.enable True"))),Object(r.b)("h4",{id:"file-alteration"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  enable: True\n")),Object(r.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h2",{id:"first-run"},"FIRST RUN"),Object(r.b)("p",null,"!!! ",Object(r.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(r.b)("br",null),"\n!!! Below are some ",Object(r.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(r.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(r.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(r.b)("p",null,"Navigate to ",Object(r.b)("em",{parentName:"p"},"https://False/admin")),Object(r.b)("p",null,"Create an account with your desired username; as this is the first user, bookstack makes this account the administrator."),Object(r.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(r.b)("ol",null,Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(r.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(r.b)("li",{parentName:"ol"},"make some changes")),Object(r.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(r.b)("ol",{start:3},Object(r.b)("li",{parentName:"ol"},"run ",Object(r.b)("strong",{parentName:"li"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))," to complete the changes")),Object(r.b)("h2",{id:"access"},"ACCESS"),Object(r.b)("p",null,"Bookstack (HTTPS) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://bookstack.vivumlab.xyz/"}),"https://bookstack.vivumlab.xyz/"),"\nBookstack (HTTP) link: ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"http://bookstack.vivumlab.xyz/"}),"http://bookstack.vivumlab.xyz/")),Object(r.b)("h2",{id:"options"},"OPTIONS"),Object(r.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-1"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.https_only True"))),Object(r.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  https_only: True\n")),Object(r.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h3",{id:"auth"},"AUTH"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"Options: True/False")),Object(r.b)("h4",{id:"command-2"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.auth True"))),Object(r.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  auth: True\n")),Object(r.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h3",{id:"domain"},"DOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: False")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(r.b)("h4",{id:"command-3"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.domain bookstack.com"))),Object(r.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  domain: bookstack.com\n")),Object(r.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: bookstack")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(r.b)("h4",{id:"command-4"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.subdomain media"))),Object(r.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  subdomain: media\n")),Object(r.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h3",{id:"version"},"VERSION"),Object(r.b)("p",null,Object(r.b)("em",{parentName:"p"},"Default: 0.29.2")," ",Object(r.b)("br",null),"\n",Object(r.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(r.b)("h4",{id:"command-5"},"Command:"),Object(r.b)("p",null,Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab set bookstack.version 2.7"))),Object(r.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(r.b)("p",null,"set the appropriate service settings in ",Object(r.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(r.b)("p",null,"eg."),Object(r.b)("pre",null,Object(r.b)("code",Object(a.a)({parentName:"pre"},{}),"bookstack\n  version: 2.7\n")),Object(r.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(r.b)("p",null,"run: ",Object(r.b)("strong",{parentName:"p"},Object(r.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bookstack"))),Object(r.b)("h2",{id:"need-more-help"},"Need more help?"),Object(r.b)("p",null,"Further information regarding services can be found. ",Object(r.b)("br",null),"\nGeneral Information can be found in the ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(r.b)("br",null),"\nAdditional assistance can be found on our ",Object(r.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}s.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return O}));var a=n(0),b=n.n(a);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function c(e,t){if(null==e)return{};var n,a,b=function(e,t){if(null==e)return{};var n,a,b={},r=Object.keys(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||(b[n]=e[n]);return b}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(a=0;a<r.length;a++)n=r[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(b[n]=e[n])}return b}var l=b.a.createContext({}),s=function(e){var t=b.a.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},p=function(e){var t=s(e.components);return b.a.createElement(l.Provider,{value:t},e.children)},m={inlineCode:"code",wrapper:function(e){var t=e.children;return b.a.createElement(b.a.Fragment,{},t)}},u=b.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,r=e.originalType,i=e.parentName,l=c(e,["components","mdxType","originalType","parentName"]),p=s(n),u=a,O=p["".concat(i,".").concat(u)]||p[u]||m[u]||r;return n?b.a.createElement(O,o(o({ref:t},l),{},{components:n})):b.a.createElement(O,o({ref:t},l))}));function O(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var r=n.length,i=new Array(r);i[0]=u;var o={};for(var c in t)hasOwnProperty.call(t,c)&&(o[c]=t[c]);o.originalType=e,o.mdxType="string"==typeof e?e:a,i[1]=o;for(var l=2;l<r;l++)i[l]=n[l];return b.a.createElement.apply(null,i)}return b.a.createElement.apply(null,n)}u.displayName="MDXCreateElement"}}]);