### [1.0.2](https://github.com/VivumLab/VivumLab/compare/v1.0.1...v1.0.2) (2021-01-17)


### Bug Fixes

* minify dockerfile by using alpine image ([#292](https://github.com/VivumLab/VivumLab/issues/292)) ([2099328](https://github.com/VivumLab/VivumLab/commit/20993283d481abdc4050d61e9dc190d475b02aea))

### [1.0.1](https://github.com/VivumLab/VivumLab/compare/v1.0.0...v1.0.1) (2021-01-15)


### Bug Fixes

* update search api key ([892eb54](https://github.com/VivumLab/VivumLab/commit/892eb542dc7f97c64a61e3a2a6047c1fadda1f6c))

## [1.0.0](https://github.com/VivumLab/VivumLab/compare/v0.5.2...v1.0.0) (2021-01-15)


### ⚠ BREAKING CHANGES

* **cli:** Task-it CLI (bash based) changes to Thor Cli (ruby based)

### Features

* **codeowners:** add CODEOWNERS file and basic rules ([#249](https://github.com/VivumLab/VivumLab/issues/249)) ([aa0545d](https://github.com/VivumLab/VivumLab/commit/aa0545d4db1278709b098a04c432bce4b7effbf9))
* **cli:** adding Thor CLI with SOPS ([#219](https://github.com/VivumLab/VivumLab/issues/219)) ([dea959f](https://github.com/VivumLab/VivumLab/commit/dea959ff1074d8760fe51db9c15e42b408aa66d4))
* **service:** adds mastodon ([#267](https://github.com/VivumLab/VivumLab/issues/267)) ([e71eef2](https://github.com/VivumLab/VivumLab/commit/e71eef2e398ee6f377f29134842cb749a47f8c05))
* **automation:** automatically add owner of merged PR as a contributor ([#250](https://github.com/VivumLab/VivumLab/issues/250)) ([cb95f9d](https://github.com/VivumLab/VivumLab/commit/cb95f9d9b0e0c9cfa5b0a5556ecf937b836448cd))
* cache docker images ([#277](https://github.com/VivumLab/VivumLab/issues/277)) ([39ad695](https://github.com/VivumLab/VivumLab/commit/39ad695d42de123c50192230272360b9a0d7470e))
* securely templated overrides  ([#285](https://github.com/VivumLab/VivumLab/issues/285)) ([b917e20](https://github.com/VivumLab/VivumLab/commit/b917e20b30de872cc6f6ff6f0e4c9bebd5b0f458))
* skip setup tag after first setup. ([#265](https://github.com/VivumLab/VivumLab/issues/265)) ([bdaf9b4](https://github.com/VivumLab/VivumLab/commit/bdaf9b47ac9f226d8444ea8fd840b1229b77b8e9))


### Bug Fixes

* add config update before deploy and update ([c8093cd](https://github.com/VivumLab/VivumLab/commit/c8093cdc0d81ad529d1c7aca3776ab59fa8ff38e))
* add enable wait_for_connection activated via variable ([#262](https://github.com/VivumLab/VivumLab/issues/262)) ([6b61e91](https://github.com/VivumLab/VivumLab/commit/6b61e91d613efbe7a6c81cb52103fecbd8681c8c))
* auto trigger release after 10 commits ([#246](https://github.com/VivumLab/VivumLab/issues/246)) ([df028a2](https://github.com/VivumLab/VivumLab/commit/df028a24d4c02d87508da53c4f44c177a89e168a))
* change https_only to hsts and default true ([#268](https://github.com/VivumLab/VivumLab/issues/268)) ([9936639](https://github.com/VivumLab/VivumLab/commit/99366396bf87b24ce1b209ad74dfa7ad598a5ca5))
* code-server's password param is wrong. ([#287](https://github.com/VivumLab/VivumLab/issues/287)) ([a937d9c](https://github.com/VivumLab/VivumLab/commit/a937d9c21eca4e9edad73c84e372929fdc62dfc1)), closes [#284](https://github.com/VivumLab/VivumLab/issues/284)
* **services:** correct ownership permissions ([#230](https://github.com/VivumLab/VivumLab/issues/230)) ([b8a833d](https://github.com/VivumLab/VivumLab/commit/b8a833ddf72c35e86bae3f4379553a2c328b3ffa))
* fix docker-compose path traefik.service ([01a6ffc](https://github.com/VivumLab/VivumLab/commit/01a6ffc5b9646b584a2ea05c66b3e4cc2c0ad52b))
* fix hardcoded config paths ([#264](https://github.com/VivumLab/VivumLab/issues/264)) ([0cf7ea2](https://github.com/VivumLab/VivumLab/commit/0cf7ea2af15969d05dea859a643c560fd9f8dcfb))
* **traefik:** fix insecure traefik port ([#239](https://github.com/VivumLab/VivumLab/issues/239)) ([0c47bea](https://github.com/VivumLab/VivumLab/commit/0c47beab910ad88920c09a102a8fd89ade33b67b))
* **service:** fix statping using db instead of sqlite ([#275](https://github.com/VivumLab/VivumLab/issues/275)) ([39748ad](https://github.com/VivumLab/VivumLab/commit/39748ad68f63b6ef2158ef7be1cbde9e6d09a5d4))
* fixes issue with modulo math that caused an error ([#279](https://github.com/VivumLab/VivumLab/issues/279)) ([a7fa8ed](https://github.com/VivumLab/VivumLab/commit/a7fa8edfed1ef801b73def98f67ecb08af7bd788))
* fixes WIP failing status ([#253](https://github.com/VivumLab/VivumLab/issues/253)) ([5e5a7fd](https://github.com/VivumLab/VivumLab/commit/5e5a7fdf57738e85e3a98e6c4c12803135cd07ec))
* gh action 01 ([3b71eea](https://github.com/VivumLab/VivumLab/commit/3b71eea6821311b2163b155368b744bed31b867f))
* **cli:** hides service:setup so that the user only sees vlab service NAME setup ([#269](https://github.com/VivumLab/VivumLab/issues/269)) ([1fa7d0e](https://github.com/VivumLab/VivumLab/commit/1fa7d0ef79cfc13be556e03ba68c29984d2df1d4))
* new config commmand ([#280](https://github.com/VivumLab/VivumLab/issues/280)) ([a44e2a1](https://github.com/VivumLab/VivumLab/commit/a44e2a1d6f6267e2816a64daa3abfd2fa0371c4d)), closes [#278](https://github.com/VivumLab/VivumLab/issues/278)
* not working when: query | bool ([8ada006](https://github.com/VivumLab/VivumLab/commit/8ada0065e00fad5c879b8eababdb8999c8f6feb8))
* removes ssh check ([#281](https://github.com/VivumLab/VivumLab/issues/281)) ([4219cea](https://github.com/VivumLab/VivumLab/commit/4219cea0577b2a57ce7779ff50edaa02d248aad2))
* rename CodiMd to HedgeDoc ([#286](https://github.com/VivumLab/VivumLab/issues/286)) ([7f42128](https://github.com/VivumLab/VivumLab/commit/7f421286865e12c314174d6076eb32e6637bbbb0)), closes [#283](https://github.com/VivumLab/VivumLab/issues/283)
* switch from mkdocs to docusaurus v2 ([#190](https://github.com/VivumLab/VivumLab/issues/190)) ([1c86254](https://github.com/VivumLab/VivumLab/commit/1c86254b240c3ea3116fff7f5cce6d6b93a38f41))
* **service:** update nextcloud  ([#234](https://github.com/VivumLab/VivumLab/issues/234)) ([b6fbf3f](https://github.com/VivumLab/VivumLab/commit/b6fbf3fc0a65877ae3b404dc52cdd5edc0d9c74e))
* **service:** use python3 with debinstall ([#217](https://github.com/VivumLab/VivumLab/issues/217)) ([1e19432](https://github.com/VivumLab/VivumLab/commit/1e19432e22a36ef0ebd907f498f968c3598b9d6a))

### [0.5.3](https://github.com/VivumLab/VivumLab/compare/v0.5.2...v0.5.3) (2020-12-30)


### Bug Fixes

* **services:** correct ownership permissions ([#230](https://github.com/VivumLab/VivumLab/issues/230)) ([2c0aa47](https://github.com/VivumLab/VivumLab/commit/2c0aa479151d606fd6444efa23d2fcafb603159e))
* not working when: query | bool ([f713c13](https://github.com/VivumLab/VivumLab/commit/f713c13165d354985533ef25962b9e03220b464e))
* switch from mkdocs to docusaurus v2 ([#190](https://github.com/VivumLab/VivumLab/issues/190)) ([c3c4687](https://github.com/VivumLab/VivumLab/commit/c3c4687dd11935186b3559331dcee9ac9c715056))
* **service:** use python3 with debinstall ([#217](https://github.com/VivumLab/VivumLab/issues/217)) ([1e19432](https://github.com/VivumLab/VivumLab/commit/1e19432e22a36ef0ebd907f498f968c3598b9d6a))

### [0.5.2](https://github.com/VivumLab/VivumLab/compare/v0.5.1...v0.5.2) (2020-12-10)


### Bug Fixes

* **service:** :pencil2: fix typo ([#215](https://github.com/VivumLab/VivumLab/issues/215)) ([9388c19](https://github.com/VivumLab/VivumLab/commit/9388c191aa86f3baa00a32829cd1dcc9f71c72e6))
* **ci:** fix docker-publish lint ([#213](https://github.com/VivumLab/VivumLab/issues/213)) ([5765f59](https://github.com/VivumLab/VivumLab/commit/5765f59171dd94ce21662490ceecd7f5229ddb6c))

### [0.5.1](https://github.com/VivumLab/VivumLab/compare/v0.5.0...v0.5.1) (2020-12-09)


### Bug Fixes

* **ci:** fix docker-publish workflow ([#212](https://github.com/VivumLab/VivumLab/issues/212)) ([e5b2de9](https://github.com/VivumLab/VivumLab/commit/e5b2de9443a8750ee8ba5f20fa5cbdead5d63086))

## [0.5.0](https://github.com/VivumLab/VivumLab/compare/v0.4.0...v0.5.0) (2020-12-09)


### Features

* **service:** add kutt ([#180](https://github.com/VivumLab/VivumLab/issues/180)) ([cab85e2](https://github.com/VivumLab/VivumLab/commit/cab85e2271e11c3e8c430897228a6822cb62d6ee))
* **service:** add wificard ([#182](https://github.com/VivumLab/VivumLab/issues/182)) ([1f1a15e](https://github.com/VivumLab/VivumLab/commit/1f1a15e374fa9d842dffa87ff7f1a278ab44d242))
* **core:** allows user to create/use different config files ([#133](https://github.com/VivumLab/VivumLab/issues/133)) ([cb5e885](https://github.com/VivumLab/VivumLab/commit/cb5e88534285a47a04d2020383a4333ebf8b133d))
* **service:** service/adds hastebin ([#145](https://github.com/VivumLab/VivumLab/issues/145)) ([977b8bd](https://github.com/VivumLab/VivumLab/commit/977b8bd179ffd99095c70b8940f1e72a5a40b601))


### Bug Fixes

* **core:** add new package wizard ([#118](https://github.com/VivumLab/VivumLab/issues/118)) ([0510d1a](https://github.com/VivumLab/VivumLab/commit/0510d1afaf08dfd2901139520f6863f0447f37e2))
* **sui:** fix for SUI not working ([#166](https://github.com/VivumLab/VivumLab/issues/166)) ([b7f9f7a](https://github.com/VivumLab/VivumLab/commit/b7f9f7a0d7619622022e2c58591b7d5cb95422d6))
* **service:** fixes turtl ([#181](https://github.com/VivumLab/VivumLab/issues/181)) ([269de05](https://github.com/VivumLab/VivumLab/commit/269de05453c42cbd017555853ab6558053c28152))
* **wireguard:** fixing wireguard key exchange ([#187](https://github.com/VivumLab/VivumLab/issues/187)) ([89d471b](https://github.com/VivumLab/VivumLab/commit/89d471baeb427f84e92b0c73d05edcd5ceb7d20b))
* **service:** kutt docker-compose.yml ([#186](https://github.com/VivumLab/VivumLab/issues/186)) ([c40e6a2](https://github.com/VivumLab/VivumLab/commit/c40e6a2726b032323406148888060dacaade9fb3))
* latest unbound variable error ([#153](https://github.com/VivumLab/VivumLab/issues/153)) ([c5b9fdf](https://github.com/VivumLab/VivumLab/commit/c5b9fdff1bd8b4353c06cf70eb02e2f3d22d6cb6))
* **ci:** pre-commit should not run on push master or dev ([#191](https://github.com/VivumLab/VivumLab/issues/191)) ([192b411](https://github.com/VivumLab/VivumLab/commit/192b4118f04e3aa3e50fbe306b040ba581746982))
* **travis:** travis build instead of pull docker images ([#174](https://github.com/VivumLab/VivumLab/issues/174)) ([7bfae96](https://github.com/VivumLab/VivumLab/commit/7bfae964d22782fbb8dcaf027a960e62e2e6e66a))
* **service:** wificard main.yml ([#185](https://github.com/VivumLab/VivumLab/issues/185)) ([b37505f](https://github.com/VivumLab/VivumLab/commit/b37505fb938d0ebeda2654bbb0998f65c7d8c7cd))


### Reverts

* **core:** allows user to create/use different config files ([#133](https://github.com/VivumLab/VivumLab/issues/133)) ([#160](https://github.com/VivumLab/VivumLab/issues/160)) ([3ad5d77](https://github.com/VivumLab/VivumLab/commit/3ad5d77f9b2cceb241363abc855aa5d2396f0e57))

## [0.4.0](https://github.com/VivumLab/VivumLab/compare/v0.3.1...v0.4.0) (2020-11-02)


### Features

* **dev:** allows choice to be a dev or a user ([#137](https://github.com/VivumLab/VivumLab/issues/137)) ([bcd5c38](https://github.com/VivumLab/VivumLab/commit/bcd5c38540b4ef09f96bab7432060fa4bd3fd06c))


### Bug Fixes

* **docs:** linebreak in docs fixed ([#140](https://github.com/VivumLab/VivumLab/issues/140)) ([6e82ed6](https://github.com/VivumLab/VivumLab/commit/6e82ed6d0e07dc436c6afe57d345cb20538879e2))

### [0.3.1](https://github.com/VivumLab/VivumLab/compare/v0.3.0...v0.3.1) (2020-11-02)


### Bug Fixes

* **docs:** linebreak fix ([#139](https://github.com/VivumLab/VivumLab/issues/139)) ([9b831c0](https://github.com/VivumLab/VivumLab/commit/9b831c0a9edc1a75df0638e1d70de8699f77c58d))

## [0.3.0](https://github.com/VivumLab/VivumLab/compare/v0.2.0...v0.3.0) (2020-10-22)


### Features

* **release:** :white_check_mark: add semantic-release dry-run for dev branch ([#106](https://github.com/VivumLab/VivumLab/issues/106)) ([22ef4fa](https://github.com/VivumLab/VivumLab/commit/22ef4faad1994e531764ff6bbee8e3fe43d3b890))
* **docs:** Add options to specified commands ([#107](https://github.com/VivumLab/VivumLab/issues/107)) ([33e8dc4](https://github.com/VivumLab/VivumLab/commit/33e8dc40eee1fc5c402292376a8ab34fcb855476))


### Bug Fixes

* **service:** :bug: fix netdata errors ([#92](https://github.com/VivumLab/VivumLab/issues/92)) ([56128d7](https://github.com/VivumLab/VivumLab/commit/56128d71268255ac9b35c3d823f51abc3e229ea6))
* **service:** :bug: fixed wrong ansible variable in bitwarden ([#96](https://github.com/VivumLab/VivumLab/issues/96)) ([036c3db](https://github.com/VivumLab/VivumLab/commit/036c3db27a6e7e906263b78b7a69587d4d5d29c6))
* **core:** fixes deploy error for CentOS ([#109](https://github.com/VivumLab/VivumLab/issues/109)) ([b748c88](https://github.com/VivumLab/VivumLab/commit/b748c88995d2daf7093688ea555a2bf048ae3839))
* **service:** fixing docs service ([#105](https://github.com/VivumLab/VivumLab/issues/105)) ([7f1a388](https://github.com/VivumLab/VivumLab/commit/7f1a388173968502bef296b2de1cb5917f729a62))
* **core:** rename vlabTasks.sh, fix image versioning ([#103](https://github.com/VivumLab/VivumLab/issues/103)) ([ab414b5](https://github.com/VivumLab/VivumLab/commit/ab414b5f53a68b2bc2bd04fc09957f98746d764a))
* **core:** vivum logo/link, contributing.md, other docs ([#102](https://github.com/VivumLab/VivumLab/issues/102)) ([1c1b42a](https://github.com/VivumLab/VivumLab/commit/1c1b42accfdfb70bb3f22885565dfdc445bfccb2))

## [0.2.0](https://github.com/VivumLab/VivumLab/compare/v0.1.0...v0.2.0) (2020-10-18)


### Features

* **service:** :recycle: update netdata to keep config persistant ([#81](https://github.com/VivumLab/VivumLab/issues/81)) ([64ccda8](https://github.com/VivumLab/VivumLab/commit/64ccda86e6f729ddcf018b4f87497ad2282b12cf))
* **core:** SSH keys can be created within VivumLab ([#82](https://github.com/VivumLab/VivumLab/issues/82)) ([8df383c](https://github.com/VivumLab/VivumLab/commit/8df383c75dd0c6625ce712f6d039b0e29cd0cec3))


### Bug Fixes

* **service:** adds CentOS support for Netdata ([#87](https://github.com/VivumLab/VivumLab/issues/87)) ([9ad0198](https://github.com/VivumLab/VivumLab/commit/9ad019896668dbbbd6896e305e0e832e08e3a5c0))
* **setup:** fixes small issue with sshkeys/bash ([#79](https://github.com/VivumLab/VivumLab/issues/79)) ([63abc92](https://github.com/VivumLab/VivumLab/commit/63abc926269e95b55dd0b29f7960f6c0bade9255))

## [0.1.0](https://github.com/VivumLab/VivumLab/compare/v0.0.1...v0.1.0) (2020-10-07)


### Features

* **cleanup:** :wastebasket: cleanup unused website folder ([#78](https://github.com/VivumLab/VivumLab/issues/78)) ([b311fcb](https://github.com/VivumLab/VivumLab/commit/b311fcb28c6cb3beceeacbaaf364fe5397989312))
* **logo:** added picture logo ([#14](https://github.com/VivumLab/VivumLab/issues/14)) ([9db669d](https://github.com/VivumLab/VivumLab/commit/9db669d210b067afdfd95540fd28b57dc81a38b5))
* **service:** adding Readarr ([#4](https://github.com/VivumLab/VivumLab/issues/4)) ([90c5a8a](https://github.com/VivumLab/VivumLab/commit/90c5a8a5efef13f657e7b2d92edf381f9e276950))
* **core:** adds user tasks, that interact with the server ([#34](https://github.com/VivumLab/VivumLab/issues/34)) ([7ec548f](https://github.com/VivumLab/VivumLab/commit/7ec548f1eec3231350c0b7a5bbdf39c6bb4ff186))
* **core:** allow user to specify ssh keys ([#35](https://github.com/VivumLab/VivumLab/issues/35)) ([f39cd80](https://github.com/VivumLab/VivumLab/commit/f39cd80a29e573da8567bf5f3d2942f27e15fe49))
* **core:** Allows shell to use ansible variables ([#19](https://github.com/VivumLab/VivumLab/issues/19)) ([0995778](https://github.com/VivumLab/VivumLab/commit/09957785d0ea57ba688cbc314f744a819a1e510b))
* **core:** debug option for ansible playbook commands ([#15](https://github.com/VivumLab/VivumLab/issues/15)) ([1e2d21b](https://github.com/VivumLab/VivumLab/commit/1e2d21b776ed1efcd5bb6769998b87e2084df2b6))
* **core:** host docker daemon on ([#13](https://github.com/VivumLab/VivumLab/issues/13)) ([ac22945](https://github.com/VivumLab/VivumLab/commit/ac229459b9178b8ae016ef219378031e61a4f310))
* **core:** revised the setup prompts ([#17](https://github.com/VivumLab/VivumLab/issues/17)) ([5d7f450](https://github.com/VivumLab/VivumLab/commit/5d7f4508c7d339a289264f6bf81b59ced6937ca4))
* **core:** separate install of centos and debian based systems ([#18](https://github.com/VivumLab/VivumLab/issues/18)) ([b0a180b](https://github.com/VivumLab/VivumLab/commit/b0a180bffc3819c6836c4cb4e02c96db0b7cca91))
* **core:** task to create user edittable files/services ([#53](https://github.com/VivumLab/VivumLab/issues/53)) ([9b616bf](https://github.com/VivumLab/VivumLab/commit/9b616bfeb68cee1e50b4f626851f9f2e1b5c19b2))


### Bug Fixes

* **travis:** add python3 ([#27](https://github.com/VivumLab/VivumLab/issues/27)) ([e49eef9](https://github.com/VivumLab/VivumLab/commit/e49eef97db1eff4abc3d49a03bf6eadf05e6deea))
* **travis:** adding pre-commit stage to travis ([#24](https://github.com/VivumLab/VivumLab/issues/24)) ([a799b24](https://github.com/VivumLab/VivumLab/commit/a799b24f72a4f21d2b36801f0a01bda12b1e4b65))
* **travis:** adding commitlint ([#31](https://github.com/VivumLab/VivumLab/issues/31)) ([b71bc9d](https://github.com/VivumLab/VivumLab/commit/b71bc9d5f9434caa01ec0e90e0abd9c25931ae5c))
* **travis:** apt needs sudo ([#28](https://github.com/VivumLab/VivumLab/issues/28)) ([938ed5c](https://github.com/VivumLab/VivumLab/commit/938ed5c088dd7a8e782f1a9b0bf88e1cd2751870))
* **service:** authelia bug fix (new version) ([#8](https://github.com/VivumLab/VivumLab/issues/8)) ([5277acb](https://github.com/VivumLab/VivumLab/commit/5277acb5b70083578f996be123a2739097286875))
* **service:** authelia config bug ([#21](https://github.com/VivumLab/VivumLab/issues/21)) ([8fd68aa](https://github.com/VivumLab/VivumLab/commit/8fd68aa6dffbfe833c420c8dcb2c3bca5d5fbf45))
* **travis:** change language to python ([#30](https://github.com/VivumLab/VivumLab/issues/30)) ([0d90bbb](https://github.com/VivumLab/VivumLab/commit/0d90bbb4dbcc9afd83e937f2a6dd7d2a50c6fc94))
* **travis:** change pip to pip3 ([#26](https://github.com/VivumLab/VivumLab/issues/26)) ([e53af92](https://github.com/VivumLab/VivumLab/commit/e53af92dbe4c75ac638c7f4aea81bb1e91273b15))
* **travis:** commitlint fix ([#41](https://github.com/VivumLab/VivumLab/issues/41)) ([e1fae4e](https://github.com/VivumLab/VivumLab/commit/e1fae4e9c4aa96a55521e0e5f2265f936920e310))
* **service:** config.yml added watchtower.subdomain False ([#11](https://github.com/VivumLab/VivumLab/issues/11)) ([fc43902](https://github.com/VivumLab/VivumLab/commit/fc43902a8f17073d9958c249464c1be5a03ec324))
* db version no automatic main version change ([#75](https://github.com/VivumLab/VivumLab/issues/75)) ([556f5c9](https://github.com/VivumLab/VivumLab/commit/556f5c9c0e116a8acbe2d847f31836b9ea272521))
* **drone:** disable trim_blocks ([5f11964](https://github.com/VivumLab/VivumLab/commit/5f119642c4a60b18e881f228aacbc7dbbf4df22a))
* **travis:** fix automatic changelog ([#51](https://github.com/VivumLab/VivumLab/issues/51)) ([9c51e4b](https://github.com/VivumLab/VivumLab/commit/9c51e4beb0b936609199920e162efdd942975628))
* **cli:** fix cli run vlab update include more tasks ([4b8910a](https://github.com/VivumLab/VivumLab/commit/4b8910a77d05de27e6a24a2b59ad2a3721aae5f2))
* **ansible:** fix vlab update ([451b748](https://github.com/VivumLab/VivumLab/commit/451b7484ddf9feee61dbb1f53d01f17fca13e28e))
* **commitzen:** fixes commitzen cli dependencies ([#2](https://github.com/VivumLab/VivumLab/issues/2)) ([35bd93e](https://github.com/VivumLab/VivumLab/commit/35bd93e4a162e1188c0cafc5fd38c8b4c2cffd5f))
* **travis:** fixing commitlint ([#44](https://github.com/VivumLab/VivumLab/issues/44)) ([b55277a](https://github.com/VivumLab/VivumLab/commit/b55277a13a7ebaf8124047a1659dfcf5fb43dc2c))
* **service:** jinja2 trim_blocks ([#20](https://github.com/VivumLab/VivumLab/issues/20)) ([02ff58c](https://github.com/VivumLab/VivumLab/commit/02ff58c982ceb8c62e6f8a25267370e4f3400f16))
* **lint:** lint fixes ([#23](https://github.com/VivumLab/VivumLab/issues/23)) ([aa0b209](https://github.com/VivumLab/VivumLab/commit/aa0b2098589829c08e99237d8b2e8b25f464b585))
* **service:** netdata necessities and nice-to-haves fix needs become yes ([#55](https://github.com/VivumLab/VivumLab/issues/55)) ([97e8f4d](https://github.com/VivumLab/VivumLab/commit/97e8f4d9ba69ffc3bd48503377aa51456619e2fb))
* **service:** nextcloud (file permission set to user) ([#6](https://github.com/VivumLab/VivumLab/issues/6)) ([dcd0401](https://github.com/VivumLab/VivumLab/commit/dcd0401fb0e81848ab1059a2db9d78f6b6318fc9))
* nextcloud move webroot to storage_dir ([#7](https://github.com/VivumLab/VivumLab/issues/7)) ([26495b7](https://github.com/VivumLab/VivumLab/commit/26495b7310dd42744bb427b56bda2f9a4b5c4aa7))
* **ansible:** set unnecessary gather_facts for restart playbook to no ([b80eccb](https://github.com/VivumLab/VivumLab/commit/b80eccbb9a731567ebcd75793093bc5cd66b4d2b))
* small fix / disable cleanup ([#40](https://github.com/VivumLab/VivumLab/issues/40)) ([c1b65ae](https://github.com/VivumLab/VivumLab/commit/c1b65aed6ee9fa72c3ed1c9052aa7a70e7507fe1))
* **travis:** still trying to fix commitlint travis ([#43](https://github.com/VivumLab/VivumLab/issues/43)) ([7c32df6](https://github.com/VivumLab/VivumLab/commit/7c32df6dae0c5caed8a3a9b53f27773cb94c93e0))
* tmp files stacked via unused volumes ([#10](https://github.com/VivumLab/VivumLab/issues/10)) ([9a44870](https://github.com/VivumLab/VivumLab/commit/9a44870e1c0133c46657892a0f90777367f0ed50))
* **travis:** travis pre-commit change to run-all ([#25](https://github.com/VivumLab/VivumLab/issues/25)) ([41f2728](https://github.com/VivumLab/VivumLab/commit/41f2728278a3d1a7211422b5b305cb3435eb69cd))
* **service:** tv and movies not in video folder ([#5](https://github.com/VivumLab/VivumLab/issues/5)) ([5509748](https://github.com/VivumLab/VivumLab/commit/55097487b3771168cd15305309835405f4f5c15c))
* **travis:** typo ([#42](https://github.com/VivumLab/VivumLab/issues/42)) ([6de9f09](https://github.com/VivumLab/VivumLab/commit/6de9f0957b69f249cb454f97ef2660da3594b893))
* **ansible:** variable watchtower.domain is needed for ansible ([#9](https://github.com/VivumLab/VivumLab/issues/9)) ([82f710c](https://github.com/VivumLab/VivumLab/commit/82f710cc94442ee62db202474a3d28de2f8a9c73))
* **service:** zammad version bump and nginx scheme fix ([#12](https://github.com/VivumLab/VivumLab/issues/12)) ([9f1d2f7](https://github.com/VivumLab/VivumLab/commit/9f1d2f74dba736c3b700ef9a1daf0d46eab2f01a))
