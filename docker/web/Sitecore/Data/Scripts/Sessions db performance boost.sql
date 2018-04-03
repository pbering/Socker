

USE [Sitecore_Sessions];
GO

BEGIN TRANSACTION;
GO

IF( OBJECT_ID( N'dbo.sessions', N'SN' ) IS NOT NULL )
BEGIN
  DROP SYNONYM [dbo].[Sessions];
END;
GO

CREATE SYNONYM [dbo].[Sessions] FOR [tempdb].[dbo].[SessionState];
GO

IF( EXISTS( SELECT 1 FROM [information_schema].[tables] WHERE ([table_schema] = 'dbo') AND ([table_type] = 'BASE TABLE') AND ([table_name] = 'SessionState') ) )
BEGIN
  DROP TABLE [dbo].[SessionState];
END;

IF( OBJECT_ID( N'dbo.applications', N'SN' ) IS NOT NULL )
BEGIN
  DROP SYNONYM [dbo].[Applications];
END;
GO

CREATE SYNONYM [dbo].[Applications] FOR [tempdb].[dbo].[Application];
GO

IF( EXISTS( SELECT 1 FROM [information_schema].[tables] WHERE ([table_schema] = 'dbo') AND ([table_type] = 'BASE TABLE') AND ([table_name] = 'Application') ) )
BEGIN
  DROP TABLE [dbo].[Application];
END;

COMMIT TRANSACTION;
GO



USE [master];

BEGIN TRANSACTION;
GO

IF( OBJECT_ID( N'dbo.Sitecore_InitializeSessionState', N'P') IS NOT NULL )
BEGIN
  DROP PROCEDURE [dbo].[Sitecore_InitializeSessionState];
END;
GO

CREATE PROCEDURE [dbo].[Sitecore_InitializeSessionState] AS
BEGIN
  EXECUTE [Sitecore_Sessions].[dbo].[CreateTables];
END;
GO

EXECUTE [dbo].[Sitecore_InitializeSessionState];
GO

COMMIT TRANSACTION;
GO

EXECUTE [sp_procoption] @ProcName = 'dbo.Sitecore_InitializeSessionState', @OptionName = 'startup', @OptionValue = 'true';
GO
