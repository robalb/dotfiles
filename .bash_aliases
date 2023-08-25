alias k='kubectl'
alias kn='kubectl config set-context --current --namespace '
#alias kn='kubens'
alias kc='kubectx'
alias l='ls -hAl'
alias tf='terraform'
alias vi=nvim
alias vim=nvim

# move the latest downloaded file to the current path
alias lastd='ls -t1 ~/Downloads/ | head -1 | xargs -p -I{} mv ~/Downloads/{} .'

# dotfiles management 
# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dig_any='function _dig_any() { domain="$1"; types=("A" "AAAA" "MX" "TXT" "NS" "SOA" "CNAME" "SRV" "NAPTR" "DNSKEY" "DS" "CAA"); for type in "${types[@]}"; do dig "$type" "$domain" +noall +multiline +answer; done; }; _dig_any'
