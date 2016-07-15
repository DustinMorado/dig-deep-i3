# defs/sets

## Dataset definitions text file
**Note:** This file must _not_ contain _any_ blank lines especially at the end
of the file.

## Format:
One line for each data subset corresponding to one tomogram. A single
tomorgram can correspond to multiple subsets. Fields are:

### map
* `map` - Tomogram filename without path components. Same as
  [`map`](maps.md#map)

### subset
* `subset` - Subset identifier name.

## Example:
```
tomogram_00001.mrc subset1
tomogram_00001.mrc subset2
tomogram_00001.mrc subset3
tomogram_00002.mrc subset4
tomogram_00002.mrc subset5
tomogram_00003.mrc subset6
```
