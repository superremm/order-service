# Stage 1: Build the application
FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /build

# Copiar archivos de Maven y descargar dependencias antes de copiar el código fuente
COPY pom.xml ./
RUN mvn dependency:go-offline -B 

# Ahora copiamos el código fuente
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create a smaller runtime image
FROM eclipse-temurin:17-jre-alpine AS runtime
WORKDIR /app

COPY --from=builder /build/target/*.jar order-service.jar
EXPOSE 8080 
ENTRYPOINT ["java", "-jar", "/app/order-service.jar"]