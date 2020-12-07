const path = require('path');

module.exports = {
  title: 'VivumLab',
  tagline: 'It\'s your data, it\'s your life. Own it, with VivumLab',
  url: 'https://vivumlab.com',
  baseUrl: '/',
  favicon: 'img/favicon.ico',
  organizationName: 'VivumLab',
  projectName: 'vivumlab',
  themeConfig: {
    prism: {
      theme: require('prism-react-renderer/themes/github'),
      darkTheme: require('./src/plugins/prism_themes/monokai'),
    },
    colorMode: {
      defaultMode: 'light',
    },
    image: 'img/og_img.png',
    metadatas: [{name: 'twitter:card', content: 'summary'}],
    navbar: {
      title: 'Vivumlab',
      logo: {
        alt: 'Vivumlab',
        src: 'logo250x75.png',
      },
      items: [
        {to: 'docs/welcome', label: 'Docs', position: 'left'},
        {to: 'community', label: 'Community', position: 'right'},
        {
          href: 'https://github.com/VivumLab/VivumLab/releases/latest',
          position: 'right',
          className: 'header-download-link header-icon-link',
          'aria-label': 'Download',
        },
        {
          href: 'https://github.com/VivumLab/VivumLab',
          position: 'right',
          className: 'header-github-link header-icon-link',
          'aria-label': 'GitHub repository',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Getting started',
              to: 'docs/core/Installation',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'Join the chat',
              to: 'community',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/VivumLab/VivumLab',
            },
          ],
        },
        {
          title: 'Social',
          items: [
            {
              label: 'Get in touch',
              to: 'community',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} VivumLab.`,
    },
    // googleAnalytics: {
    //   trackingID: '',
    // },
    algolia: {
      apiKey: 'ed517b25d6e55720f296c166c5bb5a02',
      indexName: 'vivumlab',
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/VivumLab/VivumLab/edit/master/website/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
        blog: {
          feedOptions: {
            type: 'all',
          },
        },
      },
    ],
  ],
  plugins: [
    path.resolve(__dirname, './src/plugins/redirects'),
  ],
};
