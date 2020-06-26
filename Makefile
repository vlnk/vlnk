.PHONY: build-fr
build-fr:
	lualatex cv-fr

.PHONY: watch-fr
watch-fr:
	ls contents/fr/*.tex | entr make build-fr

.PHONY: build-en
build-en:
	lualatex cv-en

.PHONY: watch-en
watch-en:
	ls contents/en/*.tex | entr make build-en

.PHONY: watch-all
watch-all: watch-fr watch-en
