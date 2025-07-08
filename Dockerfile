FROM tomcat:9.0.107-jdk11-temurin-noble

ARG GSESSION_VERSION=5.7.1
ARG ENTRYKIT_VERSION=0.4.0

ADD https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz $CATALINA_HOME
ADD https://www.sjts.co.jp/download/gs/${GSESSION_VERSION}/gsession.war ${CATALINA_HOME}/webapps/
# COPY entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz $CATALINA_HOME
# COPY gsession.war ${CATALINA_HOME}/webapps/
COPY run.sh /
COPY gsdata.conf /tmp/

RUN tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && mv entrykit /bin/entrykit \
    && chmod +x /bin/entrykit \
    && entrykit --symlink \
    && chmod +x /run.sh

VOLUME ["/home/gsession"]
EXPOSE 8080
ENTRYPOINT [ \
    "codep", \
        "catalina.sh run", \
        "/run.sh" \
]
