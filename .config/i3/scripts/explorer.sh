#!/usr/bin/env bash

# Store the STDOUT of fzf in a variable
selection=$(find -type d | fzf \
--preview='tree -C {}' \
--prompt='Dizinler> ' \
--bind='del:execute(rm -ri {+})' \
--bind='ctrl-p:toggle-preview' \
--bind='ctrl-d:change-prompt(Dizinler > )' \
--bind='ctrl-d:+reload(find -type d)' \
--bind='ctrl-d:+change-preview(tree -C {})' \
--bind='ctrl-d:+refresh-preview' \
--bind='ctrl-f:change-prompt(Dosyalar > )' \
--bind='ctrl-f:+reload(find -type f)' \
--bind='ctrl-f:+change-preview(~/.config/i3/fzf-preview.sh {})' \
--bind='ctrl-f:+refresh-preview' \
--bind='ctrl-a:select-all' \
--bind='ctrl-x:deselect-all' \
--header '
CTRL-D Dizinleri göster | CTRL-F Dosyaları göster
CTRL-A Tümünü seç| CTRL-X Hiçbirini seçme
ENTER Aç | DEL Sil
CTRL-P Önizleme aç-kapat 
'
)

# Eğer seçilen bir dizinse
if [ -d "$selection" ]; then
    nemo $selection
# Eğer seçilen bir dosyaysa
else
    # Dosya MIME türünü al
    mime_type=$(file --mime-type -b "$selection")

    # Dosya türüne göre uygun programı seç
    case "$mime_type" in
        # Metin içerikli dosyalar için
        text/*)
            nvim "$selection"  # Metin dosyaları için nvim
            ;;
        # Resim dosyaları için
        image/*)
            ristretto "$selection"  # Resim dosyaları için ristretto
            ;;
        # PDF dosyaları için
        application/pdf)
            evince "$selection"  # PDF dosyaları için evince
            ;;
        # Video dosyaları için
        video/*)
            vlc "$selection"  # Video dosyaları için VLC
            ;;
        # Diğer dosyalar için varsayılan uygulama
        *)
            xdg-open "$selection"  # Diğer dosyalar için varsayılan uygulama
            ;;
    esac
fi

