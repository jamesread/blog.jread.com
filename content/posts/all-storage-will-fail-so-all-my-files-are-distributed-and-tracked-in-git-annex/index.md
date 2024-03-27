---
title: All storage will fail, so all my files are distributed & tracked in Git Annex. ❤
date: 2021-01-19
tags:
  - my-tools
  - git
featured_image: ![Photo by [**Markus Spiske](https://www.pexels.com/@markusspiske?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)** from [**Pexels](https://www.pexels.com/photo/space-apple-broken-technology-2644598/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)**](https://cdn-images-1.medium.com/max/3760/1*Nrhal9MO7DcLlRJ9RIXHrQ.jpeg)*Photo by [**Markus Spiske](https://www.pexels.com/@markusspiske?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)** from [**Pexels](https://www.pexels.com/photo/space-apple-broken-technology-2644598/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)***
---

## I am paranoid about data loss

In the past, I have lost files. It pains me that I cannot get back some of my early files from my first PCs and computers. I've had corrupt disks. Typos in disk format commands. Busted RAID controllers, and I've been permanently locked out of cloud storage access, etc. I can’t stop any of that happening again, but I refuse to lose any more data because I thought I could trust the storage.

This is so important now that so much of the important stuff is only digital. I don’t think I’ve ever permanently lost family or holiday photos, thankfully — but so many, including my wedding photos, photos of my newborn baby, if the digital copies are lost, then they are lost forever.

## Don’t talk to me about Google Photos, RAID, etc.

They’re not backup solutions — they’re single points of failure with a false sense of security.

**How to lose data with RAID;**

* [Your controller starts writing junk](https://www.diskinternals.com/raid-recovery/how_to/).

* [Your power supply blows up and takes the motherboard, controller, or multiple disks with it](https://linustechtips.com/uploads/monthly_2018_10/IMG_2131.jpeg.e3cbf5a6160d2610e85bc9b2556bbf96.jpeg).

* [You spill coffee over your precious NAS](https://i.ytimg.com/vi/9GGnua2kUF0/hqdefault.jpg).

* [Your NAS tries to float when your house floods](https://image.bayimg.com/caakgaadl.jpg).

* You get bitrot, or ransomware, or you type something stupid and corrupt your files.

**How to lose data with Google photos/drive;**

* Google photos does not store your original files anyway (it strips location and camera information if you download the file again).

* Your Google account gets banned, hacked, or locked out.

* [Google decides to delete some of your photos, or loses files](https://support.google.com/drive/thread/18490916?hl=en).

* You accidently delete a file or folder.

**This goes for every other storage solution. **ZFS, Ceph, S3, Tape, SSDs. They all have single points of failure. Yep, even stuff like S3 and Ceph — get your account banned on S3? Your Ceph servers physically catch fire? Yep.

## So, what does Git Annex do?

Git calls itself a “[stupid content tracker](https://git-scm.com/docs/git)”.

Git Annex calls itself a “[stupid filename and metadata tracker](https://git-annex.branchable.com/how_it_works/)”.

[Git Annex is not a backup tool](https://git-annex.branchable.com/not/), or a better storage system. It just can be used to as a really awesome way to track (and copy, check, etc) files across lots of different types of storage.

Putting it simply, using Git Annex, you can add files (in particular, large files), that don’t have to be pulled down in every place where you clone the repository. However, you can **track exactly in which** repos you have those files. Let me show by example;

    user@host: **git annex whereis "2019-10 Wedding/IMG001.jpg"**
    whereis 2019-10 Wedding/IMG001.jpg (6 copies)
      2a85a996-5601-42ee-a5eb-637ab9fcd869 -- HDD-home-storinator-SN-ABC
      e0156b12-7b3f-4697-aebb-4de7456890f1 -- SSD-home-mindstorm-SN-XYZ
      ff4a9c3f-435b-4d13-be85-0b8d1e4631a3 -- HDD-storageunit-SN-QQR
      d2e9ee3e-49bf-4600-bd49-0ed5dc089373 -- AWS-S3-Glacier-account-foo
      7e215541-7715-4490-b3ad-afd8d4e8c10f -- LTO-00000083
      1a4afe67-b5bd-49dc-bb9e-83d0ac1d9bd9 -- LTO-00000413

Yep. My wedding photos are backed up onto 4 different mediums (HDD, SSD, AWS and LTO), in 3 different locations (home, cloud, storage unit).

Git annex allows me to name each repository that I clone, and here’s how I name them;

* **Servers**; **<disk type (HDD or SSD)>**-**<server name>**-**<disk serial>** For example; HDD-home-storinator-SN-ABC . that’s Hard Drive, at home, in a server called “storinator”, with a disk serial number starting “ABC….”. I don’t want to publish my real disk serial numbers on the internet.

* **Cold storage (my storage unit); **Very similar to servers; **<disk type>**-storageunit-**<disk serial>**

* **Cloud; <AWS/Azure/GCP/etc>**-**<service (eg: S3)>**-**<username/account number to login>**

Note: LTO is Linear Tape. Yep, I backup everything to tape as well. Cold Storage is so useful when a server blows up.

## Other essential reasons I use Git Annex;

* It “fails open”. My files are just regular files/symlinks on a filesystem. There’s no “magic”, or proprietary database. This means I’m not too concerned if Git annex development stops, or more importantly, if I want to get files off a LTO tape in 10 years.

* There is no central point of failure — there is no index server that needs to stay online, any cloned repository has a full list of files.

* It works with offline storage (eg, LTO tapes, HDDs in a storage unit) super easily.

* For old photos or files I don’t need often, I can just “drop” them from my servers and workstations to save storage space, knowing that there are safe copies on tape, in the cloud, or elsewhere. Git Annex tracks this for me.

* It’s Open Source and seems pretty stable. Linux support.

* As a hobbyist developer, I’m already super familiar with Git.

* It’s design philosophy is not to do too much (although it supports BitTorrent, Glacier, etc via the native clients if they’re installed locally).

* It works with basically any storage because it doesn’t use any magic — AWS, LTO tapes, HDDs, whatever.

* It’s super easy to track how many copies of a file I have, and where they are. If used properly, it will stop me deleting a file locally if it’s the last copy (or if I’ve told Git Annex to keep at least 3, or 5 copies).

## Summary;

All storage has single points of failure. I use Git Annex because I don’t trust any storage, and because it’s so good at tracking files, it really helps me implement a [3–2–1 backup strategy](https://en.wikipedia.org/wiki/Backup).
