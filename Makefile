# Project configuration
NAME = c_tmpl
VERSION = 0.1.0

# Compiler & flags
CC = clang
CFLAGS = -Iinclude -Wall -Wextra
LDFLAGS =

# Directories
SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin

# Source & object files
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS_DBG = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/debug/%.o,$(SRCS))
OBJS_REL = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/release/%.o,$(SRCS))
TARGET = $(NAME)

.PHONY: all debug release clean
all: debug release

debug: $(BIN_DIR)/debug/$(TARGET)

release: $(BIN_DIR)/release/$(TARGET)

$(BIN_DIR)/debug/$(TARGET): $(OBJS_DBG)
	@mkdir -p $(dir $@)
	$(CC) $(OBJS_DBG) -o $@ $(LDFLAGS)

$(BIN_DIR)/release/$(TARGET): $(OBJS_REL)
	@mkdir -p $(dir $@)
	$(CC) $(OBJS_REL) -o $@ $(LDFLAGS)

$(OBJ_DIR)/debug/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -g -O0 -DNDEBUG -c $< -o $@

$(OBJ_DIR)/release/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -O3 -DDEBUG -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
