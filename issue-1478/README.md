# Using Thread Local Arrays on Unikraft (For Unikraft Issue #1478)

This program is modeled after issue [#1478](https://github.com/unikraft/unikraft/issues/1478) 
on the Unikraft core repo. This is a proof of concept for a configuration that would 
mitigate this issue. The goal of this is to provide an example of how to get around the described
issue and possibly be a basis for providing a more long-term concrete solution.

## Quick Setup (aka TLDR)

For a quick setup, run the commands below.
Note that you still need to install the [requirements](../README.md#requirements).
Before everything, make sure you run the [top-level `setup.sh` script](../setup.sh).

1. `cd` into this directory (ie `issue1478` from the root directory of `catalog-core-cs360v`; if you are reading this, then you may have already done this)
2. Run `setup.sh` for this directory 
3. Run `./scripts/build/qemu.x86_64` to build the unikernel (this config
* This build is based on `scripts/defconfig/qemu.x86_64`. I chose this platform to be
the example since it is easiest to test for me; it is likely trivial to convert this configuration 
across architectures and runtimes (just add the neccessary additional configuration to the 
corresponding defconfig file for your desired platform, also located in `./scripts/defconfig`).
If you want an example of a broken unikernel/config, then run `./scripts/build/qemu-broken.x86_64`;
the aforementioned and following information should also generally apply to the broken config
as well. 
4. Run `./scripts/run/qemu.x86_64` to run the unikernel.

## Run

A successful run will show a message such as the one below:

```text
Booting from ROM..Powered by
o.   .o       _ _               __ _
Oo   Oo  ___ (_) | __ __  __ _ ' _) :_
oO   oO ' _ `| | |/ /  _)' _` | |_|  _)
oOo oOO| | | | |   (| | | (_) |  _) :_
 OoOoO ._, ._:_:_,\_._,  .__,_:_, \___)
                 Kiviuq 0.20.0~d13f61a2
Hello from Unikraft!
success!
```

## Special Thanks
* [teamore-ctrl](https://github.com/teamore-ctrl) for figuring out this config and being a great 
help in figuring out this issue
