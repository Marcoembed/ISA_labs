## Verification Section
In each directory sim of each laboratory section is present a
Makefile to run all the simulations. Each Makefile has an
help recipe which explains how to use it (you just need to run make or make help).
In the Verification section all the modules are separated (alu, multiplier and 
floating point), then there are three sim directories in which each 
Makefile is used to compile, simulate and get verification results 
with a proper functional coverage. These results can be seen running the make
rules specifying which interface do you prefer (gui or cli).

## UVM Section
In the UVM section we use a single Makefile in the sim directory
which allow you to test whatever modules running the specific recipe in the
Makefile for the specific module, both with cli and gui.
Also in this case is present a make help command to better understand
the functionality of the Makefile.
