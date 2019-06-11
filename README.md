# GreatSPN-Overlay

This is an unofficial overlay. The packages installed here are fetched from their respective GitHub
repositories, all credits goes to the software creators.

Available packages:

* [asminer/meddly](https://github.com/asminer/meddly.git)
* [GreatSPN/SOURCES](https://github.com/greatspn/sources.git)

## How to use this overlay

Requirements:

* Gentoo Linux
* layman: [Gentoo wiki](https://wiki.gentoo.org/wiki/Layman)

### 1. Adding the overlay to layman

```
root# layman -o https://raw.githubusercontent.com/GallaFrancesco/greatspn-overlay/master/greatspn-overlay.xml -f -a greatspn-overlay
```
Follow the prompt and the overlay should be added successfully.


### 2. Updating Layman Repositories

```
root# layman-updater -R
```

### 3. Installing GreatSPN

```
root# emerge --ask greatspn
```

This will install the GreatSPN Framework by using its build system along with its runtime and build dependencies.
