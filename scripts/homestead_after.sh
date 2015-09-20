#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

if [ ! -f /usr/local/extra_homestead_software_installed ]; then

    echo "Setting up swapspace (4GB)"

    # Create the Swap file
    fallocate -l 4G /swapfile
    # Set the correct Swap permissions
    chmod 600 /swapfile
    # Setup Swap space
    mkswap /swapfile
    # Enable Swap space
    swapon /swapfile
    # Make the Swap file permanent
    echo "/swapfile   none    swap    sw    0   0" | tee -a /etc/fstab
    # Add some swap settings:
    printf "vm.swappiness=10\nvm.vfs_cache_pressure=50" | tee -a /etc/sysctl.conf && sysctl -p

    echo "Installing .zsh"
    apt-get install zsh -y
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    chsh -s /usr/bin/zsh vagrant
    rm ~/.zshrc
    ln -s ~/Sites/sebdd.dotfiles/.zshrc-homestead ~/.zshrc

    echo "Installing imagemagick"
    sudo apt-get install imagemagick -y
    sudo apt-get install php5-imagick -y
    
    echo "Installing ruby things"
    sudo gem install sass
    gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
    curl -L https://get.rvm.io | bash -s stable
    /usr/local/rvm/bin/rvm install ruby-2.1.2
    /usr/local/rvm/bin/rvm use 2.1.2 --default
    echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
    sudo chgrp -R vagrant /usr/local/rvm/gems/ruby-2.1.2/bin
    sudo chmod -R 770 /usr/local/rvm/gems/ruby-2.1.2/bin
    sudo chgrp -R vagrant /usr/local/rvm/user
    sudo chmod -R 770 /usr/local/rvm/user 

    echo "Setting up git"
    git config --global user.name "Sebastian De Deyne"
    git config --global user.email "sebastiandedeyne@gmail.com"
    git config --global push.default simple
    rm ~/.gitignore_global
    ln -s ~/Sites/sebdd.dotfiles/.gitignore_global ~/.gitignore_global

    echo "Done"
    touch /usr/local/extra_homestead_software_installed
else    
    echo "Extra software already installed... moving on..."
fi
