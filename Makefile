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
	./tools/run_tests.sh
