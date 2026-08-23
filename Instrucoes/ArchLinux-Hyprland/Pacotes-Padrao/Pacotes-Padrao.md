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

## Interface, Terminal, Editor e Fontes

```bash
sudo pacman -S hyprland kitty nano noto-fonts ttf-jetbrains-mono-nerd
```

| **Pacote**                | **Função**                       |
| ------------------------- | -------------------------------- |
| `hyprland`                | Gerenciador de janelas (Wayland) |
| `kitty`                   | Terminal                         |
| `nano`                    | Editor de texto básico           |
| `noto-fonts`              | Fontes para emojis e fallback    |
| `ttf-jetbrains-mono-nerd` | Fonte principal com ícones       |

---

## Explorador de Arquivos, Lançador e Multimídia

```bash
sudo pacman -S nemo wofi eog mpv evince
```

| **Pacote** | **Função**                             |
| ---------- | -------------------------------------- |
| `nemo`     | Explorador de arquivos                 |
| `wofi`     | Lançador de aplicativos                |
| `eog`      | Visualizador de imagens (Eye of GNOME) |
| `mpv`      | Reprodutor de vídeo e áudio            |
| `evince`   | Visualizador de PDFs (padrão do GNOME) |

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

---

## Tema Escuro e Aparência (GTK/Qt)

```bash
sudo pacman -S adw-gtk3 xdg-desktop-portal xdg-desktop-portal-gtk qt6ct qt5ct kvantum breeze-icons
```

---

## Gerenciador de Monitores (Hyprland/Sway)

```bash
# Instalação via AUR
yay -S monique
```

> [!note] O `monique` é um gerenciador gráfico de monitores com suporte a arrastar e soltar, perfis de configuração e daemon de hotplug. Foi testado e aprovado para uso com Hyprland.

> [!warning] Segurança
> Durante a instalação do monique no meu sistema, uma verificação foi feita no código fonte para garantir a integridade do sistema.

**Para iniciar:**

```bash
monique
```

**Ativar o daemon (para detectar automaticamente monitores):**

```bash
systemctl --user enable --now moniqued
```

---

## Wallpaper

```bash
sudo pacman -S swww
```

> **Nota:** O `swww` substituiu o `hyprpaper` por ser mais moderno e lidar melhor com animações e escala.

### Inicialização automática

Crie `~/.config/hypr/scripts/wallpaper.sh`:

```bash
#!/bin/bash
swww-daemon &
sleep 0.5
swww img /home/ivaneudo/Imagens/wallpaper.jpg
```

Adicione ao `hyprland.lua`:

```lua
hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh")
```

---

## Tela de Login (Display Manager)

```bash
sudo pacman -S sddm
sudo systemctl enable sddm
```

> **Nota:** O SDDM é a tela de login que aparece ao ligar o computador.

---

## Bloqueio de Tela

```bash
sudo pacman -S hyprlock
```

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
}
input-field {
    monitor =
    size = 280, 50
    outline_thickness = 2
    outer_color = rgba(196, 168, 130, 0.7)
    inner_color = rgba(42, 34, 28, 0.95)
    font_color = #c8b8a8
    placeholder_text = <i>Digite sua senha...</i>
    position = 0, -60
    halign = center
    valign = center
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

### Keybind no Hyprland

```lua
hl.bind("ALT, L", hl.dsp.exec_cmd("hyprlock"))
```

---

## Menu de Energia / Desligamento

```bash
sudo pacman -S nwg-bar
```

### `bar.json` atualizado

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

### Atalhos no Hyprland

```lua
-- Capturar área selecionada
hl.bind("ALT SHIFT, S", hl.dsp.exec_cmd('mkdir -p ~/Imagens/Screenshot && grim -g "$(slurp)" ~/Imagens/Screenshot/print-$(date +%s).png || echo "Seleção cancelada"'))
```

> **Nota:** `gnome-screenshot` e `flameshot` foram testados, mas não funcionaram bem no Hyprland.

---

## Rede (Wi-Fi e Ethernet)

```bash
sudo pacman -S networkmanager iwd network-manager-applet
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
```

### Configurar NetworkManager para usar iwd

Edite `/etc/NetworkManager/NetworkManager.conf`:

```ini
[device]
wifi.backend=iwd
```

### Módulo na Waybar (sem ação de clique)

```json
"custom/network": {
    "format": " {}",
    "interval": 10,
    "exec": "nmcli -t -f NAME,ACTIVE con show --active | grep ':yes' | cut -d ':' -f1 || echo 'off'",
    "tooltip": true
}
```

---

## Bluetooth

```bash
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```

> **Nota:** O Bluetooth **não funciona em máquinas virtuais** por padrão. Para usar, instale `blueman` e adicione `blueman-applet` ao `hyprland.lua`.

---

## Ferramentas Adicionais

```bash
sudo pacman -S mpd mpc playerctl brightnessctl pamixer
```

---

## Fontes de Ícones

```bash
sudo pacman -S ttf-font-awesome
```

---

## Dependências do Python (para scripts da Waybar)

```bash
sudo pacman -S python python-requests
```

---

## Firmware de Áudio (Notebooks)

```bash
sudo pacman -S sof-firmware
```

---

## Pacotes que foram TESTADOS, mas REMOVIDOS

|**Pacote**|**Motivo da remoção**|
|---|---|
|`flameshot`|Não funcionou bem no Wayland|
|`gnome-screenshot`|Não funcionou com interface interativa|
|`hyprpaper`|Substituído pelo `swww` (melhor com escala)|
|`trayer`|Não encontrado nos repositórios oficiais|

---

## Comando Único para Instalar TUDO (Repositórios Oficiais)

```bash
sudo pacman -S hyprland kitty nano noto-fonts ttf-jetbrains-mono-nerd nemo wofi eog mpv evince waybar pavucontrol adw-gtk3 xdg-desktop-portal xdg-desktop-portal-gtk qt6ct qt5ct kvantum breeze-icons swww sddm hyprlock nwg-bar grim slurp wl-clipboard networkmanager iwd network-manager-applet bluez bluez-utils blueman mpd mpc playerctl brightnessctl pamixer ttf-font-awesome python python-requests sof-firmware git base-devel firefox obsidian
```

### Comando para AUR

```bash
yay -S brave-bin visual-studio-code-bin monique
```

---

## Observações Finais

- **Tecla `SUPER` vs `ALT`:** Atalhos configurados com `ALT` para evitar conflitos com o sistema hospedeiro (Ubuntu) em VMs.
    
- **Waybar:** O módulo `tray` exibe ícones de aplicativos como NetworkManager e Blueman.
    
- **Inicialização automática:** Adicione ao `hyprland.lua`:
    

```lua
hl.exec_cmd("waybar &")
hl.exec_cmd("nm-applet --indicator &")
hl.exec_cmd("blueman-applet &")
hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh")
```