.PHONY: test

SRC = $(shell find src -name "*.ls" -type f | sort)
LIB = $(patsubst src/%.ls, lib/%.js, $(SRC))

MOCHA = ./node_modules/.bin/mocha
LSC = node_modules/.bin/lsc
NAME = $(shell node -e "console.log(require('./package.json').name)")

default: all

lib:
	mkdir -p lib/

lib/%.js: src/%.ls lib
	$(LSC) --compile --map=linked --output "$(@D)" "$<"

all: compile

compile: $(LIB) package.json

install: clean all
	npm install -g .

reinstall:
	$(MAKE) uninstall
	$(MAKE) install

uninstall:
	npm uninstall -g ${NAME}

dev-install: package.json
	npm install .

clean:
	rm -rf lib

publish: all test
	git push --tags origin HEAD:master
	npm publish

test: compile
	@$(MOCHA) \
		--timeout 20000 \
		--compilers ls:LiveScript \
		--require ./test/_globals.ls \
		--recursive \
		--harmony-generators \
		--reporter dot

prepublish:
	sed -i "" "/source-map-support/d" lib/index.js
