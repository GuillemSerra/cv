.PHONY: clean veryclean

CC = docker run --rm -v $(shell pwd):/data vipintm/xelatex
SRC_DIR = src
CV_DIR_ENG = src/cv_eng
CV_DIR_CAT = src/cv_cat
CV_SRCS_ENG = $(shell find $(CV_DIR_ENG) -name '*.tex')
CV_SRCS_CAT = $(shell find $(CV_DIR_CAT) -name '*.tex')
OUTPUT_DIR=.
OUTPUT_NAME=cv.pdf

cv_eng: $(SRC_DIR)/cv_eng.tex $(CV_SRCS_ENG)
	$(CC) xelatex -output-directory=$(SRC_DIR) $<
	mv -f $(SRC_DIR)/cv_eng.pdf $(OUTPUT_DIR)/$(OUTPUT_NAME)

cv_cat: $(SRC_DIR)/cv_cat.tex $(CV_SRCS_CAT)
	$(CC) -output-directory=$(SRC_DIR) $<
	mv -f $(SRC_DIR)/cv_cat.pdf $(OUTPUT_DIR)/$(OUTPUT_NAME)

clean:
	rm -rf $(SRC_DIR)/*.aux $(SRC_DIR)/*.out $(SRC_DIR)/*.log $(SRC_DIR)/*~

veryclean:
	make clean
	rm -rf $(OUTPUT_DIR)/$(OUTPUT_NAME)
