#!/usr/bin/env bash

! grep -R --include='*.rb' --include='vlab' --exclude='demo_tasks.rb' 'puts ' . | grep -n "puts \'"
! grep -R --include='*.rb' --include='vlab' --exclude='demo_tasks.rb' 'puts ' . | grep -n 'puts \"'
! grep -R --include='*.rb' --include='vlab' --exclude='demo_tasks.rb' 'say ' . | grep -n "say \'"
! grep -R --include='*.rb' --include='vlab' --exclude='demo_tasks.rb' 'say ' . | grep -n 'say \"'
