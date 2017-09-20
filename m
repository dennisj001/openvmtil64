cd src
make xz
cp ../cfrtil.tar.xz ../cfrtil.$1.tar.xz
make copy
ls -al ~/backup/cfrtil.$1.tar.xz
ls -al ~/backup/archive/cfrtil.$1.tar.xz
