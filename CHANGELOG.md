# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### 0.0.2 (2020-10-06)


### Features

* **core:** adds user tasks, that interact with the server ([#34](https://github.com/Vivumlab/VivumLab/issues/34)) ([7ec548f](https://github.com/Vivumlab/VivumLab/commit/7ec548f1eec3231350c0b7a5bbdf39c6bb4ff186))
* **core:** allow user to specify ssh keys ([#35](https://github.com/Vivumlab/VivumLab/issues/35)) ([f39cd80](https://github.com/Vivumlab/VivumLab/commit/f39cd80a29e573da8567bf5f3d2942f27e15fe49))
* **core:** Allows shell to use ansible variables ([#19](https://github.com/Vivumlab/VivumLab/issues/19)) ([0995778](https://github.com/Vivumlab/VivumLab/commit/09957785d0ea57ba688cbc314f744a819a1e510b))
* **core:** debug option for ansible playbook commands ([#15](https://github.com/Vivumlab/VivumLab/issues/15)) ([1e2d21b](https://github.com/Vivumlab/VivumLab/commit/1e2d21b776ed1efcd5bb6769998b87e2084df2b6))
* **core:** host docker daemon on ([#13](https://github.com/Vivumlab/VivumLab/issues/13)) ([ac22945](https://github.com/Vivumlab/VivumLab/commit/ac229459b9178b8ae016ef219378031e61a4f310))
* **core:** revised the setup prompts ([#17](https://github.com/Vivumlab/VivumLab/issues/17)) ([5d7f450](https://github.com/Vivumlab/VivumLab/commit/5d7f4508c7d339a289264f6bf81b59ced6937ca4))
* **core:** separate install of centos and debian based systems ([#18](https://github.com/Vivumlab/VivumLab/issues/18)) ([b0a180b](https://github.com/Vivumlab/VivumLab/commit/b0a180bffc3819c6836c4cb4e02c96db0b7cca91))
* **core:** task to create user edittable files/services ([#53](https://github.com/Vivumlab/VivumLab/issues/53)) ([9b616bf](https://github.com/Vivumlab/VivumLab/commit/9b616bfeb68cee1e50b4f626851f9f2e1b5c19b2))
* **logo:** added picture logo ([#14](https://github.com/Vivumlab/VivumLab/issues/14)) ([9db669d](https://github.com/Vivumlab/VivumLab/commit/9db669d210b067afdfd95540fd28b57dc81a38b5))
* **service:** adding Readarr ([#4](https://github.com/Vivumlab/VivumLab/issues/4)) ([90c5a8a](https://github.com/Vivumlab/VivumLab/commit/90c5a8a5efef13f657e7b2d92edf381f9e276950))


### Bug Fixes

* **ansible:** fix vlab update ([451b748](https://github.com/Vivumlab/VivumLab/commit/451b7484ddf9feee61dbb1f53d01f17fca13e28e))
* **ansible:** set unnecessary gather_facts for restart playbook to no ([b80eccb](https://github.com/Vivumlab/VivumLab/commit/b80eccbb9a731567ebcd75793093bc5cd66b4d2b))
* **ansible:** variable watchtower.domain is needed for ansible ([#9](https://github.com/Vivumlab/VivumLab/issues/9)) ([82f710c](https://github.com/Vivumlab/VivumLab/commit/82f710cc94442ee62db202474a3d28de2f8a9c73))
* **cli:** fix cli run vlab update include more tasks ([4b8910a](https://github.com/Vivumlab/VivumLab/commit/4b8910a77d05de27e6a24a2b59ad2a3721aae5f2))
* **commitzen:** fixes commitzen cli dependencies ([#2](https://github.com/Vivumlab/VivumLab/issues/2)) ([35bd93e](https://github.com/Vivumlab/VivumLab/commit/35bd93e4a162e1188c0cafc5fd38c8b4c2cffd5f))
* **drone:** disable trim_blocks ([5f11964](https://github.com/Vivumlab/VivumLab/commit/5f119642c4a60b18e881f228aacbc7dbbf4df22a))
* **lint:** lint fixes ([#23](https://github.com/Vivumlab/VivumLab/issues/23)) ([aa0b209](https://github.com/Vivumlab/VivumLab/commit/aa0b2098589829c08e99237d8b2e8b25f464b585))
* **service:** authelia bug fix (new version) ([#8](https://github.com/Vivumlab/VivumLab/issues/8)) ([5277acb](https://github.com/Vivumlab/VivumLab/commit/5277acb5b70083578f996be123a2739097286875))
* **service:** authelia config bug ([#21](https://github.com/Vivumlab/VivumLab/issues/21)) ([8fd68aa](https://github.com/Vivumlab/VivumLab/commit/8fd68aa6dffbfe833c420c8dcb2c3bca5d5fbf45))
* **service:** config.yml added watchtower.subdomain False ([#11](https://github.com/Vivumlab/VivumLab/issues/11)) ([fc43902](https://github.com/Vivumlab/VivumLab/commit/fc43902a8f17073d9958c249464c1be5a03ec324))
* **service:** jinja2 trim_blocks ([#20](https://github.com/Vivumlab/VivumLab/issues/20)) ([02ff58c](https://github.com/Vivumlab/VivumLab/commit/02ff58c982ceb8c62e6f8a25267370e4f3400f16))
* **service:** netdata necessities and nice-to-haves fix needs become yes ([#55](https://github.com/Vivumlab/VivumLab/issues/55)) ([97e8f4d](https://github.com/Vivumlab/VivumLab/commit/97e8f4d9ba69ffc3bd48503377aa51456619e2fb))
* **service:** nextcloud (file permission set to user) ([#6](https://github.com/Vivumlab/VivumLab/issues/6)) ([dcd0401](https://github.com/Vivumlab/VivumLab/commit/dcd0401fb0e81848ab1059a2db9d78f6b6318fc9))
* **service:** tv and movies not in video folder ([#5](https://github.com/Vivumlab/VivumLab/issues/5)) ([5509748](https://github.com/Vivumlab/VivumLab/commit/55097487b3771168cd15305309835405f4f5c15c))
* **service:** zammad version bump and nginx scheme fix ([#12](https://github.com/Vivumlab/VivumLab/issues/12)) ([9f1d2f7](https://github.com/Vivumlab/VivumLab/commit/9f1d2f74dba736c3b700ef9a1daf0d46eab2f01a))
* **travis:** add python3 ([#27](https://github.com/Vivumlab/VivumLab/issues/27)) ([e49eef9](https://github.com/Vivumlab/VivumLab/commit/e49eef97db1eff4abc3d49a03bf6eadf05e6deea))
* **travis:** addding pre-commit stage to travis ([#24](https://github.com/Vivumlab/VivumLab/issues/24)) ([a799b24](https://github.com/Vivumlab/VivumLab/commit/a799b24f72a4f21d2b36801f0a01bda12b1e4b65))
* **travis:** adding commitlint ([#31](https://github.com/Vivumlab/VivumLab/issues/31)) ([b71bc9d](https://github.com/Vivumlab/VivumLab/commit/b71bc9d5f9434caa01ec0e90e0abd9c25931ae5c))
* **travis:** apt needs sudo ([#28](https://github.com/Vivumlab/VivumLab/issues/28)) ([938ed5c](https://github.com/Vivumlab/VivumLab/commit/938ed5c088dd7a8e782f1a9b0bf88e1cd2751870))
* **travis:** change language to python ([#30](https://github.com/Vivumlab/VivumLab/issues/30)) ([0d90bbb](https://github.com/Vivumlab/VivumLab/commit/0d90bbb4dbcc9afd83e937f2a6dd7d2a50c6fc94))
* **travis:** change pip to pip3 ([#26](https://github.com/Vivumlab/VivumLab/issues/26)) ([e53af92](https://github.com/Vivumlab/VivumLab/commit/e53af92dbe4c75ac638c7f4aea81bb1e91273b15))
* **travis:** commitlint fix ([#41](https://github.com/Vivumlab/VivumLab/issues/41)) ([e1fae4e](https://github.com/Vivumlab/VivumLab/commit/e1fae4e9c4aa96a55521e0e5f2265f936920e310))
* **travis:** fix automatic changelog ([#51](https://github.com/Vivumlab/VivumLab/issues/51)) ([9c51e4b](https://github.com/Vivumlab/VivumLab/commit/9c51e4beb0b936609199920e162efdd942975628))
* **travis:** fixing commitlint ([#44](https://github.com/Vivumlab/VivumLab/issues/44)) ([b55277a](https://github.com/Vivumlab/VivumLab/commit/b55277a13a7ebaf8124047a1659dfcf5fb43dc2c))
* **travis:** still trying to fix commitlint travis ([#43](https://github.com/Vivumlab/VivumLab/issues/43)) ([7c32df6](https://github.com/Vivumlab/VivumLab/commit/7c32df6dae0c5caed8a3a9b53f27773cb94c93e0))
* **travis:** typo ([#42](https://github.com/Vivumlab/VivumLab/issues/42)) ([6de9f09](https://github.com/Vivumlab/VivumLab/commit/6de9f0957b69f249cb454f97ef2660da3594b893))
* small fix / disable cleanup ([#40](https://github.com/Vivumlab/VivumLab/issues/40)) ([c1b65ae](https://github.com/Vivumlab/VivumLab/commit/c1b65aed6ee9fa72c3ed1c9052aa7a70e7507fe1))
* **travis:** travis pre-commit change to run-all ([#25](https://github.com/Vivumlab/VivumLab/issues/25)) ([41f2728](https://github.com/Vivumlab/VivumLab/commit/41f2728278a3d1a7211422b5b305cb3435eb69cd))
* nextcloud move webroot to storage_dir ([#7](https://github.com/Vivumlab/VivumLab/issues/7)) ([26495b7](https://github.com/Vivumlab/VivumLab/commit/26495b7310dd42744bb427b56bda2f9a4b5c4aa7))
* tmp files stacked via unused volumes ([#10](https://github.com/Vivumlab/VivumLab/issues/10)) ([9a44870](https://github.com/Vivumlab/VivumLab/commit/9a44870e1c0133c46657892a0f90777367f0ed50))

# 0.0.1

- Initial release
