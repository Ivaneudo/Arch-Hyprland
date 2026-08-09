#TECNOLOGIA #LINUX

A maior parte das modificações realizadas aqui, foram tiradas das documentações oficiais do Arch e vídeos no Youtube. Acesse a [[Bibliografia]]

---

## Comandos básicos e caminhos

|**Ação**|**Comando / Caminho**|
|---|---|
|Abrir o terminal|`SUPER + Q` (ou `ALT + Q`)|
|Fechar janela|`SUPER + C` (ou `ALT + C`)|
|Limpar o terminal|`Ctrl + L` ou `clear`|
|Configuração Hyprland|`~/.config/hypr/hyprland.lua`|
|Configuração do pacman|`/etc/pacman.conf`|
|Configuração da Waybar|`~/.config/waybar/config.jsonc` e `style.css`|

---

## Pacotes Essenciais (Interface, Terminal, Editor e Fontes)

```bash
sudo pacman -S hyprland kitty nano noto-fonts ttf-jetbrains-mono-nerd
```

|**Pacote**|**Função**|
|---|---|
|`hyprland`|Gerenciador de janelas (Wayland)|
|`kitty`|Terminal|
|`nano`|Editor de texto básico|
|`noto-fonts`|Fontes para emojis e fallback|
|`ttf-jetbrains-mono-nerd`|Fonte principal com ícones|

---

## Explorador de Arquivos, Lançador e Multimídia

```bash
sudo pacman -S nemo wofi eog mpv
```

|**Pacote**|**Função**|
|---|---|
|`nemo`|Explorador de arquivos|
|`wofi`|Lançador de aplicativos|
|`eog`|Visualizador de imagens (Eye of GNOME)|
|`mpv`|Reprodutor de vídeo e áudio|

---

## Gerenciador de Pacotes AUR (yay)

```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/
```

|**Pacote**|**Função**|
|---|---|
|`git`|Controle de versão|
|`base-devel`|Ferramentas de compilação|
|`yay`|Gerenciador de pacotes AUR|

---

## Navegadores

```bash
# Brave (via AUR)
yay -S brave-bin
# Firefox (via repositório oficial)
sudo pacman -S firefox
```

---

## Editores de Texto e Produtividade

```bash
# VS Code (via AUR)
yay -S visual-studio-code-bin
# Obsidian (via repositório oficial)
sudo pacman -S obsidian
```

---

## Waybar e Controle de Áudio

```bash
sudo pacman -S waybar pavucontrol
```

|**Pacote**|**Função**|
|---|---|
|`waybar`|Barra de status (Wayland)|
|`pavucontrol`|Controle de áudio (PulseAudio)|

---

## Tema Escuro e Aparência (GTK/Qt)

```bash
sudo pacman -S adw-gtk3 xdg-desktop-portal xdg-desktop-portal-gtk qt6ct qt5ct kvantum breeze-icons
```

|**Pacote**|**Função**|
|---|---|
|`adw-gtk3`|Tema escuro para GTK3/GTK4|
|`xdg-desktop-portal`|Portal para Wayland (arquivos, tela)|
|`xdg-desktop-portal-gtk`|Backend GTK para o portal|
|`qt6ct` / `qt5ct`|Configuração de tema para Qt|
|`kvantum`|Tema para aplicativos Qt|
|`breeze-icons`|Ícones para Qt|

---

## Wallpaper

```bash
sudo pacman -S hyprpaper
```

|**Pacote**|**Função**|
|---|---|
|`hyprpaper`|Gerenciador de wallpapers para Hyprland|

---

## Menu de Energia / Desligamento

```bash
sudo pacman -S nwg-bar
```

|**Pacote**|**Função**|
|---|---|
|`nwg-bar`|Menu de energia (desligar, reiniciar, bloquear)|

---

## Captura de Tela (Prints)

```bash
sudo pacman -S grim slurp wl-clipboard
```

|**Pacote**|**Função**|
|---|---|
|`grim`|Captura de tela (Wayland)|
|`slurp`|Seleção de área para captura|
|`wl-clipboard`|Área de transferência no Wayland|

> **Nota:** O `gnome-screenshot` foi testado, mas **não funcionou bem** no Hyprland. Por isso, optou-se pelo `grim` + `slurp`.

---

## Rede (Wi-Fi e Ethernet)

```bash
sudo pacman -S networkmanager network-manager-applet
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
```

|**Pacote**|**Função**|
|---|---|
|`networkmanager`|Gerenciador de redes|
|`network-manager-applet`|Ícone na bandeja do sistema para Wi-Fi|

> **Nota:** O applet da bandeja aparece automaticamente no módulo `tray` da Waybar.

---

## Bluetooth

```bash
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```

|**Pacote**|**Função**|
|---|---|
|`bluez`|Pilha Bluetooth|
|`bluez-utils`|Ferramentas (ex: `bluetoothctl`)|

> **Nota:** O Bluetooth **não funciona em máquinas virtuais** por padrão. Se estiver em uma VM, desative o módulo na Waybar.

---

## Ferramentas Adicionais (Opcionais)

```bash
sudo pacman -S mpd mpc playerctl brightnessctl pamixer
```

|**Pacote**|**Função**|
|---|---|
|`mpd` / `mpc`|Servidor e cliente de música|
|`playerctl`|Controle de mídia (Spotify, etc.)|
|`brightnessctl`|Controle de brilho|
|`pamixer`|Controle de áudio (alternativa ao pavucontrol)|

---

## Fontes de Ícones (Para Waybar e Terminal)

```bash
sudo pacman -S ttf-font-awesome
```

> **Nota:** Essencial para exibir ícones como ``, ``, `⚠` na Waybar e no terminal.

---

## Dependências do Python (para scripts da Waybar)

```bash
sudo pacman -S python python-requests
```

> **Nota:** Necessário para scripts como `waybar-wttr.py` (clima) e `mediaplayer.py`.

---

## Pacotes que foram TESTADOS, mas REMOVIDOS

|**Pacote**|**Motivo da remoção**|
|---|---|
|`flameshot`|Não funcionou bem no Wayland (erros de DBus e captura)|
|`gnome-screenshot`|Não funcionou com a interface interativa no Hyprland|
|`trayer`|Não encontrado nos repositórios oficiais; substituído pelo módulo `tray` da Waybar|

---

## Observações Finais

- **Tecla `SUPER` vs `ALT`:** No Hyprland, os atalhos foram configurados com `ALT` para evitar conflitos com o sistema hospedeiro (Ubuntu) em máquinas virtuais.
    
- **Waybar:** O módulo `tray` deve estar presente no `modules-right` para exibir ícones de aplicativos como NetworkManager e Flameshot.
    
- **Wallpaper:** O `hyprpaper` pode ter problemas com escala diferente de 1.0; nesse caso, use `swaybg` como alternativa.
    

---

## Comando Único para Instalar TUDO (copiar e colar)

```bash
sudo pacman -S hyprland kitty nano noto-fonts ttf-jetbrains-mono-nerd nemo wofi eog mpv waybar pavucontrol adw-gtk3 xdg-desktop-portal xdg-desktop-portal-gtk qt6ct qt5ct kvantum breeze-icons hyprpaper nwg-bar grim slurp wl-clipboard networkmanager network-manager-applet bluez bluez-utils mpd mpc playerctl brightnessctl pamixer ttf-font-awesome python python-requests git base-devel firefox obsidian

# E para o AUR:
yay -S brave-bin visual-studio-code-bin
```
