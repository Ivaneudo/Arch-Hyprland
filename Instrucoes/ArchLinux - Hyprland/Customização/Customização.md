#TECNOLOGIA #LINUX 
## Iniciando customização

#### Interface Hyprland

Rode o comando a seguir para entrar na interface gráfica:
```Shell
start-hyprland
```

No terminal entre nas configurações do Hyprland.
```shell
nano .config/hypr/hyprland.lua
```

Configurando básicas:
```lua
-----------------------------
----Munitor(14 polegadas)----
-----------------------------
hl.munitor({
	output   = "",
	mode     = "1920x1080",
	position = "0x0",
	scale    = "1",
})

-------------------
----MY PROGRAMS----
-------------------
local terminal    = "kitty"
local fileManager = "nemo"
local menu        = "wofi --show drun"
local browser     = "brave"

---------------------
----LOOK AND FILL----
---------------------
hl.config({
	general = {
	--Ache apenas essas duas configurações e modifique-as
		gaps_in  = 2,
		gaps_out = 10,

-------------
----INPUT----
-------------
hl.config({
	input = {
	--Mude de acordo com o seu teclado
		kb_layout   = "BR"
		kb_variante = "ABNT-2"

-------------------
----KEYBINDINGS----
-------------------
hl.bin(mainMod .. " + B", hl.dsp.exec_cmd(browser))

```
#### Terminal

Abra o seu terminal e mude o tema dele. Rode:
```
kitten theme
```

Clique na `/` para pesquisar e digite "cat". Clique em `ENTER` e selecione o tema `Catppuccin-Mocha` ou qualquer outro que você desejar. De `ENTER` mais uma vez e Digite m para salvar. 

#### Mudando para o zsh

O zsh é um terminal mais bonito e poderoso. Siga as instruções para ver ou assista o primeiro vídeo da nossa Bibliografia no minuto 44.

```Shell
#Instalando o zsh
sudo pacman -S zsh

#Verifique onde o seu zsh está
which zsh

#Copie o caminho aqui
chsh -s /usr/bin/zsh

#Saida do sistema para ativar o zsh
SUPER + M

#Sai do seu login
exit

#Após logar de um ENTER quando surgir uma mensagem do zsh e rode o seu hyprland
start-hyprland
```

Agora vamos deixar o zsh mais bonito. No seu terminal rode o seguinte comando
```Shell
sudo pacman -S starship zsh-autosuggestions zsh-syntax-highlighting fzf

#Verifique se um arquivo .zshrc foi criada na raiz do seu usário.
cd ~
ls -a

#Caso esse arquivo não tenha sido criada durante a instalação. Rode o seguinte comando
touch .zshrc
```

Agora com o arquivo criado, rode os comandos a seguir para estilizar o seu zsh
```Shell
code .zshrc

#Apague qualquer comentário que tenha dentro do arquivo e escreva
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
eval "$(starship init zsh)"

#Digite os comandos
Ctrl + O 
ENTER
exic zsh
```

Mudando a font do terminal
```Shell
#Rode o comando abaixo, escolha a font que preferir e de ENTER 2x
kitten choose-font

#Deixar o font bonita no starship também
starship preset nerd-font-symbols -o ~/.config/starchip.toml  
```

