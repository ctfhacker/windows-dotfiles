pacman --noconfirm -S python
pacman --noconfirm -S python2
pacman --noconfirm -S git
pacman --noconfirm -S stow
pacman --noconfirm -S unzip
pacman --noconfirm -S wget
pacman --noconfirm -S mingw64/mingw-w64-x86_64-ag
wget https://bootstrap.pypa.io/get-pip.py
python2 get-pip.py
python3 get-pip.py
pip2 install ipython
pip3 install ipython
cp bin/* /usr/bin
pip install virtualenvwrapper

mkdir ~/workspace
cd ~/workspace
git clone https://github.com/arizvisa/syringe
pip2 install six
pip3 install six
for file in $(ls syringe/lib); do ln -s $(pwd)/syringe/lib/$file `python2 -m site --user-site`; done
for file in $(ls syringe/template); do ln -s $(pwd)/syringe/template/$file `python2 -m site --user-site`; done
