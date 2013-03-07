###Integrating CSDP with Sage (and pycsdp)

To create a working installation, you need recent autotools.
Run 

    autoreconf --install 
    automake --add-missing --copy

and then 

    ./configure 
    make
    make install # (eventually)
