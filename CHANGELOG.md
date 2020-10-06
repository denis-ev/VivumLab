## Unreleased

### Refactor

- **service**: fix RSSHub env values (#59)
- **logo**: extra space, new colours (#60)
- **service**: remove unnecessary bookstack www-data permissions (#58)
- **service**: update jellyfin default version (#63)
- **logo**: added text logo to match (#62)
- **core**: fixes deploy, removes red wall of text (#61)
- **setup**: fixed debinstall.yml not found error (#57)
- **core**: fixed error in lifestyleTask file (#56)
- **core**: fixes commands using custom sshkeys (#54)
- **travis**: git credentials (#52)
- **travis**: branch set to master for release (#50)
- add automatic changelog (#49)
- move docs deployment to travis ci (#39)
- **docs**: documentation update (#36)
- **core**: refactor error system, fix service param, etc (#32)
- changing travis to only run when merged to master (#22)
- first commit

### Fix

- **service**: netdata necessities and nice-to-haves fix needs become yes (#55)
- **travis**: fix automatic changelog (#51)
- **travis**: fixing commitlint (#44)
- **travis**: still trying to fix commitlint travis (#43)
- **travis**: typo (#42)
- **travis**: commitlint fix (#41)
- small fix / disable cleanup (#40)
- **travis**: adding commitlint (#31)
- **travis**: change language to python (#30)
- **travis**: apt needs sudo (#28)
- **travis**: add python3 (#27)
- **travis**: change pip to pip3 (#26)
- **travis**: travis pre-commit change to run-all (#25)
- **travis**: addding pre-commit stage to travis (#24)
- **lint**: lint fixes (#23)
- **service**: authelia config bug (#21)
- **service**: jinja2 trim_blocks (#20)
- **service**: zammad version bump and nginx scheme fix (#12)
- **service**: config.yml added watchtower.subdomain False (#11)
- tmp files stacked via unused volumes (#10)
- **ansible**: variable watchtower.domain is needed for ansible (#9)
- **service**: authelia bug fix (new version) (#8)
- nextcloud move webroot to storage_dir (#7)
- **service**: nextcloud (file permission set to user) (#6)
- **service**: tv and movies not in video folder (#5)
- **commitzen**: fixes commitzen cli dependencies (#2)
- **cli**: fix cli run vlab update include more tasks
- **ansible**: fix vlab update
- **ansible**: set unnecessary gather_facts for restart playbook to no
- **drone**: disable trim_blocks

### Feat

- **core**: task to create user edittable files/services (#53)
- **core**: allow user to specify ssh keys (#35)
- **core**: adds user tasks, that interact with the server (#34)
- **core**: Allows shell to use ansible variables (#19)
- **core**: separate install of centos and debian based systems (#18)
- **core**: revised the setup prompts (#17)
- **core**: debug option for ansible playbook commands (#15)
- **logo**: added picture logo (#14)
- **core**: host docker daemon on (#13)
- **service**: adding Readarr (#4)
