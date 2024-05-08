# ContosoUniversityv3

Adaptación del tutorial https://learn.microsoft.com/es-es/aspnet/core/data/ef-mvc/?view=aspnetcore-7.0

Sistema Académico para una Universidad

## Requisitos:

- .Net Core 7

- Visual Studio 2022

- SQL Server 2019



## Creación de base de datos

1. Crear migración inicial, ejecutando el siguiente comando en CMD en Windows:
```
dotnet ef migrations add InitialMigration
```

2. Generar archivos SQL, ejecutando el siguiente comando en CMD en Windows: 
```
dotnet ef migrations script --idempotent
```

3. Crear base de datos usando SQL Server Management Studio
```
/* Create database */

CREATE DATABASE [ContosoUniversity3];

GO
```

4. Ejecutar los archivos SQL generados en el paso 1, usando SQL Server Management Studio

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

## Instalar dotnet ef
1. Ejecutar el siguiente comando en CMD en Windows:
```
dotnet tool install --global dotnet-ef
```

## Cadena de conexión de base de datos - Con Autenticacion de Windows (funciona solo en Windows)
Modificar el archivo Properties/launchSettings.json
```
"DefaultConnection": "Server=localhost;Database=ContosoUniversity3;Trusted_Connection=true;TrustServerCertificate=True;MultipleActiveResultSets=true;"
```

## Referencias

Solución a problema de certificado SSL para GitHub

https://stackoverflow.com/questions/58522318/git-error-in-azure-devops-ssl-certificate-problem-self-signed-certificate-in
