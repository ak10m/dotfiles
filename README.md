ak10m's dot files
=================================================

homebrew
-------------------------------------------------

* https://brew.sh/

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

git
-------------------------------------------------

* https://git-scm.com/

```
$ brew install git
```

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
