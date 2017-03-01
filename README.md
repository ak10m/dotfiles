ak10m's dot files
=================================================


fish
-------------------------------------------------

* https://fishshell.com/
* https://github.com/fish-shell/fish-shell

```
$ brew install fish
$ which fish | sudo tee -a /etc/shells
/usr/local/bin/fish
$ chsh -s /usr/local/bin/fish
```

### fisherman

* https://github.com/fisherman/fisherman

```
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fisher install hauleth/agnoster
```

### powerline fonts

* https://github.com/powerline/fonts

```
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
```


vim
-------------------------------------------------

```
brew install lua
brew install vim --with-lua
```


direnv
-------------------------------------------------

* https://github.com/direnv/direnv

```
$ brew install direnv
```

anyenv
-------------------------------------------------

* https://github.com/riywo/anyenv

```
$ git clone https://github.com/riywo/anyenv ~/.anyenv
```

Dracula Thema
-------------------------------------------------

* https://draculatheme.com/

