SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Correct]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Correct](
	[CorrectID] [int] IDENTITY(1,1) NOT NULL,
	[CorrectUrl] [nvarchar](255) NOT NULL,
	[CorrectTitle] [nvarchar](255) NOT NULL,
	[CorrectType] [int] NOT NULL CONSTRAINT [DF_ZL_Correct_CorrectType]  DEFAULT ((0)),
	[CorrectDetail] [nvarchar](255) NULL,
	[CorrectPer] [nvarchar](50) NULL,
	[PerEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_ZL_Correct] PRIMARY KEY CLUSTERED 
(
	[CorrectID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_DownServer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_DownServer](
	[ServerID] [int] NOT NULL,
	[ServerName] [nvarchar](50) NULL,
	[ServerUrl] [nvarchar](50) NULL,
	[ServerLogo] [nvarchar](255) NULL,
	[OrderID] [int] NULL,
	[ShowType] [int] NULL,
 CONSTRAINT [PK_ZL_DownServer] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Favorite]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Favorite](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[FavoriteDate] [datetime] NOT NULL CONSTRAINT [DF_ZL_Favorite_FavoriteDate]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[RegSelect] [bit] NULL CONSTRAINT [DF_ZL_UserGroup_RegSelect]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_GroupModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_GroupModel](
	[GroupID] [int] NOT NULL,
	[UserModel] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_JSTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_JSTemplate](
	[JSTemplateID] [int] NOT NULL,
	[JSTemplateName] [varchar](50) NOT NULL,
	[JSTemplatePath] [varchar](100) NOT NULL,
	[JSTemplateSize] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Keywords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Keywords](
	[KeywordID] [int] IDENTITY(1,1) NOT NULL,
	[KeywordText] [nvarchar](200) NOT NULL,
	[KeywordType] [int] NOT NULL,
	[Priority] [int] NOT NULL CONSTRAINT [DF_ZL_Keywords_Priority]  DEFAULT ((0)),
	[Hits] [int] NOT NULL CONSTRAINT [DF_ZL_Keywords_Hits]  DEFAULT ((0)),
	[LastUseTime] [datetime] NOT NULL CONSTRAINT [DF_ZL_Keywords_LastUseTime]  DEFAULT (getdate()),
	[ArrGeneralID] [ntext] NULL,
	[QuoteTimes] [int] NULL,
 CONSTRAINT [PK_ZL_Keywords] PRIMARY KEY CLUSTERED 
(
	[KeywordID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Label]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Label](
	[LabelID] [int] IDENTITY(1,1) NOT NULL,
	[LabelName] [nvarchar](50) NOT NULL,
	[LabelType] [int] NOT NULL CONSTRAINT [DF_ZL_Label_LabelType]  DEFAULT ((1)),
	[LabelCate] [nvarchar](50) NULL,
	[LabelDesc] [nvarchar](255) NULL,
	[LabelParam] [ntext] NULL,
	[LabelTable] [ntext] NULL,
	[LabelField] [ntext] NULL,
	[LabelWhere] [ntext] NULL,
	[LabelOrder] [ntext] NULL,
	[LabelContent] [ntext] NULL,
	[LabelCount] [nvarchar](50) NULL CONSTRAINT [DF_ZL_Label_LabelCount]  DEFAULT ((0)),
	[LabelIdentity] [nvarchar](255) NULL CONSTRAINT [DF_ZL_Label_LabelIdentity]  DEFAULT (''),
 CONSTRAINT [PK_ZL_Label] PRIMARY KEY CLUSTERED 
(
	[LabelID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [int] NULL,
	[Priority] [int] NULL CONSTRAINT [DF_ZL_Log_Priority]  DEFAULT ((0)),
	[Title] [nvarchar](255) NULL,
	[Message] [ntext] NULL,
	[Timestamp] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserIP] [nvarchar](20) NULL,
	[Source] [ntext] NULL,
	[ScriptName] [nvarchar](255) NULL,
	[PostString] [ntext] NULL,
 CONSTRAINT [PK_ZL_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Manager]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Manager](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminPassword] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[EnableMultiLogin] [bit] NOT NULL CONSTRAINT [DF_ZL_Manager_EnableMultiLogin]  DEFAULT ((1)),
	[LoginTimes] [int] NULL CONSTRAINT [DF_ZL_Manager_LoginTimes]  DEFAULT ((0)),
	[LastLoginIP] [nvarchar](50) NULL CONSTRAINT [DF_ZL_Manager_LastLoginIP]  DEFAULT (''),
	[LastLoginTime] [datetime] NULL CONSTRAINT [DF_ZL_Manager_LastLoginTime]  DEFAULT (getdate()),
	[LastLogoutTime] [datetime] NULL CONSTRAINT [DF_ZL_Manager_LastLogoutTime]  DEFAULT (getdate()),
	[LastModifyPwdTime] [datetime] NULL CONSTRAINT [DF_ZL_Manager_LastModifyPwdTime]  DEFAULT (getdate()),
	[IsLock] [bit] NULL CONSTRAINT [DF_ZL_Manager_IsLock]  DEFAULT ((0)),
	[EnableModifyPassword] [bit] NULL CONSTRAINT [DF_ZL_Manager_EnableModifyPassword]  DEFAULT ((1)),
	[AdminRole] [ntext] NULL CONSTRAINT [DF_ZL_Manager_AdminRole]  DEFAULT (''),
	[Theme] [nvarchar](50) NULL CONSTRAINT [DF_ZL_Manager_Theme]  DEFAULT (''),
	[RandNumber] [nvarchar](50) NULL CONSTRAINT [DF_ZL_Manager_RandNumber]  DEFAULT (''),
 CONSTRAINT [PK_ZL_Manager] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Message]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Message](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [ntext] NOT NULL,
	[Sender] [nvarchar](50) NOT NULL,
	[Incept] [nvarchar](50) NOT NULL,
	[status] [bit] NULL CONSTRAINT [DF_ZL_Message_status]  DEFAULT ((0)),
	[PostDate] [datetime] NULL CONSTRAINT [DF_ZL_Message_PostDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ZL_Message] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Model]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemUnit] [nvarchar](20) NULL,
	[ItemIcon] [nvarchar](255) NULL,
	[ContentTemplate] [nvarchar](255) NULL,
	[ModelType] [int] NULL CONSTRAINT [DF_ZL_Model_ModelType]  DEFAULT ((1)),
 CONSTRAINT [PK_ZL_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_ModelField]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_ModelField](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[FieldAlias] [nvarchar](50) NOT NULL,
	[FieldTips] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[IsNotNull] [bit] NULL CONSTRAINT [DF_ZL_ModelField_IsNotNull]  DEFAULT ((0)),
	[IsSearchForm] [bit] NULL CONSTRAINT [DF_ZL_ModelField_IsSearchForm]  DEFAULT ((0)),
	[FieldType] [nvarchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[OrderId] [int] NULL CONSTRAINT [DF_ZL_ModelField_OrderId]  DEFAULT ((1)),
 CONSTRAINT [PK_ZL_ModelField] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Node]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Node](
	[NodeID] [int] IDENTITY(1,1) NOT NULL,
	[NodeName] [nvarchar](50) NOT NULL,
	[NodeType] [int] NOT NULL CONSTRAINT [DF_ZL_Node_NodeType]  DEFAULT ((0)),
	[NodeDir] [nvarchar](50) NOT NULL,
	[NodeUrl] [nvarchar](255) NULL,
	[Tips] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[OrderID] [int] NULL CONSTRAINT [DF_ZL_Node_OrderID]  DEFAULT ((0)),
	[Child] [int] NULL,
	[Depth] [int] NULL CONSTRAINT [DF_ZL_Node_Depth]  DEFAULT ((1)),
	[NodePicUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Meta_Keywords] [nvarchar](255) NULL,
	[Meta_Description] [nvarchar](255) NULL,
	[OpenType] [bit] NULL CONSTRAINT [DF_ZL_Node_OpenType]  DEFAULT ((0)),
	[PurviewType] [bit] NULL CONSTRAINT [DF_ZL_Node_PurviewType]  DEFAULT ((0)),
	[CommentType] [bit] NULL CONSTRAINT [DF_ZL_Node_CommentType]  DEFAULT ((0)),
	[HitsOfHot] [int] NULL CONSTRAINT [DF_ZL_Node_HitsOfHot]  DEFAULT ((0)),
	[ListTemplateFile] [nvarchar](255) NULL,
	[IndexTemplate] [nvarchar](255) NULL,
	[ContentModel] [nvarchar](255) NULL,
	[ItemOpenType] [bit] NULL CONSTRAINT [DF_ZL_Node_ItemOpenType]  DEFAULT ((0)),
	[ContentHtmlRule] [int] NULL CONSTRAINT [DF_ZL_Node_ContentHtmlRule]  DEFAULT ((0)),
	[ListPageHtmlEx] [int] NULL CONSTRAINT [DF_ZL_Node_ListPageHtmlRule]  DEFAULT ((0)),
	[ContentFileEx] [int] NULL CONSTRAINT [DF_ZL_Node_ItemAspxFileName]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Node_ModelTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Node_ModelTemplate](
	[NodeID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[Template] [nvarchar](255) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_P_Resume]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_P_Resume](
	[PersonName] [nvarchar](255) NULL CONSTRAINT [DF__ZL_P_Resu__Perso__2022C2A6]  DEFAULT (''),
	[Birthday] [datetime] NULL CONSTRAINT [DF__ZL_P_Resu__Birth__2116E6DF]  DEFAULT (getdate()),
	[UserID] [char](10) NOT NULL,
 CONSTRAINT [PK_ZL_P_Resume] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_P_corporation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_P_corporation](
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Project]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Project](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](255) NOT NULL,
	[ProjectIntro] [ntext] NOT NULL,
	[UserID] [int] NOT NULL,
	[RequireID] [int] NOT NULL CONSTRAINT [DF_ZL_Project_RequireID]  DEFAULT ((0)),
	[StartDate] [datetime] NOT NULL CONSTRAINT [DF_ZL_Project_StartDate]  DEFAULT (getdate()),
	[EndDate] [datetime] NULL,
	[Status] [int] NULL CONSTRAINT [DF_ZL_Project_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_ProjectDiscuss]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_ProjectDiscuss](
	[DiscussID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NOT NULL,
	[WorkID] [int] NOT NULL CONSTRAINT [DF_ZL_ProjectDiscuss_WorkID]  DEFAULT ((0)),
	[UserID] [int] NOT NULL CONSTRAINT [DF_ZL_ProjectDiscuss_UserID]  DEFAULT ((0)),
	[Content] [ntext] NOT NULL,
	[DiscussDate] [datetime] NOT NULL CONSTRAINT [DF_ZL_ProjectDiscuss_DiscussDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ZL_ProjectDiscuss] PRIMARY KEY CLUSTERED 
(
	[DiscussID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_ProjectWork]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_ProjectWork](
	[WorkID] [int] IDENTITY(1,1) NOT NULL,
	[WorkName] [nvarchar](255) NOT NULL,
	[WorkIntro] [ntext] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[Approving] [int] NULL CONSTRAINT [DF_ZL_ProjectWork_Approving]  DEFAULT ((0)),
	[Status] [int] NULL CONSTRAINT [DF_ZL_ProjectWork_Status]  DEFAULT ((0)),
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZL_ProjectWork] PRIMARY KEY CLUSTERED 
(
	[WorkID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_RolePermissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_RolePermissions](
	[RoleID] [int] NOT NULL,
	[OperateCode] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Source]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Source](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL CONSTRAINT [DF_ZL_Source_Type]  DEFAULT ((0)),
	[Name] [nvarchar](50) NOT NULL,
	[Passed] [bit] NULL CONSTRAINT [DF_ZL_Source_Passed]  DEFAULT ((0)),
	[onTop] [bit] NULL CONSTRAINT [DF_ZL_Source_onTop]  DEFAULT ((0)),
	[IsElite] [bit] NULL CONSTRAINT [DF_ZL_Source_IsElite]  DEFAULT ((0)),
	[Hits] [int] NULL CONSTRAINT [DF_ZL_Source_Hits]  DEFAULT ((0)),
	[LastUseTime] [datetime] NULL,
	[Photo] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ZipCode] [int] NULL,
	[HomePage] [nvarchar](50) NULL,
	[Im] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NULL,
 CONSTRAINT [PK_ZL_Source] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_SpecCate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_SpecCate](
	[SpecCateID] [int] IDENTITY(1,1) NOT NULL,
	[SpecCateName] [nvarchar](50) NOT NULL,
	[SpecCateDir] [nvarchar](50) NOT NULL,
	[SpecCateDesc] [nvarchar](255) NULL,
	[OpenType] [bit] NULL CONSTRAINT [DF_ZL_SpecCate_OpenType]  DEFAULT ((0)),
	[FileExt] [int] NULL,
	[ListTemplate] [nvarchar](255) NULL,
 CONSTRAINT [PK_ZL_SpecCate] PRIMARY KEY CLUSTERED 
(
	[SpecCateID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_SpecInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_SpecInfo](
	[SpecInfoID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
 CONSTRAINT [PK_ZL_SpecInfo] PRIMARY KEY CLUSTERED 
(
	[SpecInfoID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_AddFieldToTable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_AddFieldToTable]
@TableName nvarchar(50),
@FieldName nvarchar(50),
@FieldType nvarchar(50),
@DefaultValue nvarchar(150)
AS
	declare @sqlstr nvarchar(1000)
	
	if(@FieldType=''nvarchar'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] nvarchar(255) DEFAULT (''''''+@DefaultValue+'''''')''
	else if(@FieldType=''varchar'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] varchar(255) DEFAULT (''''''+@DefaultValue+'''''')''
	else if(@FieldType=''ntext'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] ntext DEFAULT (''''''+@DefaultValue+'''''')''
	else if(@FieldType=''int'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] int DEFAULT (0)''
	else if(@FieldType=''bit'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] bit DEFAULT (0)''
	else if(@FieldType=''char'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] char(10)''
	else if(@FieldType=''datetime'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] datetime DEFAULT (getdate())''
	else if(@FieldType=''decimal'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] decimal(8)''
	else if(@FieldType=''money'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] money''
	else if(@FieldType=''nchar'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] nchar(10)''
	else if(@FieldType=''bit'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] bit DEFAULT (0)''
	else if(@FieldType=''text'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] text''	
	else if(@FieldType=''float'')
		set @sqlstr = ''ALTER TABLE [''+@TableName+''] ADD [''+@FieldName+''] float(8)''
execute sp_executesql @sqlstr
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Special]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Special](
	[SpecID] [int] IDENTITY(1,1) NOT NULL,
	[SpecName] [nvarchar](50) NOT NULL,
	[SpecDir] [nvarchar](50) NOT NULL,
	[SpecDesc] [nvarchar](255) NULL,
	[OpenType] [bit] NULL CONSTRAINT [DF_ZL_Special_OpenType]  DEFAULT ((0)),
	[SpecCate] [int] NOT NULL,
	[ListFileExt] [int] NULL,
	[ListTemplate] [nvarchar](255) NULL,
	[ListFileRule] [int] NULL CONSTRAINT [DF_ZL_Special_ListFileRule]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_Special] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_UModelField]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_UModelField](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[FieldName] [nvarchar](20) NOT NULL,
	[FieldAlias] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsNotNull] [bit] NULL CONSTRAINT [DF_ZL_UModelField_IsNotNull]  DEFAULT ((0)),
	[IsSearchForm] [bit] NULL CONSTRAINT [DF_ZL_UModelField_IsSearchForm]  DEFAULT ((0)),
	[FieldType] [nvarchar](50) NOT NULL,
	[FieldSetting] [ntext] NULL,
	[OrderId] [int] NULL CONSTRAINT [DF_ZL_UModelField_OrderId]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_UModelField] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[UserPwd] [nvarchar](200) NOT NULL,
	[GroupID] [int] NOT NULL CONSTRAINT [DF_ZL_User_GroupID]  DEFAULT ((0)),
	[Email] [nvarchar](50) NOT NULL,
	[Question] [nvarchar](255) NOT NULL,
	[Answer] [nvarchar](255) NOT NULL,
	[UserFace] [nvarchar](255) NULL,
	[RegTime] [datetime] NULL CONSTRAINT [DF_ZL_User_RegTime]  DEFAULT (getdate()),
	[LoginTimes] [int] NULL CONSTRAINT [DF_ZL_User_LoginTimes]  DEFAULT ((0)),
	[LastLoginTime] [datetime] NULL CONSTRAINT [DF_ZL_User_LastLoginTime]  DEFAULT (getdate()),
	[LastLoginIP] [nvarchar](50) NULL,
	[LastPwdChangeTime] [datetime] NULL CONSTRAINT [DF_ZL_User_LastPwdChangeTime]  DEFAULT (getdate()),
	[LastLockTime] [datetime] NULL CONSTRAINT [DF_ZL_User_LastLockTime]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_ZL_User_Status]  DEFAULT ((0)),
	[CheckNum] [nvarchar](50) NULL,
	[FaceWidth] [int] NULL CONSTRAINT [DF_ZL_User_FaceWidth]  DEFAULT ((0)),
	[FaceHeight] [int] NULL CONSTRAINT [DF_ZL_User_FaceHeight]  DEFAULT ((0)),
	[Sign] [ntext] NULL,
	[PrivacySetting] [int] NULL CONSTRAINT [DF_ZL_User_PrivacySetting]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_UserModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_UserModel](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[TableName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ZL_UserModel] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_WorkRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_WorkRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_ZL_WorkRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Zone_Advertisement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Zone_Advertisement](
	[ZoneID] [int] NOT NULL,
	[ADID] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Common_List2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Common_List2]
@TableNames VARCHAR(200),    --表名，可以是多个表，但不能用别名
@PrimaryKey VARCHAR(100),    --主键，可以为空，但@Order为空时该值不能为空
@Fields    VARCHAR(200),        --要取出的字段，可以是多个表的字段，可以为空，为空表示select *
@PageSize INT,            --每页记录数
@CurrentPage INT,        --当前页，0表示第1页
@Filter VARCHAR(200) = '''',    --条件，可以为空，不用填 where
@Order VARCHAR(200) = ''''    --排序，可以为空，为空默认按主键升序排列，不用填 order by
AS
BEGIN
    DECLARE @SortColumn VARCHAR(200)
    DECLARE @Operator CHAR(2)
    DECLARE @SortTable VARCHAR(200)
    DECLARE @SortName VARCHAR(200)
    IF @Fields = ''''
        SET @Fields = ''*''
    IF @Filter = ''''
        SET @Filter = ''WHERE 1=1''
    ELSE
        SET @Filter = ''WHERE '' +  @Filter    

    IF @Order <> ''''
    BEGIN
        DECLARE @pos1 INT, @pos2 INT
        SET @Order = REPLACE(REPLACE(@Order, '' asc'', '' ASC''), '' desc'', '' DESC'')
        IF CHARINDEX('' DESC'', @Order) > 0
            IF CHARINDEX('' ASC'', @Order) > 0
            BEGIN
                IF CHARINDEX('' DESC'', @Order) < CHARINDEX('' ASC'', @Order)
                    SET @Operator = ''<=''
                ELSE
                    SET @Operator = ''>=''
            END
            ELSE
                SET @Operator = ''<=''
        ELSE
            SET @Operator = ''>=''
        SET @SortColumn = REPLACE(REPLACE(REPLACE(@Order, '' ASC'', ''''), '' DESC'', ''''), '' '', '''')
        SET @pos1 = CHARINDEX('','', @SortColumn)
        IF @pos1 > 0
            SET @SortColumn = SUBSTRING(@SortColumn, 1, @pos1-1)
        SET @pos2 = CHARINDEX(''.'', @SortColumn)
        IF @pos2 > 0
        BEGIN
            SET @SortTable = SUBSTRING(@SortColumn, 1, @pos2-1)
            IF @pos1 > 0 
                SET @SortName = SUBSTRING(@SortColumn, @pos2+1, @pos1-@pos2-1)
            ELSE
                SET @SortName = SUBSTRING(@SortColumn, @pos2+1, LEN(@SortColumn)-@pos2)
        END
        ELSE
        BEGIN
            SET @SortTable = @TableNames
            SET @SortName = @SortColumn
        END
    END
    ELSE
    BEGIN
        SET @SortColumn = @PrimaryKey
        SET @SortTable = @TableNames
        SET @SortName = @SortColumn
        SET @Order = @SortColumn
        SET @Operator = ''>=''
    END

    DECLARE @type varchar(50)
    DECLARE @prec int
    SELECT @type=t.name, @prec=c.prec
    FROM sysobjects o 
    JOIN syscolumns c on o.id=c.id
    JOIN systypes t on c.xusertype=t.xusertype
    WHERE o.name = @SortTable AND c.name = @SortName
    IF CHARINDEX(''char'', @type) > 0
    SET @type = @type + ''('' + CAST(@prec AS varchar) + '')''

    DECLARE @TopRows INT
    SET @TopRows = @PageSize * @CurrentPage + 1
    print @TopRows
    print @Operator
    EXEC(''
        DECLARE @SortColumnBegin '' + @type + ''
        SET ROWCOUNT '' + @TopRows + ''
        SELECT @SortColumnBegin='' + @SortColumn + '' FROM  '' + @TableNames + '' '' + @Filter + '' ORDER BY '' + @Order + ''
        SET ROWCOUNT '' + @PageSize + ''
        SELECT '' + @Fields + '' FROM  '' + @TableNames + '' '' + @Filter  + '' AND '' + @SortColumn + '''' + @Operator + ''@SortColumnBegin '' + '' ORDER BY '' + @Order + ''    
    '')    
END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_Add]
(
	@TableName nvarchar(50),
	@FieldList nvarchar,
	@FieldValue nvarchar,
	@NodeID int,
	@ModelID int,
	@Title nvarchar,
	@Inputer nvarchar,
	@EliteLevel int,
	@InfoID nvarchar,
	@SpecialID nvarchar
)
AS
	EXEC(''Insert Into '' + @TableName + '' ('' + @FieldList + '') values('' + @FieldValue + '')'')
	DECLARE @ItemID int
	Set @ItemID=(select @@IDENTITY AS newID)
	EXEC(
	''Insert Into ZL_CommonModel (NodeID,ModelID,ItemID,Title,Inputer,EliteLevel,InfoID,SpecialID)
	 Values (''+@NodeID+'',''+@ModelID+'',''+@ItemID+'',''+@Title+'',''+@Inputer+'',''
	 +@EliteLevel+'',''+@InfoID+'',''+@SpecialID+'')'')
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_CreateCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_CreateCount]
(
	@Count int
)
AS
	Exec(''select top ''+@Count+'' * from ZL_CommonModel Where IsCreate=0 order by GeneralID Desc'')
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Model_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PR_Model_Del]@TableName nvarchar(255)ASExec(''DROP Table ''+@TableName+'''')' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_Del]
(
	@TableName nvarchar(50),
	@ItemID int,
	@GeneralID int
)
AS
		
	EXEC(''Delete From ''+@TableName +'' Where [ID]=''+@ItemID)	
	EXEC(''Delete From ZL_CommonModel Where GeneralID=''+@GeneralID)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_Read]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_Read]
(
	@TableName nvarchar(100),
	@ItemID int
)
AS
	DECLARE @SqlID nvarchar(500)
	Set @SqlID=CAST(@ItemID as nvarchar)
	EXEC (''Select * From ''+@TableName +'' Where ID=''+@SqlID)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_UpDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_UpDate]
(
	@TableName nvarchar(50),
	@FieldSet nvarchar,
	@Title nvarchar,
	@EliteLevel int,
	@InfoID nvarchar,
	@SpecialID nvarchar,
	@ItemID int,
	@GeneralID int
)
AS
		
	EXEC(''Update ''+@TableName +'' Set ''+@FieldSet +'' Where [ID]=''+@ItemID)	
	EXEC(''Update ZL_CommonModel Set Title=''+@Title+'',EliteLevel=''+@EliteLevel+'',InfoID=''+@InfoID+'',SpecialID=''+@SpecialID+ '' Where GeneralID=''+@GeneralID)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_Delete]
(
	 @ServerID nvarchar(4000)
)
 AS 
		DECLARE @sql nvarchar(4000)
		set @sql = ''DELETE  FROM ZL_DownServer WHERE ServerID  IN ('' + @ServerID + '')''
		exec(@sql)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_GetRecordFromPage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_GetRecordFromPage]
 @TableName varchar(350),        --表名
 @Identity VARCHAR(100),         --主键，可以为空，但@Order为空时该值不能为空
 @Fields varchar(5000) = ''*'',    --字段名(全部字段为*)
 @OrderField varchar(5000),        --排序字段(必须!支持多字段)
 @sqlWhere varchar(5000) = Null,--条件语句(不用加where)
 @pageSize int,                    --每页多少条记录
 @pageIndex int = 0            --指定当前为第几页 0=第一页
as
begin
    Declare @sql nvarchar(4000);
    Declare @totalRecord int;    
    DECLARE @totalPage INT;
    --计算总记录数
    if (@SqlWhere='''' or @sqlWhere=NULL)
        set @sql = ''select @totalRecord = count(1) from '' + @TableName
    else
        set @sql = ''select @totalRecord = count(1) from '' + @TableName + '' where '' + @sqlWhere
 
    EXEC sp_executesql @sql,N''@totalRecord int OUTPUT'',@totalRecord OUTPUT--计算总记录数    
    --计算总页数
    SELECT @totalPage=CEILING((@totalRecord+0.0)/@PageSize)
    SELECT @totalRecord AS ''fldtotalRecord'',@totalPage AS ''fldTotalPage''
 
    if (@SqlWhere='''' or @sqlWhere=NULL)
        set @sql = ''Select * FROM (select ROW_NUMBER() Over(order by '' + @OrderField + '') as rowId,'' + @Fields + '' from '' + @TableName
    else
        set @sql = ''Select * FROM (select ROW_NUMBER() Over(order by '' + @OrderField + '') as rowId,'' + @Fields + '' from '' + @TableName + '' where '' + @SqlWhere    
         
    --处理页数超出范围情况
    if @PageIndex<0 
        Set @pageIndex = 0    
    if @pageIndex>@TotalPage
        Set @pageIndex = @TotalPage-1 
     --处理开始点和结束点
    Declare @StartRecord int
    Declare @EndRecord int    
    set @StartRecord = @pageIndex*@PageSize + 1
    set @EndRecord = @StartRecord + @pageSize - 1
 
    --继续合成sql语句

    set @Sql = @Sql + '') as tempTable where rowId >='' + CONVERT(VARCHAR(50),@StartRecord) + '' and rowid<= '' +  CONVERT(VARCHAR(50),@EndRecord)
    
    Exec(@Sql)

end

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DelTableField]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_DelTableField]
	@TableName nvarchar(50),
	@FieldName nvarchar(50)
AS 
	Declare @Name nvarchar(50)
	declare @sqlstr nvarchar(500)
	
	select @Name=b.name from syscolumns a,sysobjects b where a.id=object_id(@TableName) and b.id=a.cdefault and a.name=@FieldName and b.name like ''DF%''
	set @sqlstr = ''ALTER TABLE [''+@TableName+''] drop constraint [''+@Name+'']''
	execute sp_executesql @sqlstr
	
	set @sqlstr = ''ALTER TABLE [''+@TableName+''] DROP COLUMN [''+@FieldName+'']''
	execute sp_executesql @sqlstr
	RETURN
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Keywords_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Keywords_Delete]
(
	@KeywordId nvarchar(4000)
)
 AS 
		DECLARE @sql nvarchar(4000)
		set @sql = ''DELETE  FROM ZL_Keywords WHERE KeywordId IN ('' + @KeywordId + '')''
		exec(@sql)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_AdZone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_AdZone](
	[ZoneID] [int] NOT NULL,
	[ZoneName] [nvarchar](100) NULL,
	[ZoneJSName] [nvarchar](100) NULL,
	[ZoneIntro] [nvarchar](255) NULL,
	[ZoneType] [int] NULL,
	[DefaultSetting] [bit] NOT NULL,
	[ZoneSetting] [nvarchar](255) NULL,
	[ZoneWidth] [int] NULL,
	[ZoneHeight] [int] NULL,
	[Active] [bit] NOT NULL,
	[ShowType] [int] NULL,
	[UpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ZL_AdZone] PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Advertisement]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Advertisement](
	[ADID] [int] NOT NULL,
	[UserID] [int] NULL,
	[ADType] [int] NULL,
	[ADName] [nvarchar](100) NULL,
	[ImgUrl] [nvarchar](255) NULL,
	[ImgWidth] [int] NULL,
	[ImgHeight] [int] NULL,
	[FlashWmode] [int] NULL,
	[ADIntro] [ntext] NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[LinkTarget] [int] NULL,
	[LinkAlt] [nvarchar](255) NULL,
	[Priority] [int] NULL,
	[Setting] [ntext] NULL,
	[CountView] [bit] NOT NULL,
	[Views] [int] NULL,
	[CountClick] [bit] NOT NULL,
	[Clicks] [int] NULL,
	[Passed] [bit] NOT NULL,
	[OverdueDate] [datetime] NULL,
 CONSTRAINT [PK_ZL_Advertisement] PRIMARY KEY CLUSTERED 
(
	[ADID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Author]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL CONSTRAINT [DF_ZL_Author_UserID]  DEFAULT ((0)),
	[Type] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Passed] [bit] NULL CONSTRAINT [DF_ZL_Author_Passed]  DEFAULT ((0)),
	[onTop] [bit] NULL CONSTRAINT [DF_ZL_Author_onTop]  DEFAULT ((0)),
	[IsElite] [bit] NULL CONSTRAINT [DF_ZL_Author_IsElite]  DEFAULT ((0)),
	[Hits] [int] NULL CONSTRAINT [DF_ZL_Author_Hits]  DEFAULT ((0)),
	[LastUseTime] [datetime] NULL CONSTRAINT [DF_ZL_Author_LastUseTime]  DEFAULT (getdate()),
	[TemplateID] [int] NULL CONSTRAINT [DF_ZL_Author_TemplateID]  DEFAULT ((0)),
	[Photo] [nvarchar](255) NULL,
	[Intro] [ntext] NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ZipCode] [int] NULL,
	[HomePage] [nvarchar](50) NULL,
	[Im] [nvarchar](50) NULL,
	[Sex] [smallint] NULL CONSTRAINT [DF_ZL_Author_Sex]  DEFAULT ((0)),
	[BirthDay] [datetime] NULL,
	[Company] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_ZL_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_ClientRequire]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_ClientRequire](
	[RequireID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Require] [ntext] NOT NULL,
	[ReuqireDate] [datetime] NOT NULL CONSTRAINT [DF_ZL_ClientRequire_ReuqireDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ZL_ClientRequire] PRIMARY KEY CLUSTERED 
(
	[RequireID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_Comment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Contents] [nvarchar](300) NOT NULL,
	[Audited] [bit] NOT NULL CONSTRAINT [DF_ZL_Comment_Audited]  DEFAULT ((0)),
	[UserID] [int] NOT NULL,
	[CommentTime] [datetime] NOT NULL CONSTRAINT [DF_ZL_Comment_CommentTime]  DEFAULT (getdate()),
	[Score] [int] NOT NULL CONSTRAINT [DF_ZL_Comment_Score]  DEFAULT ((0)),
	[PK] [bit] NULL CONSTRAINT [DF_ZL_Comment_PK]  DEFAULT ((0)),
 CONSTRAINT [PK_ZL_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZL_CommonModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZL_CommonModel](
	[GeneralID] [int] IDENTITY(1,1) NOT NULL,
	[NodeID] [int] NOT NULL,
	[ModelID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Inputer] [nvarchar](50) NULL CONSTRAINT [DF_ZL_CommonModel_Inputer]  DEFAULT (''),
	[Hits] [int] NULL CONSTRAINT [DF_ZL_CommonModel_Hits]  DEFAULT ((0)),
	[CreateTime] [datetime] NULL CONSTRAINT [DF_ZL_CommonModel_CreateTime]  DEFAULT (getdate()),
	[Status] [int] NULL CONSTRAINT [DF_ZL_CommonModel_Status]  DEFAULT ((0)),
	[EliteLevel] [int] NULL CONSTRAINT [DF_ZL_CommonModel_EliteLevel]  DEFAULT ((0)),
	[InfoID] [nvarchar](255) NULL CONSTRAINT [DF_ZL_CommonModel_InfoID]  DEFAULT (''),
	[SpecialID] [nvarchar](255) NULL CONSTRAINT [DF_ZL_CommonModel_SpecialID]  DEFAULT (''),
	[IsCreate] [int] NULL CONSTRAINT [DF_ZL_CommonModel_IsCreate]  DEFAULT ((0)),
	[HtmlLink] [nvarchar](500) NULL CONSTRAINT [DF_ZL_CommonModel_HtmlLink]  DEFAULT (''),
	[Template] [nvarchar](255) NULL,
 CONSTRAINT [PK_ZL_CommonModel] PRIMARY KEY CLUSTERED 
(
	[GeneralID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Correct_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Correct_Add]
(
@CorrectID int,
@CorrectTitle nvarchar(255),
@CorrectUrl nvarchar(255),
@CorrectType int,
@CorrectDetail nvarchar(255),
@CorrectPer nvarchar(50),
@CorrectEmail nvarchar(50)
)
AS
Insert into ZL_Correct 
(
CorrectTitle,
CorrectUrl,
CorrectType,
CorrectDetail,
CorrectPer,
PerEmail
) values
(
@CorrectTitle,
@CorrectUrl,
@CorrectType,
@CorrectDetail,
@CorrectPer,
@CorrectEmail
)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Correct_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Correct_Del]
@CorrectID int
AS
Delete from ZL_Correct where CorrectID=@CorrectID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_Add]
(
   @ServerID int,
    @ServerName nvarchar(50),
    @ServerUrl nvarchar(50),
    @ServerLogo nvarchar(255),
    @OrderID int,
    @ShowType int
	)
AS
	--SET NOCOUNT ON 
	INSERT INTO
        ZL_DownServer(ServerID,ServerName,ServerUrl,ServerLogo,OrderID,ShowType)VALUES(@ServerID,@ServerName,@ServerUrl,@ServerLogo,@OrderID,@ShowType)  
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_GetById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_GetById] 
	(
	@ServerID int
	)
AS
	SET NOCOUNT ON
	SELECT
		  ServerID,ServerName,ServerUrl,ServerLogo,OrderID,ShowType 
    FROM 
         ZL_DownServer
	WHERE ServerID = @ServerID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_GetCountOrderId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_GetCountOrderId] 
AS
	SET NOCOUNT ON  
	SELECT ISNULL(COUNT(ServerID),0) 
	FROM ZL_DownServer
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_GetList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_GetList]
AS
	SET NOCOUNT ON
	SELECT
	     ServerID,ServerName,ServerUrl,ServerLogo,OrderID,ShowType 
    FROM 
         ZL_DownServer 
	ORDER BY OrderID ASC 
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_Update] 
	(
	@ServerID int,
    @ServerName nvarchar(50),
    @ServerUrl nvarchar(50),
    @ServerLogo nvarchar(255),
    @OrderID int,
    @ShowType int
	)
AS
	--SET NOCOUNT ON 
	UPDATE ZL_DownServer 
	SET ServerName=@ServerName,ServerUrl=@ServerUrl,ServerLogo=@ServerLogo,OrderID=@OrderID,ShowType=@ShowType WHERE ServerID=@ServerID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_DownServer_UpdateOrderId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_DownServer_UpdateOrderId] 
	(
	@ServerID int,
	@OrderID int
	)
AS
	--SET NOCOUNT ON
	UPDATE ZL_DownServer 
	SET OrderID=@OrderID WHERE ServerID=@ServerID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Favorite_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Favorite_Add]
(
@FavoriteID int,
@Owner int,
@InfoID int,
@FavoriteDate datetime
)
AS
	Insert Into ZL_Favorite (Owner,InfoID,FavoriteDate) values(@Owner,@InfoID,@FavoriteDate)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Favorite_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Favorite_Del]
(
@FavoriteID int
)
AS
	Delete from ZL_Favorite Where FavoriteID=@FavoriteID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Group_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Group_Add]
(
@GroupID int,
@GroupName nvarchar(50),
@Description nvarchar(255),
@RegSelect bit
)
AS
Insert into ZL_Group (GroupName,[Description],RegSelect) values (@GroupName,@Description,@RegSelect)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Group_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Group_Del]
(
@GroupID int
)
AS
delete from ZL_Group where GroupID=@GroupID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Group_Get]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Group_Get]
AS
select * from ZL_Group
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Group_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Group_Update]
(
@GroupID int,
@GroupName nvarchar(50),
@Description nvarchar(255),
@RegSelect bit
)
AS
Update ZL_Group set GroupName=@GroupName,[Description]=@Description,RegSelect=@RegSelect where GroupID=@GroupID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_KeyWords_GetKeyWordnfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_KeyWords_GetKeyWordnfo] 
AS
		SELECT * FROM ZL_KeyWords  ORDER BY KeywordID DESC 	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Keywords_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Keywords_Add]	
	(
	@KeywordText NVarChar(200),
    @KeywordType Int,
    @Priority Int,
    @Hits Int,
    @lastUseTime datetime,
    @ArrayGeneralId ntext,
    @QuoteTimes int,
   @KeywordID int
	)	
AS
	INSERT INTO ZL_Keywords
	      (KeywordText,KeywordType,Priority,Hits,lastUseTime,arrGeneralID,QuoteTimes)
	VALUES (@KeywordText,@KeywordType,@Priority, @Hits, @lastUseTime,@ArrayGeneralId,@QuoteTimes)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Keywords_GetById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Keywords_GetById]
(
	@KeywordID Int
)
 AS 
 
	SELECT KeywordID,KeywordText,KeywordType,Priority,Hits,LastUseTime,arrGeneralId,QuoteTimes FROM ZL_Keywords WHERE KeywordID = @KeywordID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Keywords_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Keywords_Update] 
    (
    @KeywordID Int,
   @KeywordText NVarChar(200),
    @KeywordType Int,
    @Priority Int,
    @LastUseTime DateTime,
    @ArrayGeneralId ntext,
    @QuoteTimes int,
   @Hits int
	)	
AS
	UPDATE 
		ZL_Keywords
    SET 
        KeywordText = @KeywordText, Hits=@Hits,KeywordType=@KeywordType,Priority=@Priority,LastUseTime=@LastUseTime,arrGeneralID=@ArrayGeneralId ,QuoteTimes=@QuoteTimes
    WHERE 
         KeywordID = @KeywordID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Label_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Label_Add]
(	@LabelID int,
	@LabelName nvarchar(50),
	@LabelType int,
	@LabelCate nvarchar(50),
	@LabelDesc nvarchar(255),
	@LabelParam ntext,	
	@LabelTable ntext,
	@LabelField ntext,
	@LabelWhere ntext,
	@LabelOrder ntext,
	@LabelContent ntext,
	@LabelCount nvarchar(50)
)
AS
	INSERT INTO [ZL_Label] 
	(		
		LabelName,
		LabelType,
		LabelCate,
		LabelDesc,
		LabelParam,
		LabelTable,
		LabelField,
		LabelWhere,
		LabelOrder,
		LabelContent,
		LabelCount
	)
	values
	(		
		@LabelName,
		@LabelType,
		@LabelCate,
		@LabelDesc,
		@LabelParam,	
		@LabelTable,
		@LabelField,
		@LabelWhere,
		@LabelOrder,
		@LabelContent,
		@LabelCount
)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Label_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Label_Update]
(	@LabelID int,
	@LabelName nvarchar(50),
	@LabelType int,
	@LabelCate nvarchar(50),
	@LabelDesc nvarchar(255),
	@LabelParam ntext,	
	@LabelTable ntext,
	@LabelField ntext,
	@LabelWhere ntext,
	@LabelOrder ntext,
	@LabelContent ntext,
	@LabelCount nvarchar(50)
)
AS
	UPDATE [ZL_Label] 
	Set		
		LabelName=@LabelName,
		LabelType=@LabelType,
		LabelCate=@LabelCate,
		LabelDesc=@LabelDesc,
		LabelParam=@LabelParam,
		LabelTable=@LabelTable,
		LabelField=@LabelField,
		LabelWhere=@LabelWhere,
		LabelOrder=@LabelOrder,
		LabelContent=@LabelContent,
		LabelCount=@LabelCount
	Where LabelID=@LabelID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Manage_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Manage_Add]
(
@AdminName nvarchar(50),
@AdminPassword nvarchar(100),
@UserName nvarchar(50),
@EnableMultiLogin bit,
@LastLoginIp nvarchar(50),
@IsLock bit,
@EnableModifyPassword bit,
@AdminRole ntext,
@Theme nvarchar(50),
@RndPassword nvarchar(50)
)
AS
INSERT INTO ZL_Manager
(
AdminName,
AdminPassword,
UserName,
EnableMultiLogin,
LastLoginIP,
IsLock,
EnableModifyPassword,
AdminRole,
Theme,
RandNumber
)VALUES(
@AdminName,
@AdminPassword,
@UserName,
@EnableMultiLogin,
@LastLoginIp,
@IsLock,
@EnableModifyPassword,
@AdminRole,
@Theme,
@RndPassword
)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Manage_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Manage_Update]
(
@AdminID int,
@AdminName nvarchar(50),
@AdminPassword nvarchar(100),
@UserName nvarchar(50),
@EnableMultilogin bit,
@LoginTimes int,
@LastLoginIp nvarchar(50),
@LastLoginTime datetime,
@LastLogoutTime datetime,
@LastModifyPasswordTime datetime,
@IsLock bit,
@EnableModifyPassword bit,
@RoleList ntext,
@Theme nvarchar(50)
)
AS
UPDATE ZL_Manager SET 
AdminName=@AdminName,
AdminPassword=@AdminPassword,
UserName=@UserName,
EnableMultilogin=@EnableMultilogin,
LoginTimes=@LoginTimes,
LastLoginIP=@LastLoginIp,
LastLoginTime=@LastLoginTime,
LastLogoutTime=@LastLogoutTime,
LastModifyPwdTime=@LastModifyPasswordTime,
IsLock=@IsLock,
EnableModifyPassword=@EnableModifyPassword,
AdminRole=@RoleList,
Theme=@Theme 
WHERE AdminId=@AdminID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Model_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Model_Add]	
(
    @ModelID int,
    @ModelName NVarChar(50),    
    @Description NVarChar(250),
    @TableName nvarchar(50),
    @ItemName nvarchar(50),
    @ItemUnit nvarchar(20), 
    @ItemIcon nvarchar(255),
    @ModelType int
)
AS
if(@ModelID=0)
BEGIN	
INSERT INTO 
[ZL_Model] 
(  
	[ModelName],    
	[Description], 
	[TableName],
	[ItemName],
	[ItemUnit],  
	[ItemIcon],
	[ModelType]
	)
	VALUES
	(
	@ModelName,
	@Description,
	@TableName,
	@ItemName,
	@ItemUnit,
	@ItemIcon,
	@ModelType
	)
-- 不存在创建指定数据表
EXEC(''CREATE TABLE dbo.''+ @TableName+'' ([ID] [int] IDENTITY (1, 1) PRIMARY Key NOT NULL)'')
END
ELSE
BEGIN
	update ZL_Model set [ModelName]=@ModelName,
	[Description]=@Description, 
	[TableName]=@TableName,
	[ItemName]=@ItemName,
	[ItemUnit]=@ItemUnit,  
	[ItemIcon]=@ItemIcon
where ModelID=@ModelID		
END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_UserModel_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_UserModel_Add]
(
    @ModelID int,
    @ModelName NVarChar(50),    
    @Description NVarChar(250),
    @TableName nvarchar(50),
    @ItemName nvarchar(50),
    @ItemUnit nvarchar(20), 
    @ItemIcon nvarchar(255),
    @ModelType int
)
AS
INSERT INTO 
[ZL_Model] 
(  
	[ModelName],    
	[Description], 
	[TableName],
	[ItemName],
	[ItemUnit],  
	[ItemIcon],
	[ModelType]
	)
	VALUES
	(
	@ModelName,
	@Description,
	@TableName,
	@ItemName,
	@ItemUnit,
	@ItemIcon,
	@ModelType
	)
-- 不存在创建指定数据表
EXEC(''CREATE TABLE dbo.''+ @TableName+'' ([UserID] [int] PRIMARY Key NOT NULL)'')
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_IsModelNameExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create PROCEDURE [dbo].[PR_IsModelNameExists]
(
    @ModelName NVarChar(50)
)
as
select count(*) from [ZL_Model] where ModelName=@ModelName
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_IsTableNameExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_IsTableNameExists]
(
    @TableName NVarChar(50)
)
as
BEGIN
	SET NOCOUNT OFF	
	select count(*) from [ZL_Model] where TableName=@TableName
End
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Contents_Model_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Contents_Model_Add]	
(
             @ModelID int,
	@ModelName NVarChar(20),    
	@Description NVarChar(255),
	@TableName nvarchar(50),
	@ItemName nvarchar(50),
	@ItemUnit nvarchar(50), 
	@ItemIcon nvarchar(255)
)
AS
	INSERT INTO 
	[ZL_Model] 
	(  
		[ModelID], 
		[ModelName],    
		[Description], 
		[TableName],
		[ItemName],
		[ItemUnit],  
		[ItemIcon]
	)
	VALUES
	(
		@ModelID,
		@ModelName,
		@Description,
		@TableName,
		@ItemName,
		@ItemUnit,
		@ItemIcon
	)
BEGIN
		-- 不存在创建指定数据表
		EXEC(''CREATE TABLE ''+ @TableName+'' (ID int,CONSTRAINT [PK_''+@TableName+''_ID] PRIMARY KEY CLUSTERED
(
 [ID] ASC
))'')

END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ModelField_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_ModelField_Add]
@FieldID int,
@ModelID int,
@FieldName nvarchar(50) ,
@FieldAlias nvarchar(20) ,
@FieldTips nvarchar(50),
@Description nvarchar(255) ,
@IsNotNull bit ,
@IsSearchForm bit ,
@FieldType nvarchar(50) ,
@Content ntext 
 AS
	Declare @OrderId int; 
	set @OrderId=(select Max(OrderId) from [ZL_ModelField] where ModelID=@ModelID)
	
	if @OrderId is null
		set @OrderId=0
	else
		set @OrderId=@OrderId+1
	
	INSERT INTO [ZL_ModelField]
	(
		ModelID,
		FieldName,
		FieldAlias,
		FieldTips,
		[Description],
		IsNotNull,
		IsSearchForm,
		FieldType,
		Content,
		OrderId
	)
	 VALUES
	(
		@ModelID,
		@FieldName,
		@FieldAlias,
		@FieldTips,
		@Description,
		@IsNotNull,
		@IsSearchForm,
		@FieldType,
		@Content,
		@OrderId
	)
	
	RETURN
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ModelField_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_ModelField_Del]
	@FieldID int
AS
	/* SET NOCOUNT ON */ 
	delete from [ZL_ModelField] where FieldID=@FieldID
	RETURN
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ModelField_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_ModelField_Update]
@FieldID int,
@ModelID int,
@FieldName nvarchar(50),
@FieldAlias nvarchar(20),
@FieldTips nvarchar(50),
@FieldType nvarchar(50),
@Description nvarchar(255),
@IsNotNull bit,
@IsSearchForm bit,
@Content ntext
AS
	UPDATE ZL_ModelField 
	SET 
	FieldAlias= @FieldAlias,
	FieldTips=@FieldTips,
	[Description] = @Description,
	IsNotNull = @IsNotNull,
	IsSearchForm = @IsSearchForm,
	Content = @Content
	 WHERE FieldID = @FieldID and ModelID=@ModelID
	RETURN
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Node_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Node_Del]
	@NodeID int
AS
	Delete From ZL_Node Where NodeID=@NodeID
Return
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Node_DelChild]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Node_DelChild]
	@NodeID int
AS
	Delete From ZL_Node Where ParentID=@NodeID
Return
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Nodes_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Nodes_Add]
(	@NodeID int,
	@NodeName nvarchar(50),
	@NodeType int,
	@Tips nvarchar(255),
	@NodeDir nvarchar(50),
	@NodeUrl nvarchar(255),
	@ParentID int,
	@Child int,
	@Depth int,
	@NodePicUrl nvarchar(255),
	@Description nvarchar(255),
	@Meta_Keywords nvarchar(255),
	@Meta_Description nvarchar(255),
	@OpenType bit,
	@PurviewType bit,
	@CommentType bit,
	@HitsOfHot int,
	@ListTemplateFile nvarchar(255),
	@IndexTemplate nvarchar(255),
	@ContentModel nvarchar(255),
	@ItemOpenType bit,
	@ContentHtmlRule int,
	@ListPageHtmlEx int,
	@ContentFileEx int,
	@OrderID int
)
AS
	INSERT INTO [ZL_Node] 
	(
		NodeName,
		NodeType,
		Tips,
		NodeDir,
		NodeUrl,
		ParentID,
		Child,
		Depth,
		NodePicUrl,
		Description,
		Meta_Keywords,
		Meta_Description,
		OpenType,
		PurviewType,
		CommentType,
		HitsOfHot,
		ListTemplateFile,
		IndexTemplate,
		ContentModel,
		ItemOpenType,
		ContentHtmlRule,
		ListPageHtmlEx,
		ContentFileEx,
		OrderID
	)
	values
	(
		@NodeName,
		@NodeType,
		@Tips,
		@NodeDir,
		@NodeUrl,
		@ParentID,
		@Child,
		@Depth,
		@NodePicUrl,
		@Description,
		@Meta_Keywords,
		@Meta_Description,
		@OpenType,
		@PurviewType,
		@CommentType,
		@HitsOfHot,
		@ListTemplateFile,
		@IndexTemplate,
		@ContentModel,
		@ItemOpenType,
		@ContentHtmlRule,
		@ListPageHtmlEx,
		@ContentFileEx,
		@OrderID
)
select @@IDENTITY AS newID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Nodes_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Nodes_Update]
(
	@NodeID int,
	@NodeName nvarchar(50),
	@NodeType int,
	@Tips nvarchar(255),
	@NodeDir nvarchar(50),
	@NodeUrl nvarchar(255),
	@ParentID int,
	@Child int,
	@Depth int,
	@NodePicUrl nvarchar(255),
	@Description nvarchar(255),
	@Meta_Keywords nvarchar(255),
	@Meta_Description nvarchar(255),
	@OpenType bit,
	@PurviewType bit,
	@CommentType bit,
	@HitsOfHot int,
	@ListTemplateFile nvarchar(255),
	@IndexTemplate nvarchar(255),
	@ContentModel nvarchar(255),
	@ItemOpenType bit,
	@ContentHtmlRule int,
	@ListPageHtmlEx int,
	@ContentFileEx int,
	@OrderID int
)
AS
UPDATE  ZL_Node SET
	NodeName=@NodeName,
	NodeType=@NodeType,
	Tips=@Tips,
	ParentID=@ParentId,
	Depth=@Depth,
	Child=@Child,
	NodeDir=@NodeDir,
	NodeUrl=@NodeUrl,
	NodePicUrl=@NodePicUrl,
	Description=@Description,			
	Meta_Keywords=@Meta_Keywords,
	Meta_Description=@Meta_Description,
	OpenType=@OpenType,
	PurviewType=@PurviewType,
	CommentType=@CommentType,
	HitsOfHot=@HitsOfHot,
	ListTemplateFile=@ListTemplateFile,
	IndexTemplate=@IndexTemplate,
	ContentModel=@ContentModel,
	ItemOpenType=@ItemOpenType,
	ContentHtmlRule=@ContentHtmlRule,	
	ListPageHtmlEx=@ListPageHtmlEx,
	ContentFileEx=@ContentFileEx,
	OrderID=@OrderID
	Where NodeID=@NodeID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Project_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Project_Add]
(
@ProjectID int,
@ProjectName nvarchar(255),
@ProjectIntro ntext,
@RequireID int,
@StartDate datetime,
@EndDate datetime ,
@Status int,
@UserID int
)
AS
INSERT INTO ZL_Project (ProjectName,ProjectIntro,RequireID,StartDate,EndDate,Status ,UserID) VALUES (@ProjectName ,@ProjectIntro,@RequireID,@StartDate ,@EndDate,@Status,@UserID)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Project_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Project_Delete]
	@ID int
AS
	/* SET NOCOUNT ON */ 
	delete from [ZL_Project] where ProjectID=@ID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Project_GetProjectByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Project_GetProjectByID]
(
	@ID int
)
AS
    IF @ID > 0
    BEGIN
        SELECT * FROM ZL_Project WHERE ProjectID=@ID
	END
	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Project_SelByUid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Project_SelByUid] 
@Uid int
AS
		SELECT * FROM ZL_Project where UserID=@Uid ORDER BY ProjectID DESC 	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Project_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Project_Update] 
    (
    @ProjectID Int,
   @ProjectName NVarChar(255),
    @ProjectIntro ntext,
    @UserID Int,
    @RequireID int,
    @StartDate datetime,
    @EndDate datetime,
    @Status int 
	)	
AS
	UPDATE ZL_Project
    SET    
  ProjectName = @ProjectName, ProjectIntro=@ProjectIntro,UserID=@UserID,RequireID =@RequireID,StartDate=@StartDate,Status=@Status,EndDate =@EndDate
    WHERE  ProjectID= @ProjectID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectDiscuss_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectDiscuss_Add]
(
@DiscussID int,
@ProjectID int,
@WorkID int,
@UserID int,
@Content ntext,
@DiscussDate datetime
)
AS
INSERT INTO ZL_ProjectDiscuss (ProjectID,WorkID,UserID,Content,DiscussDate ) VALUES (@ProjectID,@WorkID,@UserID,@Content ,@DiscussDate)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectDiscuss_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectDiscuss_Delete]
	@ID int
AS
	/* SET NOCOUNT ON */ 
	delete from [ZL_ProjectDiscuss] where DiscussID=@ID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectDiscuss_GetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectDiscuss_GetAll]
AS
SELECt *  FROM ZL_ProjectDiscuss ORDER BY DiscussDate desc

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectDiscuss_SelByWid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectDiscuss_SelByWid]
(
	@WID int
)
AS
    IF @WID > 0
    BEGIN
        SELECT * FROM ZL_ProjectDiscuss WHERE WorkID=@WID
	END
	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectWork_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectWork_Add]
(
@WorkID int,
@WorkName nvarchar(255),
@WorkIntro ntext,
@ProjectID int,
@Approving int,
@Status int,
@EndDate datetime
)
AS
	Insert Into ZL_ProjectWork (WorkName,WorkIntro,ProjectID,Approving,Status,EndDate) values(@WorkName,@WorkIntro,@ProjectID,@Approving,@Status,@EndDate)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectWork_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectWork_Del]
	@ID int
AS
	/* SET NOCOUNT ON */ 
	delete from [ZL_ProjectWork] where WorkID=@ID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectWork_SelByPID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectWork_SelByPID]
(
	@ProjectID Int
)
 AS 
 
	SELECT * FROM ZL_ProjectWork WHERE ProjectID = @ProjectID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectWork_SelByWID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectWork_SelByWID]
(
	@ID int
)
AS
    IF @ID > 0
    BEGIN
        SELECT * FROM ZL_ProjectWork  WHERE WorkID=@ID
	END
	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ProjectWork_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ProjectWork_Update] 
    (
    @WorkID Int,
   @WorkName NVarChar(255),
    @WorkIntro ntext,
    @ProjectID Int,
    @Approving int,
    @Status int,
    @EndDate datetime
	)	
AS
	UPDATE ZL_ProjectWork
    SET         WorkName = @WorkName, WorkIntro=@WorkIntro,ProjectID=@ProjectID,Approving =@Approving,Status=@Status,EndDate =@EndDate
    WHERE 
         WorkID = @WorkID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Source_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Source_Delete] 
(
    @ID nvarchar(100)
)
AS
	IF @ID IS NOT NULL 
	BEGIN
		DELETE FROM ZL_Source WHERE ID in(@ID)
	END

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Source_GetSourceInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Source_GetSourceInfo] 
AS
		SELECT
				ID,
				Type,
				[Name],
				Passed,
				onTop,
				IsElite,
				Hits,
				LastUseTime,
				Photo,
				Intro,
				Address,
				Tel,
				Fax,
				Mail,
				Email,
				ZipCode,
				HomePage,
				Im,
				Contacter
				FROM ZL_Source ORDER BY ID DESC 	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Source_GetSourceInfoByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Source_GetSourceInfoByID]
(
	@ID int
)
AS
    IF @ID > 0
    BEGIN
		SELECT
		ID,
		Type,
		[Name],
		Passed,
		onTop,
		IsElite,
		Hits,
		LastUseTime,
		Photo,
		Intro,
		Address,
		Tel,
		Fax,
		Mail,
		Email,
		ZipCode,
		HomePage,
		Im,
		Contacter
		FROM ZL_Source WHERE ID=@ID
	END
	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Source_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Source_Insert] 
(
    @Type varchar(50),
    @Name varchar(50),
    @Passed bit,
    @onTop bit,
    @IsElite bit,
    @Hits int,
    @LastUseTime DateTime,
    @Photo varchar(50),
    @Intro nvarchar(255),
    @Address varchar(50),
    @Tel varchar(50),
    @Fax varchar(50),
    @Mail varchar(50),
    @Email varchar(50),
    @ZipCode int,
    @HomePage varchar(50),
    @Im varchar(50),
    @ContacterName varchar(50),
    @ID int
)
AS
	INSERT INTO
	ZL_Source(Type,Name,Passed,onTop,IsElite,Hits,LastUseTime,Photo,Intro,Address,Tel,Fax,Mail,Email,ZipCode,HomePage,Im,Contacter) VALUES(@Type,@Name,@Passed,@onTop,@IsElite,@Hits,@LastUseTime,@Photo,@Intro,@Address,@Tel,@Fax,@Mail,@Email,@ZipCode,@HomePage,@Im,@ContacterName)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Source_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Source_Update] 
(
	@ID int,
    @Type varchar(50),
    @Name varchar(50),
    @Passed bit,
    @onTop bit,
    @IsElite bit,
    @Hits int,
    @LastUseTime DateTime,
    @Photo varchar(50),
    @Intro nvarchar(255),
    @Address varchar(50),
    @Tel varchar(50),
    @Fax varchar(50),
    @Mail varchar(50),
    @Email varchar(50),
    @ZipCode int,
    @HomePage varchar(50),
    @Im varchar(50),
    @ContacterName varchar(50)
)
AS
	IF @ID > 0
	BEGIN
		UPDATE ZL_Source SET
		Type=@Type,[Name]=@Name,Passed=@Passed,onTop=@onTop,IsElite=@IsElite,Hits=@Hits,LastUseTime=@LastUseTime,Photo=@Photo,Intro=@Intro,Address=@Address,Tel=@Tel,Fax=@Fax,Mail=@Mail,Email=@Email,ZipCode=@ZipCode,HomePage=@HomePage,Im=@Im,Contacter=@ContacterName
		WHERE ID=@ID
		
	END

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_SpecCate_AddUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_SpecCate_AddUpdate]	
(
    @SpecCateID int,
    @SpecCateName NVarChar(50),    
    @SpecCateDir NVarChar(50),
    @SpecCateDesc nvarchar(255),
    @OpenType bit,
    @FileExt int, 
    @ListTemplate nvarchar(255)
)
AS
if(@SpecCateID=0)
BEGIN	
INSERT INTO 
[ZL_SpecCate] 
(  
	[SpecCateName],    
	[SpecCateDir], 
	[SpecCateDesc],
	[OpenType],
	[FileExt],  
	[ListTemplate]
	)
	VALUES
	(
	@SpecCateName,
	@SpecCateDir,
	@SpecCateDesc,
	@OpenType,
	@FileExt,
	@ListTemplate
	)
END
ELSE
BEGIN
	update ZL_SpecCate set [SpecCateName]=@SpecCateName,
	[SpecCateDir]=@SpecCateDir, 
	[SpecCateDesc]=@SpecCateDesc,
	[OpenType]=@OpenType,
	[FileExt]=@FileExt,  
	[ListTemplate]=@ListTemplate
where SpecCateID=@SpecCateID		
END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_SpecCate_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_SpecCate_Del]
(
    @SpecCateID int
)
AS
Delete from ZL_SpecCate where SpecCateID=@SpecCateID
Return
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_SpecInfo_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_SpecInfo_Add]
@SpecialID int,
@InfoID int
AS
Insert Into ZL_SpecInfo (SpecialID,InfoID) values(@SpecialID,@InfoID)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_SpecInfo_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_SpecInfo_Del]
@SpecInfoID int
AS
Delete from ZL_SpecInfo where SpecInfoID=@SpecInfoID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Spec_AddUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Spec_AddUpdate]	
(
    @SpecID int,
    @SpecName NVarChar(50),    
    @SpecDir NVarChar(50),
    @SpecDesc nvarchar(255),	
    @OpenType bit,
    @SpecCate int,
    @ListFileExt int,
    @ListFileRule int,	
    @ListTemplate nvarchar(255)
)
AS
if(@SpecID=0)
BEGIN	
INSERT INTO 
[ZL_Special] 
(  
	[SpecName],    
	[SpecDir], 
	[SpecDesc],
	[OpenType],
	[SpecCate],
	[ListFileExt],
	[ListFileRule],
	[ListTemplate]	
	)
	VALUES
	(
	@SpecName,
	@SpecDir,
	@SpecDesc,
	@OpenType,
	@SpecCate,
	@ListFileExt,
	@ListFileRule,
	@ListTemplate
	)
END
ELSE
BEGIN
	update ZL_Special set [SpecName]=@SpecName,
	[SpecDir]=@SpecDir, 
	[SpecDesc]=@SpecDesc,
	[OpenType]=@OpenType,
	[SpecCate]=@SpecCate,
	[ListFileExt]=@ListFileExt,
	[ListFileRule]=@ListFileRule,
	[ListTemplate]=@ListTemplate
where SpecID=@SpecID		
END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Spec_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Spec_Del]
(
    @SpecID int
)
AS
Delete from ZL_Special where SpecID=@SpecID
Return
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_UserLock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_UserLock]
(
@UserID int,
@LockoutTime datetime
)
AS
	Update ZL_User Set Status=1,LastLockTime=@LockoutTime where UserID=@UserID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_User_AddUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_User_AddUpdate]
(
@UserID int,
@UserName nvarchar(20),
@UserPwd nvarchar(255),
@Email nvarchar(255),
@Question nvarchar(255),
@Answer nvarchar(255),
@UserFace nvarchar(255),
@FaceHeight int,
@FaceWidth int,
@RegTime datetime,
@Sign ntext,
@PrivacySetting int,
@LoginTimes int,
@LastLoginTime datetime,
@LastLoginIP nvarchar(50),
@LastPwdChangeTime datetime,
@LastLockTime datetime,
@CheckNum nvarchar(50),
@Status int
)
AS
if(@UserID=0)
BEGIN
Insert into ZL_User
(
UserName,
UserPwd,
Email,
Question,
Answer,
UserFace,
FaceHeight,
FaceWidth,
RegTime,
Sign,
PrivacySetting,
LoginTimes,
LastLoginTime,
LastLoginIP,
LastPwdChangeTime,
LastLockTime,
CheckNum,
Status
)
VALUES(
@UserName,
@UserPwd,
@Email,
@Question,
@Answer,
@UserFace,
@FaceHeight,
@FaceWidth,
@RegTime,
@Sign,
@PrivacySetting,
@LoginTimes,
@LastLoginTime,
@LastLoginIP,
@LastPwdChangeTime,
@LastLockTime,
@CheckNum,
@Status
)
END
ELSE
BEGIN
Update ZL_User SET 
UserName=@UserName,
UserPwd=@UserPwd,
Email=@Email,
Question=@Question,
Answer=@Answer,
UserFace=@UserFace,
FaceHeight=@FaceHeight,
FaceWidth=@FaceWidth,
RegTime=@RegTime,
Sign=@Sign,
PrivacySetting=@PrivacySetting,
LoginTimes=@LoginTimes,
LastLoginTime=@LastLoginTime,
LastLoginIP=@LastLoginIP,
LastPwdChangeTime=@LastPwdChangeTime,
LastLockTime=@LastLockTime,
CheckNum=@CheckNum,
Status=@Status
END
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_GetExportList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_ADZone_GetExportList]
@ZoneID int 
as 
select * from dbo.ZL_Advertisement where ADID in
(select ADID from dbo.ZL_Zone_Advertisement 
where ZoneID=@ZoneID and dbo.ZL_Zone_Advertisement.ADID=dbo.ZL_Advertisement.ADID )

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_adzone_copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_adzone_copy]
@zone int
as
declare
@ZoneId int,
@ZoneName nvarchar(100),
@ZoneJSName nvarchar(100),
@ZoneIntro  nvarchar(255),
@ZoneType   int ,
@DefaultSetting bit,
@ZoneSetting nvarchar(255),
@ZoneWidth int ,
@ZoneHeight int,
@Active bit,
@ShowType int ,
@UpdateTime datetime
select @ZoneName=''复制''+ZoneName,@ZoneJSName=ZoneJSName,@ZoneIntro=ZoneIntro,@ZoneType=ZoneType,@DefaultSetting=DefaultSetting,@ZoneSetting=ZoneSetting,
@ZoneWidth=ZoneWidth,@ZoneHeight=ZoneHeight,@Active=Active,@ShowType=ShowType,@UpdateTime=UpdateTime 
from dbo.ZL_AdZone
where ZoneID=@zone
select  @ZoneID=max(ZoneID)+1 from ZL_AdZone
insert dbo.ZL_AdZone values(@ZoneId,@ZoneName,@ZoneJSName,@ZoneIntro,@ZoneType,@DefaultSetting,@ZoneSetting,@ZoneWidth,@ZoneHeight,@Active,@ShowType,@UpdateTime)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_Active]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_ADZone_Active]
@ZoneID int
as
update dbo.ZL_AdZone set Active=1 where ZoneID=@ZoneID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE  proc [dbo].[dt_ADZone_Add]
@ZoneId int,
@ZoneName nvarchar(100),
@ZoneJSName nvarchar(100),
@ZoneIntro  nvarchar(255),
@ZoneType   int ,
@DefaultSetting bit,
@ZoneSetting nvarchar(255),
@ZoneWidth int ,
@ZoneHeight int,
@Active bit,
@ShowType int ,
@UpdateTime datetime
as 
insert dbo.ZL_AdZone values(@ZoneId,@ZoneName,@ZoneJSName,@ZoneIntro,@ZoneType,@DefaultSetting,@ZoneSetting,@ZoneWidth,@ZoneHeight,@Active,@ShowType,@UpdateTime)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_Pause]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[dt_ADZone_Pause]
@ZoneID int
as
update dbo.ZL_AdZone set Active=0 where ZoneID=@ZoneID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_Remove]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_ADZone_Remove]
@ZoneID int
as
delete dbo.ZL_AdZone from dbo.ZL_AdZone  where ZoneID=@ZoneID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_ADZone_Upadte]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create   proc [dbo].[dt_ADZone_Upadte]
@ZoneId int,
@ZoneName nvarchar(100),
@ZoneJSName nvarchar(100),
@ZoneIntro  nvarchar(255),
@ZoneType   int ,
@DefaultSetting bit,
@ZoneSetting nvarchar(255),
@ZoneWidth int ,
@ZoneHeight int,
@Active bit,
@ShowType int ,
@UpdateTime datetime
as 
update dbo.ZL_AdZone
set ZoneName=@ZoneName,ZoneJSName=@ZoneJSName,ZoneIntro=@ZoneIntro,
ZoneType=@ZoneType,DefaultSetting=@DefaultSetting,ZoneSetting=@ZoneSetting,ZoneWidth=@ZoneWidth,ZoneHeight=@ZoneHeight,Active=@Active,ShowType=@ShowType,UpdateTime=@UpdateTime
where ZoneID=@ZoneId

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_Advertisement_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE  proc [dbo].[dt_Advertisement_Add] 
@ADID int,
@UserID int,
@ADType int,
@ADName nvarchar(100),
@ImgUrl nvarchar(255),
@ImgWidth int ,
@ImgHeight int,
@FlashWmode int,
@ADIntro  ntext,
@LinkUrl nvarchar(255),
@LinkTarget int,
@LinkAlt nvarchar(255),
@Priority int,
@Setting ntext,
@CountView bit,
@Views int,
@CountClick bit,
@Clicks int,
@Passed bit,
@OverdueDate datetime
as insert dbo.ZL_Advertisement values(@ADID,@UserID,@ADType,@ADName,@ImgUrl,@ImgWidth,@ImgHeight,@FlashWmode,@ADIntro,@LinkUrl,@LinkTarget,@LinkAlt,@Priority,@Setting,@CountView,@Views,@CountClick,@Clicks,@Passed,@OverdueDate)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_Advertisement_CancelPassed]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_Advertisement_CancelPassed]
@strAdId int
as update dbo.ZL_Advertisement set Passed=0 where ADID=@strAdId

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_Advertisement_Passed]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_Advertisement_Passed]
@strAdId int
as update dbo.ZL_Advertisement set Passed=1 where ADID=@strAdId

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_Advertisement_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE  proc [dbo].[dt_Advertisement_Update] 
@ADID int,
@UserID int,
@ADType int,
@ADName nvarchar(100),
@ImgUrl nvarchar(255),
@ImgWidth int ,
@ImgHeight int,
@FlashWmode int,
@ADIntro  ntext,
@LinkUrl nvarchar(255),
@LinkTarget int,
@LinkAlt nvarchar(255),
@Priority int,
@Setting ntext,
@CountView bit,
@Views int,
@CountClick bit,
@Clicks int,
@Passed bit,
@OverdueDate datetime
as update dbo.ZL_Advertisement set
UserID=@UserID,ADType=@ADType
,ADName=@ADName,
ImgUrl=@ImgUrl,ImgWidth=@ImgWidth,ImgHeight=@ImgHeight,FlashWmode=@FlashWmode
,ADIntro=@ADIntro,LinkUrl=@LinkUrl,LinkTarget=@LinkTarget,LinkAlt=@LinkAlt,
Priority=@Priority,Setting=@Setting,CountView=@CountView,
[Views]=@Views,CountClick=@CountClick,Clicks=@Clicks,Passed=@Passed,OverdueDate=@OverdueDate
where ADID=@ADID

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_Advertisement_remove]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create proc [dbo].[dt_Advertisement_remove]
@strAdId  int
as 
delete ZL_Advertisement  from  ZL_Advertisement 
where  ADID=@strAdId

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dt_advertisement_copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE  proc [dbo].[dt_advertisement_copy] 
@ad int
as 
declare
@ADID int,
@UserID int,
@ADType int,
@ADName nvarchar(100),
@ImgUrl nvarchar(255),
@ImgWidth int ,
@ImgHeight int,
@FlashWmode int,
@ADIntro  nvarchar(255),
@LinkUrl nvarchar(255),
@LinkTarget int,
@LinkAlt nvarchar(255),
@Priority int,
@Setting nvarchar(255),
@CountView bit,
@Views int,
@CountClick bit,
@Clicks int,
@Passed bit,
@OverdueDate datetime
select @UserID=UserID,@ADType=ADType,@ADName=''复制''+ADName,@ImgUrl=ImgUrl,
@ImgWidth=ImgWidth,@ImgHeight=ImgHeight,@FlashWmode=FlashWmode,@ADIntro=ADIntro,
@LinkUrl=LinkUrl,@LinkTarget=LinkTarget,@LinkAlt=LinkAlt,
@Priority=Priority,@Setting=Setting,@CountView =CountView,@Views=[Views],@CountClick=CountClick,
@Clicks=Clicks,@Passed=Passed,@OverdueDate=OverdueDate
from dbo.ZL_Advertisement where ADID=@ad
select @ADID=max(ADID)+1 from dbo.ZL_Advertisement
insert dbo.ZL_Advertisement values(@ADID,@UserID,@ADType,@ADName,@ImgUrl,@ImgWidth,@ImgHeight,@FlashWmode,@ADIntro,@LinkUrl,@LinkTarget,@LinkAlt,@Priority,@Setting,@CountView,@Views,@CountClick,@Clicks,@Passed,@OverdueDate)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Author_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Author_Update]
(
    @ID int,
    @UserId int,
    @Name varchar(50),
    @Type varchar(50),
    @Passed bit,
    @onTop bit,
    @IsElite bit,
    @Hits int,
    @LastUseTime DateTime,
    @TemplateID int,
    @Photo varchar(255),
    @Intro nvarchar(255),
    @Address varchar(50),
    @Tel varchar(50),
    @Fax varchar(50),
    @Mail varchar(50),
    @Email varchar(50),
    @ZipCode int,
    @HomePage varchar(50),
    @Im varchar(50),
    @Sex smallint,
    @BirthDay DateTime,
    @Company varchar(50),
    @Department varchar(50)
)
AS
	IF @ID > 0
	BEGIN

		UPDATE ZL_Author SET
		UserID=@UserId,Type=@Type,[Name]=@Name,Passed=@Passed,onTop=@onTop,IsElite=@IsElite,Hits=@Hits,LastUseTime=@LastUseTime,TemplateID=@TemplateID,Photo=@Photo,Intro=@Intro,Address=@Address,Tel=@Tel,Fax=@Fax,Mail=@Mail,Email=@Email,ZipCode=@ZipCode,HomePage=@HomePage,Im=@Im,Sex=@Sex,BirthDay=@BirthDay,Company=@Company,Department=@Department
		WHERE ID=@ID
		
	END

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Author_GetAuthorInfoByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Author_GetAuthorInfoByID]
(
	@ID int
)
AS
    IF @ID > 0
    BEGIN
        SELECT
		ID,
		UserID,
		Type,
		[Name],
		Passed,
		onTop,
		IsElite,
		Hits,
		LastUseTime,
		TemplateID,
		Photo,
		Intro,
		Address,
		Tel,
		Fax,
		Mail,
		Email,
		ZipCode,
		HomePage,
		Im,
		Sex,
		BirthDay,
		Company,
		Department
		FROM ZL_Author WHERE ID=@ID
	END
	
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Author_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Author_Delete] 
(
    @ID nvarchar(100)
)
AS	
	IF @ID IS NOT NULL 
	BEGIN
		DELETE FROM ZL_Author WHERE ID in(@ID) 
	END

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Author_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_Author_Add] 
(   @ID int, 	
    @UserId int,
    @Name varchar(50),
    @Type varchar(50),
    @Passed bit,
    @onTop bit,
    @IsElite bit,
    @Hits int,
    @LastUseTime DateTime,
    @TemplateID int,
    @Photo varchar(255),
    @Intro nvarchar(255),
    @Address varchar(50),
    @Tel varchar(50),
    @Fax varchar(50),
    @Mail varchar(50),
    @Email varchar(50),
    @ZipCode int,
    @HomePage varchar(50),
    @Im varchar(50),
    @Sex smallint,
    @BirthDay DateTime,
    @Company varchar(50),
    @Department varchar(50)
)
AS

	INSERT INTO
	ZL_Author(UserID,Type,[Name],Passed,onTop,IsElite,Hits,LastUseTime,TemplateID,Photo,Intro,Address,Tel,Fax,Mail,Email,ZipCode,HomePage,Im,Sex,BirthDay,Company,Department) VALUES(@UserId,@Type,@Name,@Passed,@onTop,@IsElite,@Hits,@LastUseTime,@TemplateID,@Photo,@Intro,@Address,@Tel,@Fax,@Mail,@Email,@ZipCode,@HomePage,@Im,@Sex,@BirthDay,@Company,@Department)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ClientRequire_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[PR_ClientRequire_Add]
(
@RequireID int,
@Require ntext,
@UserID int,
@ReuqireDate datetime
)
AS
INSERT INTO ZL_ClientRequire (Require,UserID,ReuqireDate ) VALUES (@Require,@UserID,@ReuqireDate)

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_ClientRequire_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[PR_ClientRequire_Delete]
	@ID int
AS
	/* SET NOCOUNT ON */ 
	delete from [ZL_ClientRequire] where RequireID=@ID
	RETURN

' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Comment_ByNodeAudit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Comment_ByNodeAudit]
(
@Audited bit,
@NodeID int
)
AS
select A.*,B.Title from ZL_Comment A left outer join ZL_CommonModel B on A.GeneralID=B.GeneralID where A.Audited =@Audited and B.NodeID=@NodeID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Comments_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Comments_Add]
(
@CommentID int,
@GeneralID int,
@Title nvarchar(255),
@Contents nvarchar(300),
@Audited bit,
@UserID int,
@CommentTime datetime,
@Score int,
@PK bit
)
AS
INSERT INTO ZL_Comment (GeneralID,Title,Contents,Audited,UserID,CommentTime,Score,PK) VALUES (@GeneralID,@Title,@Contents,@Audited,@UserID,@CommentTime,@Score,@PK)
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Comments_Audit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Comments_Audit]
(
@CommentID int
)
AS
UPDATE ZL_Comment SET Audited=1 where CommentID=@CommentID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Comments_Del]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Comments_Del]
(
@CommentID int
)
AS
    Delete from ZL_Comment where CommentID=@CommentID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_Reset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_Reset]
(
	@GeneralID int
)
AS
UPDATE  ZL_CommonModel SET
	Status=0
	Where GeneralID=@GeneralID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_ResetAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_ResetAll]
AS
UPDATE  ZL_CommonModel SET
	Status=0
	Where Status=-2
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_SetAudit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_SetAudit]
(
	@GeneralID int
)
AS
UPDATE  ZL_CommonModel SET
	Status=99
	Where GeneralID=@GeneralID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_SetDel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_SetDel]
(
	@GeneralID int
)
AS
UPDATE  ZL_CommonModel SET
	Status=-2
	Where GeneralID=@GeneralID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_CreateDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_CreateDate]
(
	@startTime datetime,
	@endTime datetime
)
AS
	select * from ZL_CommonModel Where (CreateTime between @startTime and @endTime) and IsCreate=0 order by GeneralID Desc
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_CreateID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_CreateID]
(
	@startID int,
	@endID int
)
AS
	select * from ZL_CommonModel Where (GeneralID between @startID and @endID) and IsCreate=0 order by GeneralID Desc
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_Common]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_Common]
(
	@GeneralID int
)
AS
Select * from ZL_CommonModel
	Where GeneralID=@GeneralID
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PR_Content_CreateAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[PR_Content_CreateAll]
 AS
	Select * from ZL_CommonModel Where IsCreate=0
' 
END
