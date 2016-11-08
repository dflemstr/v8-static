TARGETS := \
	arm-unknown-linux-gnueabi \
	arm-unknown-linux-gnueabihf \
	arm-unknown-linux-musleabi \
	arm-unknown-linux-musleabihf \
	armv7-unknown-linux-gnueabihf \
	armv7-unknown-linux-musleabihf \
	i686-unknown-linux-gnu \
	i686-unknown-linux-musl \
	x86_64-unknown-linux-gnu \
	x86_64-unknown-linux-musl

.DEFAULT: all

all: $(addsuffix .target,$(TARGETS))

%.target: args/%.args
	TARGET=$(@:.target=) USE_DOCKER=true ./build
	touch $(@)
