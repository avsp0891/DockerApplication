FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app

COPY pom.xml ./
COPY src ./src

RUN mvn clean package

FROM openjdk:17-jdk-alpine

ARG JAR_FILE=target/*.jar

COPY --from=build /app/target/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=studies
ENV SERVER_PORT=9090

EXPOSE ${SERVER_PORT}

ENTRYPOINT ["java", "-Dspring.profiles.active=${SPRING_PROFILES_ACTIVE}", "-Dserver.port=${SERVER_PORT}", "-jar", "/app.jar"]
