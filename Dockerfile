# Stage 1: Build the Spring Boot application
FROM eclipse-temurin:17-jre-focal

# Set the working directory inside the container
WORKDIR /app

# Copy Maven wrapper and configuration files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies (cached for faster builds)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src src

# Build the Spring Boot application JAR
RUN ./mvnw clean package -DskipTests

# Stage 2: Create the final lightweight runtime image
FROM eclipse-temurin:17-jre-focal

# Working directory for runtime container
WORKDIR /app

# Copy the built JAR from the builder stage
# (adjust the name below if your JAR has a different version)
COPY --from=builder /app/target/*.jar app.jar

# Expose the port your app runs on (e.g., 8080 or 9090)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
