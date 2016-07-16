# i3transf

## Probably applies initial transformation for a tomogram in an i3 database
This is a pre-built executable so I cannot provide a lot of documentation, but
it appears from [i3init.sh](i3init.md) to set an initial transform for the
entire tomogram in an i3 database. From the tutorial it seems to be used to
scale data to the same object pixel size.

## Usage:
```
i3transf -dim dim(integer) [-Ainv] [-A a11(real) [a12..a33(8*real)]] [-b dunno
(real) [dunno2(real)] [dunno3(real)]][-d dunno1(real) [dunno2(real)] [
dunno3(real)]] [-e dunno1(real) dunno2(real) dunno3(real)] [-r dunno(real)]
database(string) [tomo(string)]
```

## Called From:
* [i3init.sh](i3init.md)

## Example:
* i3transf -dim [`DIM`](i3setup.md#dim) -A [`A`](maps.md#a)
  [`I3D`](i3setup.md#i3d) [`map`](maps.md#map)
    * i3transf -dim 3 -A 0.97 0 0 0 0.97 0 0 0.97 mot-000.i3d
      tomogram\_00001.mrc
