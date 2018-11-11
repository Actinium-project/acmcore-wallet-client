.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	acmcore-wallet-client.min.js

clean:
	rm acmcore-wallet-client.js
	rm acmcore-wallet-client.min.js

acmcore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

acmcore-wallet-client.min.js: acmcore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
