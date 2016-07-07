# i3mrainitial.sh

## Run initial cycle of alignment or multi-reference alignment

## Usage:
`i3mrainitial.sh`

## Sets:
### I3PARAM
* [`I3PARAM`](./i3param.md) - Name of i3 parameter file.
  *Value: mraparam.sh*
    * **Note:** Only sets [`I3PARAM`](./i3param.md) if unset

## Sources:
* [`I3LEGACY`](./setup.md#i3legacy)/run/[i3setup.sh](./i3setup.md) defs 0

## Does:
* Makes the directory [`DIR`](./i3setup.md#dir)
* Copies [`I3PARAM`](./i3param.md) to [`DIR`](./i3setup.md#dir)
* Sets [`DIR`](./i3setup.md#dir) as the current working directory

## Calls:
**Note:** Calls here are made after the current working directory has changed to
[`DIR`](./i3setup.md#dir).
* [i3init.sh](./i3init.md)
* [i3totsum.sh](./i3totsum.sh) raw
* [i3reference.sh](./i3reference.md) [`REFIMG`](./i3param.md#refimg)
* [i3msamask.sh](./i3msamask.md) raw 
