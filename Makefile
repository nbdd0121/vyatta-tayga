.PHONY: all clean

all: package.deb

clean:
	rm -rf data.tar.gz control.tar.gz debian-binary usr tayga-0.9.2.tar.bz2 tayga-0.9.2

tayga-0.9.2.tar.bz2:
	wget http://www.litech.org/tayga/tayga-0.9.2.tar.bz2

tayga-0.9.2: tayga-0.9.2.tar.bz2
	tar xf $<
	
usr/bin/tayga: tayga-0.9.2
	mkdir -p usr/bin
	cd $<; ./configure --host=mipsel-linux-gnu --sysconfdir=/etc && make
	mipsel-linux-gnu-strip $</tayga -o $@

data.tar.gz: usr/bin/tayga opt
	tar --owner=root:0 --group root:0 -czf $@ opt usr

control.tar.gz: control
	tar --owner=root:0 --group root:0 -czf $@ control

debian-binary:
	echo 2.0 > $@

package.deb: debian-binary control.tar.gz data.tar.gz
	rm -rf package.deb
	ar -rcs $@ $^

