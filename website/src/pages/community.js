import React from 'react';

import styles from './community.module.css';
import classnames from 'classnames';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';

import useDocusaurusContext from '@docusaurus/useDocusaurusContext';

function Community() {
  const context = useDocusaurusContext();

  return (
    <Layout title="Community" description="Where to ask questions and find your soul mate">
      <header className="hero">
        <div className="container text--center">
          <h1>Community</h1>
          <div className="hero--subtitle">
            These are places where you can ask questions and find your soul mate (no promises).
          </div>
          {/* <img className={styles.headerImg} src="/img/Blobsocial.svg" /> */}
        </div>
      </header>
      <main>
        <div className="container">
          <div className="row margin-vert--lg">
            <div className="col text--center padding-vert--md">
              <div className="card">
                <div className="card__header">
                  <i className={classnames(styles.icon, styles.chat)}></i>
                </div>
                <div className="card__body">
                  <p>Join the official VivumLab Zulip Chat</p>
                </div>
                <div className="card__footer">
                  <Link to="https://vivumlab.zulipchat.com/" className="button button--outline button--primary button--block">Join</Link>
                </div>
              </div>
            </div>

            <div className="col text--center padding-vert--md">
              <div className="card">
                <div className="card__header">
                  <i className={classnames(styles.icon, styles.email)}></i>
                </div>
                <div className="card__body">
                  <p>Say hello via email</p>
                </div>
                <div className="card__footer">
                  <Link to="mailto:hello@vivumlab.xyz" className="button button--outline button--primary button--block">hello&#64;vivumlab.xzy</Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </Layout>
  );
}

export default Community;
