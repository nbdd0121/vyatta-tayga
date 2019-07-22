# vyatta-tayga

This is a Vyatta module for stateless NAT64 support, powered by TAYGA.

## Building
Make sure you have required cross-compilation toolchain installed. Take ER-X for example, as the
architecture is mipsel, you should install `gcc-mipsel-linux-gnu`.

If you're using devices other than mipsel ones, you need to modify the `Makefile` to update the
cross-compilation flags and `control`'s `Architecture`.

After that, run `make`, and you will get a deb file. Install the deb file on your device.

## Configuration
After installation, you will have `service/tayga` in the config tree. Set all fields, commit and
save. The prefix is fixed to 64:ff9b::/96.

