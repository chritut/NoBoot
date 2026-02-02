# NoBoot
A bootloader for the system NoNameOS.

This repository is a part of my project, i haven't scripted in a long time. And don't remember absolutely anything.
So i'm trying to learn back everything. By making an OS, from zero. It is a bad idea, but im doing it anyway.

What it does now:
-Boot (MBR only)
-Write out on the screen "Loading NoBoot..."
-Changes to 32-bit
Thats all.

My plans currently:
-Actually read C code from a FAT32 partition on the drive
-Show a boot menu with boot options
-Has a way to read the file system (also fat32)
-boot the kernel
