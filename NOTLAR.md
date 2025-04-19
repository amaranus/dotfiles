# Linux Notları
Bu belge linux notlarından oluşmaktadır. 

## Arch Linux için komutlar
#### Otomatik paket kaldırma (artık dosyalar ile birlikte) 

```pacman -Rcns <paket>```

```pacman -R $(pacman -Qdtq)```

#### Türkçe klavye düzeni

Bunu yapmak için terminalde şu komutu kullanarak klavye düzeninizi kontrol edebilirsiniz:

```setxkbmap -query```

Şu komutla Türkçe'ye çevirebilirsiniz

```setxkbmap tr```

Eğer her zaman Türkçe klavye düzeni kullanmak istiyorsanız,
klavye düzenini her seferinde manuel olarak değiştirmek
yerine, bir oturum başlatıcı veya bir konfigürasyon
dosyasına bu ayarı ekleyebilirsiniz. Örneğin, ```~/.xprofile``` ya
da ```~/.xinitrc``` dosyasına şu satırı ekleyebilirsiniz:

```setxkbmap tr```

#### Pacman tüm yüklemeleri listele

---

```pacman -Q```

pacman sonradan yüklenmiş paketler

```pacman -Qe```

daha fazla sistem paketi listelemek için

```pacman -Qet```

Varsayılan olarak, Pacman komutu yüklü tüm paket listelerini iki sütunda oluşturur. Yalnızca ilk sütunu göstermek istiyorsanız, aşağıdaki komutu çalıştırın:

```pacman -Q | awk '{print $1}'```

Yukarıdaki listeyi bir dosyaya dışa aktarmak için aşağıdaki komutu çalıştırın:

```pacman -Q | awk '{print $1}' > package_list.txt```

---

#### Python ile basit web sunucusu başlatma

```python3 -m http.server```

### Wget ile tüm siteyi clonlama

```wget --mirror --convert-links --html-extension --wait=1 https://site.com/```

#### Bir programı yönetici desteği ile başlat komutu (Şifre alanı açar)

```pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY <program-adi>```

#### Sistem başlangıcında pencere yöneticilerinin autostart dosyalarına polkit ekleme komutu

```/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1```

#### Fontları listeleme

```fc-list : family``` veya bir etikete göre ```fc-list : family | grep "Roboto"```

#### Harddiski durdurma

```sudo hdparm -Y /dev/sdX``` veya ```udisksctl power-off -b /dev/sdX```

#### Tar ile sıkıştırılmış dosyaları açma

```tar -xvf <dosya>```

#### Tar ile dosyaları sıkıştırma

```tar -czvf dosya-adi.tar.gz dosya-adi```

#### Fzf ile çalıştırılabilir dosyaları listele

```compgen -c | fzf```

Root / Kök dizininde hızlı arama için

```sudo updatedb```

```locate / | fzf```

Aranılanı bir görüntüleyici "vim" gibi, veya bir dosya yöneticisi ile "nemo" gibi açmak için

```nemo "${locate / | fzf}"``` (Klasör içine girme)

```vim "${locate . | fzf}"``` (Dosyayı açmak için)

#### Xresources dosyası üzerinde yapılan değişikliği kaydetme

```xrdb -merge ~/.Xresources```

#### Sistem açılış hatalarını listeleme

```sudo dmesg | egrep -i "interrupt|spurious"```

#### Duvar kağıdından ya da bir resimden renk şeması oluşturma

```wpg -s <resim>``` veya ```wpg``` ile arayüzü açma

Renk kayıtları kodları ```~/.cache/wal/``` dizinine oluşturulacak.

gtk teması için renk temasını oluşturmada ```~/bin/wpg-install.sh``` isminde bir dosya çalıştırılacak.

#### Sistem temizleme
---
Şişkinliğin nerede olduğunu görmek için root olarak çalıştırın:

```ncdu -x /```

root olarak çalıştırın (ben bunu sistem güncellemesinden sonra yapıyorum):

```bleachbit --clean system.cache system.localizations system.trash system.tmp```

Ve son olarak

```pacman -Scc``` ve ```yay -Scc```

---

#### Pacman güncellemelerinden istediğin paketi seçip kurmak için bu komutu kullan

```pacman -Qu | fzf | awk '{print $1}' | xargs sudo pacman -S --noconfirm --```

#### Wifi bağlantısı

---
```lspci -k```

```ip link```

```ip link set wlan0 up```

```sudo rfkill unblock wifi```

```nmcli device wifi list```

```nmcli device wifi connect "Aygunshome" password "42d60D724A877"```

#### Gnome settings ile ikon, cursor ve tema ayarlama
---

```gsettings set org.gnome.desktop.interface gtk-theme "tema-ismi"```

```gsettings set org.gnome.desktop.interface icon-theme "tema-ismi"```

```gsettings set org.gnome.desktop.interface cursor-theme "tema-ismi"```

Dconf editor ile düzenleme

```dconf-editor```

Lxappearance GTK sürümünü kurma

```sudo pacman -S lxappearance-gtk3```

Openbox sürümünü kurma

```sudo pacman -S lxappearance-obconf-gtk3```

#### Klasör / Dosya içinde metin arama
---
```grep -r "aranan_metin" /klasör/yolu/```

Eğer sadece dosya adlarını listelemek isterseniz, -l (küçük "L") seçeneğini ekleyebilirsiniz:

```grep -rl "aranan_metin" /klasör/yolu/```
