### Environment constants 

LIB_PATH ?=/usr/lib
INC_PATH ?=/usr/include
ARCH ?=
CROSS_COMPILE ?=
export

VERSION :=$(shell cat VERSION)
BASE :=$(basename $(notdir ${PWD}))

### general build targets

all:
	$(MAKE) all -e -C libloragw
	$(MAKE) all -e -C util_pkt_logger
	$(MAKE) all -e -C util_spi_stress
	$(MAKE) all -e -C util_tx_test
	$(MAKE) all -e -C util_tx_continuous

clean:
	$(MAKE) clean -e -C libloragw
	$(MAKE) clean -e -C util_pkt_logger
	$(MAKE) clean -e -C util_spi_stress
	$(MAKE) clean -e -C util_tx_test
	$(MAKE) clean -e -C util_tx_continuous

install:
	$(MAKE) install -e -C libloragw

release:
	echo $(BASE)-$(VERSION)
	cp -rf . /tmp/$(BASE)-$(VERSION)
	cd /tmp && tar cvJf /tmp/$(BASE)-$(VERSION).tar.xz $(BASE)-$(VERSION) \
	  --exclude=.git --exclude=*~ --exclude=*.tar.xz && \
	  rm -rf /tmp/$(BASE)-$(VERSION)
	mv /tmp/$(BASE)-$(VERSION).tar.xz ./

### EOF
