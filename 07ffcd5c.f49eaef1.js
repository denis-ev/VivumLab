(window.webpackJsonp=window.webpackJsonp||[]).push([[6],{232:function(e,t,n){"use strict";n.d(t,"a",(function(){return p})),n.d(t,"b",(function(){return O}));var a=n(0),b=n.n(a);function l(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function r(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?r(Object(n),!0).forEach((function(t){l(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):r(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,a,b=function(e,t){if(null==e)return{};var n,a,b={},l=Object.keys(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||(b[n]=e[n]);return b}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(b[n]=e[n])}return b}var c=b.a.createContext({}),s=function(e){var t=b.a.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},p=function(e){var t=s(e.components);return b.a.createElement(c.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return b.a.createElement(b.a.Fragment,{},t)}},m=b.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,l=e.originalType,r=e.parentName,c=o(e,["components","mdxType","originalType","parentName"]),p=s(n),m=a,O=p["".concat(r,".").concat(m)]||p[m]||u[m]||l;return n?b.a.createElement(O,i(i({ref:t},c),{},{components:n})):b.a.createElement(O,i({ref:t},c))}));function O(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var l=n.length,r=new Array(l);r[0]=m;var i={};for(var o in t)hasOwnProperty.call(t,o)&&(i[o]=t[o]);i.originalType=e,i.mdxType="string"==typeof e?e:a,r[1]=i;for(var c=2;c<l;c++)r[c]=n[c];return b.a.createElement.apply(null,r)}return b.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"},68:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return r})),n.d(t,"metadata",(function(){return i})),n.d(t,"rightToc",(function(){return o})),n.d(t,"default",(function(){return s}));var a=n(3),b=n(7),l=(n(0),n(232)),r={id:"bulletnotes",title:"BulletNotes",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"BulletNotes",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},i={unversionedId:"software/bulletnotes",id:"software/bulletnotes",isDocsHomePage:!1,title:"BulletNotes",description:"BulletNotes",source:"@site/docs/software/bulletnotes.md",slug:"/software/bulletnotes",permalink:"/docs/software/bulletnotes",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"BulletNotes",sidebar:"docs",previous:{title:"Bookstack",permalink:"/docs/software/bookstack"},next:{title:"Calibre",permalink:"/docs/software/calibre"}},o=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling bulletnotes",id:"enabling-bulletnotes",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],c={rightToc:o};function s(e){var t=e.components,n=Object(b.a)(e,["components"]);return Object(l.b)("wrapper",Object(a.a)({},c,n,{components:t,mdxType:"MDXLayout"}),Object(l.b)("h1",{id:"bulletnotes"},"BulletNotes"),Object(l.b)("p",null,Object(l.b)("a",Object(a.a)({parentName:"p"},{href:"https://github.com/Vivumlab/BulletNotes/"}),"BulletNotes")," is an open source note taking app."),Object(l.b)("p",null,Object(l.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(l.b)("br",null),"\n",Object(l.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(l.b)("br",null),"\n",Object(l.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(l.b)("br",null)),Object(l.b)("h2",{id:"information"},"Information"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(l.b)("br",null),"\n",Object(l.b)("strong",{parentName:"p"},"Current Image Version:")," latest"),Object(l.b)("h2",{id:"setup"},"SETUP"),Object(l.b)("h3",{id:"enabling-bulletnotes"},"Enabling bulletnotes"),Object(l.b)("h4",{id:"command"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.enable True"))),Object(l.b)("h4",{id:"file-alteration"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  enable: True\n")),Object(l.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h2",{id:"first-run"},"FIRST RUN"),Object(l.b)("p",null,"!!! ",Object(l.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(l.b)("br",null),"\n!!! Below are some ",Object(l.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(l.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(l.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(l.b)("p",null,"Navigate to ",Object(l.b)("em",{parentName:"p"},"https://False/admin")),Object(l.b)("p",null,"Create an account with your desired username; as this is the first user, bulletnotes makes this account the administrator."),Object(l.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(l.b)("ol",null,Object(l.b)("li",{parentName:"ol"},"run ",Object(l.b)("strong",{parentName:"li"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(l.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(l.b)("li",{parentName:"ol"},"make some changes")),Object(l.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(l.b)("ol",{start:3},Object(l.b)("li",{parentName:"ol"},"run ",Object(l.b)("strong",{parentName:"li"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))," to complete the changes")),Object(l.b)("h2",{id:"access"},"ACCESS"),Object(l.b)("p",null,"Bulletnotes (HTTPS) link: ",Object(l.b)("a",Object(a.a)({parentName:"p"},{href:"https://bulletnotes.vivumlab.xyz/"}),"https://bulletnotes.vivumlab.xyz/"),"\nBulletnotes (HTTP) link: ",Object(l.b)("a",Object(a.a)({parentName:"p"},{href:"http://bulletnotes.vivumlab.xyz/"}),"http://bulletnotes.vivumlab.xyz/")),Object(l.b)("h2",{id:"options"},"OPTIONS"),Object(l.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(l.b)("p",null,Object(l.b)("em",{parentName:"p"},"Default: False")," ",Object(l.b)("br",null),"\n",Object(l.b)("em",{parentName:"p"},"Options: True/False")),Object(l.b)("h4",{id:"command-1"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.https_only True"))),Object(l.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  https_only: True\n")),Object(l.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h3",{id:"auth"},"AUTH"),Object(l.b)("p",null,Object(l.b)("em",{parentName:"p"},"Default: False")," ",Object(l.b)("br",null),"\n",Object(l.b)("em",{parentName:"p"},"Options: True/False")),Object(l.b)("h4",{id:"command-2"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.auth True"))),Object(l.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  auth: True\n")),Object(l.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h3",{id:"domain"},"DOMAIN"),Object(l.b)("p",null,Object(l.b)("em",{parentName:"p"},"Default: False")," ",Object(l.b)("br",null),"\n",Object(l.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(l.b)("h4",{id:"command-3"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.domain bulletnotes.com"))),Object(l.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  domain: bulletnotes.com\n")),Object(l.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(l.b)("p",null,Object(l.b)("em",{parentName:"p"},"Default: bulletnotes")," ",Object(l.b)("br",null),"\n",Object(l.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(l.b)("h4",{id:"command-4"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.subdomain media"))),Object(l.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  subdomain: media\n")),Object(l.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h3",{id:"version"},"VERSION"),Object(l.b)("p",null,Object(l.b)("em",{parentName:"p"},"Default: latest")," ",Object(l.b)("br",null),"\n",Object(l.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(l.b)("h4",{id:"command-5"},"Command:"),Object(l.b)("p",null,Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab set bulletnotes.version 2.7"))),Object(l.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(l.b)("p",null,"set the appropriate service settings in ",Object(l.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(l.b)("p",null,"eg."),Object(l.b)("pre",null,Object(l.b)("code",Object(a.a)({parentName:"pre"},{}),"bulletnotes\n  version: 2.7\n")),Object(l.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(l.b)("p",null,"run: ",Object(l.b)("strong",{parentName:"p"},Object(l.b)("inlineCode",{parentName:"strong"},"vlab update_one service=bulletnotes"))),Object(l.b)("h2",{id:"need-more-help"},"Need more help?"),Object(l.b)("p",null,"Further information regarding services can be found. ",Object(l.b)("br",null),"\nGeneral Information can be found in the ",Object(l.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(l.b)("br",null),"\nAdditional assistance can be found on our ",Object(l.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}s.isMDXComponent=!0}}]);