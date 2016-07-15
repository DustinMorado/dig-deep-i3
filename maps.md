# defs/maps

## Tomogram definitions text file
**Note:** This file must _not_ contain _any_ blank lines especially at the end
of the file.

## Format:
One line for each tomogram with at least the first two fields. Fields are:

### dir
* `dir` - Path to the directory containing the tomogram.
    * **Note:** The path should be a relative path.

### map
* `map` - Tomogram filename without path components. 

### tlt
* `tlt` - Path to geometry parameter file describing the missing wedge
    * **Note:** If [`WDGCOMP`](i3param.md#wdgcomp) is set to false then this
      file is not needed.
    * **Note:** The format of this file can be found in protomo documentation.

### A
* `A` - A 3x3 transformation matrix to be applied when motifs are first
  extracted 


## Example:
'''
../maps tomogram_00001.mrc ../tlt/tomogram_00001.tlt 1 0 0 0 1 0 0 0 1
../maps tomogram_00002.mrc ../tlt/tomogram_00002.tlt 1.05 0 0 0 1.05 0 0 0 1.05
'''
