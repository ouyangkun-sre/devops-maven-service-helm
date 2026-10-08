FROM eclipse-temurin:8-jre

LABEL maintainer="devops" \
      app="devops-maven-service"

# 使用非 root 用户运行
RUN groupadd --system app && useradd --system --gid app app

WORKDIR /app

COPY target/*.jar app.jar
RUN chown -R app:app /app

USER app

EXPOSE 8080

ENV JAVA_OPTS="-Xms256m -Xmx512m"

ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar /app/app.jar"]
