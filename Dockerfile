# Based on: https://github.com/aosapps/drone-sonar-plugin/blob/master/Dockerfile
FROM openjdk:8-jre-slim

ARG SONAR_VERSION=4.2.0.1873
ARG SONAR_SCANNER_CLI=sonar-scanner-cli-${SONAR_VERSION}
ARG SONAR_SCANNER=sonar-scanner-${SONAR_VERSION}

RUN apt-get update && apt-get install -y curl unzip

WORKDIR /bin

RUN curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/${SONAR_SCANNER_CLI}.zip -so /bin/${SONAR_SCANNER_CLI}.zip
RUN unzip ${SONAR_SCANNER_CLI}.zip \
    && rm ${SONAR_SCANNER_CLI}.zip

WORKDIR /src
ENV PATH $PATH:/bin/${SONAR_SCANNER}/bin

ENTRYPOINT sonar-scanner \
  -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
  -Dsonar.sources=. \
  -Dsonar.host.url=${SONAR_HOST} \
  -Dsonar.login=${SONAR_TOKEN} \
  -Dsonar.projectVersion=${COMMIT_VERSION}