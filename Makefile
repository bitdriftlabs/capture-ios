.PHONY: swiftlint
swiftlint:
	swiftlint --fix && swiftlint

.PHONY: swiftlint
drstring:
	drstring format

.PHONY: swiftformat
swiftformat: 
	swiftformat .

.PHONY: format
format: swiftformat swiftlint drstring

.Phony: test
test:
	xcodebuild \
	-scheme Capture-Package \
	-sdk iphonesimulator17.2 \
	-destination 'platform=iOS Simulator,OS=latest,name=iPhone 15' \
	test
