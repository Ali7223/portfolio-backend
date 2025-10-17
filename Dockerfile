# Stage 1: Build the Spring Boot application
FROM eclipse-temurin:17-jdk-jammy AS builder

# Set working directory
WORKDIR /app

# Copy Maven wrapper and config files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Give execute permission to mvnw
RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src src

# Build Spring Boot application JAR (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# Stage 2: Create the final lightweight runtime image
FROM eclipse-temurin:17-jre-jammy

# Working directory for runtime container
WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port (matches your Spring Boot server.port)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

