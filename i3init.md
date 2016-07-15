# i3init.sh

## Initializes the .i3d database of a project

## Usage:
`i3init.sh`

## Sets:
None.

## Sources:
None.

## Does:
1. Calls [`i3create`](i3create.md) to create a new blank database
   [`I3D`](i3setup.md#i3d)
2. Reads [`MAPS`](i3setup.md#maps) and line by line:
    * Calls [`i3external`](i3external.md) to add [`map`](maps.md#map) to
      database
3. Reads [`SETS`](i3setup.md#sets) and line by line:
    * Reads the `.trf` file for [`subset`](sets.md#subset) and for the integral
      motif position in the tomogram adds the motif position to the database by
      calling [`i3boximport`](i3boximport.md).
4. Calls [`i3wedge.sh`](i3wedge.md)
5. Reads [`MAPS`](i3setup.md#maps) and line by line:
    * If [`A`](maps.md#a) has been given it applies the transform to the
      tomogram in the database using [`i3transf`](i3transf.md).
6. Reads [`SETS`](i3setup.md#sets) and line by line:
    * Reads the `.trf` file for [`subset`](sets.md#subset) and passes the entire
      line minus the first field to a call to [`i3dataset`](i3dataset.md).

## Calls:
* [i3create](i3create.md) [`I3D`](i3setup.md#i3d)
* [i3external](i3external.md) [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)
* [i3boximport](i3boximport.md) [`I3D`](i3setup.md#i3d) [`map`](maps.md#map) -
  [`subset`](sets.md#subset)
* [i3wedge.sh](i3wedge.md)
* [i3transf](i3transf.md) -dim [`DIM`](i3setup.md#dim) -A [`A`](maps.md#a)
  [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)
* [i3dataset](i3dataset.md) \[-add\] [`I3D`](i3setup.md#i3d)
  [`SET`](i3setup.md#set)-raw [`subset`](sets.md#subset) -
    * **Note:** -add is only added after the first call of the program.
