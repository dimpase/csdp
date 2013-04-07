###Integrating CSDP with Sage (and pycsdp)

To create a working installation, you need recent autotools.
Run 

    autoreconf --install 
    automake --add-missing --copy

and then 

    ./configure 
    make
    make install # (eventually)

Currenly, this does not work on OSX 10.6 without gfortran and its libs installed. This is a bug, as in fact no 
Fortran is needed for compiling/using CSDP. If you need it to be callable within [Sage](http://sagemath.org) (e.g. to run [flagmatic](http://www.flagmatic.org)) then you need to do start Sage shell and configure with the right prefix, i.e.

    sage -sh 
    ./confugure --prefix=$SAGE_LOCAL
followed by make, etc.

