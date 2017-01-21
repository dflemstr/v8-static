ARGS := $(wildcard args/*.args)

.DEFAULT: all

all: $(addprefix .target/,$(addsuffix .build,$(ARGS:args/%.args=%)))

.target/%.build: args/%.args
	TARGET=$(@:.target/%.build=%) USE_DOCKER=true ./build
	mkdir -p .target
	touch $(@)
