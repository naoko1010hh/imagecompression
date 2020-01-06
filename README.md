# imagecompression

optipng jpegoptim cwebが前提です。

使い方は

## インストール
```
$ sudo apt-get install optipng jpegoptim webp wget -y
$ sudo wget 0e0.pw/7k-a -P /usr/bin -O /usr/bin/serene-imagecompression
$ sudo chmod 755 /usr/bin/serene-imagecompression
```

## アンインストール
```
$ sudo apt-get purge optipng jpegoptim webp wget -y
$ sudo rm /usr/bin/serene-imagecompression
```

## 使い方
```
$ serene-imagecompression 圧縮したい画像があるディレクトリのパス
```
を実行、あとは自動でpngとjpegとwebpを圧縮してくれます。上書きされるため注意です。
