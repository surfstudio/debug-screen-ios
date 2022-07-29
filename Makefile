
init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed!";\
  		-sudo gem install bundler -v "1.17.3";\
	fi
	-bundle update
	-bundle install --path .bundle

build:
	xcodebuild clean build -scheme DebugScreen -sdk iphonesimulator | bundle exec xcpretty -c

spm_build:
	swift package clean
	swift build -Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`" -Xswiftc "-target" -Xswiftc "x86_64-apple-ios15.5-simulator" -Xswiftc "-lswiftUIKit"

test:
	xcodebuild test -scheme DebugScreen -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO -enableCodeCoverage YES -destination 'platform=iOS Simulator,name=iPhone 8,OS=15.5' | bundle exec xcpretty -c

example_build:
	cd Example && xcodebuild clean build -scheme Example -sdk iphonesimulator | bundle exec xcpretty -c

doc:
	bundle exec jazzy --clean --build-tool-arguments -scheme,DebugScreen,-sdk,iphonesimulator --output "docs"

# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)


TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
