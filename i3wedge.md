# i3wedge.sh

## Set tilt geometries for the missing wedge for tomograms in an i3 database

## Usage:
`i3wedge.sh`

## Sets:
None.

## Sources:
None.

## Does:
1. Reads [`MAPS`](i3setup.md#maps), and line by line:
    * Calls [`i3stat`](i3stat.md) -sh -f
      [`dir`](maps.md#dir)/[`map`](maps.md#map)
    * if [`WDGCOMP`](i3param.md#wdgcomp) is set to true then:
        * Calls [`i3wedge`](i3wedge2.md) -tlt [`tlt`](maps.md#tlt)
          [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)

## Calls:
* [i3stat](i3stat.md) -sh -f [`dir`](maps.md#dir)/[`map`](maps.md#map)
* [i3wedge](i3wedge2.md) -tlt [`tlt`](maps.md#tlt) [`I3D`](i3setup.md#i3d)
  [`map`](maps.md#map)
