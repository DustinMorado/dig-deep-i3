# i3setup.sh

## Common I3 setup

## Usage: 
`i3setup.sh defs [[oldcycle] newcycle]`

## Sets:
### MAPS
* `MAPS` - Absolute Path to [defs/maps](maps.md) *Value: "$(pwd)/defs/maps"*

### SETS
* `SETS` - Absolute path to [defs/sets](sets.md) *Value: "$(pwd)/defs/sets"*

### PATH
* `PATH` - Modifies the path to include i3 run scripts in
  [`I3LEGACY`](setup.md#i3legacy) and if defined also includes
  [`I3SCRIPTS`](i3param.md#i3scripts). 

### CYC
* `CYC` - Zero padded three digit integer specifying the current cycle.
  *Value: `newcycle` if given otherwise `oldcycle`*
    * **Note:** This and all other variables below except
      [`I3FILEPATH`](#i3filepath) are only set if at least `oldcycle` was given
      when `i3setup.sh` was sourced.

### PRFX
* `PRFX` - Prefix of output filenames for current cycle name.
  *Value: [`CYCPRFX`](./i3param.md#cycprfx)[`CYC`](#cyc)*

### I3D
* `I3D` - i3 database filename. *Value: [`PRFX`](#prfx).i3d*

### SET
* `SET` - Same as `PRFX` (???) *Value: [`PRFX`](#prfx)*

### DIR
* `DIR` - Directory for the current cycle.
  *Value: [`DIRPRFX`](./i3param.md#dirprfx)[`CYC`](#cyc)*

### SEL
* `SEL` - Prefix for filenames from class average alignment output.
  *Value: [`PRFX`](#prfx)-sel*

### CLS
* `CLS` - Prefix for filenames and directories from classification.
  *Value: [`PRFX`](#prfx)-class*

### DIM
* `DIM` - Dimension of project motifs.
  *Value: Number of fields in [`MOTIFSIZE`](./i3param.md#motifsize)*
    * **Note:** Example - If MOTIFSIZE="10 10 10" then DIM=3.
      If MOTIFSIZE="10 10" then DIM=2.

### OLD
* `OLD` - Zero padded three digit integer specifying the previous cycle.
  *Value: `oldcycle` only if `newcycle` was also given*
    * **Note:** This and all other variables set with OLD in the name are only
      set if both `oldcycle` and `newcycle` were given when `i3setup.sh` was
      sourced.

### OLDPRFX
* `OLDPRFX` - Prefix of output filenames for previous cycle name.
  *Value: [`CYCPRFX`](#cycprfx)[`OLD`](#old)*

### OLDSET
* `OLDSET` - Prefix of filenames containing updated transformations for the raw
  motifs after the previous cycle. *Value: [`OLDPRFX`](#oldprfx)-ali*

### OLDDIR
* `OLDDIR` - Directory for the previous cycle.
  *Value: [`DIRPRFX`](./i3param.md#dirprfx)[`OLD`](#old)*

### I3FILEPATH
* `I3FILEPATH` - List of directories to search for dataset files (i.e.
  tomograms). *Value: ".:`dir`:..." for dir in [`MAPS`](#maps)*

## Sources:
* [`I3ROOT`](./protomoSetup.md#i3root)/[setup.sh](./protomoSetup.md)
* [`I3PARAM`](./i3param.md)

## Does:
* Makes sure [`I3ROOT`](./protomoSetup.md#i3root) is set and that the directory
  exists.
* Makes sure if `USEIMAGIC` is set that the directory `IMAGIC_ROOT` exists.
    * **Note:** `USEIMAGIC` and `IMAGIC_ROOT` aren't set anywhere in the I3 that
      I can find, so it should be defined by the user if desired.

## Calls:
None
