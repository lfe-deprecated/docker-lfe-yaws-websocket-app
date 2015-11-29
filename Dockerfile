FROM lfex/debian

ENV APP_DIR /opt/websocket-app
ENV APP_REPO https://github.com/oubiwann/docker-lfe-yaws-websocket-app.git
ENV DEPS_DIR $APP_DIR/deps
ENV YAWS_DIR $DEPS_DIR/yaws
ENV YAWS_APP_ID websocketapp
ENV LFE_DEPS $DEPS_DIR/lutil:$DEPS_DIR/exemplar:$DEPS_DIR/lfest:$DEPS_DIR/clj:$DEPS_DIR/ltest:$DEPS_DIR/kla
ENV DEPS $YAWS_DIR:$LFE_DEPS:$DEPS_DIR/ibrowse:$DEPS_DIR/color
ENV ERL_LIBS $ERL_LIBS:$LFE_HOME:$DEPS

RUN apt-get -f install -y
RUN apt-get install -y libpam0g-dev

RUN git clone $APP_REPO $APP_DIR

#RUN echo "Bust cache ..."

RUN cd $APP_DIR && make compile-for-docker

EXPOSE 5099

CMD sh -c "/opt/websocket-app/bin/daemon;while true; do sleep 10; done"
