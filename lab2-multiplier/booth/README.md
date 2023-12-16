## Makefile

The Makefile script use the `do.sh` script to work in this directory. You can compile,
simulate, synthetize the design in `\src` directory with the predefined testbench in
`\tb` directory.
If you want compile and simulate the design you can use `make all`, in case you want
also synthetize it you can use `make all_syn`.
All the options in the Makefile are showed with `make help`. 
If you prefer to use directly the `.do.sh` script, read the section below.

## do.sh script

If you want simulate and synthetize the HDL code you can use the `do.sh` script. 

- *compilation*: `./do.sh ela`
- *simulation*: `./do.sh sim`
- *synthesis*: `./do.sh syn`

(default simulation without gui, to activate the gui use `./do.sh sim gui`).

**Important**: for a better explanation of how to use the *do.sh* script, you can use `./do.sh --help`.
`do.sh` is also used for other operation in the directory, so please read only the useful content 
for these operations (sim, syn).

## algorithm 

The *dadda* python script in the algorithm directory allows to test the reduction tree taking in
input 6 partial products (positive or negative). A representation of the reduction tree and the
final result of the sum is printed on the terminal for a better comprehension of the reduction process.

To visualize a more general reduction tree with also the **FAs** and **HAs** allocation you can use
the option `-p True` without any partial products in the script inputs (e.g. `./dadda -p True`). 
The green color and red color for HAs and FAs portmap allocation is used to distinguish respectively
the input and the output of each HAs / FAs module.

**Important**: for a better explanation of how to use the *dadda* script, you can use `./dadda --help`.

The *generate.sh* script is used to generate the portmap in the systemverilog file `../src/dadda.sv`.
**It overwrite the previous portmap in the file, so in this case is disabled but if you want try the
portmap generation you can uncomment the code inside**.




