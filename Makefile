CHAPTERS = $(wildcard chapters/*.md)

EPUB_FILE = build/EverNote.epub


.PHONY: all
all: $(EPUB_FILE)

.PHONY: epub
epub: $(EPUB_FILE)

$(EPUB_FILE):
	pandoc \
		-o $(EPUB_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--epub-cover-image=meta/cover.jpg \
		--data-dir=meta\
		--css=meta/epub.css \
		--epub-metadata=meta/metadata.xml \
		--table-of-contents

