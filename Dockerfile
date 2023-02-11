# Use a imagem base Java
FROM openjdk:8-jdk-alpine

# Define uma variável de ambiente para o diretório de trabalho do aplicativo
ENV APP_HOME /app

# Crie o diretório de trabalho
RUN mkdir $APP_HOME

# Defina o diretório de trabalho
WORKDIR $APP_HOME

# Copie o arquivo pom.xml para o diretório de trabalho
COPY pom.xml .

# Execute o comando mvn para baixar as dependências do projeto
RUN ./mvn dependency:go-offline

# Copie o resto dos arquivos do aplicativo para o diretório de trabalho
COPY . .

# Execute o comando mvn para construir o aplicativo
RUN ./mvn package

# Defina o comando para executar o aplicativo
CMD ["java", "-jar", "target/app.jar"]