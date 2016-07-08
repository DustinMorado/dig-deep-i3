# i3param.sh

## General parameters

### DIRPRFX
* `DIRPRFX` - Prefix of directory names of alignment cycles. *Default: "cycle-"*

### CYCPRFX
* `CYCPRFX` - Prefix of output file names. *Default: "hst-"*

### TRFDIR
* `TRFDIR` - Directory with initial alignment parameters (relative to top
  directory). *Default: "trf"*

### MOTIFSIZE
* `MOTIFSIZE` - Size of subvolumes (note that this motif after transformed must
  fit entirely with the tomogram volume.) *Example: "100 100 100"*
    * **Note:** This motif after being transformed must fit entirely within the
      tomogram volume, otherwise you'll see the error:

      `i3window: resampled area is too small...`

### SAMPFACT
* `SAMPFACT` - Sampling factor. *Default: "1 1 1"*
    * **Note:** This is raw sampling, not binning, so a sampling factor of "2 2
      2" would sample every other pixel and not use the average of a 2x2x2 cube
      of pixels. Sampling obviously increases speed at the loss of resolution.

### WDGCOMP
* `WDGCOMP` - Missing wedge compensation. *Default: "false"*
    * **Note:** If this is set to true you need to specify the correct `.tlt`
      file in [`./defs/maps`](./defsMaps.md). It needs to be in the protomo
      format and not in the IMOD format. 

## Parameters for raw motif alignment

### REFIMG
* `REFIMG` - Reference image or image stack. *Default: ""*
    * **Note:** Leave blank as is the default to use the global average, or set
      to "sel" to use selected class averages of previous cycle.

### REFMSKOPT1
* `REFMSKOPT1` - Options passed to [`i3mask`](./i3mask.md) to create masks
  applied sequentially to the reference. *Example: "-md 80 80 0 -ms 7 7 0"*
    * **Note:** Leave blank to not mask. Zeroes in the mask parameters mean the
      full image size is left unmasked in that dimension.

### REFMSKOPT2
* `REFMSKOPT2` - See [`REFMSKOPT1`](#refmskopt1) above. Applied sequentially
  after `REFMSKOPT1`.

### REFMSKOPT3
* `REFMSKOPT3` - See [`REFMSKOPT1`](#refmskopt1) above. Applied sequentially
  after `REFMSKOPT2`.

### REFLOWPASS
* `REFLOWPASS` - Diameter of low-pass Fourier space filter mask applied to the
  reference, described as a fraction of the image (AKA 0 to 1).
  *Default: "0.5 0.5 0.5"*
    * **Note:** I want to emphasize that units are given as a fraction of the
      image in Fourier space. Several other programs use a normalized unit
      called the absolute spatial frequency which runs from 0 to 0.5 at Nyquist
      that describes Fourier space filter parameters, so be careful to not
      confuse the two.

### REFLOWAPO
* `REFLOWAPO` - Apodization of low-pass Fourier space filter.
  *Default: "0.05 0.05 0.05"*
    * **Note:** Not described directly but probably the variance of a gaussian
      centered at the cutoff described in [`REFLOWPASS`](#reflowpass), similar
      to the sigma factors in IMOD's filters.

### REFHIPASS
* `REFHIPASS` - Diameter of high-pass Fourier space filter mask applied to the
  reference, described as a fraction of the image. See
  [`REFLOWPASS`](#reflowpass). *Default: "0.060 0.060 0.060"*

### REFHIAPO
* `REFHIAPO` - See [`REFLOWAPO`](#reflowapo). Apodization of high-pass Fourier
  space filter.*Default: "0.007 0.007 0.007"*

### REFFILT
* `REFFILT` - Additional filter stored in an image file. *Default: ""*
    * **Note:** Leave blank to skip as in the default. Also the image size must
      be the corresponding transform size of [`MOTIFSIZE`](#motifsize). I need
      to look into this more. Is the filter Real space or Fourier? I'm guessing
      Real space. Also does the transformed size include rotations of the raw
      motifs, as that seems extremely difficult to calculate ahead of time?

### REFMONT
* `REFMONT` - Create montage images of references? (true or false)
  *Default: "true"*

### REFMONTCOL
* `REFMONTCOL` - Number of columns in reference montage. *Default: ""* 
    * **Note:** Leave blank to let I3 arrange the montage automatically.

### MRAMSK
* `MRAMSK` - See [`REFMSKOPT1`](#refmskopt1). Options passed to
  (`i3mask`)[./i3mask.md] to create a multireference alignment mask, applied to
  raw motifs. *Example: "-md 80 80 0 -ms 7 7 0"*
    * **Note:** I need to check if this mask is applied pre or post
      transformation. I'm guessing post-transform since that's really all that
      makes sense.

### MRACC
* `MRACC` - Cross-correlation mode. *Default: "xcf"*
    * **Note:** Leave blank to use xcf. Correlation functions are as follows:
        1. xcf - Cross-correlation function
        2. mcf - Mutual-correlation function (Van Heel and Orlova, 1992)
        3. pcf - Phase-only correlation function (Horner and Gianino, 1984)
        4. dbl - Double-phase correlation function (Saxton, 1994)

### MRAPKR
* `MRAPKR` - Peak search radius. *Example: "5 5 5"*
    * **Note:** This is referred to as a translational "prior" in some other
      software packages, and I like to think of it as an ellipsoidal mask
      applied to the correlation function in which to limit the search for a
      correlation peak.

### MRACMR
* `MRACMR` - Radius for center of mass calculation. *Default: ""*
    * **Note:** I have no idea what this is used for, but for completeness, it
      is set as "2 2 2" in the tutorial file but commented out. I need to look
      into this some more.

### MRASRCH
* `MRASRCH` - Grid search parameters. *Example: "30 4 8 4"*
    * **Note:** For translational alignment only, use "0 0 0 0". For rotational
      alignment parameters describe \<nutation\> \<nutation step\> \<spin\> \<spin
      step\> as follows:  
      1. \<nutation\> - Maximum half-angle for nutation of rotation axis.
        0 <= \<nutation\> <= 180.
      2. \<nutation step\> - Angular step of nutation.
      3. \<spin\> - In-plane rotations are searched from plus-minus <spin>.
        0 <= \<spin\> <= 180.
      4. \<spin step\> - Angular step of spin.
      The angular step of the precession of the rotation axis is defined as
      equal to \<nutation step\> as measured from the center of the unit sphere,
      so that as nutation increases so does the number of precession sampling
      points.

### MRAOPT
* `MRAOPT` - Execution options. *Default: "nohup 4"*
    * **Note:** Use "nohup" alone to run on a single processor and "nohup x" to
      run on "x" processors. Also for a cluster, you could also set this to
      "setup.sh" where setup.sh is a script that submits a job 'xxx.sh' to the
      cluster and sends the output to 'xxx.log'. This is all hearsay though and
      I haven't tested it.

## MSA parameters

### MSAIMGSIZE
* `MSAIMGSIZE` - Size of extracted subvolumes for multivariate statistical
  analysis (MSA). *Example: "100 100 100"*
    * **Note:** This does not have to be the same as [`MOTIFSIZE`](#motifsize)
      it could be a sub-box, although it appears this sub-box must be centered
      within the original raw motif.

### MSAIMGSMP
* `MSAIMGSMP` - See [`SAMPFACT`](#sampfact). Sampling factor for subvolume
  extraction. *Default: "1 1 1"*

### MSAMASK
* `MSAMASK` - File name of MSA mask, relative to [`DIRPRFX`](#dirprfx).
  *Default: ""*
    * **Note:** Leave blank to use standard mask creation options below
      [`MSAMASKOPT1`](#msamaskopt1). Mask image size must be the same as in
      [`MSAIMGSIZE`](#msaimagesize).

### MSAMASKOPT1
* `MSAMASKOPT1` - See [`REFMSKOPT1`](#refmskopt1). Options passed to
  [`i3mask`](./i3mask.md) to create masks applied sequentially.
  *Example: "-mw 75 75 0 -mc 0 0 0"*
    * **Note:** I don't know exactly where this mask is applied. My guess is
      that this mask is used during the actual MSA calculations.

### MSAMASKOPT2
* `MSAMASKOPT2` - See [`REFMSKOPT1`](#refmskopt1). Applied sequentially after
  `MSAMASKOPT1`.

### MSAMASKOPT3
* `MSAMASKOPT3` - See [`REFMSKOPT1`](#refmskopt1). Applied sequentially after
  `MSAMASKOPT2`.

### MSAMASKSUPERPOS
* `MSAMASKSUPERPOS` - Filename of image to superimpose mask. *Default: ""*
    * **Note:** I have no idea what this means or how it is meant to be used.
      But leaving it blank as is the default skips this step.

### MSAIMGAVG
* `MSAIMGAVG` - Create averages of raw stack. *Default: "false"*

### MSAIMGMSK
* `MSAIMGMSK` - See [`REFMSKOPT1`](#refmskopt1). Options passed to
  [`i3mask`](./i3mask.md) to create a image mask applied to extracted
  motifs. *Example: "-mw 75 75 75 -ms 5 5 5 -mc 0 0 0"*

### MSALOWPASS
* `MSALOWPASS` - See [`REFLOWPASS`](#reflowpass). Diameter of low-pass Fourier
  space filter mask described as a fraction of the image (AKA 0 to 1).
  *Default: "0.5 0.5 0.5"*
    * **Note:** Again like `MSAMASKOPT1`, I don't know exactly where this filter
      is applied, but this time my guess is to the extracted motifs.

### MSALOWAPO
* `MSALOWAPO` - See [`REFLOWAPO`](#reflowapo). Apodization of low-pass Fourier
  space filter. *Default: "0.05 0.05 0.05"*

### MSAHIPASS
* `MSAHIPASS` - See [`REFHIPASS`](#refhipass). Diameter of high-pass Fourier
  space filter mask applied to the reference, described as a fraction of the
  image. *Default: "0.060 0.060 0.060"*

### MSAHIAPO
* `MSAHIAPO` - See [`REFHIAPO`](#refhiapo). Apodization of high-pass Fourier
  space filter.*Default: "0.007 0.007 0.007"*

### MSAFILT
* `MSAFILT` - See [`REFFILT`](#reffilt). Additional filter stored in an image
  file. *Default: ""*

### MSAFACT
* `MSAFACT` - Maximal number of factors (eigenimages) to compute.
  *Default: "40"*

### MSAMONT
* `MSAMONT` - Create montages of eigenimages (factors) (true or false).
  *Default: "true"*

### MSAMONTCOL
* `MSAMONTCOL` - See [`REFMONTCOL`](#refmontcol). Number or columns to use in
  eigenimage montage. *Default: ""*

## Classification parameters

### CLASSES
* `CLASSES` - Number of classes to generate. *Default: "2 4 8"*
    * **Note:** This refers to the actual folders with class averages generated,
      which is separate from the classifications calculated, which is specified
      below.

### CLSMIN
* `CLSMIN` - Minimum number of classes calculated and stored in the class-file
  *Default: "2"*

### CLSMAX
* `CLSMAX` - Maximum number of classes calculated and stored in the class-file
  *Default: "16"*

### CLSINC
* `CLSINC` - Increment of classes calculated and stored in the class-file.
  *Default: "2"*
    * **Note:** If blank than every class between `CLSMIN` and `CLSMAX` will be
      calculated. 

### CLSFACT
* `CLSFACT` - Factors used in classification. *Example: "1-8"*
    * **Note:** The factors referenced here relate to [`MSAFACT`](#msafact) and
      are indexed started at zero, so in example the first factor is not used
      for classification.

### CLSMONT
* `CLSMONT` - Low-pass Fourier space filter applied to montaged class averages.
  *Default: "0.9"*
    * **Note:** If left blank than class average montages will not be generated.

### CLSMONTCOL
* `CLSMONTCOL` - See [`REFMONTCOL`](#refmontcol). Number of columns used in
  class average montage. *Default: ""*

### CLSHVO
* `CLSHVO` - Fraction of ignored high-variance outliers. *Default: "0.2"*
    * **Note:** I'm not so sure about this value's significance but I'm guessing
      its ignoring the 20 percent highest variable particles in defining
      classes.

### CLSHVM
* `CLSHVM` - Fraction of ignored high-variance class members. *Default: "0.2"*
    * **Note:** This means that the 20 percent most variable class members will
      not be included in the following class averages.

## Class average alignment parameters

### SELREFIMG
* `SELREFIMG` - Specific reference image to align class averages against.
  *Default: ""*
    * **Note:** Leave blank for automatic selection of the class average to
      align against.

### SELMSKOPT1
* `SELMSKOPT1` - See [`REFMSKOPT1`](#refmskopt1). Real space masks applied
  sequentially to class averages. *Default: "-mw 80 80 80 -ms 5 5 5"*

### SELMSKOPT2
* `SELMSKOPT2` - See [`REFMSKOPT1`](#refmskopt1). Real space mask applied after
  `SELMSKOPT1` to class averages. *Default: ""*

### SELMSKOPT3
* `SELMSKOPT3` - See [`REFMSKOPT1`](#refmskopt1). Real space mask applied after
  `SELMSKOPT2` to class averages. *Default: ""*

### SELLOWPASS
* `SELLOWPASS` - See [`REFLOWPASS`](#reflowpass). Diameter of low-pass Fourier
  space filter mask applied to class averages. *Default: "0.5 0.5 0.5"*

### SELLOWAPO
* `SELLOWAPO` - See [`REFLOWAPO`](#reflowapo). Apodization of low-pass Fourier
  space filter. *Default: "0.05 0.05 0.05"*

### SELHIPASS
* `SELHIPASS` - See [`REFHIPASS`](#reflowpass). Diameter of high-pass Fourier
  space filter mask applied to class averages. *Default: "0.060 0.060 0.060"*

### SELHIAPO
* `SELHIAPO` - See [`REFHIAPO`](#reflowapo). Apodization of high-pass Fourier
  space filter. *Default: "0.007 0.007 0.007"*

### SELFILT
* `SELFILT` - See [`REFFILT`](#reffilt). Additional filter stored in an image
  file. *Default: ""*

### SELCC
* `SELCC` - See [`MRACC`](#mracc). Cross-correlation mode. *Default: "xcf"*

### SELMONT
* `SELMONT` - See [`REFMONT`](#refmont). Create montage images of aligned class
  averages?  (true or false) *Default: "true"*

### SELMONTCOL
* `SELMONTCOL` - See [`REFMONTCOL`](#refmontcol). Number of columns in reference
  montage. *Default: ""* 

### SELPKR
* `SELPKR` - See [`MRAPKR`](#mrapkr). Peak search radius. *Example: "5 5 5"*

### SELCMR
* `SELCMR` - See [`MRACMR`](#mracmr). Radius for center of mass calculation.
  *Default: ""*

### SELSRCH
* `SELSRCH` - See [`MRASRCH`](#mrasrch). Grid search parameters.
  *Example: "30 4 8 4"*

### SELOPT
* `SELOPT` - See [`MRAOPT`](#mraopt). Execution options. *Default: "nohup 4"*

### SELCLS
* `SELCLS` - Selected classification to apply aligned transformations to raw
  motifs. *Default: "4"*
    * **Note:** The value here must be one of the classifications that was
      calculated and class averages generated in [`CLASSES`](#classes).

## Miscellaneous parameters

### GLBLAVG
* `GLBLAVG` - Produce global averages? (true or false.) *Default: "true"*

### YPERM
* `YPERM` - Produce side views of averages? (true or false.) *Default: "true"*

### MSAIMGKEEP
* `MSAIMGKEEP` - Keep large image stacks? (true or false.) *Default: "false"*

### I3TMPDIR
* `I3TMPDIR` - Use this variable to set a custom directory for temporary files.
  *Default: ""*

### I3SCRIPTS
* `I3SCRIPTS` - Use this variable to a set a custom directory that holds used
  user scripts. *Default: ""*
    * **Note:** Beyond setting this variable I have no idea how to actually call
      any user scripts from within i3.
