# Build stage
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:17-jre-jammy
# Yahan par hum build stage ke /target folder se jar file ko utha rahe hain
COPY --from=build /target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
