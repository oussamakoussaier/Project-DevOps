FROM maven as build
WORKDIR /app
COPY  . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build /app/target/gestion-station-ski-1.0 /app/
EXPOSE 9090
CMD ["java", "-jar","gestion-station-ski-1.0.jar"]

