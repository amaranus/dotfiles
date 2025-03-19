<img src="https://static.cdnlogo.com/logos/a/53/arch-linux.svg" alt="drawing" width="200"/>

## Dotfiles Kullanım Kılavuzu - Dotfiles User Guide
Bu dizindeki dosyalar archlinux kurulumundaki home dizininde bulunan yedeklerimi içermektedir. Dwm window manager ve onun grubu olan slstatus, dwmstatus, st klasörleri, yamaları yapılmış ve kullanıma hazırdır. Repodan clone edilip sadece klasörden çalıştırmak istenirse örneğin:

***The files in this directory contain my backups in the home directory in the archlinux installation. The dwm window manager and its group, slstatus, dwmstatus, st folders, have been patched and are ready to use. If you want to clone from the repo and run it only from the folder, for example:***
```
cd st
make
./st
```
yeterlidir. Bu st terminali çalıştıracaktır. Sisteme genel kurulum yapılacaksa,

***This will run the st terminal. If a general installation is to be made on the system,***
```
sudo make clean install
```

Bu klasörler clone edilip yerelde üzerinde değişiklik, yama vs. yapılacaksa ```.git.bak``` dizini ```.git``` olarak adlandırılmalıdır ki değişiklikler takip edilebilsin.
 
***If these folders are to be cloned and modified, patched, etc. are to be made locally, the ```.git.bak``` directory should be renamed ```.git``` so that the changes can be tracked.***
```
mv .git.bak .git
```

#### Diğer dosyalar - Other Files

Diğer dosyalar zaten kendi klasörlerinde bulunmakta olup home dizinindeki aynı adlı klasörlere clone edilebilir.

***Other files are already in their own folders and can be cloned into folders of the same name in the home directory.***

Repo sistemimdeki güncellemelere göre sürekli güncellenecektir. Başarılar!

***It will be constantly updated according to the updates in my repo system. Good luck!***

---
Daha fazla bilgi için [eposta](amaranus@hotmail.com) adresime mail atınız.

Please send [mail](amaranus@hotmail.com) to my e-mail address for more information.
