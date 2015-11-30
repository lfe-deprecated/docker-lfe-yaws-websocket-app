APP_DIR ?= $(shell pwd)
DEPS_DIR ?= $(APP_DIR)/deps
LFE_HOME ?= ~/lab/lfe/lfe

include resources/make/common.mk
include resources/make/docker.mk
include resources/make/yaws.mk
include resources/make/setup.mk
