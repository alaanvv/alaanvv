alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias nvim='~/nvim/bin/nvim'
alias fman='compgen -c | fzf | xargs man'
alias imfzf='nvim $(fzf --border=sharp --margin=0,$((($COLUMNS-$LINES)/4)) --info=hidden --pointer=- --marker=- --tabstop=2 --color=bw --preview="head -n $(($LINES-2)) {}" --cycle --preview-window=right,60%,border-left)'
