# i3dataset

## Probably passes transform data for a raw motif to an i3 database
This is a pre-built executable so I cannot provide a lot of documentation, a
real bummer here since this appears to be the command to extract information
from an i3 database. From [i3init.sh](i3init.md) it appears to pass all of the
information from `.trf` files for subsets to the i3 database.

## Usage:
```
i3dataset [-add] database(string) set(string) subset(string) trf(string)
```

## Called From:
* [i3init.sh](i3init.md)
* [i3select.sh](i3select.md)

## Example:
* i3dataset [`I3D`](i3setup.md#i3d) [`SET`](i3setup.md#set)-raw
  [`subset`](sets.md#subset) -
    * **Note:** The standard input marker `-` in the call in this example refer
      to the whole `.trf` file line except the first field being piped to the
      command.
    * cat 100 100 100 0. 0. 0. 1. 0. 0. 0. 1. 0. 0. 0. 1. 0. 0. 0. | i3dataset
      mot-000.i3d mot-000-raw subset1 -
