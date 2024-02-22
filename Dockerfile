FROM openjdk:11-jdk-slim-stretch
ADD target/campingOnTop-0.0.1-SNAPSHOT.jar /campingOnTop-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "/campingOnTop-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080