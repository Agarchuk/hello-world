FROM adoptopenjdk/openjdk11

COPY target/hello-world-1.0-SNAPSHOT.jar /app.jar

EXPOSE 3030

ENTRYPOINT ["java", "-jar","/app.jar"]
