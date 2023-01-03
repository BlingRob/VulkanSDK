sed -i.bak '/export '$1'=/d' ~/.bashrc
echo 'export '$1'='$2'' >> ~/.bashrc
source ~/.bashrc
