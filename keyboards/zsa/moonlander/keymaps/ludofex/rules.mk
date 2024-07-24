KEYMAP_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

KEYMAP_RUST_DIR := $(KEYMAP_DIR)rust/kbimpl/target/thumbv7em-none-eabihf/release

$(KEYMAP_RUST_DIR)/libkbimpl.d:
	@echo "Rebuilding deps"
	@CARGO_BUILD_DEP_INFO_BASEDIR=$(CURR_DIR) cargo rustc --release --target thumbv7em-none-eabihf --manifest-path $(KEYMAP_DIR)/rust/kbimpl/Cargo.toml -- --emit=dep-info

$(KEYMAP_RUST_DIR)/libkbimpl.a: | $(BEGIN)
	@echo "Building libkbimpl" $(KEYMAP_RUST_DIR)
	@CARGO_BUILD_DEP_INFO_BASEDIR=$(CURR_DIR) cargo rustc --release --target thumbv7em-none-eabihf --manifest-path $(KEYMAP_DIR)/rust/kbimpl/Cargo.toml -- --emit=obj

SRC += $(KEYMAP_RUST_DIR)/libkbimpl.a

-include $(KEYMAP_RUST_DIR)/libkbimpl.d
