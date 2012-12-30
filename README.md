Barcodes for Slovak internet banking smartphone apps
====================================================

About
-----

This program creates barcodes for slovak bank payment based on standard published
by Slovak Post Office.

Usage:


    pbc=PostovyPoukazBarCode.new
    pbc.save_as_eps(pbc.barcode("2600121198","8330","1234", "0000", "500"), "thecode.eps")

This will create barcode with checksum for transfer to account 2600121198/8330 with
variable symbol 1234, empty constant symbol (every field that is empty or nulls
is to be filled by used) and amount of 5.00 euros (the last argument is in cents).

If you want to convert the .eps to pdf, use this command:

ps2pdf -dEPSCrop thecode.eps thecode.pdf

Setup
-----

- Install GNU barcode from https://www.gnu.org/software/barcode/
- Try running the example

TODO
----

- More testing

Copying
-------

Author: Juraj Bednar, see COPYING for license (simplified BSD license)

Pull requests welcome, please contribute! 

Bitcoin donations welcome at 1MdYE2NZ7DpeVw2un2an27nohyWKctyaBb

Please donate if this saves you time.

