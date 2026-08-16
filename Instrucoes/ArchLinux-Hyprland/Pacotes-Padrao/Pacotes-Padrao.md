#TECNOLOGIA #LINUX

A maior parte das modificações realizadas aqui, foram tiradas das documentações oficiais do Arch e vídeos no Youtube. Acesse a [[Bibliografia]]

---

## Comandos básicos e caminhos

| **Ação**               | **Comando / Caminho**                         |
| ---------------------- | --------------------------------------------- |
| Abrir o terminal       | `SUPER + Q` (ou `ALT + Q`)                    |
| Fechar janela          | `SUPER + C` (ou `ALT + C`)                    |
| Limpar o terminal      | `Ctrl + L` ou `clear`                         |
| Configuração Hyprland  | `~/.config/hypr/hyprland.lua`                 |
| Configuração do pacman | `/etc/pacman.conf`                            |
| Configuração da Waybar | `~/.config/waybar/config.jsonc` e `style.css` |

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
|`qt6ct` / `qt5ct`|Configuração de tema para Qt|
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

## Tela de Login (Display Manager)

```bash
sudo pacman -S sddm
sudo systemctl enable sddm
```

|**Pacote**|**Função**|
|---|---|
|`sddm`|Display Manager — tela de login inicial do sistema|

> **Nota:** O SDDM aparece automaticamente ao ligar o computador. É a tela onde você digita usuário e senha para entrar no Hyprland. Para personalizar o tema do SDDM, edite `/etc/sddm.conf` ou instale temas em `/usr/share/sddm/themes/`.

---

## Bloqueio de Tela

```bash
sudo pacman -S hyprlock
```

|**Pacote**|**Função**|
|---|---|
|`hyprlock`|Bloqueador de tela para o Hyprland|

> **Nota:** O `hyprlock` exige um arquivo de configuração em `~/.config/hypr/hyprlock.conf`. Sem ele, o comando sai com erro. Ele bloqueia a sessão atual sem fechar programas — ideal para sair rapidinho (ex: na faculdade).

### Exemplo de configuração (`~/.config/hypr/hyprlock.conf`)

```ini
general {
    hide_cursor = true
    ignore_empty_input = false
}

background {
    monitor =
    path = screenshot
    color = rgba(26, 20, 16, 1.0)
    blur_passes = 2
    blur_size = 7
    noise = 0.0117
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.05
}

input-field {
    monitor =
    size = 280, 50
    outline_thickness = 2
    dots_size = 0.2
    dots_spacing = 0.2
    dots_center = true
    outer_color = rgba(196, 168, 130, 0.7)
    inner_color = rgba(42, 34, 28, 0.95)
    font_color = #c8b8a8
    fade_on_empty = false
    placeholder_text = <i>Digite sua senha...</i>
    hide_input = false
    position = 0, -60
    halign = center
    valign = center
    check_color = rgb(144, 238, 144)
    fail_color = rgb(204, 85, 85)
    fail_text = <i>$FAIL (<b>$ATTEMPTS</b>)</i>
    fail_timeout = 2000
    capslock_color = rgb(255, 165, 0)
}

label {
    monitor =
    text = $TIME
    color = #c8b8a8
    font_size = 80
    font_family = JetBrainsMono Nerd Font
    position = 0, 120
    halign = center
    valign = center
}

label {
    monitor =
    text = Olá, $USER
    color = #c4a882
    font_size = 22
    font_family = JetBrainsMono Nerd Font
    position = 0, 40
    halign = center
    valign = center
}
```

### Keybind no Hyprland (`hyprland.lua`)

```lua
bind = , SUPER_L, exec, sh -c 'pidof hyprlock || hyprlock'
```

> **Diferença entre SDDM e hyprlock:** O SDDM é a tela de login ao ligar o PC. O `hyprlock` é o bloqueio de tela enquanto você já está logado. Eles coexistem — um não substitui o outro.

---

## Menu de Energia / Desligamento

```bash
sudo pacman -S nwg-bar
```

|**Pacote**|**Função**|
|---|---|
|`nwg-bar`|Menu de energia (desligar, reiniciar, sair da sessão)|

> **Nota:** O botão de Lock foi removido da nwg-bar em favor do keybind do `hyprlock` (mais rápido e confiável). O comando `||` não funciona diretamente no `exec` da nwg-bar, pois ela não usa shell.

### `bar.json` atualizado

```json
[
  {
    "label": "Logout",
    "exec": "hyprctl dispatch exit",
    "icon": "/usr/share/nwg-bar/images/system-log-out.svg"
  },
  {
    "label": "Reboot",
    "exec": "systemctl reboot",
    "icon": "/usr/share/nwg-bar/images/system-reboot.svg"
  },
  {
    "label": "Shutdown",
    "exec": "systemctl poweroff",
    "icon": "/usr/share/nwg-bar/images/system-shutdown.svg"
  }
]
```

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

> **Nota:** O `gnome-screenshot` foi testado, mas **não funcionou bem** no Hyprland. Por isso, optou-se pelo `grim` + `slurp`.

---

## Rede (Wi-Fi e Ethernet)

```bash
sudo pacman -S networkmanager iwd network-manager-applet
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
```

|**Pacote**|**Função**|
|---|---|
|`networkmanager`|Gerenciador de redes|
|`iwd`|Backend Wi-Fi moderno, mais rápido e estável que o wpa_supplicant|
|`network-manager-applet`|Ícone na bandeja do sistema para Wi-Fi|

> **Nota:** Configure o NetworkManager para usar o iwd editando `/etc/NetworkManager/NetworkManager.conf`:
> ```ini
> [device]
> wifi.backend=iwd
> ```
> O applet da bandeja aparece automaticamente no módulo `tray` da Waybar.

---

## Bluetooth

```bash
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```

|**Pacote**|**Função**|
|---|---|
|`bluez`|Pilha Bluetooth|
|`bluez-utils`|Ferramentas (ex: `bluetoothctl`)|
|`blueman`|Gerenciador gráfico de Bluetooth (funciona no Wayland/Hyprland)|

> **Nota:** O Bluetooth **não funciona em máquinas virtuais** por padrão. Se estiver em uma VM, desative o módulo na Waybar. Adicione `blueman-applet` ao `hyprland.lua` para iniciar automaticamente:
> ```lua
> hl.exec_cmd("blueman-applet")
> ```

---

## Ferramentas Adicionais (Opcionais)

```bash
sudo pacman -S mpd mpc playerctl brightnessctl pamixer
```

|**Pacote**|**Função**|
|---|---|
|`mpd` / `mpc`|Servidor e cliente de música|
|`playerctl`|Controle de mídia (Spotify, etc.)|
|`brightnessctl`|Controle de brilho|
|`pamixer`|Controle de áudio (alternativa ao pavucontrol)|

---

## Fontes de Ícones (Para Waybar e Terminal)

```bash
sudo pacman -S ttf-font-awesome
```

> **Nota:** Essencial para exibir ícones como ``, ``, `⚠` na Waybar e no terminal.

---

## Dependências do Python (para scripts da Waybar)

```bash
sudo pacman -S python python-requests
```

> **Nota:** Necessário para scripts como `waybar-wttr.py` (clima) e `mediaplayer.py`.

---

## Firmware de Áudio (Notebooks)

```bash
sudo pacman -S sof-firmware
```

|**Pacote**|**Função**|
|---|---|
|`sof-firmware`|Firmware para placas de áudio Intel SOF (comum em notebooks)|

> **Nota:** Instale apenas se o áudio do notebook não estiver funcionando corretamente após a instalação base.

---

## Pacotes que foram TESTADOS, mas REMOVIDOS

|**Pacote**|**Motivo da remoção**|
|---|---|
|`flameshot`|Não funcionou bem no Wayland (erros de DBus e captura)|
|`gnome-screenshot`|Não funcionou com a interface interativa no Hyprland|
|`trayer`|Não encontrado nos repositórios oficiais; substituído pelo módulo `tray` da Waybar|

---

## Observações Finais

- **Tecla `SUPER` vs `ALT`:** No Hyprland, os atalhos foram configurados com `ALT` para evitar conflitos com o sistema hospedeiro (Ubuntu) em máquinas virtuais.

- **Waybar:** O módulo `tray` deve estar presente no `modules-right` para exibir ícones de aplicativos como NetworkManager e Blueman.

- **Wallpaper:** O `hyprpaper` pode ter problemas com escala diferente de 1.0; nesse caso, use `swaybg` como alternativa.

- **Inicialização automática no Hyprland:** Adicione os seguintes comandos ao `hyprland.lua`:
> ```lua
> hl.on("hyprland.start", function ()
>     hl.exec_cmd("waybar & hyprpaper & dunst")
>     hl.exec_cmd("nm-applet --indicator")
>     hl.exec_cmd("blueman-applet")
> end)
> ```

---

## Comando Único para Instalar TUDO (copiar e colar)

```bash
sudo pacman -S hyprland kitty nano noto-fonts ttf-jetbrains-mono-nerd nemo wofi eog mpv waybar pavucontrol adw-gtk3 xdg-desktop-portal xdg-desktop-portal-gtk qt6ct qt5ct kvantum breeze-icons hyprpaper sddm hyprlock nwg-bar grim slurp wl-clipboard networkmanager iwd network-manager-applet bluez bluez-utils blueman mpd mpc playerctl brightnessctl pamixer ttf-font-awesome python python-requests sof-firmware git base-devel firefox obsidian

# E para o AUR:
yay -S brave-bin visual-studio-code-bin
```
