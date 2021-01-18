import React from 'react';
import classnames from 'classnames';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import useBaseUrl from '@docusaurus/useBaseUrl';
import styles from './index.module.css';
import CodeSnippet from "@site/src/theme/CodeSnippet";
import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

const installs = [
  {
    label: 'run',
    snippet: `# Start the CLI
./launch.sh`
  },
  {
    label: 'install',
    snippet: `# Install
git clone --branch master https://github.com/VivumLab/VivumLab.git

# Start the CLI
./launch.sh

# Run within the started Docker container
vlab deploy`
  },
  {
    label: 'dev-install',
    snippet: `# Developer Install
git clone --branch dev https://github.com/VivumLab/VivumLab.git

# Start the CLI with dev parameter
./launch.sh -v dev

# Run within the started Docker container
vlab deploy`
  },
  {
    label: 'local-build',
    snippet: `# Install
git clone https://github.com/VivumLab/VivumLab.git

# Build / Start the CLI
./launch.sh -v local

# Build branch / Start the CLI
./launch.sh -v local -b branch-name

# Start the CLI (Only works if image was build before)
./launch.sh -v local -s start

# Run within the started Docker container
vlab deploy`
  }
]

const snippets = [
  {
    label: 'Deploy',
    further: '/docs/core/Installation#enabling-services',
    config: `vlab deploy`,
  },
  {
    label: 'Enable / Update Service',
    further: '/docs/core/Installation#enabling-services',
    config: `# Enable a service
vlab service SERVICENAME enable -v true

# Update a service
vlab update -s SERVICENAME

# Show config for a service
vlab service SERVICENAME show

# Change options for a service
vlab service SERVICENAME setup`,
  },
  {
    label: 'Update all Services',
    further: '/docs/core/Installation#enabling-services',
    config: `vlab update`,
  },
  {
    label: 'Show config',
    further: '/docs/core/Installation#enabling-services',
    config: `# Show config for a service
    vlab service SERVICENAME show`,
  }
];

function Snippet({label, config}) {
  return (
    <CodeSnippet className={styles.configSnippet} snippet={config}></CodeSnippet>
  );
}

const features = [
  {
    title: 'Makes it easy to host your own services',
    description: (
      <>
        <p>
          Vivumlab solves the problem of debugging, <br/>
          just enable your services and run it.
        </p>
      </>
    ),
  }
];

function Feature({imageUrl, title, description}) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={classnames('col col--6', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={classnames('padding-vert--md', styles.featureImage)} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function Home() {
  const context = useDocusaurusContext();
  const {siteConfig = {}} = context;
  return (
    <Layout
      title={`${siteConfig.title}`}
      description="It's your data, it's your life. Own it, with VivumLab"
      keywords={["VivumLab","selfhosting","self hosting","privacy","homelab"]}>
      <header className={classnames('hero', styles.heroBanner)}>
        <div className="container">
          <div className="row">
            <div className={classnames('col')}> {/* col col--5 col--offset-1 */}
              <h1 className="hero__title">{siteConfig.title}</h1>
              <p className="hero__subtitle">{siteConfig.tagline}</p>
              <div className={styles.buttons}>
                <Link
                  className={classnames(
                    'button button--outline button--primary button--lg',
                    styles.getStarted,
                  )}
                  to={useBaseUrl('docs/Welcome')}>
                  Get Started
                </Link>
              </div>
            </div>
            {/* <div className={classnames('col col--5')}>
              <img className={styles.heroImg} src="img/dashboard.png" />
            </div> */}
          </div>
        </div>
      </header>
      <main>
        <div className="container">
          <div className="row">
            <div className={classnames(`${styles.pitch} col col--6`)}>
              <h2>It's boringly easy to use</h2>
              <p>
                Written by the VivumLab Community.
              </p>
              {installs && installs.length && (
                <Tabs defaultValue={installs[0].label} values={installs.map((props, idx) => {
                  return {label:props.label, value:props.label};
                })}>
                  {installs.map((props, idx) => (
                    <TabItem value={props.label}>
                      <CodeSnippet snippet={props.snippet} lang="bash"></CodeSnippet>
                    </TabItem>
                  ))}
                </Tabs>
              )}
            </div>
            <div className={classnames('col col--6')}>
                {snippets && snippets.length && (
                  <section className={styles.configSnippets}>
                    <Tabs defaultValue={snippets[0].label} values={snippets.map((props, idx) => {
                      return {label:props.label, value:props.label};
                    })}>
                      {snippets.map((props, idx) => (
                        <TabItem value={props.label}>
                          <>
                          <Snippet key={idx} {...props} />
                          <Link
                            className={classnames('button button--outline button--secondary')}
                            to={props.further}>
                            Read more
                          </Link>
                          </>
                        </TabItem>
                      ))}
                    </Tabs>
                  </section>
                )}
            </div>
          </div>
        </div>
        {features && features.length && (
          <section className={styles.features}>
            <div className="container margin-vert--md">
              <div className="row">
                {features.map((props, idx) => (
                  <Feature key={idx} {...props} />
                ))}
              </div>
            </div>
          </section>
        )}
        {/* <section className={styles.loveSection}>
          <div className="container">
            <div className="row">
              <div className={classnames('col col--6')}>
                <h3>Not yet sponsored</h3>
              </div>
              <div className={classnames('col col--6', styles.loveSectionPlea)}>
                <div>
                  <a href="https://github.com/sponsors/Vivumlab">
                    <img className={styles.loveImg} src="img/blobheart.svg" alt="Blob Heart" />
                  </a>
                </div>
                <Link
                  className={classnames('button button--danger')}
                  to="https://github.com/sponsors/Jeffail">
                  Become a sponsor
                </Link>
              </div>
            </div>
          </div>
        </section> */}
      </main>
    </Layout>
  );
}

export default Home;
