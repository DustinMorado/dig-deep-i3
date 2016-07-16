# i3boximport

## Probably adds raw motif coordinates to i3 database
This is a pre-built executable so I cannot provide a lot of documentation, but
it appears from [i3init.sh](i3init.md) to add the integer coordinates of a raw
motif in a tomogram to an i3 database, and also associate those coordinates in
the database to the relevant subset as defined in [defs/sets](sets.md).

## Usage:
`i3create database(string) tomo(string) coordinate(string) subset(string)`

## Called From:
* [i3init.sh](i3init.md)
* [i3select.sh](i3select.md)

## Example:
* i3boximport [`I3D`](i3setup.md#i3d) [`map`](sets.md#map) -
  [`subset`](sets.md#subset)
    * **Note:** The standard input marker `-` in the call in this example refer
      to the integer coordinates being piped to the command from a `.trf` file.
    * cat 100 100 100 | i3boximport mot-000.i3d tomogram\_00001.mrc - subset1
