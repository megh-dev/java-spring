# Build a JAR File
FROM maven:3.6.3-jdk-8-slim AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f /home/app/pom.xml clean package

# Create an Image
FROM openjdk:8-jdk-alpine
EXPOSE 5000
COPY --from=stage1 /home/app/target/spring-boot-rest-example-0.5.0.war spring-boot-rest-example-0.5.0.war
ENTRYPOINT ["sh", "-c", "java -jar /spring-boot-rest-example-0.5.0.war"]
