#!/bin/sh

# needs sage in your PATH

#PATCHLEVEL=".p0"
PATCHLEVEL=

set -e
if [ ! -f make-spkg.sh ] ; then
    echo "You must run this script in the spkg directory of the csdp repository."
    exit 1
fi

rm -rf csdp-*

CWD=`pwd`
cd ..
CSDP_REPO=`pwd`

VERSION=`autoconf --trace='AC_INIT:$2'`
CSDP_DIR="csdp-$VERSION$PATCHLEVEL"
SPKG_ROOT="$CWD/$CSDP_DIR"

rm -rf "$SPKG_ROOT"
mkdir -p "$SPKG_ROOT"

rm -f csdp-$VERSION.tar.gz
make dist

cd "$SPKG_ROOT"
tar xf ../../csdp-$VERSION.tar.gz
mv csdp-$VERSION src

#cd "$CWD"
#cp spkg-install "$SPKG_ROOT"
#cp SPKG.txt "$SPKG_ROOT"
#cp ../LICENSE "$SPKG_ROOT"
#cp .hgignore "$SPKG_ROOT"

echo "$SPKG_ROOT"
cd "$SPKG_ROOT"
hg convert --filemap "$CWD"/convert_mapfile "$CSDP_REPO"
mv csdp-hg/.hg .
hg update
hg mv spkg/* .
hg mv spkg/.hgignore .
hg commit -m 'moved spkg files to the spkg root; git history imported'
rm -rf csdp-hg
cd "$CWD"
sage -pkg "$CSDP_DIR"

# uncomment the follwing if you want to test
#export SAGE_DEBUG=yes
#sage -f -s "./$CSDP_DIR.spkg"



