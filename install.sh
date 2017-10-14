#!/bin/bash
set -e

# if [[ $EUID -ne 0 ]]; then
# 	echo "This script must be run as root, use sudo "$0" instead" 1>&2
# 	exit 1
# fi
#
# echo "WE ARE ROOT!"

sudo -S apt-get update < ~/iambatman.txt;

sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs;

cd ~;
sudo -S apt-get update < ~/iambatman.txt;

git clone https://github.com/rbenv/rbenv.git ~/.rbenv;
if [ $1 -eq 1 ]; then
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc;
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc;
	exec $SHELL;
fi

if [ $1 -eq 1 ]; then
	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build;
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc;
	exec $SHELL;
fi

rbenv install 2.3.1;
sudo -S apt-get update < ~/iambatman.txt;
rbenv global 2.3.1;
sudo -S apt-get update < ~/iambatman.txt;
ruby -v;

sudo -S apt-get update < ~/iambatman.txt;
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7;
sudo apt-get install -y apt-transport-https ca-certificates;

# Add Passenger APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list';
sudo -S apt-get update < ~/iambatman.txt;

# Install Passenger & Nginx
sudo -S apt-get update < ~/iambatman.txt;

sudo apt-get install -y nginx-extras passenger;

sudo service nginx start;

sudo apt-get install -y postgresql postgresql-contrib libpq-dev;
