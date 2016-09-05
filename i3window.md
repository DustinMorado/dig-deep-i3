# i3window

## Probably windows out raw motifs in memory and can calculates an average
This is a pre-built executable so I cannot provide a lot of documentation, but
it appears from [i3totsum.sh](i3totsum.md) to window out particles in memory for
all of the raw motifs in an i3d database and can operate on these windowed out
particles such as generating averages.

## Usage:
```
i3window [-clp] [-avg] [-wdg] [-wno] [-s window size(integers)] \
[-d sampling(integers] database(string) setname(string) average(string) \
[missingwedgeweight(string)]
```

## Called From:
* [i3totsum.sh](i3totsum.md)

## Example:
* [i3window](i3window.md) -clp -avg -s [`MOTIFSIZE`](i3param.md#motifsize) -d
  [`SAMPFACT`](i3param.md#sampfact) [`I3D`](i3setup.md#i3d) `set` `avg`.img
    * i3window -clp -avg -s 64 64 64 -d 1 1 1 mot-000.i3d mot-000-raw
      mot-000-raw-totsum.img
