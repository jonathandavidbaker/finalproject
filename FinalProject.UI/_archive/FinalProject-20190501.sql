IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
DROP TABLE [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
DROP TABLE [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
DROP TABLE [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
DROP TABLE [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/1/2019 8:45:53 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](200) NOT NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[ValidFor] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ManagerID] [nvarchar](128) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonTitle] [varchar](200) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Introduction] [varchar](300) NULL,
	[VideoURL] [varchar](250) NULL,
	[PdfFileName] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 5/1/2019 8:45:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[LessonID] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201904221751046_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2DBB61323E30BA6ED45DE066C89DD5646A2B412E5B5B1D82FCB433E29BF90A2445D78D3A55BEE6E2F16584C8BE4A962F1902C168BFEDF7FFE3BFDE1250CAC679CA47E44CEECA3C9A16D61E2469E4F5667764697DF7DB27FF8FE8F7F985E7AE18BF55359EF84D58396243DB39F288D4F1D27759F7088D249E8BB4994464B3A71A3D0415EE41C1F1EFECD393A723040D8806559D32F19A17E88F31FF073161117C73443C14DE4E120E5DFA1649EA35AB728C4698C5C7C665F7B18DAD2D7390AE3004F8A06B6751EF8089499E360695B889088220AAA9E3EA6784E9388ACE6317C40C1C36B8CA1DE120529E65D38ADABF7EDCDE131EB8D53372CA1DC2CA5513810F0E8849BC7919BAF6564BB321F18F0323716EB756EC4DA7E5FA2000C200B3C9D0509AB7C66DF5422CED3F816D349D97052405E2500F74B947C9B34110FACDEED0E2A3A1D4F0ED97F07D62C0B6896E03382339AA0E0C0BACF1681EFFE13BF3E44DF30393B395A2C4F3E7DF888BC938F7FC5271F9A3D85BE423DE1037CBA4FA21827A01B5E56FDB72D476CE7C80DAB668D368555804B30336CEB06BD7CC664459F60CE1C7FB2AD2BFF057BE5174EAE47E2C344824634C9E0E76D16046811E0AADC6995C9FEDF22F5F8C3C751A4DEA2677F950FBD241F264E02F3EA0B0EF2D2F4C98F8BE9258CF7575EED2A8942F65BE45751FA751E6589CB3A1319AB3CA06485A9A8DDD4A9C9DB8BD20C6A7C5A97A8FB4F6DA6A94A6F6D55D6A17566422962DBB3A1D4F76DE5F666DC791CC3E0E5D4621669239C76BF9A480007A03A410174FADFD8A593C7EB9A41477D1944A067BFE705F132447E30C28AD8430AF8234B3F0971D5CB1F23E01F228375BE47690A0B82F70F943EB5A80EFF1C41F53976B384318D02D5DE5CDAFD5344F06D162E18FDB7276BB4A179F825BA422E8D924BC25A6D8CF73972BF4519BD24DE05A2F891BA2520FBF9E087FD014651E7DC75719A5E0199B1378BC0DD2E01AF093D391E0CC716A95D7B24B300F9A1DE259196D3AF65D5DA2DD1D7505C1343359D7BD2A6EAE768E5937EAA9655CDAA16353A55E5D586AACAC0FA69CA6B9A15CD2B74EA59D41ACDE1CB47687C8F2F87DD7F976FB3CDDBB41634CC38871512FF1D139CC032E6DD234A7142EA11E8B36EECC259C8878F097DF3BD2997F4130AB2B145AD351BF24560FCD990C3EEFF6CC8D584CFCFBEC7BC921EE7A0B232C0F7AAAF3F6275CF3949B36D4F07A19BDB16BE9D35C0345DCED33472FD7C166822603C7E21EA0F3E9CD51DCC287A230744A06340749F6D79F005FA66CBA4BA231738C0145BE76E11219CA1D4459E6A46E8903740B17247D52856074644E5FEA2C804A6E3843542EC1094C24CF50955A7854F5C3F4641A795A4963DB730D6F74A865C7281634C98C04E4BF411AE8F8330052A39D2A0745968EA3418D74E4483D76A1AF32E17B61E77253CB1154E76F8CE065E72FFED4D88D96EB12D90B3DD247D1430C6F47641507E56E94B00F9E0B26F04954E4C068272976A2B04152DB603828A267977042D8EA87DC75F3AAFEE1B3DC583F2F6B7F55673ED809B823DF68C9A85EF096D28B4C0894ACF8B052BC42F547338033DF9F92CE5AEAE4C91FC020153316453FBBB5A3FD469079149D4065813AD0394DF062A40CA841AA05C19CB6BD58E7B110360CBB85B2B2C5FFB25D8060754ECE6AD68A3A2F9EE542667AFD347D5B38A0D0AC97B1D161A381A42C88B97D8F11E4631C56555C3F4F1858778C38D8EF1C168315087E76A3052D999D1AD5452B3DB4A3A876C884BB6919524F7C960A5B233A35B8973B4DB481AA760805BB09189C42D7CA4C956463AAADDA62A9B3A45BE14FF30750C8955D31B14C73E593512ADF8176B5E6459CDBE9B0FCF3D0A0B0CC74D35294895B695241A256885A552100D9A5EF9494A2F10450BC4E23C332F54AA69F756C3F25F8A6C6E9FEA2096FB40599BFD5B5CDBC53B7C61BB55FD110E73059D0C99539347D23514D037B758EE1B0A50A209DECFA2200B89D9C732B72EAEF09AED8B2F2AC2D491F4577C28C5608AA72B5ABFD7D8A8F362BC71AABC98F5C7CA0C61B278E983366D6EF24BCD286598AA89620A5DED6CEC4CEECCD0F1929DC5E1C3D589F036B38B67A83401F8A781188D240705AC51D61F55CC4369628A25FD11A5649326A4543440CB664A89A064B3602D3C8345F535FA4B5093489AE86A697F644D3A49135A53BC06B64667B9AC3FAA26E3A409AC29EE8F5DA79FC8EBE81EEF5FC623CC261B5871D0DD6C073360BCCDA238CE06D8B8CF6F02353E0FC4E237F60A18FFBE9784329EF636215411E2D88C50060CF3FA235C868BCB4FEB0DBE1953B8E11696F8B61B7E33DE30DABE293994F39E5CA5925E9DFBA4F3DD949FB5BA5FD72887AFA28A6D956684EDFD35A5389CB00A93F9CFC12CF0315BCCCB0A3788F84B9CD222ABC33E3E3C3A965EE7ECCF4B19274DBD407356353D9711C76C0B095AE41925EE134AD474890D5E93D4A04A24FA9A78F8E5CCFE356F759A0735D8BFF2CF07D675FA48FC9F33287848326CFDA6A67F8E935DDF7EDADAD3B710FDAD7AFDAFAF45D303EB2E8119736A1D4AB65C6784C5171283B4299A6EA0CDDAEF26DEEF84125E236851A509B1FEE383854F477978506AF9A710BDFC79A86ADAC7051B216A1E108C85378A094D0F04D6C1323E0EF0E027CD1F070CEBACFEB1C03AAA191F0AF8643898FC4CA0FF3254B6DCE156A339166D6349CAEDDC9966BD51CEE5AEF726251B7BA389AE665C0F80DB20AB7A0D66BCB384E4D176474DBEF168D8BBA4F69B2719EF4B5E719DF1B1DB74E26D6610B7DC0FFDAE1287F720D54D93BAB3FBF4E06D73CD14CADDF31CCB6149C07B46369ED0B5FB54DF6D93CD14E6DD73B20D4AE8DD33AEED6AFFDC31D37A6FA13B4FCF55338D0C5732BA587057FA6D11388713FE220212141E65F16A529FEF65125693C528B0AE62166A4E3493052B134791ABD468173BACAF7CC36FED2CAFD32ED6909ED9269BAFFFADB2799D76D986A4C75D240E6BD30E75C9DC1DEB585B36D47B4A14167AD29197DEE5B3B6DEAFBFA7BCE0518C22CC1EC31DF1FB49031EC524634E9D0169BFEA752FEC9D8D3FB908FB77EAAF6A08F607180976855DB3AA734D9651B9794B1A9555A408CD0DA6C8832DF53CA1FE12B9148A598C397FF69DC7EDD84DC7027BD7E42EA37146A1CB385C0442C08B39016DF2F3DC6651E7E95D9CFF059331BA006AFA2C367F477ECCFCC0ABF4BED2C4840C10CCBBE0115D369694457657AF15D26D447A0271F3554ED1030EE300C0D23B3247CF781DDD807E9FF10AB9AF7504D004D23D10A2D9A7173E5A25284C3946DD1E7E0287BDF0E5FBFF0372A1C30879540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fffe3d06-1232-4fe1-88ff-1df617e76641', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'01fcab48-e1f1-428f-8e55-76029894a85e', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3a15af22-fde3-4268-b4d4-179243f7d8f0', N'01fcab48-e1f1-428f-8e55-76029894a85e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10', N'01fcab48-e1f1-428f-8e55-76029894a85e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0c212dda-8e9e-48d9-82d7-3a2d399654c4', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2889ad5d-d779-47e8-9bf1-d819095fba1f', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'58e23236-0538-4c62-954c-e499846f2530', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a52bd017-fb83-4aaf-8b6a-02f067b29ce2', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd49963e0-a133-4ab3-8ea7-9c41f003998e', N'fccfa2d3-fb8d-4f3e-850e-1c6af2e148ca')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'059ce4c1-5c6e-4e7b-a1e1-67efac7baabb', N'fffe3d06-1232-4fe1-88ff-1df617e76641')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'059ce4c1-5c6e-4e7b-a1e1-67efac7baabb', N'admin@agency.com', 0, N'ALb8QY2TL+Haod9Vt5hqJUCqRdeggycyQzC1Okng2vpnBnNFnGxb1Q+cIv53hJP/Lw==', N'2bc2ddab-2f39-4322-a49f-7ea24be550ff', NULL, 0, 0, NULL, 1, 0, N'admin@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0c212dda-8e9e-48d9-82d7-3a2d399654c4', N'eogbah@agency.com', 1, N'AFxZDIqQzlojTFQ/5I2Nor65xan9mhN9IuuDdVcwuMeoTBjEQLy0O3Onkt0ayozKpw==', N'6e0357d6-ec20-4a21-b871-29a6af789513', NULL, 0, 0, NULL, 1, 0, N'eogbah@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', N'tkelce@agency.com', 1, N'ANuDIYAe/CW5GAO9amEOkbIDyPmYScLdyGeZ0KS59LnQ61snfdwq+yMxWQmEt26mZA==', N'839a20b5-c871-4788-9de8-001be340a3d3', NULL, 0, 0, NULL, 1, 0, N'tkelce@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2889ad5d-d779-47e8-9bf1-d819095fba1f', N'mschwartz@agency.com', 1, N'AI89djAdbAAhjlKCAZOXdHewYhYk4PW/W57DN4x5XAe28Pdqsrq3jdPkUqHLR3Jr6Q==', N'88189123-c701-47c7-b980-e69a7f9c431d', NULL, 0, 0, NULL, 1, 0, N'mschwartz@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3a15af22-fde3-4268-b4d4-179243f7d8f0', N'spags@agency.com', 1, N'AEFUBKmlOAQVtENtPjbVkFfStNAW/PrjLLTWIN9f1gLHh3NCz3n0XV/t/xXoi/DUvg==', N'7a23565c-6505-460c-8de7-b6aafae71397', NULL, 0, 0, NULL, 1, 0, N'spags@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'58e23236-0538-4c62-954c-e499846f2530', N'pmahomes@agency.com', 1, N'ALhRhZUR/sB19Q/6pW4f5DyHpWq2TSs88Idfe5NAXimerDqctY8vMyzwWbjH11B1dA==', N'03a8cc77-e9dc-47a6-bd5c-e1a20e7bcd3e', NULL, 0, 0, NULL, 1, 0, N'pmahomes@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a52bd017-fb83-4aaf-8b6a-02f067b29ce2', N'honeybadger@agency.com', 1, N'AP7CfW2Vvr21pLC+y26iQpcreNpTb5JqjCllqMKAolh6+M40GuzqZiuQXc5hQy9XDQ==', N'675fc248-40dc-48c0-82dd-6b3af4cbf28b', NULL, 0, 0, NULL, 1, 0, N'honeybadger@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10', N'bigred@agency.com', 1, N'ANPcSco5LjSDRaKky3iHXo0HkiFZJ1vGyq2Nt43U+YQGQETs9KTTd9h7pXbACrEQhA==', N'dc66b07c-ed0d-46bb-b1f2-4768048fcb66', NULL, 0, 0, NULL, 1, 0, N'bigred@agency.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd49963e0-a133-4ab3-8ea7-9c41f003998e', N'cjones@agency.com', 1, N'AIOJPbB88olxyZocRqhco4iUQEcPkTqi26n4USOGbINhnmKHWVfpTXE5su8lDBBNtQ==', N'14dc3a27-5db7-48ef-b8c1-5deda7ca234e', NULL, 0, 0, NULL, 1, 0, N'cjones@agency.com')
SET IDENTITY_INSERT [dbo].[CourseCompletions] ON 

INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 3, CAST(0x943F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 1004, CAST(0x943F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1003, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1004, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1005, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 1003, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1006, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1007, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 1004, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1008, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1004, CAST(0x953F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (1009, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 3, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2008, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1002, CAST(0x963F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2009, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2, CAST(0x963F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2010, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1003, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (2011, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2, CAST(0x983F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3008, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3009, N'58e23236-0538-4c62-954c-e499846f2530', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3010, N'58e23236-0538-4c62-954c-e499846f2530', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3011, N'58e23236-0538-4c62-954c-e499846f2530', 1002, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3012, N'58e23236-0538-4c62-954c-e499846f2530', 1003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3013, N'58e23236-0538-4c62-954c-e499846f2530', 1004, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3014, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 1004, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3015, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3016, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3017, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (3018, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (4009, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 1002, CAST(0x993F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (4010, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 3, CAST(0x9A3F0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (4011, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 1002, CAST(0x3C3E0B00 AS Date))
INSERT [dbo].[CourseCompletions] ([CourseCompletionID], [UserID], [CourseID], [DateCompleted]) VALUES (5009, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 1003, CAST(0x9A3F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseCompletions] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (2, N'Level 1 Medical Aide', N'This course is required for any staff who will be administering medications.  You will learn the basics of different types of medications, methods of administration, and proper documentation.', 1, 2)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (3, N'First Aid/CPR', N'This course is required for all staff.  You will learn how to perform Cardiopulmonary resuscitation and First Aid so that you are prepared in an emergency situation.', 1, 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (1002, N'HIPAA', N'This course is required for all staff.  The Health Insurance Portability and Accountability Act of 1996 ensures that every patient''s personal information is kept private.  It is vital to understand this law.', 1, 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (1003, N'Blood-borne Pathogens', N'This course is required for all staff.  You will learn about blood-borne diseases and proper use of personal protective equipment.', 1, 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (1004, N'Orientation', N'Welcome to the world of Direct Support!  This is a very challenging and rewarding career.  Please view the course materials to familiarize yourself with the job.', 1, 100)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [IsActive], [ValidFor]) VALUES (2002, N'MANDT Conflict Resolution', NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'0c212dda-8e9e-48d9-82d7-3a2d399654c4', N'Emmanuel', N'Ogbah', N'3a15af22-fde3-4268-b4d4-179243f7d8f0')
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', N'Travis', N'Kelce', N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10')
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'2889ad5d-d779-47e8-9bf1-d819095fba1f', N'Mitch', N'Schwartz', N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10')
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'3a15af22-fde3-4268-b4d4-179243f7d8f0', N'Steve', N'Spagnuolo', NULL)
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'58e23236-0538-4c62-954c-e499846f2530', N'Patrick', N'Mahomes', N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10')
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'a52bd017-fb83-4aaf-8b6a-02f067b29ce2', N'Tyrann', N'Mathieu', N'3a15af22-fde3-4268-b4d4-179243f7d8f0')
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'ba6d7325-92c8-4c69-8147-6e62a3e0ca10', N'Andy', N'Reid', NULL)
INSERT [dbo].[Employees] ([UserID], [FirstName], [LastName], [ManagerID]) VALUES (N'd49963e0-a133-4ab3-8ea7-9c41f003998e', N'Chris', N'Jones', N'3a15af22-fde3-4268-b4d4-179243f7d8f0')
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2, N'First Aid', 3, N'It is important to be able to act quickly in the event of a medical emergency.  This lesson will teach you the basics of first aid so that you are prepared in the event of an emergency.', N'qahukkDYFbk', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (3, N'CPR', 3, N'Cardiopulmonary resuscitation is a vital skill for anyone in the medical field.  It can mean the difference between life and death.  ', N'1lwRQTGzKcw', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (1003, N'Personal Protective Equipment', 1003, N'PPE is the first line of defense against blood-borne illnesses and disease.  Learn about its importance and use to make sure you''re keeping yourself and the individuals you support safe every day.', N'quwzg7Vixsw', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (1006, N'Orientation', 1004, N'This video is an excellent introduction to the world of Direct Support.  Learn about what it takes to be Direct Support Staff and what you can expect day to day on the job.', N'cMPuLBC2m_4', N'Not Available', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (1007, N'Missouri HIPAA Requirements', 1002, N'Learn about Missouri''s HIPAA requirements to make sure that you don''t violate anyone''s privacy, which could result in legal action.', N'ok7BTXhKr50', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2002, N'Blood-borne Pathogens', 1003, N'There are a wide variety of illnesses and diseases that can be transmitted through blood and other bodily fluids.  Educate yourself on how to prevent the spread of such diseases.', N'yeGX4KuIslM', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2003, N'Medication Administration', 2, N'This lesson covers how to read a prescription and administer the proper medication and dosage.  Learn about the 7 "Rights" of medication administration and ensure that you do not commit a medication error.', N'A0ERiuySzFg', N'This is a blank document.pdf', 1)
INSERT [dbo].[Lessons] ([LessonID], [LessonTitle], [CourseID], [Introduction], [VideoURL], [PdfFileName], [IsActive]) VALUES (2005, N'Documentation and the MAR', 2, N'Documentation is of vital importance in this field.  If you don''t document it, it didn''t happen!  Learn how to properly document all medication administration and any other medical issues here.', N'NIXPawTZd08', N'This is a blank document.pdf', 1)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[LessonViews] ON 

INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (1, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 2, CAST(0x923F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 3, CAST(0x923F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (1002, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 2, CAST(0x933F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (1003, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 3, CAST(0x933F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (1005, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 1003, CAST(0x933F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2002, N'4096eea0-5d06-44eb-83f2-f9cf74ddd57b', 2, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2003, N'4096eea0-5d06-44eb-83f2-f9cf74ddd57b', 3, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2005, N'4096eea0-5d06-44eb-83f2-f9cf74ddd57b', 1006, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2006, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 2, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2007, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 3, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2008, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 3, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2009, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 3, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2010, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 1006, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2012, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 1007, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (2013, N'0f66f3a4-2d16-43c3-a899-848b30c207e8', 1006, CAST(0x943F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3013, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 2, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3014, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3015, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 1003, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3016, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 1006, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3017, N'0a705e5c-2111-4f07-ba36-c59cf483144b', 1007, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3019, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3020, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3021, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3022, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3023, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 1006, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3024, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 1003, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3025, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2002, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3026, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 1007, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3027, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 1006, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3028, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1006, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3029, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3030, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3031, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1006, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3032, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1007, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3033, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (3034, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 3, CAST(0x953F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4031, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1007, CAST(0x963F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4032, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1006, CAST(0x963F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4033, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1006, CAST(0x963F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4034, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 1003, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4035, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2003, CAST(0x963F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4037, N'a0b8ffe1-07b6-4d51-8cb4-897ed1a79c8d', 2003, CAST(0x963F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4038, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2003, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4039, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4040, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 3, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4041, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2005, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (4042, N'0266d798-88d7-4ebe-bd59-e3fcd8e7b542', 2002, CAST(0x983F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5031, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 2003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5032, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 2005, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5033, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5034, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5035, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 1007, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5036, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 1003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5037, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 2002, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5038, N'9fc0938f-5250-49b6-b2d4-149f0472d8c8', 1006, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5039, N'58e23236-0538-4c62-954c-e499846f2530', 2003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5040, N'58e23236-0538-4c62-954c-e499846f2530', 2005, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5041, N'58e23236-0538-4c62-954c-e499846f2530', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5042, N'58e23236-0538-4c62-954c-e499846f2530', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5043, N'58e23236-0538-4c62-954c-e499846f2530', 1007, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5044, N'58e23236-0538-4c62-954c-e499846f2530', 1003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5045, N'58e23236-0538-4c62-954c-e499846f2530', 2002, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5046, N'58e23236-0538-4c62-954c-e499846f2530', 1006, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5047, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 2003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5048, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 1006, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5049, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 2, CAST(0x9A3F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5050, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 2003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5051, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 2005, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5052, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5053, N'2889ad5d-d779-47e8-9bf1-d819095fba1f', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5054, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 2003, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5055, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 2005, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5056, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 2, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (5057, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 3, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (6040, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 1007, CAST(0x993F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (6041, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 3, CAST(0x9A3F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (6042, N'237a54c4-0aaa-4d57-9926-cb7c6a7d832d', 1007, CAST(0x9A3F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (7040, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 2002, CAST(0x9A3F0B00 AS Date))
INSERT [dbo].[LessonViews] ([LessonViewID], [UserID], [LessonID], [DateViewed]) VALUES (7041, N'd49963e0-a133-4ab3-8ea7-9c41f003998e', 1003, CAST(0x9A3F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[LessonViews] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
