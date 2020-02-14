# Sonar Scanners for several languages

Until now, this repo contains the following scanners:

* Javascript/Typescript

https://hub.docker.com/r/militarpancho1/sonar-scanner

## General cli USAGE (Example with drone ci)
```
kind: pipeline
name: code-analysis
steps:
- name: sonar
  image: militarpancho1/sonar-scanner
  environment:
    SONAR_HOST:
      from_secret: ___
    SONAR_TOKEN:
      from_secret: ___
    SONAR_PROJECT_KEY:
      from_secret: ___
    SONAR_TS_REPORTPATH: ./app/javascript/coverage/lcov.info
```