#Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

#Fzf
source <(fzf --zsh)

#Starchip prompt
eval "$(starship init zsh)"