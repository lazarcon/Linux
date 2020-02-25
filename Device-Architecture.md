# Device-Architecture

1. `/dev/sda`: Systemplatte:
..1. `/dev/sda1    ntfs    Recovery` Windows Recovery
..2. `/dev/sda2    vfat    ` 
..3. `/dev/sda3    vfat    ` 
..4. `/dev/sda4    ntfs    WinSystem` Windows System
..5. `/dev/sda5    ext4    boot` Linux Root
..6. `/dev/sda6    ext4    linux` Linux System
..7. `/dev/sda7    ntfs    WinSoftware` Windows Software
..8. `/dev/sda8    ext4    knoppix` Disc Recovery
..9. `/dev/sda9    ext4    grub`
2. `/dev/sdb`: Datenplatte:
..1. `/dev/sdb1    ntfs    Media` Medien/Daten
..2. `/dev/sdb2    ext4    ` backups/cache/crash/lib/local/...; nicht verwenden
..3. `/dev/sdb3    ext4    ` ? 
..4. `/dev/sdb4    ext4    ` ?
..5. `/dev/sdb5    ext4    ` Temporäre Dateien bzw. `\tmp`
..6. `/dev/sdb6    ext4    ` User bzw. `\home`
..7. `/dev/sdb7    [SWAP]  ` 