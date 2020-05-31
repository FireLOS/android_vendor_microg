# MicroG vendor for FireLineage 

This project facilitates the inclusion of the following apps/etc during build-time.
 * [microG](https://microg.org) packages
   * [GmsCore](https://github.com/Nanolx/android_packages_apps_GmsCore) a FOSS implementation of google play services. NanoDroid-mod.
   * [GsfProxy](https://microg.org/download.html) required by GmsCore as proxy for legacy GCM compatibility.
   * [com.google.android.maps](https://github.com/microg/android_frameworks_mapsv1) legacy microG's mapsv1 reimplementation.
   * [DroidGuard](https://github.com/ThibG/android_packages_apps_RemoteDroidGuard/tree/aarch64) NanoDroid-mod.
   * [nlpBackendProviders] Mozilla location service and Nominatim address lookup backends.
 * [F-Droid](https://f-droid.org) playstore-like client to install FOSS software.
   * [NanoDroid's F-Droid repo](https://nanolx.org/fdroid/repo/) pre-installed for easy updating.
   * [F-Droid Privileged Extension](https://gitlab.com/fdroid/privileged-extension/) eases installation/removal of apps.
 * [FakeStore](https://github.com/microg/android_packages_apps_FakeStore) An empty package that mocks the existence of the Google Play Store to the Play Services client.
 * [Weather providers](https://download.lineageos.org/extras)
   * OpenWeatherMapWeatherProvider
   * WundergroundWeatherProvider
   * YahooWeatherProvider
 * [google sync adapters](https://gitlab.com/Nanolx/NanoDroid)
 * [swipe libs](http://opengapps.org/) for swipe capability in aosp keyboard. arm32 version 
 
__*Please see links above for sources and additional information on the components included within this project.__

### Why is this necessary?
  For those seeking to install  microG, there are some roadblocks:
* No [LineageOS](https://download.lineageos.org) support for Pixel 2 / walleye. Which means,
* No [LineageOS for microG](https://lineage.microg.org) for Pixel 2 / walleye.
You can build it yourself but,
* No signature-spoofing support in [LineageOS source](https://github.com/LineageOS); required by microG.
* [Docker image](https://github.com/lineageos4microg/docker-lineage-cicd) is lacking documentation (and may not work at all due to wahoo/muskie/walleye's peculiar naming scheme.)
* The [project this project is forked from](https://github.com/lineageos4microg/android_prebuilts_prebuiltapks) works well, but [NanoDroid's](https://gitlab.com/Nanolx/NanoDroid) versions of GmsCore.apk are more regularly maintained.

### Can't you just flash a NanoDroid package?
  Installation by flashing an [official package](https://downloads.nanolx.org/NanoDroid/Stable/) would be preferred, but I was unable to succeed with this method while on Pie. I can't attribute my failure here to user error, as NanoDroid worked flawlessly on pre-Pie roms. After trying several combinations of [deodexing](https://gitlab.com/Nanolx/NanoDroid/blob/master/doc/DeodexServices.md) and running patcher on non-spoofing-enabled rom, not deodexing or running patcher on spoofing-enabled rom, running patcher in TWRP/magisk-mode, etc. I decided to have my desired components installed at build-time.

## Signature-spoofing 
  Roms without built-in support for signature-spoofing can be built from source and patched to include it by applying an OS-specific patch from [here](https://github.com/microg/android_packages_apps_GmsCore/tree/master/patches).

### Patching Procedure
  cd to frameworks/base within your build directory.

  download and apply patch
  
  For android 9
```
wget https://raw.githubusercontent.com/microg/android_packages_apps_GmsCore/master/patches/android_frameworks_base-P.patch
patch -p1 < android_frameworks_base-P.patch
```

`git clean -f` to clean frameworks/base of ".orig" files with 

For android 8
```
wget https://raw.githubusercontent.com/microg/android_packages_apps_GmsCore/master/patches/android_frameworks_base-O.patch
patch -p1 < android_frameworks_base-O.patch
```

`git clean -f` to clean frameworks/base of ".orig" files with 

For android 7
```
wget https://raw.githubusercontent.com/microg/android_packages_apps_GmsCore/master/patches/android_frameworks_base-N.patch
patch -p1 < android_frameworks_base-N.patch
```

`git clean -f` to clean frameworks/base of ".orig" files with 



## Incorporate this project into build
in .repo/local_manifests/roomservice.xml, add
 ```
  <project name="FireLOS/android_vendor_microg" path="vendor/microg" remote="github" revision="master" />
 ```

add `$(call inherit-product-if-exists, vendor/microg/microg.mk)` to  ex: device/google/muskie/aosp_walleye.mk
