SWIFTLINT ?= swiftlint

.PHONY: swiftlint
swiftlint:
	$(SWIFTLINT) --fix && $(SWIFTLINT)

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

.Phony: verify
verify:
	./tools/ci/verify_cocoapods.sh
