rm -rf build
rm -rf chapters
mkdir build
mkdir chapters
ruby parse.rb ~/Downloads/*.enex
make
kindlegen build/*.epub