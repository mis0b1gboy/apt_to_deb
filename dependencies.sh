#!/bin/bash

cp depend depend_backup
sed -i s/^/"apt-cache show "/ depend
sed -i s/$/" >> aptCacheShow "/ depend
chmod +x depend
bash depend
echo '#!/bin/bash' > files
echo '' >> files
echo 'mkdir dependencies' >> files
echo 'cd dependencies' >> files
cat aptCacheShow | grep Filename >> files
rm aptCacheShow
sed -i s@'Filename: '@'wget https://deb.parrotsec.org/parrot/'@g files
chmod +x files
bash files
rm files
