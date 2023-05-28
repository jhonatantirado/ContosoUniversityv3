# ContosoUniversityv3

Adaptación del tutorial https://learn.microsoft.com/es-es/aspnet/core/data/ef-mvc/?view=aspnetcore-7.0

Sistema Académico para una Universidad

## Requisitos:

- .Net Core 7

- Visual Studio 2022

- SQL Server 2019



## Creación de base de datos

1. Generar archivos SQL, ejecutando el siguiente comando en CMD en Windows: 
```
dotnet ef migrations script --idempotent
```

2. Crear base de datos usando SQL Server Management Studio
```
/* Create database */

CREATE DATABASE [ContosoUniversity3];

GO
```

3. Ejecutar los archivos SQL generados en el paso 1, usando SQL Server Management Studio


## Referencias

Solución a problema de certificado SSL para GitHub

https://stackoverflow.com/questions/58522318/git-error-in-azure-devops-ssl-certificate-problem-self-signed-certificate-in
