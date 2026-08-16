#!/bin/bash
HORA=$(date +%H | sed 's/^0//')
DIA_NUM=$(date +%u)

case "$DIA_NUM" in
    1) DIA_PT="seg" ;;
    2) DIA_PT="ter" ;;
    3) DIA_PT="qua" ;;
    4) DIA_PT="qui" ;;
    5) DIA_PT="sex" ;;
    6) DIA_PT="sáb" ;;
    7) DIA_PT="dom" ;;
esac

DATA=$(date +%d/%m/%Y)
HORA_MIN=$(date +%H:%M)

if [ "$HORA" -ge 6 ] && [ "$HORA" -lt 18 ]; then
    ICONE=""
else
    ICONE=""
fi

printf "%s %s, %s - %s\n" "$ICONE" "$DIA_PT" "$HORA_MIN" "$DATA"