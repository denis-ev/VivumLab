(window.webpackJsonp=window.webpackJsonp||[]).push([[16],{229:function(e,t,a){"use strict";a.r(t);var n=a(0),l=a.n(n),r=a(24),i=a(233),c=a(22),o=a(238),s=a(235);var m=function(e){var t=e.metadata;return l.a.createElement("nav",{className:"pagination-nav","aria-label":"Blog list page navigation"},l.a.createElement("div",{className:"pagination-nav__item"},t.previous&&l.a.createElement(s.a,{className:"pagination-nav__link",to:t.previous.permalink},l.a.createElement("div",{className:"pagination-nav__sublabel"},"Previous"),l.a.createElement("div",{className:"pagination-nav__label"},"\xab ",t.previous.title))),l.a.createElement("div",{className:"pagination-nav__item pagination-nav__item--next"},t.next&&l.a.createElement(s.a,{className:"pagination-nav__link",to:t.next.permalink},l.a.createElement("div",{className:"pagination-nav__sublabel"},"Next"),l.a.createElement("div",{className:"pagination-nav__label"},t.next.title," \xbb"))))},d=a(236);var u=function(){var e=Object(c.default)().siteConfig.title,t=Object(d.useActivePlugin)({failfast:!0}).pluginId,a=Object(i.useDocsPreferredVersion)(t).savePreferredVersionName,n=Object(d.useActiveVersion)(t),r=Object(d.useDocVersionSuggestions)(t),o=r.latestDocSuggestion,m=r.latestVersionSuggestion;if(!m)return l.a.createElement(l.a.Fragment,null);var u,g=null!=o?o:(u=m).docs.find((function(e){return e.id===u.mainDocId}));return l.a.createElement("div",{className:"alert alert--warning margin-bottom--md",role:"alert"},"current"===n.name?l.a.createElement("div",null,"This is unreleased documentation for ",e," ",l.a.createElement("strong",null,n.label)," version."):l.a.createElement("div",null,"This is documentation for ",e," ",l.a.createElement("strong",null,n.label),", which is no longer actively maintained."),l.a.createElement("div",{className:"margin-top--md"},"For up-to-date documentation, see the"," ",l.a.createElement("strong",null,l.a.createElement(s.a,{to:g.path,onClick:function(){return a(m.name)}},"latest version"))," ","(",m.label,")."))},g=a(234);var v=function(e,t,a){var l=Object(n.useState)(void 0),r=l[0],i=l[1];Object(n.useEffect)((function(){function n(){var n=function(){var e=Array.from(document.getElementsByClassName("anchor")),t=e.find((function(e){return e.getBoundingClientRect().top>=a}));if(t){if(t.getBoundingClientRect().top>=a){var n=e[e.indexOf(t)-1];return null!=n?n:t}return t}return e[e.length-1]}();if(n)for(var l=0,c=!1,o=document.getElementsByClassName(e);l<o.length&&!c;){var s=o[l],m=s.href,d=decodeURIComponent(m.substring(m.indexOf("#")+1));n.id===d&&(r&&r.classList.remove(t),s.classList.add(t),i(s),c=!0),l+=1}}return document.addEventListener("scroll",n),document.addEventListener("resize",n),n(),function(){document.removeEventListener("scroll",n),document.removeEventListener("resize",n)}}))},E=a(78),f=a.n(E),p="table-of-contents__link";function b(e){var t=e.headings,a=e.isChild;return t.length?l.a.createElement("ul",{className:a?"":"table-of-contents table-of-contents__left-border"},t.map((function(e){return l.a.createElement("li",{key:e.id},l.a.createElement("a",{href:"#"+e.id,className:p,dangerouslySetInnerHTML:{__html:e.value}}),l.a.createElement(b,{isChild:!0,headings:e.children}))}))):null}var h=function(e){var t=e.headings;return v(p,"table-of-contents__link--active",100),l.a.createElement("div",{className:Object(g.a)(f.a.tableOfContents,"thin-scrollbar")},l.a.createElement(b,{headings:t}))},N=a(3),_=a(7),O=a(79),j=a.n(O),w=function(e){var t=e.className,a=Object(_.a)(e,["className"]);return l.a.createElement("svg",Object(N.a)({fill:"currentColor",height:"1.2em",width:"1.2em",preserveAspectRatio:"xMidYMid meet",role:"img",viewBox:"0 0 40 40",className:Object(g.a)(j.a.iconEdit,t)},a),l.a.createElement("g",null,l.a.createElement("path",{d:"m34.5 11.7l-3 3.1-6.3-6.3 3.1-3q0.5-0.5 1.2-0.5t1.1 0.5l3.9 3.9q0.5 0.4 0.5 1.1t-0.5 1.2z m-29.5 17.1l18.4-18.5 6.3 6.3-18.4 18.4h-6.3v-6.2z"})))},k=a(80),y=a.n(k);t.default=function(e){var t,a=Object(c.default)().siteConfig.url,n=e.content,s=n.metadata,v=n.frontMatter,E=v.image,f=v.keywords,p=v.hide_title,b=v.hide_table_of_contents,N=s.description,_=s.title,O=s.permalink,j=s.editUrl,k=s.lastUpdatedAt,C=s.lastUpdatedBy,x=Object(d.useActivePlugin)({failfast:!0}).pluginId,L=Object(d.useVersions)(x),I=Object(d.useActiveVersion)(x),A=L.length>1,S=Object(i.useTitleFormatter)(_),T=Object(o.a)(E,{absolute:!0});return l.a.createElement(l.a.Fragment,null,l.a.createElement(r.a,null,l.a.createElement("title",null,S),l.a.createElement("meta",{property:"og:title",content:S}),N&&l.a.createElement("meta",{name:"description",content:N}),N&&l.a.createElement("meta",{property:"og:description",content:N}),f&&f.length&&l.a.createElement("meta",{name:"keywords",content:f.join(",")}),E&&l.a.createElement("meta",{property:"og:image",content:T}),E&&l.a.createElement("meta",{property:"twitter:image",content:T}),E&&l.a.createElement("meta",{name:"twitter:image:alt",content:"Image for "+_}),O&&l.a.createElement("meta",{property:"og:url",content:a+O}),O&&l.a.createElement("link",{rel:"canonical",href:a+O})),l.a.createElement("div",{className:"row"},l.a.createElement("div",{className:Object(g.a)("col",(t={},t[y.a.docItemCol]=!b,t))},l.a.createElement(u,null),l.a.createElement("div",{className:y.a.docItemContainer},l.a.createElement("article",null,A&&l.a.createElement("div",null,l.a.createElement("span",{className:"badge badge--secondary"},"Version: ",I.label)),!p&&l.a.createElement("header",null,l.a.createElement("h1",{className:y.a.docTitle},_)),l.a.createElement("div",{className:"markdown"},l.a.createElement(n,null))),(j||k||C)&&l.a.createElement("div",{className:"margin-vert--xl"},l.a.createElement("div",{className:"row"},l.a.createElement("div",{className:"col"},j&&l.a.createElement("a",{href:j,target:"_blank",rel:"noreferrer noopener"},l.a.createElement(w,null),"Edit this page")),(k||C)&&l.a.createElement("div",{className:"col text--right"},l.a.createElement("em",null,l.a.createElement("small",null,"Last updated"," ",k&&l.a.createElement(l.a.Fragment,null,"on"," ",l.a.createElement("time",{dateTime:new Date(1e3*k).toISOString(),className:y.a.docLastUpdatedAt},new Date(1e3*k).toLocaleDateString()),C&&" "),C&&l.a.createElement(l.a.Fragment,null,"by ",l.a.createElement("strong",null,C)),!1))))),l.a.createElement("div",{className:"margin-vert--lg"},l.a.createElement(m,{metadata:s})))),!b&&n.rightToc&&l.a.createElement("div",{className:"col col--3"},l.a.createElement(h,{headings:n.rightToc}))))}}}]);