USER_LIBS=/root/.lfe/libs

get-deps-prep:
	mkdir -p $(DEPS_DIR)

# Get all the dependencies with the appropriate versions; due to a
# bug in rebar (see https://github.com/rebar/rebar/issues/170), it's
# less of a hassle to explicitly download the dpendencies like this

deps-lib:
	cd $(DEPS_DIR) && git clone $(DEPS_REPO) $(DEPS_LIB)
	cd $(DEPS_DIR)/$(DEPS_LIB) && \
	git checkout tags/$(DEPS_TAG) 2> /dev/null

# deps-yaws:
# 	DEPS_LIB=yaws \
# 	DEPS_REPO=https://github.com/klacke/yaws.git \
# 	DEPS_TAG=yaws-2.0.2 \
# 	make deps-lib

# deps-ibrowse:
# 	DEPS_LIB=ibrowse \
# 	DEPS_REPO=https://github.com/cmullaparthi/ibrowse.git \
# 	DEPS_TAG=v4.2.2 \
# 	make deps-lib

# deps-color:
# 	DEPS_LIB=color \
# 	DEPS_REPO=https://github.com/julianduque/erlang-color.git \
# 	DEPS_TAG=v0.2.0 \
# 	make deps-lib

# deps-lager:
# 	DEPS_LIB=lager \
# 	DEPS_REPO=https://github.com/basho/lager.git \
# 	DEPS_TAG=3.0.2 \
# 	make deps-lib

# deps-goldrush:
# 	DEPS_LIB=goldrush \
# 	DEPS_REPO=https://github.com/DeadZen/goldrush.git \
# 	DEPS_TAG=0.1.8 \
# 	make deps-lib

deps-lfe:
	ln -s $(LFE_HOME) $(DEPS_DIR)/

deps-lutil:
	DEPS_LIB=lutil \
	DEPS_REPO=https://github.com/lfex/lutil.git \
	DEPS_TAG=0.6.7 \
	make deps-lib

deps-ltest:
	DEPS_LIB=ltest \
	DEPS_REPO=https://github.com/lfex/ltest.git \
	DEPS_TAG=0.6.4 \
	make deps-lib

deps-lcfg:
	DEPS_LIB=lcfg \
	DEPS_REPO=https://github.com/lfex/lcfg.git \
	DEPS_TAG=0.1.1 \
	make deps-lib

deps-exemplar:
	DEPS_LIB=exemplar \
	DEPS_REPO=https://github.com/lfex/exemplar.git \
	DEPS_TAG=0.2.0 \
	make deps-lib

deps-lfest:
	DEPS_LIB=lfest \
	DEPS_REPO=https://github.com/lfex/lfest.git \
	DEPS_TAG=0.2.1 \
	make deps-lib

deps-kla:
	DEPS_LIB=kla \
	DEPS_REPO=https://github.com/lfex/kla.git \
	DEPS_TAG=0.4.3 \
	make deps-lib

deps-clj:
	DEPS_LIB=clj \
	DEPS_REPO=https://github.com/lfex/clj.git \
	DEPS_TAG=0.2.1 \
	make deps-lib

deps-logjam:
	DEPS_LIB=logjam \
	DEPS_REPO=https://github.com/lfex/logjam.git \
	DEPS_TAG=0.1.0 \
	make deps-lib

# get-deps-for-docker: get-deps-prep deps-yaws deps-ibrowse deps-lager \
# 	deps-goldrush \

get-deps-for-docker: get-deps-prep \
	deps-lfe deps-lutil deps-lcfg deps-ltest deps-exemplar \
	deps-lfest deps-kla deps-clj deps-logjam

compile-for-docker: get-deps-for-docker
	#rebar get-deps
	#rebar compile
	#cp -v $(DEPS_DIR)/*/ebin/* $(APP_DIR)/ebin/
