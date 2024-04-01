.PHONY: format
format:
	swiftformat . && swiftlint --fix && swiftlint
