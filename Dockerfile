# Use a slim JDK base image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Maven build artifact (JAR file) into the image
COPY target/notification-service-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on
EXPOSE 8083

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
