#TECNOLOGIA #LINUX 

A maior parte das modificações realizadas aqui, foram tiradas das documentações oficiais do Arch e vídeos no Youtube. Acesse a [[Bibliografia]]

---

## Comandos básicos e caminhos

Para abrir o terminal:  `SUPER + Q`
Fechar janela:          `SUPER + C` 
Limpe o terminal:       `Ctrl + L` ou `clear`
Configuração Hyprland:  `~/.config/hypr/hyprland.lua`
Configuração do pacman: `~/etc/pacman.conf` 

--- 


## Pacotes básicos

Interface, terminal, editor de texto básico e fonts:
```shell
sudo pacman -S hyprland kitty nano nato-fonts
```

#### Explorador de Arquivos, nemo. Lançador de Aplicativos, Wofi. Ferramenta de exibir de imagem e vídeo, eog e mpv

Rode o comando: 
```
sudo pacman -S nemo wofi eog mpv
```

#### Gerenciador de pacotes yay e suas dependencias
```Shell
#Baixe o git para conseguir clonar o repositório do yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
sudo pacman -S base-devel

#Construindo o yay
makepkg -si

#Verifique se instalou
yay --help

#Volte e já pode excluir o diretorio yay
cd ..
rm -fr yay/
```

#### Instalando um navegador
```Shell
#Para o navegar brave
yay -S brave

#Para o firefox
	sudo pacman -S firefox
```
#### Instalando editores de texto
```
yay -S visual-studio-code-bin --noconfirm
sudo pacman -S obsidian
```
#### Instalando a waybar
```
sudo pacman -S waybar
```

#### Instalando um font bonita
```Shell
sudo pacman -S ttf-jetbrains-mono-nerd
```

