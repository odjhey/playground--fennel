
FENNEL = ./.bin/fennel-1.2.1-x86_64

SRC_DIR = .src
BUILD_DIR = .build

SRCS = $(shell find $(SRC_DIR) -name "*.fnl")
OBJS = $(patsubst $(SRC_DIR)/%.fnl, $(BUILD_DIR)/%.lua, $(SRCS))

.PHONY: all
all: $(OBJS)
	rsync -a $(BUILD_DIR)/* .

$(BUILD_DIR)/%.lua: $(SRC_DIR)/%.fnl
	mkdir -p $(dir $@)
	$(FENNEL) --compile $< > $@

%.lua: $(SRC_DIR)/%.fnl
	$(FENNEL) --compile $< > $@
