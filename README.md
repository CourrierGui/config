Laptop configuration files

# Setting up

## Initialisation

```
# Create a bare git repository in ~/.cfg folde:
git init --bare $HOME/.cfg
# Create an alias config:
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
# Source ~/.bashrc:
source ~/.bashrc
# Hide untracked file:
config config --local status.showUntrackedFiles no
```

## Easy version

```
curl -Lks http://bit.do/cfg-init &#124; /bin/bash
```

## Restore configuration in a new computer

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
config checkout
mkdir -p .config-backup && config checkout 2>&1 &#124; egrep "\s+\." &#124; awk {'print $1'} & xargs -I{} mv {} .config-backup/{}
config config --local status.showUntrackedFiles no
```

## Easy version

```
curl -Lks http://bit.do/cfg-install &#124; /bin/bash
```
