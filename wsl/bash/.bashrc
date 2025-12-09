# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[38;5;50m\]wsl\[\e[0m\] [\[\e[2m\]\w\[\e[0m\]] > '

force_color_prompt=yes

# basic
alias c='clear'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias ll='ls -l'

# colorize
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ccat='highlight --out-format=ansi'

# aliases
alias r='ranger'
alias sr='sudo ranger'
alias vim='nvim'
alias sv='sudo -E -s nvim'
alias svim='sudo -E -s nvim'
alias mkc='sudo make clean install'
alias py='python3'

# git
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push origin main'
alias gs='git status'
alias gb='git branch'
alias gd='git diff'

# system
alias ka='killall'
alias SS='sudo systemctl'
alias reload='source ~/.bashrc'
alias syn='sudo mount -t cifs //192.168.1.90/homes/karl /mnt/synology/home -o username=karl,uid=1000,gid=1000,file_mode=0775,dir_mode=0775 && sudo mount -t nfs 192.168.1.90:/volume1/media /mnt/synology/media'

# navigation
alias ...='cd ../..'
alias ....='cd ../../..'
alias gg='cd ~/git'
alias gpy='cd ~/git/python'
alias dots='cd ~/git/dotfiles'

# exports
export EDITOR='nvim'
export LS_COLORS='di=1;38;5;180:ln=1;38;5;223:so=1;38;5;137:pi=1;38;5;137:ex=1;38;5;215:bd=1;38;5;173:cd=1;38;5;173:su=1;38;5;174:sg=1;38;5;166:tw=1;38;5;180:ow=1;38;5;180:st=1;38;5;137:mi=1;38;5;124:or=1;38;5;202:*.tar=1;38;5;172:*.zip=1;38;5;172:*.gz=1;38;5;180:*.xz=1;38;5;180:*.7z=1;38;5;180:*.mp3=1;38;5;223:*.ogg=1;38;5;223:*.flac=1;38;5;223:*.jpg=1;38;5;144:*.jpeg=1;38;5;144:*.png=1;38;5;144:*.gif=1;38;5;144:*.bmp=1;38;5;144:*.pdf=1;38;5;173:*.tex=1;38;5;180:*.doc=1;38;5;180:*.docx=1;38;5;180:*.odt=1;38;5;180:*.c=1;38;5;137:*.cpp=1;38;5;137:*.h=1;38;5;180:*.py=1;38;5;215:*.sh=1;38;5;215:*.go=1;38;5;180:*.rs=1;38;5;173:*.js=1;38;5;215:*.ts=1;38;5;223:*.json=1;38;5;223:*.xml=1;38;5;223:*.html=1;38;5;180:*.css=1;38;5;180'
export PATH=$PATH:$HOME/go/bin
