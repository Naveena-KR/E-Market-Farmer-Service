#
# Build stage
#
FROM maven:3.8.2-jdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/E-Market-Webservice-Docker-Render-0.0.1-SNAPSHOT.jar emarket.jar
# ENV PORT=8080
EXPOSE 8081
ENTRYPOINT ["java","-jar","emarket.jar"]
