IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [Instructor] (
        [ID] int NOT NULL IDENTITY,
        [LastName] nvarchar(50) NOT NULL,
        [FirstName] nvarchar(50) NOT NULL,
        [HireDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Instructor] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [Student] (
        [ID] int NOT NULL IDENTITY,
        [LastName] nvarchar(50) NOT NULL,
        [FirstName] nvarchar(50) NOT NULL,
        [EnrollmentDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Student] PRIMARY KEY ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [Department] (
        [DepartmentID] int NOT NULL IDENTITY,
        [Name] nvarchar(50) NOT NULL,
        [Budget] money NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [InstructorID] int NULL,
        CONSTRAINT [PK_Department] PRIMARY KEY ([DepartmentID]),
        CONSTRAINT [FK_Department_Instructor_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Instructor] ([ID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [OfficeAssignment] (
        [InstructorID] int NOT NULL,
        [Location] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_OfficeAssignment] PRIMARY KEY ([InstructorID]),
        CONSTRAINT [FK_OfficeAssignment_Instructor_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Instructor] ([ID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [Course] (
        [CourseID] int NOT NULL,
        [Title] nvarchar(50) NOT NULL,
        [Credits] int NOT NULL,
        [DepartmentID] int NOT NULL,
        CONSTRAINT [PK_Course] PRIMARY KEY ([CourseID]),
        CONSTRAINT [FK_Course_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) REFERENCES [Department] ([DepartmentID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [CourseAssignment] (
        [InstructorID] int NOT NULL,
        [CourseID] int NOT NULL,
        CONSTRAINT [PK_CourseAssignment] PRIMARY KEY ([CourseID], [InstructorID]),
        CONSTRAINT [FK_CourseAssignment_Course_CourseID] FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE CASCADE,
        CONSTRAINT [FK_CourseAssignment_Instructor_InstructorID] FOREIGN KEY ([InstructorID]) REFERENCES [Instructor] ([ID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE TABLE [Enrollment] (
        [EnrollmentID] int NOT NULL IDENTITY,
        [CourseID] int NOT NULL,
        [StudentID] int NOT NULL,
        [Grade] int NULL,
        CONSTRAINT [PK_Enrollment] PRIMARY KEY ([EnrollmentID]),
        CONSTRAINT [FK_Enrollment_Course_CourseID] FOREIGN KEY ([CourseID]) REFERENCES [Course] ([CourseID]) ON DELETE CASCADE,
        CONSTRAINT [FK_Enrollment_Student_StudentID] FOREIGN KEY ([StudentID]) REFERENCES [Student] ([ID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE INDEX [IX_Course_DepartmentID] ON [Course] ([DepartmentID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE INDEX [IX_CourseAssignment_InstructorID] ON [CourseAssignment] ([InstructorID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE INDEX [IX_Department_InstructorID] ON [Department] ([InstructorID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE INDEX [IX_Enrollment_CourseID] ON [Enrollment] ([CourseID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    CREATE INDEX [IX_Enrollment_StudentID] ON [Enrollment] ([StudentID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001311_InitialMigration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230529001311_InitialMigration', N'7.0.5');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001815_RowVersion')
BEGIN
    ALTER TABLE [Department] ADD [RowVersion] rowversion NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230529001815_RowVersion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230529001815_RowVersion', N'7.0.5');
END;
GO

COMMIT;
GO
