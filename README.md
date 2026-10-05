# Emacs Configuration

## The simplest install that could possibly work:

This is my configuration for Emacs 31.1+ running on MacOS. The easiest
way to use this is to clone the repository into your ~/.config
directory:

``` shell
cd ~/.config
git clone https://github.com/BlameTroi/config-emacs.git emacs
```

## Bugs of note:

- MacOS 27 and libgccjit have some versioning conflict. An
explicit version is added to the compile options at the head
of the init.el file.
- Blocks of code related to packages that aren't in Elpa are
commented out. Restore them once the packages are available
under site-lisp.


## License:

In case this should be copyrighted:
(c) 2026 Troy Brumley <blametroi@gmail.com>.

In case this should be licensed:
I release this to the public domain under the terms of the UNLICENSE.
