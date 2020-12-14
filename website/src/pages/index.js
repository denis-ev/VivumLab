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
    label: 'git',
    snippet: `# Install
git clone https://github.com/VivumLab/VivumLab.git

# Make a config
./vlab config

# Run
./vlab deploy`
  }
]

const snippets = [
  {
    label: 'Enable Services',
    further: '/docs/core/Installation#enabling-services',
    config: `vlab set SERVICENAME.enable=true

vlab deploy`,
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
    // imageUrl: 'img/Blobboring.svg',
    description: (
      <>
        <p>
          Vivumlab solves the problem of debugging, <br/>
          just enable your services and run it.
        </p>
      </>
    ),
  }
  // {
  //   title: 'Well Connected',
  //   imageUrl: 'img/Blobborg.svg',
  //   description: (
  //     <>
  //       <p>
  //         Benthos is able to glue a wide range of <a href="/docs/index">sources</a> and <a href="/docs/index">sinks</a> together and hook into a variety of <a href="/docs/components/processors/sql">databases</a>, <a href="/docs/components/processors/cache">caches</a>, <a href="/docs/components/processors/http">HTTP APIs</a>, <a href="/docs/components/processors/lambda">lambdas</a> and <a href="/docs/components/processors/about">more</a>, enabling you to seamlessly drop it into your existing infrastructure.
  //       </p>
  //       <p>
  //         Working with disparate APIs and services can be a daunting task, doubly so in a streaming data context. With Benthos it's possible to break these tasks down and automatically parallelize them as <a href="/cookbooks/enrichments">a streaming workflow</a>.
  //       </p>
  //     </>
  //   ),
  // },
  // {
  //   title: 'Reliable and Scalable',
  //   imageUrl: 'img/Blobscales.svg',
  //   description: (
  //     <>
  //       <p>
  //         Benthos runs fast and processes messages using a transaction model, making it able to guarantee at-least-once delivery even in the event of crashes or unexpected server faults.
  //       </p>
  //       <p>
  //         It's completely stateless, allowing for easy deployment and liberal scaling. It also exposes <a href="/docs/index">metrics</a> and <a href="/docs/index">tracing</a> events to targets of your choice.
  //       </p>
  //       <p>
  //         At Meltwater it's enriching over 450 million documents per day with a network of more than 20 NLP services. It sounds very interesting but rest assured, <a href="https://underthehood.meltwater.com/blog/2019/08/26/enriching-450m-docs-daily-with-a-boring-stream-processor">it's totally drab</a>.
  //       </p>
  //     </>
  //   ),
  // },
  // {
  //   title: 'Extendable',
  //   imageUrl: 'img/Blobextended.svg',
  //   description: (
  //     <>
  //       <p>
  //         Sometimes the components that come with Benthos aren't enough. Luckily, Benthos has been designed to be easily plugged with whatever components you need.
  //       </p>
  //       <p>
  //         You can either write plugins <a href="https://github.com/benthosdev/benthos-plugin-example">directly in Go (recommended)</a> or you can have Benthos run your plugin as a <a href="/docs/index">subprocess</a>.
  //       </p>
  //     </>
  //   ),
  // },
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
      description="The stream processor for mundane tasks"
      keywords={["benthos","stream processor","data engineering","ETL","ELT","event processor","go","golang"]}>
      <header className={classnames('hero', styles.heroBanner)}>
        <div className="container">
          <div className="row">
            <div className={classnames('col col--5 col--offset-1')}>
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
            <div className={classnames('col col--5')}>
              <img className={styles.heroImg} src="img/dashboard.png" />
            </div>
          </div>
        </div>
      </header>
      <main>
        <div className="container">
          <div className="row">
            <div className={classnames(`${styles.pitch} col col--6`)}>
              <h2>It's boringly easy to use</h2>
              <p>
                Written in Go, deployed as a static binary, declarative configuration. Cloud native as utter heck.
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
