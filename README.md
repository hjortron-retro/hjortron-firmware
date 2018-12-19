# hjortron

_hjortron_ is a retro gaming firmware for handhelds built upon
RetroArch. Primary target device is RetroGaming RS-97.

## Building

The following tools are required to be in path for building hjortron
firmware:

- cpio
- rsync

You also need to deactivate Perl local::lib `eval $(perl
-Mlocal::lib=--deactivate-all)`

To build a firmware, run `make <target>` where target is one of
supported targets found in `src/targets`.


## resources

 - UBIBoot for rs97, https://github.com/SNESFAN/UBIBoot/commits/master