# ContosoUniversityv3

Adaptación del tutorial https://learn.microsoft.com/es-es/aspnet/core/data/ef-mvc/?view=aspnetcore-7.0

Sistema Académico para una Universidad

## Requisitos:

- .Net Core 8

- Visual Studio 2022

- SQL Server 2019



## Creación de base de datos

1. Crear base de datos usando SQL Server Management Studio
```
/* Create database */
CREATE DATABASE [ContosoUniversity3];
GO
```

2. Ejecutar el archivo ScriptCreacionBD.sql, usando SQL Server Management Studio.

## Actualización de base de datos
1. Generar un script SQL con los cambios posteriores a la creación inicial de la base de datos, ejecutando el siguiente comando en CMD en Windows:
```
dotnet ef migrations script --idempotent InitialMigration
```

## Borrar base de datos
1. Ejecutar el siguiente script usando SQL Server Management Studio
```
USE master ;  
GO  
DROP DATABASE [ContosoUniversity3];
GO
```

## Instalar dotnet ef (Entity Framework)
1. Ejecutar el siguiente comando en CMD en Windows:
```
dotnet tool install --global dotnet-ef
```

## Cadena de conexión de base de datos - Con Autenticacion de Windows (funciona solo en Windows)
Modificar el archivo Properties/launchSettings.json
```
"DefaultConnection": "Server=localhost;Database=ContosoUniversity3;Trusted_Connection=true;TrustServerCertificate=True;MultipleActiveResultSets=true;"
```

## Ejecutar aplicación desde línea de comandos
1. "https" es el nombre del profile que tiene la cadena de conexión DefaultConnection en el archivo Properties/launchSettings.json
```
dotnet run --launch-profile https
```

## Referencias

Solución a problema de certificado SSL para GitHub

https://stackoverflow.com/questions/58522318/git-error-in-azure-devops-ssl-certificate-problem-self-signed-certificate-in

Configurar profiles en Visual Code

https://kaylumah.nl/2022/06/07/share-debug-configuration-with-launch-profiles.html
