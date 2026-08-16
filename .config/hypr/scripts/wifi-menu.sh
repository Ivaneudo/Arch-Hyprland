#!/bin/bash
# Menu Wi-Fi gráfico usando wofi + nmcli

# Lista redes disponíveis (SSID, sinal, segurança)
networks=$(nmcli -t -f SSID,SIGNAL,SECURITY,ACTIVE device wifi list | grep -v '^--' | sort -t: -k2 -nr)

# Se não houver redes
if [ -z "$networks" ]; then
    wofi --dmenu --prompt "Nenhuma rede Wi-Fi encontrada" <<< "" >/dev/null
    exit 1
fi

# Formata para o wofi: "Nome da Rede (85%) [WPA2]"
selected=$(echo "$networks" | awk -F: '
    {
        ssid=$1; signal=$2; sec=$3; active=$4
        gsub(/&/, "&amp;", ssid)
        if (active == "yes") marker = " ✓"
        else marker = ""
        printf "%s (%s%%) [%s]%s\n", ssid, signal, sec, marker
    }' | wofi --dmenu --prompt "Conectar em qual rede?" --width 400 --height 300)

# Se cancelou
[ -z "$selected" ] && exit 0

# Extrai o SSID (remove o sufixo " (85%) [WPA2] ✓")
ssid=$(echo "$selected" | sed 's/ *(.*//')

# Verifica se já está conectado
if echo "$selected" | grep -q '✓'; then
    wofi --dmenu --prompt "Já conectado em: $ssid" <<< "" >/dev/null
    exit 0
fi

# Verifica se a rede já está salva
if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
    # Conecta direto
    nmcli connection up "$ssid" && \
    wofi --dmenu --prompt "Conectado em: $ssid" <<< "" >/dev/null
else
    # Pede senha
    password=$(wofi --dmenu --password --prompt "Senha para $ssid" --width 300)
    if [ -n "$password" ]; then
        nmcli device wifi connect "$ssid" password "$password" && \
        wofi --dmenu --prompt "Conectado em: $ssid" <<< "" >/dev/null
    fi
fi