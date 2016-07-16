# i3wedge

## Probably adds missing wedge information to an i3 database
This is a pre-built executable so I cannot provide a lot of documentation, but
it appears from [i3wedge.sh](i3wedge.md) to add the the missing wedge geometry
information included in `.tlt` files for tomograms when
[`WDGCOMP`](i3param.md#wdgcomp) is set to true in the parameter file.

## Usage:
`i3wedge [-w 5 noidea(reals)] [-tlt tiltfile(string)] database(string)
[tomo(string)]`

## Called From:
* [i3wedge.sh](i3wedge.md)

## Example:
* i3wedge -tlt [`tlt`](maps.md#tlt) [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)
    * i3wedge -tlt ../tlt/tomogram\_00001.tlt mot-000.i3d tomogram\_00001.mrc
