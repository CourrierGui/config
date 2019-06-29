Laptop configuration files

# Setting up

## Initialisation

Create a bare git repository in ~/.cfg folde:

> git init --bare $HOME/.cfg

Create an alias confi:

> echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

Source ~/.bashrc:

> source ~/.bashrc

Hide untracked file:

> config config --local status.showUntrackedFiles no

## Restore configuration in a new computer

> alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

> echo ".cfg" >> .gitignore

> git clone --bare <git-repo-url> $HOME/.cfg

> config checkout

> mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

> config config --local status.showUntrackedFiles no
