#!/bin/bash
exec i3-msg -q "exec --no-startup-id $(compgen -c | fzf)"


