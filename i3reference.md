# i3reference.sh

## Creates references for multi-reference alignment of raw motifs

## Usage:
`i3reference.sh reference`

## Sets:
### img
* `img` - Name of reference.
  * Value: reference argument to the script
  * Example: [`REFIMG`](i3param.md#refimg)
  * **Note:** If unset img will default to
    [`SET`](i3setup.md#set)-raw-totsum.img
  * **Note:** If set to `'sel'` then img will default to
    [`PRFX`](i3setup.md#prfx)-ref-sel.img

### fou
* `fou` - Fourier transform of reference
  * Value: [`PRFX`](i3setup.md#prfx)-ref.fou
  * Example: mot-000-ref.fou

### ref
* `ref` - Filename of reference
  * Value: [`PRFX`](i3setup.md#prfx)-ref.img
  * Example: mot-000-ref.img

## Sources:
None.

## Does:
1. Calculate the zero mean Fourier transform of `img` using
   [`i3fourier`](i3fourier.md)
2. Apply low-pass fourier filter using [`i3mask`](i3mask.md) and
   [`REFLOWPASS`](i3param.md#reflowpass) and [`REFLOWAPO`](i3param.md#reflowapo)
3. Apply high-pass fourier filter using [`i3mask`](i3mask.md) and
   [`REFHIPASS`](i3param.md#refhipass) and [`REFHIAPO`](i3param.md#refhiapo)
4. If [`REFFILT`](i3param.md#reffilt) was set: apply it to the filtered `fou`
   using [`i3compute`](i3compute.md).
5. Calculate the inverse Fourier transform of filtered `fou` using
   [`i3fourier`](i3fourier.md)
6. Mask the filtered `ref` using [`i3mask`](i3mask.md) by sequentially applying
   [`REFMSKOPT1`](i3param.md#refmskopt1), [`REFMSKOPT2`](i3param.md#refmskopt2)
   and [`REFMSKOPT3`](i3param.md#refmskopt3)
  * **Note:** Masks are only applied if these variables are set and non-empty
7. Normalizes `ref` to a mean of zero and a standard deviation of one using
   [`i3compute`](i3compute.md)
8. Recalculates the zero mean Fourier transform of `ref` using
   [`i3fourier`](i3fourier.md)
9. If [`REFMONT`](i3param.md#refmont) is true, then produce a montage of the
   references using [`REFMONTCOL`](i3param.md#refmontcol) or, by default, 10
   columns using [`i3montage`](i3montage.md) and setting the output to
   [`PRFX`](i3setup.md#prfx)-ref-mont.img
10. If [`YPERM`] is also set to true, then [`i3permute`](i3permute.md) is used
    along with [`i3montage`](i3montage.md) to generate a reference montage with
    the references rotated 90 degrees about the X-axis.

## Calls:
* [i3fourier](i3fourier.md)
* [i3mask](i3mask.md)
* [i3compute](i3compute.md)
* [i3montage](i3montage.md)
  * **Note:** Only called if [`REFMONT`](i3param.md#refmont) is set to true
* [i3permute](i3permute.md)
  * **Note:** Only called if [`REFMONT`](i3param.md#refmont) and
    [`YPERM`](i3param.md#yperm) are both set to true.
