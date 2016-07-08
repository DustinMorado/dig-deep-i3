# I3 setup.sh

## Usage:
`source /path/to/i3/setup.sh [[[path] [ld_library_path]] [pythonpath]]`

## Sets:
### I3ROOT
* `I3ROOT` - Absolute path to protomo directory.
  *Example: /opt/protomo/2.4.2*

### I3LIB
* `I3LIB` - Absolute path to I3 dynamic libraries.
  *Value: `I3ROOT`/lib/[`OS`](./osarch.md#os)/[`DISTR`](./osarch.md#distr)*
    * **Note:** In older versions of protomo there is no
      [`DISTR`](./osarch.md#distr) variable and it is replaced with
      [`ARCH`](./osarch.md#arch).

### I3DEPLIB
* `I3DEPLIB` - Absolute path to I3's dependency dynamic libraries.
  *Example: /usr/local/lib/[`OS`](./osarch.md#os)/[`ARCH`](./osarch.md#arch)*

### I3LEGACY
* `I3LEGACY` - Absolute path to i3 directory.
  *Example: /opt/i3/0.9.8*

### EMAN2DIR
* `EMAN2DIR` - Absolute path to installation of EMAN2.
  *Example: /opt/EMAN2*

### I3LIBPATH
* `I3LIBPATH` - Shared library search path for I3 related dynamic libraries.
  *Example:* `I3LIBPATH` contains:
    * [`I3LIB`](#i3lib)
    * [`I3DEPLIB`](#i3deplib)
    * [`EMAN2DIR`](#eman2dir)/lib

### I3EXEPATH
* `I3EXEPATH` - Executble search path for I3 related binaries and scripts.
  *Example:* `I3EXEPATH` contains:
    * [`I3LEGACY`](#i3legacy)/bin/[`OS`](osarch.md#os)/[`DISTR`](osarch.md#distr)
    * [`I3LEGACY`](#i3legacy)/bin
    * [`I3ROOT`](#i3root)/bin/[`OS`](osarch.md#os)/[`DISTR`](osarch.md#distr)
    * [`I3ROOT`](#i3root)/bin
    * [`EMAN2DIR`](#eman2dir)/bin
    * /usr/bin
    * /bin

### I3PYPATH
* `I3PYPATH` - Python module search path for I3 related Python modules.
  *Example:* `I3PYPATH` contains:
    * [`I3LIB`](#i3lib)
    * [`EMAN2DIR`](#eman2dir)/lib

### PATH
* `PATH` - Modifies the path to include [`I3EXEPATH`](#I3EXEPATH), '.', and
  `path` if it was given when `setup.sh` was sourced.
    * **Note:** I3 needs the current directory '.' to be in the path. It puts it
      at the front of `PATH`, which is historically known as being unsafe, but
      removing it breaks I3 and adding it to the end can sometimes cause
      problems.

### LD\_LIBRARY\_PATH
* `LD_LIBRARY_PATH` - Modifies the linker library path to include
  [`I3LIBPATH`](#i3libpath), and `ld_library_path` if it was given when
  `setup.sh` was sourced.

### PYTHONPATH
* `PYTHONPATH` - Modifies the python path to include [`I3PYPATH`](#i3pypath),
  and `python_path` if it was given when `setup.sh` was sourced.
