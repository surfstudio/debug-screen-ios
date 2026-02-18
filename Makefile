
init:
	bundle config set --local path '.bundle'
	bundle install

build:
	xcodebuild clean build -scheme DebugScreen -sdk iphonesimulator | bundle exec xcpretty -c

spm_build:
	swift package clean
	swift build \
		-Xswiftc "-sdk" -Xswiftc "`xcrun --sdk iphonesimulator --show-sdk-path`" \
		-Xswiftc "-target" -Xswiftc "arm64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-version`-simulator" \
		-Xcc "-isysroot" -Xcc "`xcrun --sdk iphonesimulator --show-sdk-path`" \
		-Xcc "-target" -Xcc "arm64-apple-ios`xcrun --sdk iphonesimulator --show-sdk-version`-simulator" \
		-Xswiftc "-lswiftUIKit"

test:
	xcodebuild test -scheme DebugScreen -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO -enableCodeCoverage YES -destination 'platform=iOS Simulator,name=iPhone 16,OS=latest' | bundle exec xcpretty -c

example_build:
	xcodebuild clean build -scheme DebugScreenExample -sdk iphonesimulator | bundle exec xcpretty -c

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
