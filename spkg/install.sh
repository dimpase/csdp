#! /bin/bash 
#
# this will eventually become the spkg-install
#
# 1) Compile Csdp static lib in lib/ subdirectory of Csdp distibution 
# and install it (i.e. libcsdp.a) into $SAGE_LOCAL/lib/
export SAGE_LOCAL=/usr/local/src/sage/current/local
PWD=`pwd`
cd ../lib 
make install
echo $SAGE_LOCAL
echo $PWD
cd $PWD
#mkdir $SAGE_LOCAL/include/sdp/
cp ../include/*.h $SAGE_LOCAL/include/sdp/
