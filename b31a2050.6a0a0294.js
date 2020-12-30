(window.webpackJsonp=window.webpackJsonp||[]).push([[109],{181:function(e,t,n){"use strict";n.r(t),n.d(t,"frontMatter",(function(){return i})),n.d(t,"metadata",(function(){return c})),n.d(t,"rightToc",(function(){return s})),n.d(t,"default",(function(){return p}));var a=n(3),r=n(7),o=(n(0),n(232)),i={id:"backup",title:"VivumLab Backup",hide_title:!0,hide_table_of_contents:!1,sidebar_label:"Backup",custom_edit_url:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md"},c={unversionedId:"core/backup",id:"core/backup",isDocsHomePage:!1,title:"VivumLab Backup",description:"VivumLab Backups",source:"@site/docs/core/Backup.md",slug:"/core/backup",permalink:"/docs/core/backup",editUrl:"https://github.com/VivumLab/VivumLab/issues/new?template=documentation.md",version:"current",sidebar_label:"Backup",sidebar:"docs",previous:{title:"Next Step",permalink:"/docs/core/getting-started"},next:{title:"Cloud Bastion Server",permalink:"/docs/core/bastion"}},s=[{value:"Get access to an S3 Bucket",id:"get-access-to-an-s3-bucket",children:[]},{value:"Use your own S3",id:"use-your-own-s3",children:[]},{value:"Configure the Backup Service",id:"configure-the-backup-service",children:[]},{value:"Restoring Backups",id:"restoring-backups",children:[]}],l={rightToc:s};function p(e){var t=e.components,n=Object(r.a)(e,["components"]);return Object(o.b)("wrapper",Object(a.a)({},l,n,{components:t,mdxType:"MDXLayout"}),Object(o.b)("h1",{id:"vivumlab-backups"},"VivumLab Backups"),Object(o.b)("p",null,"VivumLab is capable of automatically backing itself up in a smart, incremental, encrypted way to any S3 compatible storage provider, using ",Object(o.b)("a",Object(a.a)({parentName:"p"},{href:"https://restic.net/"}),"Restic")," and ",Object(o.b)("a",Object(a.a)({parentName:"p"},{href:"https://minio.io/"}),"Minio"),"."),Object(o.b)("p",null,"This is in addition to and separate from the Backup service included within VivumLab, which backs up your personal computers to the VivumLab servers."),Object(o.b)("h2",{id:"get-access-to-an-s3-bucket"},"Get access to an S3 Bucket"),Object(o.b)("p",null,"Ideally you want your backups to be offsite, so really the best case scenario would be to find a friend also running VivumLab, and trade S3 access with them."),Object(o.b)("p",null,"Alternatively, you could pay Amazon and use their S3 service."),Object(o.b)("h2",{id:"use-your-own-s3"},"Use your own S3"),Object(o.b)("p",null,"Backing up to your own infrastructure does not protect your data, especially in the case of server failure or data corruption. However it is still possible to use your own S3 bucket; this may be useful due to Restic's snapshotting. So while this won't give you an offsite backup, it will still provide timed snapshots to access old versions of files."),Object(o.b)("p",null,"View your logs for the Minio service (eg. vivumlab_minio_1) and copy the ",Object(o.b)("inlineCode",{parentName:"p"},"AccessKey")," and ",Object(o.b)("inlineCode",{parentName:"p"},"SecretKey")," out of the logs.\nRun ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the vault, and put the keys into under the ",Object(o.b)("inlineCode",{parentName:"p"},"s3_access_key")," and ",Object(o.b)("inlineCode",{parentName:"p"},"s3_secret_key")," variables in the decrypted",Object(o.b)("inlineCode",{parentName:"p"},"settings/vault.yml")," file.\nNow login to your Minio with the same access and secret key values and create a bucket called ",Object(o.b)("inlineCode",{parentName:"p"},"restic-backups"),".\nFinally run ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab update"))," to copy your new settings up to your VivumLab server."),Object(o.b)("p",null,"!!! Note: When self hosting your own S3, its good practice to keep good backups of the S3 data files as well."),Object(o.b)("h2",{id:"configure-the-backup-service"},"Configure the Backup Service"),Object(o.b)("p",null,"To configure the backup service, 4 parameters are required; they are:\n",Object(o.b)("inlineCode",{parentName:"p"},"s3_path"),"\n",Object(o.b)("inlineCode",{parentName:"p"},"s3_access_key"),"\n",Object(o.b)("inlineCode",{parentName:"p"},"s3_secret_key"),"\n",Object(o.b)("inlineCode",{parentName:"p"},"s3_backup_password")," (please generate a strong password)"),Object(o.b)("p",null,"You can set all these parameters as follows:\n",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab set s3_path <S3 path>")),"\n",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab set s3_access_key <S3 access key>")),"\n",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab set s3_secret_key <S3 secret key>")),"\n",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab set s3_backup_password <your S3 password>"))),Object(o.b)("p",null,"You can also manually set the required S3 parameters in ",Object(o.b)("inlineCode",{parentName:"p"},"settings/vault.yml")," and ",Object(o.b)("inlineCode",{parentName:"p"},"settings/config.yml"),"\nRun ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab decrypt"))," to decrypt the vault before editing it, and set the respective parameters. Finalize any changes with ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab deploy"))),Object(o.b)("p",null,"Once these are set, VivumLab will back up all it's core data every night at 4 AM."),Object(o.b)("h2",{id:"restoring-backups"},"Restoring Backups"),Object(o.b)("p",null,"To restore your most recent backup, simply run ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab restore")),"; then proceed with the normal install step of running ",Object(o.b)("strong",{parentName:"p"},Object(o.b)("inlineCode",{parentName:"strong"},"vlab deploy")),"."),Object(o.b)("p",null,"This should result in a fully working VivumLab setup with the backed up data."),Object(o.b)("p",null,"Alternatively you can work directly with the Restic backups through its own 'docker shell' (see below)."),Object(o.b)("p",null,"Accessing the restic shell, enables you to run commands like ",Object(o.b)("inlineCode",{parentName:"p"},"restic snapshots")," to list all your snapshots.\nTo restore (for example) just your NextCloud data, you can run ",Object(o.b)("inlineCode",{parentName:"p"},"docker exec restic_restic_1 restic restore latest --include /data/nextcloud --target /data/nextcloud"),"."),Object(o.b)("p",null,"VivumLab strongly suggests that you read the ",Object(o.b)("a",Object(a.a)({parentName:"p"},{href:"https://restic.readthedocs.io/en/latest/"}),"Restic")," documentation, prior to backing up any files, especially important and irreplacable files."))}p.isMDXComponent=!0},232:function(e,t,n){"use strict";n.d(t,"a",(function(){return u})),n.d(t,"b",(function(){return m}));var a=n(0),r=n.n(a);function o(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function c(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){o(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function s(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},o=Object.keys(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)n=o[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var l=r.a.createContext({}),p=function(e){var t=r.a.useContext(l),n=t;return e&&(n="function"==typeof e?e(t):c(c({},t),e)),n},u=function(e){var t=p(e.components);return r.a.createElement(l.Provider,{value:t},e.children)},b={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},d=r.a.forwardRef((function(e,t){var n=e.components,a=e.mdxType,o=e.originalType,i=e.parentName,l=s(e,["components","mdxType","originalType","parentName"]),u=p(n),d=a,m=u["".concat(i,".").concat(d)]||u[d]||b[d]||o;return n?r.a.createElement(m,c(c({ref:t},l),{},{components:n})):r.a.createElement(m,c({ref:t},l))}));function m(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=n.length,i=new Array(o);i[0]=d;var c={};for(var s in t)hasOwnProperty.call(t,s)&&(c[s]=t[s]);c.originalType=e,c.mdxType="string"==typeof e?e:a,i[1]=c;for(var l=2;l<o;l++)i[l]=n[l];return r.a.createElement.apply(null,i)}return r.a.createElement.apply(null,n)}d.displayName="MDXCreateElement"}}]);