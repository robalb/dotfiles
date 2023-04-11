alias k='kubectl'
alias kn='kubectl config set-context --current --namespace '
#alias kn='kubens'
alias kc='kubectx'
alias l='ls -hAl'
alias tf='terraform'

# move the latest downloaded file to the current path
alias lastd='ls -t1 ~/Downloads/ | head -1 | xargs -p -I{} mv ~/Downloads/{} .'

# dotfiles management 
# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
