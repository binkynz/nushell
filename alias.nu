# vim: set filetype=nu :

alias nv = nvim .;
alias lg = lazygit

alias kdev = kubectl --context=dev
alias kedev = kubectl --context=eks.dev
alias kus = kubectl --context=prod-us
alias keus = kubectl --context=eks.prod-us
alias keu = kubectl --context=prod-eu
alias keeu = kubectl --context=eks.prod-eu
alias ktools = kubectl --context=tools

alias dcu = docker compose up -d
alias dcd = docker compose down
alias dvc = docker volume prune -a
