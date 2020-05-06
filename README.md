# GreatSPN-Overlay

This is an unofficial overlay. The packages installed here are fetched from their respective GitHub
repositories, all credits go to the software creators.

Available packages:

* [Spot 2](https://spot.lrde.epita.fr/)
* [asminer/meddly](https://github.com/asminer/meddly.git)
* [GreatSPN/SOURCES](https://github.com/greatspn/sources.git)

All three packages are free and open source software. At the moment,
only Spot versions 2.8.7+ (upwards) are provided, while the other two packages are
directly fetched from the `master` branch of their git repository and
have the version string `9999`, to respect Portage's naming
conventions.

## How to use this overlay

Requirements:

* **Portage** package manager: [Gentoo wiki](https://wiki.gentoo.org/wiki/Portage)
* **Layman**: [Gentoo wiki](https://wiki.gentoo.org/wiki/Layman)

### 1. Adding the overlay to layman

This is an unofficial overlay, therefore the overlay description
(which is provided as .xml file) must be specified while adding
it. The command is the following.

```
root# layman -o https://raw.githubusercontent.com/GallaFrancesco/greatspn-overlay/master/greatspn-overlay.xml -f -a greatspn-overlay
```

Follow the prompt and the overlay should be added successfully.

### 2. Updating Layman Repositories

```
root# layman-updater -R
```
Alternatively, to only sync this overlay:

```
root# layman -s greatspn-overlay
```

## Installing GreatSPN

The main purpose of this overlay is to provide an automated build
environment for GreatSPN by exploiting Portage's dependency tracking.

### Configuring Portage

Add the requested keywords:
```
root# echo "=sys-libs/meddly-9999 **" >> /etc/portage/package.accept_keywords
root# echo "=sci-mathematics/greatspn-9999 **" >> /etc/portage/package.accept_keywords
```

### Start the installation procedure

```
root# emerge --ask greatspn
```

This will install the GreatSPN Framework by using its build system
along with its runtime and build dependencies. To finish the
installation and run the graphical tool:

```
user$ export PATH=$PATH:/usr/local/GreatSPN/bin:/usr/local/GreatSPN/scripts
user$ greatspn_editor
```

Remember to add `/usr/local/GreatSPN/bin` and `/usr/local/GreatSPN/scripts` to your `$PATH` in your
`$HOME/.bashrc` to make this change persistent.

### Updating GreatSPN

Sync the overlay: 
```
root# layman -s greatspn-overlay
```

Reinstall (this command will rebuild the tool and install it as in 3)
```
root# emerge --ask greatspn
```
