USER_LIBS=/root/.lfe/libs

get-deps-prep:
	mkdir -p $(DEPS_DIR)
	ln -s $(LFE_HOME) $(DEPS_DIR)/lfe

# Get all the dependencies with the appropriate versions; due to a
# bug in rebar (see https://github.com/rebar/rebar/issues/170), it's
# less of a hassle to explicitly download the dpendencies like this

deps-lib:
	cd $(DEPS_DIR) && git clone $(DEPS_REPO) $(DEPS_LIB)
	cd $(DEPS_DIR)/$(DEPS_LIB) && git checkout tags/$(DEPS_TAG)

deps-yaws:
	DEPS_LIB=yaws \
	DEPS_REPO=https://github.com/klacke/yaws.git \
	DEPS_TAG=yaws-2.0.2 \
	make deps-lib

deps-ibrowse:
	DEPS_LIB=ibrowse \
	DEPS_REPO=https://github.com/cmullaparthi/ibrowse.git \
	DEPS_TAG=v4.2.2 \
	make deps-lib

deps-color:
	DEPS_LIB=color \
	DEPS_REPO=https://github.com/julianduque/erlang-color.git \
	DEPS_TAG=v0.2.0 \
	make deps-lib

deps-lager:
	DEPS_LIB=lager \
	DEPS_REPO=https://github.com/basho/lager.git \
	DEPS_TAG=3.0.2 \
	make deps-lib

deps-goldrush:
	DEPS_LIB=goldrush \
	DEPS_REPO=https://github.com/DeadZen/goldrush.git \
	DEPS_TAG=0.1.8 \
	make deps-lib

# deps-XXX:
# 	DEPS_LIB=XXX \
# 	DEPS_REPO=YYY \
# 	DEPS_TAG=ZZZ \
# 	make deps-lib

# deps-XXX:
# 	DEPS_LIB=XXX \
# 	DEPS_REPO=YYY \
# 	DEPS_TAG=ZZZ \
# 	make deps-lib

# deps-XXX:
# 	DEPS_LIB=XXX \
# 	DEPS_REPO=YYY \
# 	DEPS_TAG=ZZZ \
# 	make deps-lib

get-deps-for-docker: get-deps-prep deps-yaws deps-ibrowse deps-lager \
	goldrush

compile-for-docker: get-deps-for-docker
	rebar compile
	cp $(USER_LIBS)/*/ebin/* $(APP_DIR)/ebin/
	cp $(DEPS_DIR)/*/ebin/* $(APP_DIR)/ebin/
	cp $(LFE_HOME)/ebin/* $(APP_DIR)/ebin/

