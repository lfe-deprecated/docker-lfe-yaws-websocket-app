ETC_DIR = $(APP_DIR)/etc
YAWS_DIR = $(DEPS_DIR)/yaws
YAWS = $(YAWS_DIR)/bin/yaws
YAWS_CONF = $(ETC_DIR)/yaws.conf
YAWS_APP_ID = websocketapp

run: compile-no-deps copy-deps
	APP_DIR=$(APP_DIR) YAWS_DIR=$(YAWS_DIR) YAWS_APP_ID=$(YAWS_APP_ID) ./bin/run

dev: run

daemon: compile copy-deps
	APP_DIR=$(APP_DIR) YAWS_DIR=$(YAWS_DIR) YAWS_APP_ID=$(YAWS_APP_ID) ./bin/daemon

prod: daemon

update-conf:
	$(YAWS) -h --conf $(YAWS_CONF) --id $(YAWS_APP_ID)

stats:
	$(YAWS) -S --id $(YAWS_APP_ID)

stop:
	YAWS_DIR=$(YAWS_DIR) YAWS_APP_ID=$(YAWS_APP_ID) ./bin/stop
