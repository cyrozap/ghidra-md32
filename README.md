# MediaTek MD32 Processor Module for Ghidra

Work-in-progress, most instructions not yet supported.

**Current status**: Progress has stalled due to both the difficulty I've had
getting Ghidra to understand MD32 instruction bundles as well as [Ghidra's
current inability to support delay slots for ISAs that have variable-length
instructions][delayslot].

Fortunately, it may be possible to fix the issue with instruction bundles (see
Ghidra issues [\#4390][ghidra-4390] and [\#4581][ghidra-4581]), and I may be
able to work around the [delay slot issue][delayslot] using [P-code
injection][pcode].


## Build and Install

```
$ git clone https://github.com/cyrozap/ghidra-md32.git
$ cd ghidra-md32
$ gradle
```

The `dist` directory will now contain the extension zip file that you can
install into Ghidra.


[delayslot]: https://github.com/NationalSecurityAgency/ghidra/issues/3942
[ghidra-4390]: https://github.com/NationalSecurityAgency/ghidra/issues/4390
[ghidra-4581]: https://github.com/NationalSecurityAgency/ghidra/issues/4581
[pcode]: https://swarm.ptsecurity.com/guide-to-p-code-injection/
