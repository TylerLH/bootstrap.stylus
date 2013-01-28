DATE=$(shell DATE)
BOOTSTRAP = ../css/bootstrap-2.2.2.css
BOOTSTRAP_MIN = ../css/bootstrap-2.2.2.min.css
BOOTSTRAP_STYL = ./bootstrap.styl
STYLUS_PROCESSOR ?= `which stylus`

bootstrap:
	@@if test ! -z ${STYLUS_PROCESSOR}; then \
		cd ./styl; \
		stylus < ${BOOTSTRAP_STYL} > ${BOOTSTRAP}; \
		stylus --compress < ${BOOTSTRAP_STYL} > ${BOOTSTRAP_MIN}; \
		echo "Bootstrap successfully built! - `date`"; \
	else \
		echo "You must have the STYLUS compiler installed in order to build Bootstrap."; \
		echo "You can install it by running: npm install stylus -g"; \
	fi

#
# RUN JSHINT & QUNIT TESTS IN PHANTOMJS
#

test:
	jshint js/*.js --config js/.jshintrc
	jshint js/tests/unit/*.js --config js/.jshintrc
	node js/tests/server.js &
	phantomjs js/tests/phantom.js "http://localhost:3000/js/tests"
	kill -9 `cat js/tests/pid.txt`
	rm js/tests/pid.txt

#
# CLEANS THE ROOT DIRECTORY OF PRIOR BUILDS
#

clean:
	rm -r bootstrap

#
# MAKE FOR GH-PAGES 4 FAT & MDO ONLY (O_O  )
#

gh-pages: bootstrap docs
	rm -f docs/assets/bootstrap.zip
	zip -r docs/assets/bootstrap.zip bootstrap
	rm -r bootstrap
	rm -f ../bootstrap-gh-pages/assets/bootstrap.zip
	node docs/build production
	cp -r docs/* ../bootstrap-gh-pages

#
# WATCH LESS FILES
#

watch:
	echo "Watching less files..."; \
	watchr -e "watch('less/.*\.less') { system 'make' }"


.PHONY: docs watch gh-pages
