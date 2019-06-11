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

```
root# layman -s greatspn-overlay
```

To sync the respective git repositories of Meddly and GreaSPN. Then:

```
root# emerge --ask greatspn
```
If the overlay has been updated, it will rebuild the tool and install it as in 3.
