# Git notlarını içerir

Sıralamada bir düzen takip edilmemiştir.

* Git içerisinde arşivlenen klasörleri listele

```git ls-tree -d --name-only HEAD```

* Git içerisinde arşivlenen dosyaları listele

```git log --pretty=format: --name-only --diff-filter=A | sort -u```

Fazladan commit kaydı yüklemeden en son kayıt üzerine sürekli commit edebilmek için

```git commit --amend -m "buraya en son commit mesajı yazılır"```

Dosyayı diskten kaldırmadan git kayıtlarından kaldır

```git rm --cached -f <dosya>```

Uzak repoya bağlanmak için

```dotfiles remote add origin https://github.com/amaranus/dotfiles.git```

git ile bir dosyada yapılan değişiklikleri görme

```git diff <dosya>```

Yapılan değişiklikleri uzak depoya gönderme

```git push origin master -f```

