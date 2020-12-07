const {docuHash} = require('@docusaurus/utils');

const redirects = [
  ["/docs/", "/docs/Welcome", false],
  ["/getting_started", "/docs/core/Getting-Started", false],
];

module.exports = function() {
  return {
    name: 'docusaurus-plugin',
    async contentLoaded({actions}) {
      const {addRoute, createData} = actions;

      await Promise.all(
        redirects.map(async redirect => {
          const dest = JSON.stringify({to: redirect[1], forComponent: redirect[2]});
          const destPath = await createData(`${docuHash(redirect[0])}.json`, dest);

          addRoute({
            path: redirect[0],
            component: '@site/src/exports/redirect.js',
            modules: {
              dest: destPath,
            },
            exact: true,
          });
        }),
      );
    },
  };
};
