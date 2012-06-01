<a name="eselect-gcc-user"/>
## eselect-gcc-user

eselect-gcc-user is a Gentoo eselect module that allow a user to specify which
(installed) version of GCC to use without requiring super-user priviledges or
modifying global system and affecting other users.

When used, it will modify the PATH environment variable to point to the wanted
GCC version, but only for the specific user. This allow to install an up to date
version of GCC but only use it for user specific code, while keeping a stable
version for Gentoo to use on package compilation.

<a name="Usage"/>
### Usage

The usage is relatively simple, as other eselect modules.

    $ eselect gcc-user
    Usage: eselect gcc-user <action> <options>

    Standard actions:
    help                      Display help text
    usage                     Display usage information
    version                   Display version information

    Extra actions:
    list                      List available gcc versions
    set <version>             Set a GCC version
        version                   Version or number to use (from 'list' action)
    show                      Show the user's current GCC version.
    unset                     Unset user selected GCC version

To set a specific version:
    $ eselect gcc-user list
    Available gcc versions:
    [1]   4.5.3 *
    [2]   4.7.0
    $ eselect gcc-user set 4.7.0
    GCC version set to 4.7.0
    Remember to source profile files (or logout-login):
    source /etc/profile && source ~/.bashrc
    $ source /etc/profile && source ~/.bashrc
    $ eselect gcc-user list
    Available gcc versions:
    [1]   4.5.3
    [2]   4.7.0 *
    $ which gcc
    /usr/x86_64-pc-linux-gnu/gcc-bin/4.7.0/gcc
    $ gcc -v
    Using built-in specs.
    COLLECT_GCC=gcc
    COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-pc-linux-gnu/4.7.0/lto-wrapper
    Target: x86_64-pc-linux-gnu
    Configured with: /var/tmp/portage/sys-devel/gcc-4.7.0/work/gcc-4.7.0/configure --prefix=/usr --bindir=/usr/x86_64-pc-linux-gnu/gcc-bin/4.7.0 --includedir=/usr/lib/gcc/x86_64-pc-linux-gnu/4.7.0/include --datadir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.7.0 --mandir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.7.0/man --infodir=/usr/share/gcc-data/x86_64-pc-linux-gnu/4.7.0/info --with-gxx-include-dir=/usr/lib/gcc/x86_64-pc-linux-gnu/4.7.0/include/g++-v4 --host=x86_64-pc-linux-gnu --build=x86_64-pc-linux-gnu --disable-altivec --disable-fixed-point --without-ppl --without-cloog --enable-lto --enable-nls --without-included-gettext --with-system-zlib --disable-werror --enable-secureplt --enable-multilib --with-multilib-list=m32,m64 --enable-libmudflap --disable-libssp --enable-libgomp --with-python-dir=/share/gcc-data/x86_64-pc-linux-gnu/4.7.0/python --enable-checking=release --disable-libgcj --enable-languages=c,c++,fortran --enable-shared --enable-threads=posix --enable-__cxa_atexit --enable-clocale=gnu --enable-targets=all --with-bugurl=http://bugs.gentoo.org/ --with-pkgversion='Gentoo 4.7.0 p1.1, pie-0.5.3'
    Thread model: posix
    gcc version 4.7.0 (Gentoo 4.7.0 p1.1, pie-0.5.3)

<a name="Issues"/>
### Issues

- No ebuild for the moment. Just copy/simlink these files:
  - /usr/share/eselect/modules/gcc-user.eselect
  - /etc/profile.d/gcc-user.sh
- Does not work with dev-util/colorgcc: dev-util/colorgcc will always pick up
the system wide GCC.
- There is no indication if the used version is the system-wide version or a
specified one. If no version is explicitely set, the active version will be
shown (as reported by gcc-config -c).
- It's playing with PATH variable, it might hurt kittens!
