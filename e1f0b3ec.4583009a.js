(window.webpackJsonp=window.webpackJsonp||[]).push([[137],{211:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return s})),n.d(t,"rightToc",(function(){return l})),n.d(t,"default",(function(){return p}));var a=n(3),r=n(7),b=(n(0),n(232)),i={id:"speedtest",title:"Speedtest",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Speedtest",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},s={unversionedId:"software/speedtest",id:"software/speedtest",isDocsHomePage:!1,title:"Speedtest",description:"Speedtest",source:"@site/docs/software/speedtest.md",slug:"/software/speedtest",permalink:"/docs/software/speedtest",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Speedtest",sidebar:"docs",previous:{title:"Sonarr",permalink:"/docs/software/sonarr"},next:{title:"Statping",permalink:"/docs/software/statping"}},l=[{value:"Information",id:"information",children:[]},{value:"SETUP",id:"setup",children:[{value:"Enabling speedtest",id:"enabling-speedtest",children:[]}]},{value:"FIRST RUN",id:"first-run",children:[{value:"SMTP/ MAIL",id:"smtp-mail",children:[]}]},{value:"ACCESS",id:"access",children:[]},{value:"OPTIONS",id:"options",children:[{value:"HTTPS_ONLY",id:"https_only",children:[]},{value:"AUTH",id:"auth",children:[]},{value:"DOMAIN",id:"domain",children:[]},{value:"SUBDOMAIN",id:"subdomain",children:[]},{value:"VERSION",id:"version",children:[]}]},{value:"Need more help?",id:"need-more-help",children:[]}],c={rightToc:l};function p(e){var t=e.components,n=Object(r.a)(e,["components"]);return Object(b.b)("wrapper",Object(a.a)({},c,n,{components:t,mdxType:"MDXLayout"}),Object(b.b)("h1",{id:"speedtest"},"Speedtest"),Object(b.b)("p",null,Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://github.com/atribe/Speedtest-for-InfluxDB-and-Grafana"}),"Speedtest")," A tool to run periodic speedtests and save them in InfluxDB for graphing in Grafana"),Object(b.b)("p",null,Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-amd64-inactive?style=flat",alt:"amd64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-arm64-inactive?style=flat",alt:"arm64"}))," ",Object(b.b)("br",null),"\n",Object(b.b)("img",Object(a.a)({parentName:"p"},{src:"https://img.shields.io/badge/untested-armv7-inactive?style=flat",alt:"armv7"}))," ",Object(b.b)("br",null)),Object(b.b)("h2",{id:"information"},"Information"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},"Docker Image:")," !!! LINK TO DOCKER IMAGE/ DOCKER HUB !!! ",Object(b.b)("br",null),"\n",Object(b.b)("strong",{parentName:"p"},"Current Image Version:")," latest"),Object(b.b)("h2",{id:"setup"},"SETUP"),Object(b.b)("h3",{id:"enabling-speedtest"},"Enabling speedtest"),Object(b.b)("h4",{id:"command"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.enable True"))),Object(b.b)("h4",{id:"file-alteration"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  enable: True\n")),Object(b.b)("h4",{id:"finalising-changes"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h2",{id:"first-run"},"FIRST RUN"),Object(b.b)("p",null,"!!! ",Object(b.b)("strong",{parentName:"p"},"DEVELOPERS"),": make sure that you include any information that the user requires to get started, below. !!! ",Object(b.b)("br",null),"\n!!! Below are some ",Object(b.b)("strong",{parentName:"p"},"examples")," with headings, and with some ",Object(b.b)("strong",{parentName:"p"},"example")," instructions !!!"),Object(b.b)("h4",{id:"administrator-setup"},"ADMINISTRATOR SETUP"),Object(b.b)("p",null,"Navigate to ",Object(b.b)("em",{parentName:"p"},"https://False/admin")),Object(b.b)("p",null,"Create an account with your desired username; as this is the first user, speedtest makes this account the administrator."),Object(b.b)("h3",{id:"smtp-mail"},"SMTP/ MAIL"),Object(b.b)("ol",null,Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the ",Object(b.b)("inlineCode",{parentName:"li"},"vault.yml")," file"),Object(b.b)("li",{parentName:"ol"},"make some changes")),Object(b.b)("h4",{id:"smtp-settings"},"SMTP Settings"),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"smtp:\n  host:\n  port:\n  user:\n  pass:\n  from_email:\n  from_name:\n")),Object(b.b)("ol",{start:3},Object(b.b)("li",{parentName:"ol"},"run ",Object(b.b)("strong",{parentName:"li"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))," to complete the changes")),Object(b.b)("h2",{id:"access"},"ACCESS"),Object(b.b)("p",null,"speedtest (HTTPS) link: ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://speedtest.vivumlab.xyz/"}),"https://speedtest.vivumlab.xyz/"),"\nspeedtest (HTTP) link: ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"http://speedtest.vivumlab.xyz/"}),"http://speedtest.vivumlab.xyz/")),Object(b.b)("h2",{id:"options"},"OPTIONS"),Object(b.b)("h3",{id:"https_only"},"HTTPS_ONLY"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-1"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.https_only True"))),Object(b.b)("h4",{id:"file-alteration-1"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  https_only: True\n")),Object(b.b)("h5",{id:"finalising-changes-1"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h3",{id:"auth"},"AUTH"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"Options: True/False")),Object(b.b)("h4",{id:"command-2"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.auth True"))),Object(b.b)("h4",{id:"file-alteration-2"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  auth: True\n")),Object(b.b)("h5",{id:"finalising-changes-2"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h3",{id:"domain"},"DOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: False")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: include the sitename and top level domain suffix. eg. name.com, site.net")),Object(b.b)("h4",{id:"command-3"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.domain speedtest.com"))),Object(b.b)("h4",{id:"file-alteration-3"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  domain: speedtest.com\n")),Object(b.b)("h5",{id:"finalising-changes-3"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h3",{id:"subdomain"},"SUBDOMAIN"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: speedtest")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Periods/ delimiters are not required. eg. 'media' will set the full URL as 'media.vivumlab.xyz'")),Object(b.b)("h4",{id:"command-4"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.subdomain media"))),Object(b.b)("h4",{id:"file-alteration-4"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  subdomain: media\n")),Object(b.b)("h5",{id:"finalising-changes-4"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h3",{id:"version"},"VERSION"),Object(b.b)("p",null,Object(b.b)("em",{parentName:"p"},"Default: latest")," ",Object(b.b)("br",null),"\n",Object(b.b)("em",{parentName:"p"},"NOTE: Ensure that the version exists")),Object(b.b)("h4",{id:"command-5"},"Command:"),Object(b.b)("p",null,Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab set speedtest.version 2.7"))),Object(b.b)("h4",{id:"file-alteration-5"},"File alteration:"),Object(b.b)("p",null,"set the appropriate service settings in ",Object(b.b)("inlineCode",{parentName:"p"},"settings/config.yml")," to true"),Object(b.b)("p",null,"eg."),Object(b.b)("pre",null,Object(b.b)("code",Object(a.a)({parentName:"pre"},{}),"speedtest\n  version: 2.7\n")),Object(b.b)("h5",{id:"finalising-changes-5"},"Finalising changes:"),Object(b.b)("p",null,"run: ",Object(b.b)("strong",{parentName:"p"},Object(b.b)("inlineCode",{parentName:"strong"},"vlab update_one service=speedtest"))),Object(b.b)("h2",{id:"need-more-help"},"Need more help?"),Object(b.b)("p",null,"Further information regarding services can be found. ",Object(b.b)("br",null),"\nGeneral Information can be found in the ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com"}),"documentation"),". ",Object(b.b)("br",null),"\nAdditional assistance can be found on our ",Object(b.b)("a",Object(a.a)({parentName:"p"},{href:"https://docs.vivumlab.com/Contact-us"}),"Contact Us")," page."))}p.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return o})),n.d(t,"b",(function(){return u}));var a=n(0),r=n.n(a);function b(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function s(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){b(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},b=Object.keys(e);for(a=0;a<b.length;a++)n=b[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var b=Object.getOwnPropertySymbols(e);for(a=0;a<b.length;a++)n=b[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var c=r.a.createContext({}),p=function(e){var t=r.a.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):s(s({},t),e)),n},o=function(e){var t=p(e.components);return r.a.createElement(c.Provider,{value:t},e.children)},d={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},m=r.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,b=e.originalType,i=e.parentName,c=l(e,["components","mdxType","originalType","parentName"]),o=p(n),m=a,u=o["".concat(i,".").concat(m)]||o[m]||d[m]||b;return n?r.a.createElement(u,s(s({ref:t},c),{},{components:n})):r.a.createElement(u,s({ref:t},c))}));function u(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var b=n.length,i=new Array(b);i[0]=m;var s={};for(var l in t)hasOwnProperty.call(t,l)&&(s[l]=t[l]);s.originalType=e,s.mdxType="string"==typeof e?e:a,i[1]=s;for(var c=2;c<b;c++)i[c]=n[c];return r.a.createElement.apply(null,i)}return r.a.createElement.apply(null,n)}m.displayName="MDXCreateElement"}}]);