# i3totsum.sh

## Generates global average of an i3d database and project

## Usage:
`i3totsum.sh suffix`

## Sets:
### set
* `set` - Name of set to use in generating global average.
    *Value: [`SET`](i3setup.md#set)-suffix
    *Example: mot-000-raw

### avg
* `avg` - Name of root filename for global average.
    *Value: `set`-totsum
    *Example: mot-000-raw-totsum

## Sources:
None.

## Does:
1. If [`WDGCOMP`](i3param.md#wdgcomp) is true and [`DIM`](i3setup.md#dim) is
   3 then calls [`i3window`](i3window.md) to create the global average and the
   missing wedge weight factor file. Otherwise just calls produces the global
   average.
2. If [`YPERM`](i3param.md#yperm) is true and [`DIM`](i3setup.md#dim) is 3 calls
   [`i3permute`](i3permute.md) to generate the global average also rotated 90
   degrees about the X-axis.

## Calls:
* [i3window](i3window.md) -clp -avg -wdg -wno -s
  [`MOTIFSIZE`](i3param.md#motifsize) -d [`SAMPFACT`](i3param.md#sampfact)
  [`I3D`](i3setup.md#i3d) `set` `avg`.img `avg`.wgt
  * **Note:** Only if missing wedge is set to be considered
* [i3window](i3window.md) -clp -avg -s [`MOTIFSIZE`](i3param.md#motifsize) -d
  [`SAMPFACT`](i3param.md#sampfact) [`I3D`](i3setup.md#i3d) `set` `avg`.img
  * **Note:** Only if missing wedge is not set to considered
* [i3permute](i3permute.md) -perm 1 0 0 0 0 1 0 -1 0 `avg`.img `avg`-y.img
  * **Note:** Only if y permutation is set to be considered as said above.
