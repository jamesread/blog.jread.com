---
title: "Freedom from Google Photos: taking 18 years and 80gb out of the cloud"
date: 2023-11-04T16:04:00+01:00
draft: false
featured_image_caption: No Google, I don't want to add photos.
tags:
  - cloud
---

Google Photos, the free, easy to use, on-for-many-android-users service has been the single Photo backup strategy for many of those who have used it, since it was released in 2015. I, for one, was amazed to discover that I have uploaded photos dating as far back as 2005, totalling over 80Gb. Initially, Google photos seemed like that ultimate, hassle-free, cloud backup service that would never be replaced.... However, as time went on, I found myself growing increasingly concern about cloud services that "own" my personal data. and I've just now managed to clear my data out of Google Photos.

I stopped using Google photos in 2019 - that is, I stopped my phone uploading photos to the cloud. I was initially frustrated by having to pay for the 100Gb storage tier (£1.59/month) and at 95+ Gb stored at the time, I deleted a bunch of videos to make sure I had enough Google disk space to continue using other google services.

On top of the storage worries, I started to get more frustrated with Google as a company. I was not so worried about privacy as a I am now, but there were frustrations building with services being deprecated, features being turned off, or changed without any notice. If you've not seen a history of Google services that have been killed off, https://killedbygoogle.com/ is a fascinating read.

Overall, here were the reasons I decided to really kill off Google photos;

* **Degoogling**: I'm using less and less of the Google ecosystem tools - I'd like to get rid of as much as possible in time!
* **Cost**: £1.59/month is nothing, but the cost per Gb is insane compared to the storage options I have already.
* **Accessibility**: The storage is difficult to access using tools I use all the time, although I was not aware of rcopy until recently!
* **Lifecycle**: While it is unlikely that Google would get rid of Google photos anytime soon, they're far more likely to kill of features, or change things in a way that does not suit me. I like services that I can control.
* **Privacy**: In the end, Google is Google - they have a pretty awful
* **Cheeky features**: Google photos does not serve you original images in the web UI, and various tools. Even if you download the photos, it will strip metadata, including Geolocation. 

# Google make it tricky to delete things in bulk

Would you believe that the Google photos API doesn't have an API call to delete the contents an album, or images that meet a certain criteria? It surprised the hell out of me! This mean that I could not use a command, or an easy tool to delete photos in bulk. Sure, there are some scripts and bits and pieces lying around GitHub, but most of them are pretty flaky, or were written years ago. This mean that I actually had to use the Web UI on photos.google.com, to select a photo, scroll down a long while, hold shift, and delete in chunks of 5-10Gb. It worked in the end, but it still was quite time consuming!

# The silver lining: Google Takeout is actually great.

Just a quick note to say, I got several 10Gb .tar.gz Archives of my original files back. Thanks Google - that's exactly what I wanted!

It's highly likely that 90% of these are duplicates with photos I already have stored locally, but there may be files that I uploaded to Google photos that I didn't have locally. I didn't want to take the chance.

# Conclusion

My decision to part ways with Google Photos reflects my ambition to move as much as I possibly can to self hosted services, and pure open source apps, with easily-accessible, maintainable files. While the convenience suited me for a long time, the associated costs, loss of control, and privacy concerns led me explore alternatives. It's a reminder that so many of these cloud services have low barriers to entry, and that long term hold on our data makes the exit only get higher, and higher.
