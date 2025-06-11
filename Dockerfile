
FROM ubuntu:16.04 
RUN apt-get update && apt-get install -y some_package
EXPOSE 8080

ENV JAVA_PROFILE prod

ARG DEPENDENCY=target/dependency

COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-Dspring.profiles.active=${JAVA_PROFILE}", \
"-cp", "app:app/lib/*", "camt.se234.lab10.Lab10Application"]
    
