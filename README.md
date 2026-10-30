[Contribution guidelines for this project](docs/CONTRIBUTING.md)

# Cheat Reformatter

Looking at [unibuild](https://github.com/noabody/unibuild), we see a number of *unique* cheat reformatting scripts that are designed to convert RetroArch format .cht files into that used by certain stand-alone emulators.

Using AI, we took the original BASH scripts:
[gbcro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/gbcro), [mbyro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/mbyro), [mcdro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/mcdro), [mdsro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/mdsro), [nesro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/nesro), [pr2ro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/pr2ro), [ro2ro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/ro2ro), [s9xro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/s9xro), [smsro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/smsro), [sxero](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/sxero), [vbaro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/vbaro), [yctro](https://raw.githubusercontent.com/noabody/unibuild/refs/heads/master/data/yctro), and converted them into a single Powershell, using Wine in Linux.

Unlike the simple command-line of original BASH , Powershell developed around a cheat editor style GUI.  The initial ten PS scripts were subsequently combined, and conversion functions split, into input/output modules.  The underlying conversion engine was divided into these types:

- 1to1 - Each cheat line has a code and name (duplicate names of the same code type are multi-line)
- 1few - Each cheat has a single heading name followed by many codes (multi-line)
- few1 - Each cheat line has one name with many codes (multi-line)

Cheat code formats are identified by regular expressions that tag each so that differing types don't clobber, e.g., (8 4) and (4 4) multi-line codes of the same name, are kept separate.  Each converter establishes what code types are valid.

A metric system evaluates how much of a regex matched, in order to discard bad codes.  The metric was extended as a file check, to see if the selected format matched the input file.

Once the initial Powershell was complete, it was converted to pyside6, Dotnet10 and Avalonia, along with Qt6.  It was a very interesting collaboration with AI that hasn't been stress tested, though it seems fully functional.
