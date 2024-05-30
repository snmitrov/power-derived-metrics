MD_SRC=RFC/draft-opsawg-deum.md
#YANG_SRC=$(wildcard YANGModules/ietf-sust*.yang)
XML_FILES=$(MD_SRC:%.md=%.xml)
TXT_FILES=$(MD_SRC:%.md=%.txt)

PYANG = pyang

.PHONY: all clean lint

all: $(XML_FILES) $(TXT_FILES)

lint:
	$(PYANG) --lint --ietf -p YANGModules/ $(YANG_SRC)

clean:
	-rm $(XML_FILES) $(TXT_FILES)

RFC/%.xml RFC/%.txt: RFC/%.md
	kdrfc -3 $<
