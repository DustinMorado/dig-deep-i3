# Protomo osarch.sh

## Determine system type for Protomo setup

## Usage:
None. Called by [`I3ROOT`](protomoSetup.md#i3root)/[setup.sh](protomoSetup.md)

## Sets:
### OS
* `OS` - The operating system of your computer.
    * **Note:** The only available options are 'linux' and 'freebsd' and is set
      by a call to the command `uname -s`.

### ARCH
* `ARCH` - The architecture of your computer's processor.
    * **Note:** The only available options are 'i686' (32-bit) and 'x86-64'
      (64-bit) and is set by a call to the command `uname -m`.

### DISTR
* `DISTR` - The distribution of your computer's OS.
    * **Note:** The only available options are 'centos6-[`ARCH`](#arch)' or just
      [`ARCH`](#arch), and is set by a call to the command `lsb_release -a`.

## Sources:
None.

## Does:
None. Just sets the above mentioned environment variables for later use.

## Calls:
None.
