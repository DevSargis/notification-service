# 🛠️ Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml and src for building
COPY pom.xml .
COPY src ./src

# Package the app without running tests
RUN mvn clean package -DskipTests


# 🚀 Stage 2: Run the application using slim JDK
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port used by the Notification Service
EXPOSE 8083

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
