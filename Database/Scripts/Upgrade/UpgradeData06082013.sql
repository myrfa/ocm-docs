/**************************************************************************
-- -Generated by xSQL Data Compare
-- -Date/Time: 2013-08-06 13:38:27
-- -Summary: Synchronization script that makes the content of the database [(local)\sqlexpress].[OCM_Staging] 
    the same as the content of the database [(local)\sqlexpress].[OCM_Live].
    
    **** BACKUP the database [(local)\sqlexpress].[OCM_Staging] before running this script. ****

-- -Action:  Execute this script on [(local)\sqlexpress].[OCM_Staging]
-- -SQL Server version: 11.0.3128.0
**************************************************************************/


SET XACT_ABORT ON;
SET ARITHABORT ON;
SET NUMERIC_ROUNDABORT OFF;


BEGIN TRANSACTION;
ALTER TABLE [dbo].[MetadataField] DROP CONSTRAINT [FK_MetadataField_DataType];
GO

ALTER TABLE [dbo].[MetadataField] DROP CONSTRAINT [FK_MetadataField_MetadataGroup];
GO

ALTER TABLE [dbo].[MetadataFieldOption] DROP CONSTRAINT [FK_MetadataFieldOption_MetadataField];
GO

ALTER TABLE [dbo].[MetadataGroup] DROP CONSTRAINT [FK_MetadataGroup_DataProvider];
GO

ALTER TABLE [dbo].[MetadataValue] DROP CONSTRAINT [FK_MetadataValue_ChargePoint];
GO

ALTER TABLE [dbo].[MetadataValue] DROP CONSTRAINT [FK_MetadataValue_MetadataField];
GO

ALTER TABLE [dbo].[MetadataValue] DROP CONSTRAINT [FK_MetadataValue_MetadataFieldOption];
GO




/*-- -Insert(s): [dbo].[DataType] */
INSERT INTO [dbo].[DataType] ([ID],[Title]) VALUES(5,N'Boolean');
INSERT INTO [dbo].[DataType] ([ID],[Title]) VALUES(10,N'Option List');

/*-- -Insert(s): [dbo].[MetadataField] */
SET IDENTITY_INSERT [dbo].[MetadataField] ON;
INSERT INTO [dbo].[MetadataField] ([ID],[MetadataGroupID],[Title],[DataTypeID]) VALUES(1,1,N'POI Type',10);
INSERT INTO [dbo].[MetadataField] ([ID],[MetadataGroupID],[Title],[DataTypeID]) VALUES(2,1,N'Access Hours',1);
INSERT INTO [dbo].[MetadataField] ([ID],[MetadataGroupID],[Title],[DataTypeID]) VALUES(3,2,N'Group of Companies',10);
SET IDENTITY_INSERT [dbo].[MetadataField] OFF;

/*-- -Insert(s): [dbo].[MetadataFieldOption] */
SET IDENTITY_INSERT [dbo].[MetadataFieldOption] ON;
INSERT INTO [dbo].[MetadataFieldOption] ([ID],[MetadataFieldID],[Title]) VALUES(1,1,N'Shopping');
INSERT INTO [dbo].[MetadataFieldOption] ([ID],[MetadataFieldID],[Title]) VALUES(2,1,N'Hotel');
INSERT INTO [dbo].[MetadataFieldOption] ([ID],[MetadataFieldID],[Title]) VALUES(3,1,N'Restaurant');
SET IDENTITY_INSERT [dbo].[MetadataFieldOption] OFF;

/*-- -Insert(s): [dbo].[MetadataGroup] */
SET IDENTITY_INSERT [dbo].[MetadataGroup] ON;
INSERT INTO [dbo].[MetadataGroup] ([ID],[Title],[DataProviderID],[IsRestrictedEdit],[IsPublicInterest]) VALUES(1,N'Extended Information',1,0,1);
INSERT INTO [dbo].[MetadataGroup] ([ID],[Title],[DataProviderID],[IsRestrictedEdit],[IsPublicInterest]) VALUES(2,N'Supporting Data',1,0,0);
SET IDENTITY_INSERT [dbo].[MetadataGroup] OFF;

/*-- -Insert(s): [dbo].[MetadataValue] */
SET IDENTITY_INSERT [dbo].[MetadataValue] ON;
INSERT INTO [dbo].[MetadataValue] ([ID],[ChargePointID],[MetadataFieldID],[MetadataFieldOptionID],[ItemValue]) VALUES(3,4121,1,1,null);
INSERT INTO [dbo].[MetadataValue] ([ID],[ChargePointID],[MetadataFieldID],[MetadataFieldOptionID],[ItemValue]) VALUES(5,4121,1,2,null);
INSERT INTO [dbo].[MetadataValue] ([ID],[ChargePointID],[MetadataFieldID],[MetadataFieldOptionID],[ItemValue]) VALUES(6,4121,1,3,null);
SET IDENTITY_INSERT [dbo].[MetadataValue] OFF;


ALTER TABLE [dbo].[MetadataField] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataField_DataType] FOREIGN KEY 
	(
		[DataTypeID]
	)REFERENCES [dbo].[DataType]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataField] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataField_MetadataGroup] FOREIGN KEY 
	(
		[MetadataGroupID]
	)REFERENCES [dbo].[MetadataGroup]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataFieldOption] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataFieldOption_MetadataField] FOREIGN KEY 
	(
		[MetadataFieldID]
	)REFERENCES [dbo].[MetadataField]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataGroup] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataGroup_DataProvider] FOREIGN KEY 
	(
		[DataProviderID]
	)REFERENCES [dbo].[DataProvider]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataValue] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataValue_ChargePoint] FOREIGN KEY 
	(
		[ChargePointID]
	)REFERENCES [dbo].[ChargePoint]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataValue] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataValue_MetadataField] FOREIGN KEY 
	(
		[MetadataFieldID]
	)REFERENCES [dbo].[MetadataField]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO

ALTER TABLE [dbo].[MetadataValue] WITH CHECK ADD 
	CONSTRAINT [FK_MetadataValue_MetadataFieldOption] FOREIGN KEY 
	(
		[MetadataFieldOptionID]
	)REFERENCES [dbo].[MetadataFieldOption]
	(
		[ID]
	)
ON UPDATE NO ACTION ON DELETE NO ACTION;
GO


COMMIT TRANSACTION;

