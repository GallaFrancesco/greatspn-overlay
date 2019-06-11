# GreatSPN-Overlay

This is an unofficial overlay. The packages installed here are fetched from their respective GitHub
repositories, all credits go to the software creators.

Available packages:

* [asminer/meddly](https://github.com/asminer/meddly.git)
* [GreatSPN/SOURCES](https://github.com/greatspn/sources.git)

The packages have the version string `9999` appended since they are fetched from
the `master` branch of their repositories, to respect Portage's naming
conventions.

## How to use this overlay

Requirements:

* Gentoo Linux
* layman: [Gentoo wiki](https://wiki.gentoo.org/wiki/Layman)

### 1. Adding the overlay to layman

This is an unofficial overlay, therefore the overlay description (which is provided as .xml
file) must be specified while adding it. The command is the following.

```
root# layman -o https://raw.githubusercontent.com/GallaFrancesco/greatspn-overlay/master/greatspn-overlay.xml -f -a greatspn-overlay
```

Follow the prompt and the overlay should be added successfully.

### 2. Updating Layman Repositories

```
root# layman-updater -R
```

### 3. Installing GreatSPN


Add the requested keywords:
```
root# echo "=sys-libs/meddly-9999 **" >> /etc/portage/package.accept_keywords
root# echo "=sci-mathematics/greatspn-9999 **" >> /etc/portage/package.accept_keywords
```

Install:
```
root# emerge --ask greatspn
```

This will install the GreatSPN Framework by using its build system along with its runtime and build dependencies. To finish the installation and run the tool:
```
user$ export PATH=$PATH:/usr/local/GreatSPN/bin:/usr/local/GreatSPN/scripts
user$ greatspn_editor
```

Remember to add `/usr/local/GreatSPN/bin` and `/usr/local/GreatSPN/scripts` to your
`$HOME/.bashrc` to make this change persistent.

### 4. Updating GreatSPN

Sync the overlay by fetching from the git repositories:
```
root# layman -s greatspn-overlay
```

Reinstall:
```
root# emerge --ask greatspn
```

If the overlay has been updated, it will rebuild the tool and install it as in 3.
