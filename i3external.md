# i3external

## Probably adds a pointer to a tomogram to an i3d database
This is a pre-built executable so I cannot provide a lot of documentation, but
it appears from [i3init.sh](i3init.md) to add a pointer to a tomogram to an i3d
database.

## Usage:
`i3external database(string) [tomo_name(string) [4095 * tomo_name(string)]`

## Called From:
* [i3init.sh](i3init.md)
* [i3select.sh](i3select.md)

## Example:
* i3external [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)
    * i3external mot-000.i3d tomogram\_00001.mrc
