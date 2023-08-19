/*
 Navicat Premium Data Transfer

 Source Server         : 001
 Source Server Type    : SQL Server
 Source Server Version : 10504000
 Source Catalog        : aabbc
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10504000
 File Encoding         : 65001

 Date: 18/08/2023 21:19:40
*/


-- ----------------------------
-- Table structure for xy_admin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_admin]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_admin]
GO

CREATE TABLE [dbo].[xy_admin] (
  [id] int  IDENTITY NOT NULL,
  [username] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pwd] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [nickname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [level] int DEFAULT 0 NULL,
  [permission] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pic] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sex] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '男' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [flags] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [grouping] int DEFAULT -1 NULL,
  [isiplimit] int DEFAULT 1 NULL,
  [iplimitlist] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [loginstatus] int DEFAULT 0 NULL,
  [lastlogintime] datetime DEFAULT getdate() NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [regip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [upip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_admin] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_admin
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_admin] ON
GO

INSERT INTO [dbo].[xy_admin] ([id], [username], [pwd], [nickname], [level], [permission], [pic], [sex], [email], [tel], [isthrough], [flags], [grouping], [isiplimit], [iplimitlist], [loginstatus], [lastlogintime], [createtime], [updatetime], [regip], [upip], [bodycontent]) VALUES (N'0', N'admin', N'c3284d0f94606de1fd2af172aba15bf3', N'小孙', N'1', N'', N'', N'男', N'', N'', N'1', N'|*|', N'-1', N'1', N'', N'0', N'2023-08-18 21:18:36.507', N'2023-08-18 21:18:36.507', N'2023-08-18 21:18:36.507', N'', N'127.0.0.1', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_admin] OFF
GO


-- ----------------------------
-- Table structure for xy_articlecount
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articlecount]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articlecount]
GO

CREATE TABLE [dbo].[xy_articlecount] (
  [id] int  IDENTITY NOT NULL,
  [articleid] int DEFAULT -1 NULL,
  [memberid] int DEFAULT -1 NULL,
  [type] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [count] int DEFAULT 1 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articlecount] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articlecount
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articlecount] ON
GO

SET IDENTITY_INSERT [dbo].[xy_articlecount] OFF
GO


-- ----------------------------
-- Table structure for xy_articledetail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articledetail]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articledetail]
GO

CREATE TABLE [dbo].[xy_articledetail] (
  [id] int  IDENTITY NOT NULL,
  [parentid] int DEFAULT -1 NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [filename] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [views] int DEFAULT 0 NULL,
  [fabulous] int DEFAULT 0 NULL,
  [good] int DEFAULT 0 NULL,
  [bad] int DEFAULT 0 NULL,
  [smallimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bigimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [author] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [flags] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webtitle] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webkeywords] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webdescription] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tags] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [price] float(53) DEFAULT 0 NULL,
  [nbuy] int DEFAULT 0 NULL,
  [tempdataid] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [aboutcontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articledetail] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articledetail
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articledetail] ON
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'0', N'2', N'你好', N'', N'0', N'0', N'0', N'0', N'0', N'', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:40.913', N'2023-08-18 21:18:40.913', N'', N'', N'你好，测试内容')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'1', N'27', N'企业-自适应网站模板500(初始版)', N'/tpl/TPL500/', N'200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500.jpg', N'', N'TPL500', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:40.947', N'2023-08-18 21:18:40.947', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'2', N'27', N'企业-自适应网站模板500A(蓝色版)', N'/tpl/TPL500A/', N'300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500A.jpg', N'', N'TPL500A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:40.987', N'2023-08-18 21:18:40.987', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'3', N'27', N'企业-自适应网站模板500B(红色版)', N'/tpl/TPL500B/', N'400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500B.jpg', N'', N'TPL500B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:40.993', N'2023-08-18 21:18:40.993', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'4', N'27', N'企业-自适应网站模板500C(黄色版)', N'/tpl/TPL500C/', N'500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500C.jpg', N'', N'TPL500C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.007', N'2023-08-18 21:18:41.007', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'5', N'27', N'企业-自适应网站模板500D(紫色版)', N'/tpl/TPL500D/', N'600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500D.jpg', N'', N'TPL500D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.017', N'2023-08-18 21:18:41.017', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'6', N'27', N'企业-自适应网站模板500E(黑色版)', N'/tpl/TPL500E/', N'700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500E.jpg', N'', N'TPL500E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.027', N'2023-08-18 21:18:41.027', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'7', N'27', N'企业-自适应网站模板500F(绿色版)', N'/tpl/TPL500F/', N'800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500F.jpg', N'', N'TPL500F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.040', N'2023-08-18 21:18:41.040', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'8', N'27', N'企业-自适应网站模板500G(粉色版)', N'/tpl/TPL500G/', N'900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500G.jpg', N'', N'TPL500G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.053', N'2023-08-18 21:18:41.053', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'9', N'27', N'企业-自适应网站模板500H(浅绿色版)', N'/tpl/TPL500H/', N'1000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500H.jpg', N'', N'TPL500H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.063', N'2023-08-18 21:18:41.063', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'10', N'27', N'企业-自适应网站模板500K(其它版)', N'/tpl/TPL500K/', N'1100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500K.jpg', N'', N'TPL500K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.073', N'2023-08-18 21:18:41.073', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'11', N'27', N'企业-自适应网站模板501(初始版)', N'/tpl/TPL501/', N'1200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501.jpg', N'', N'TPL501', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.080', N'2023-08-18 21:18:41.080', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'12', N'27', N'企业-自适应网站模板501A(蓝色版)', N'/tpl/TPL501A/', N'1300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501A.jpg', N'', N'TPL501A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.093', N'2023-08-18 21:18:41.093', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'13', N'27', N'企业-自适应网站模板501B(红色版)', N'/tpl/TPL501B/', N'1400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501B.jpg', N'', N'TPL501B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.103', N'2023-08-18 21:18:41.103', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'14', N'27', N'企业-自适应网站模板501C(黄色版)', N'/tpl/TPL501C/', N'1500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501C.jpg', N'', N'TPL501C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.113', N'2023-08-18 21:18:41.113', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'15', N'27', N'企业-自适应网站模板501D(紫色版)', N'/tpl/TPL501D/', N'1600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501D.jpg', N'', N'TPL501D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.167', N'2023-08-18 21:18:41.167', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'16', N'27', N'企业-自适应网站模板501E(黑色版)', N'/tpl/TPL501E/', N'1700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501E.jpg', N'', N'TPL501E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.177', N'2023-08-18 21:18:41.177', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'17', N'27', N'企业-自适应网站模板501F(绿色版)', N'/tpl/TPL501F/', N'1800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501F.jpg', N'', N'TPL501F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.187', N'2023-08-18 21:18:41.187', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'18', N'27', N'企业-自适应网站模板501G(粉色版)', N'/tpl/TPL501G/', N'1900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501G.jpg', N'', N'TPL501G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.197', N'2023-08-18 21:18:41.197', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'19', N'27', N'企业-自适应网站模板501H(浅绿色版)', N'/tpl/TPL501H/', N'2000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501H.jpg', N'', N'TPL501H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.207', N'2023-08-18 21:18:41.207', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'20', N'27', N'企业-自适应网站模板501K(其它版)', N'/tpl/TPL501K/', N'2100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501K.jpg', N'', N'TPL501K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.220', N'2023-08-18 21:18:41.220', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'21', N'27', N'企业-自适应网站模板503(初始版)', N'/tpl/TPL503/', N'2200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503.jpg', N'', N'TPL503', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.240', N'2023-08-18 21:18:41.240', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'22', N'27', N'企业-自适应网站模板503A(蓝色版)', N'/tpl/TPL503A/', N'2300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503A.jpg', N'', N'TPL503A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.247', N'2023-08-18 21:18:41.247', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'23', N'27', N'企业-自适应网站模板503B(红色版)', N'/tpl/TPL503B/', N'2400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503B.jpg', N'', N'TPL503B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.260', N'2023-08-18 21:18:41.260', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'24', N'27', N'企业-自适应网站模板503C(黄色版)', N'/tpl/TPL503C/', N'2500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503C.jpg', N'', N'TPL503C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.270', N'2023-08-18 21:18:41.270', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'25', N'27', N'企业-自适应网站模板503D(紫色版)', N'/tpl/TPL503D/', N'2600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503D.jpg', N'', N'TPL503D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.280', N'2023-08-18 21:18:41.280', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'26', N'27', N'企业-自适应网站模板503E(黑色版)', N'/tpl/TPL503E/', N'2700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503E.jpg', N'', N'TPL503E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.290', N'2023-08-18 21:18:41.290', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'27', N'27', N'企业-自适应网站模板503F(绿色版)', N'/tpl/TPL503F/', N'2800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503F.jpg', N'', N'TPL503F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.300', N'2023-08-18 21:18:41.300', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'28', N'27', N'企业-自适应网站模板503G(粉色版)', N'/tpl/TPL503G/', N'2900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503G.jpg', N'', N'TPL503G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.310', N'2023-08-18 21:18:41.310', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'29', N'27', N'企业-自适应网站模板503H(浅绿色版)', N'/tpl/TPL503H/', N'3000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503H.jpg', N'', N'TPL503H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.323', N'2023-08-18 21:18:41.323', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'30', N'27', N'企业-自适应网站模板503K(其它版)', N'/tpl/TPL503K/', N'3100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503K.jpg', N'', N'TPL503K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.330', N'2023-08-18 21:18:41.330', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'31', N'27', N'企业-自适应网站模板504(初始版)', N'/tpl/TPL504/', N'3200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504.jpg', N'', N'TPL504', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.340', N'2023-08-18 21:18:41.340', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'32', N'27', N'企业-自适应网站模板504A(蓝色版)', N'/tpl/TPL504A/', N'3300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504A.jpg', N'', N'TPL504A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.360', N'2023-08-18 21:18:41.360', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'33', N'27', N'企业-自适应网站模板504B(红色版)', N'/tpl/TPL504B/', N'3400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504B.jpg', N'', N'TPL504B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.370', N'2023-08-18 21:18:41.370', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'34', N'27', N'企业-自适应网站模板504C(黄色版)', N'/tpl/TPL504C/', N'3500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504C.jpg', N'', N'TPL504C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.377', N'2023-08-18 21:18:41.377', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'35', N'27', N'企业-自适应网站模板504D(紫色版)', N'/tpl/TPL504D/', N'3600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504D.jpg', N'', N'TPL504D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.390', N'2023-08-18 21:18:41.390', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'36', N'27', N'企业-自适应网站模板504E(黑色版)', N'/tpl/TPL504E/', N'3700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504E.jpg', N'', N'TPL504E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.400', N'2023-08-18 21:18:41.400', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'37', N'27', N'企业-自适应网站模板504F(绿色版)', N'/tpl/TPL504F/', N'3800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504F.jpg', N'', N'TPL504F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.407', N'2023-08-18 21:18:41.407', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'38', N'27', N'企业-自适应网站模板504G(粉色版)', N'/tpl/TPL504G/', N'3900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504G.jpg', N'', N'TPL504G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.417', N'2023-08-18 21:18:41.417', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'39', N'27', N'企业-自适应网站模板504H(浅绿色版)', N'/tpl/TPL504H/', N'4000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504H.jpg', N'', N'TPL504H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.430', N'2023-08-18 21:18:41.430', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'40', N'27', N'企业-自适应网站模板504K(其它版)', N'/tpl/TPL504K/', N'4100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504K.jpg', N'', N'TPL504K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.437', N'2023-08-18 21:18:41.437', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'41', N'27', N'企业-自适应网站模板505(初始版)', N'/tpl/TPL505/', N'4200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505.jpg', N'', N'TPL505', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.447', N'2023-08-18 21:18:41.447', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'42', N'27', N'企业-自适应网站模板505A(蓝色版)', N'/tpl/TPL505A/', N'4300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505A.jpg', N'', N'TPL505A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.457', N'2023-08-18 21:18:41.457', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'43', N'27', N'企业-自适应网站模板505B(红色版)', N'/tpl/TPL505B/', N'4400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505B.jpg', N'', N'TPL505B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.467', N'2023-08-18 21:18:41.467', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'44', N'27', N'企业-自适应网站模板505C(黄色版)', N'/tpl/TPL505C/', N'4500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505C.jpg', N'', N'TPL505C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.477', N'2023-08-18 21:18:41.477', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'45', N'27', N'企业-自适应网站模板505D(紫色版)', N'/tpl/TPL505D/', N'4600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505D.jpg', N'', N'TPL505D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.490', N'2023-08-18 21:18:41.490', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'46', N'27', N'企业-自适应网站模板505E(黑色版)', N'/tpl/TPL505E/', N'4700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505E.jpg', N'', N'TPL505E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.497', N'2023-08-18 21:18:41.497', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'47', N'27', N'企业-自适应网站模板505F(绿色版)', N'/tpl/TPL505F/', N'4800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505F.jpg', N'', N'TPL505F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.507', N'2023-08-18 21:18:41.507', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'48', N'27', N'企业-自适应网站模板505G(粉色版)', N'/tpl/TPL505G/', N'4900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505G.jpg', N'', N'TPL505G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.520', N'2023-08-18 21:18:41.520', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'49', N'27', N'企业-自适应网站模板505H(浅绿色版)', N'/tpl/TPL505H/', N'5000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505H.jpg', N'', N'TPL505H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.530', N'2023-08-18 21:18:41.530', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'50', N'27', N'企业-自适应网站模板505K(其它版)', N'/tpl/TPL505K/', N'5100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505K.jpg', N'', N'TPL505K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.540', N'2023-08-18 21:18:41.540', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'51', N'27', N'企业-自适应网站模板506(初始版)', N'/tpl/TPL506/', N'5200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506.jpg', N'', N'TPL506', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.547', N'2023-08-18 21:18:41.547', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'52', N'27', N'企业-自适应网站模板506A(蓝色版)', N'/tpl/TPL506A/', N'5300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506A.jpg', N'', N'TPL506A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.560', N'2023-08-18 21:18:41.560', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'53', N'27', N'企业-自适应网站模板506B(红色版)', N'/tpl/TPL506B/', N'5400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506B.jpg', N'', N'TPL506B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.570', N'2023-08-18 21:18:41.570', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'54', N'27', N'企业-自适应网站模板506C(黄色版)', N'/tpl/TPL506C/', N'5500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506C.jpg', N'', N'TPL506C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.580', N'2023-08-18 21:18:41.580', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'55', N'27', N'企业-自适应网站模板506D(紫色版)', N'/tpl/TPL506D/', N'5600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506D.jpg', N'', N'TPL506D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.597', N'2023-08-18 21:18:41.597', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'56', N'27', N'企业-自适应网站模板506E(黑色版)', N'/tpl/TPL506E/', N'5700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506E.jpg', N'', N'TPL506E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.607', N'2023-08-18 21:18:41.607', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'57', N'27', N'企业-自适应网站模板506F(绿色版)', N'/tpl/TPL506F/', N'5800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506F.jpg', N'', N'TPL506F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.620', N'2023-08-18 21:18:41.620', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'58', N'27', N'企业-自适应网站模板506G(粉色版)', N'/tpl/TPL506G/', N'5900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506G.jpg', N'', N'TPL506G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.627', N'2023-08-18 21:18:41.627', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'59', N'27', N'企业-自适应网站模板506H(浅绿色版)', N'/tpl/TPL506H/', N'6000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506H.jpg', N'', N'TPL506H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.637', N'2023-08-18 21:18:41.637', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'60', N'27', N'企业-自适应网站模板506K(其它版)', N'/tpl/TPL506K/', N'6100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506K.jpg', N'', N'TPL506K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.647', N'2023-08-18 21:18:41.647', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'61', N'27', N'企业-自适应网站模板507(初始版)', N'/tpl/TPL507/', N'6200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507.jpg', N'', N'TPL507', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.660', N'2023-08-18 21:18:41.660', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'62', N'27', N'企业-自适应网站模板507A(蓝色版)', N'/tpl/TPL507A/', N'6300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507A.jpg', N'', N'TPL507A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.667', N'2023-08-18 21:18:41.667', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'63', N'27', N'企业-自适应网站模板507B(红色版)', N'/tpl/TPL507B/', N'6400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507B.jpg', N'', N'TPL507B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.677', N'2023-08-18 21:18:41.677', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'64', N'27', N'企业-自适应网站模板507C(黄色版)', N'/tpl/TPL507C/', N'6500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507C.jpg', N'', N'TPL507C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.687', N'2023-08-18 21:18:41.687', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'65', N'27', N'企业-自适应网站模板507D(紫色版)', N'/tpl/TPL507D/', N'6600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507D.jpg', N'', N'TPL507D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.697', N'2023-08-18 21:18:41.697', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'66', N'27', N'企业-自适应网站模板507E(黑色版)', N'/tpl/TPL507E/', N'6700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507E.jpg', N'', N'TPL507E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.707', N'2023-08-18 21:18:41.707', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'67', N'27', N'企业-自适应网站模板507F(绿色版)', N'/tpl/TPL507F/', N'6800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507F.jpg', N'', N'TPL507F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.717', N'2023-08-18 21:18:41.717', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'68', N'27', N'企业-自适应网站模板507G(粉色版)', N'/tpl/TPL507G/', N'6900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507G.jpg', N'', N'TPL507G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.727', N'2023-08-18 21:18:41.727', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'69', N'27', N'企业-自适应网站模板507H(浅绿色版)', N'/tpl/TPL507H/', N'7000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507H.jpg', N'', N'TPL507H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.737', N'2023-08-18 21:18:41.737', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'70', N'27', N'企业-自适应网站模板507H(其它版)', N'/tpl/TPL507H/', N'7100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507H.jpg', N'', N'TPL507H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.747', N'2023-08-18 21:18:41.747', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'71', N'27', N'企业-自适应网站模板508(初始版)', N'/tpl/TPL508/', N'7200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508.jpg', N'', N'TPL508', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.757', N'2023-08-18 21:18:41.757', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'72', N'27', N'企业-自适应网站模板508A(蓝色版)', N'/tpl/TPL508A/', N'7300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508A.jpg', N'', N'TPL508A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.767', N'2023-08-18 21:18:41.767', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'73', N'27', N'企业-自适应网站模板508B(红色版)', N'/tpl/TPL508B/', N'7400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508B.jpg', N'', N'TPL508B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.773', N'2023-08-18 21:18:41.773', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'74', N'27', N'企业-自适应网站模板508C(黄色版)', N'/tpl/TPL508C/', N'7500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508C.jpg', N'', N'TPL508C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.787', N'2023-08-18 21:18:41.787', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'75', N'27', N'企业-自适应网站模板508D(紫色版)', N'/tpl/TPL508D/', N'7600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508D.jpg', N'', N'TPL508D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.793', N'2023-08-18 21:18:41.793', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'76', N'27', N'企业-自适应网站模板508E(黑色版)', N'/tpl/TPL508E/', N'7700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508E.jpg', N'', N'TPL508E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.803', N'2023-08-18 21:18:41.803', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'77', N'27', N'企业-自适应网站模板508F(绿色版)', N'/tpl/TPL508F/', N'7800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508F.jpg', N'', N'TPL508F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.813', N'2023-08-18 21:18:41.813', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'78', N'27', N'企业-自适应网站模板508G(粉色版)', N'/tpl/TPL508G/', N'7900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508G.jpg', N'', N'TPL508G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.823', N'2023-08-18 21:18:41.823', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'79', N'27', N'企业-自适应网站模板508H(浅绿色版)', N'/tpl/TPL508H/', N'8000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508H.jpg', N'', N'TPL508H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.833', N'2023-08-18 21:18:41.833', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'80', N'27', N'企业-自适应网站模板508K(其它版)', N'/tpl/TPL508K/', N'8100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508K.jpg', N'', N'TPL508K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.843', N'2023-08-18 21:18:41.843', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'81', N'27', N'企业-自适应网站模板509(初始版)', N'/tpl/TPL509/', N'8200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509.jpg', N'', N'TPL509', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.853', N'2023-08-18 21:18:41.853', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'82', N'27', N'企业-自适应网站模板509A(蓝色版)', N'/tpl/TPL509A/', N'8300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509A.jpg', N'', N'TPL509A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.863', N'2023-08-18 21:18:41.863', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'83', N'27', N'企业-自适应网站模板509B(红色版)', N'/tpl/TPL509B/', N'8400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509B.jpg', N'', N'TPL509B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.873', N'2023-08-18 21:18:41.873', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'84', N'27', N'企业-自适应网站模板509C(黄色版)', N'/tpl/TPL509C/', N'8500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509C.jpg', N'', N'TPL509C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.880', N'2023-08-18 21:18:41.880', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'85', N'27', N'企业-自适应网站模板509D(紫色版)', N'/tpl/TPL509D/', N'8600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509D.jpg', N'', N'TPL509D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.893', N'2023-08-18 21:18:41.893', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'86', N'27', N'企业-自适应网站模板509E(黑色版)', N'/tpl/TPL509E/', N'8700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509E.jpg', N'', N'TPL509E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.900', N'2023-08-18 21:18:41.900', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'87', N'27', N'企业-自适应网站模板509F(绿色版)', N'/tpl/TPL509F/', N'8800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509F.jpg', N'', N'TPL509F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.910', N'2023-08-18 21:18:41.910', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'88', N'27', N'企业-自适应网站模板509G(粉色版)', N'/tpl/TPL509G/', N'8900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509G.jpg', N'', N'TPL509G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.923', N'2023-08-18 21:18:41.923', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'89', N'27', N'企业-自适应网站模板509H(浅绿色版)', N'/tpl/TPL509H/', N'9000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509H.jpg', N'', N'TPL509H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.930', N'2023-08-18 21:18:41.930', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'90', N'27', N'企业-自适应网站模板509K(其它版)', N'/tpl/TPL509K/', N'9100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509K.jpg', N'', N'TPL509K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.940', N'2023-08-18 21:18:41.940', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'91', N'27', N'企业-自适应网站模板510(初始版)', N'/tpl/TPL510/', N'9200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510.jpg', N'', N'TPL510', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.953', N'2023-08-18 21:18:41.953', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'92', N'27', N'企业-自适应网站模板510A(蓝色版)', N'/tpl/TPL510A/', N'9300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510A.jpg', N'', N'TPL510A', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.960', N'2023-08-18 21:18:41.960', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'93', N'27', N'企业-自适应网站模板510B(红色版)', N'/tpl/TPL510B/', N'9400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510B.jpg', N'', N'TPL510B', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.970', N'2023-08-18 21:18:41.970', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'94', N'27', N'企业-自适应网站模板510C(黄色版)', N'/tpl/TPL510C/', N'9500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510C.jpg', N'', N'TPL510C', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.980', N'2023-08-18 21:18:41.980', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'95', N'27', N'企业-自适应网站模板510D(紫色版)', N'/tpl/TPL510D/', N'9600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510D.jpg', N'', N'TPL510D', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:41.990', N'2023-08-18 21:18:41.990', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'96', N'27', N'企业-自适应网站模板510E(黑色版)', N'/tpl/TPL510E/', N'9700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510E.jpg', N'', N'TPL510E', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.000', N'2023-08-18 21:18:42.000', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'97', N'27', N'企业-自适应网站模板510F(绿色版)', N'/tpl/TPL510F/', N'9800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510F.jpg', N'', N'TPL510F', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.010', N'2023-08-18 21:18:42.010', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'98', N'27', N'企业-自适应网站模板510G(粉色版)', N'/tpl/TPL510G/', N'9900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510G.jpg', N'', N'TPL510G', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.020', N'2023-08-18 21:18:42.020', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'99', N'27', N'企业-自适应网站模板510H(浅绿色版)', N'/tpl/TPL510H/', N'10000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510H.jpg', N'', N'TPL510H', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.030', N'2023-08-18 21:18:42.030', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'100', N'27', N'企业-自适应网站模板510K(其它版)', N'/tpl/TPL510K/', N'10100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510K.jpg', N'', N'TPL510K', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.040', N'2023-08-18 21:18:42.040', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'101', N'23', N'banner1', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/banner1.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.087', N'2023-08-18 21:18:42.087', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'102', N'23', N'banner2', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/banner2.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.097', N'2023-08-18 21:18:42.097', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'103', N'23', N'banner3', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/banner3.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.110', N'2023-08-18 21:18:42.110', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'104', N'23', N'banner4', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/banner4.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.127', N'2023-08-18 21:18:42.127', N'', N'', N'')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'105', N'11', N'企业-自适应网站模板500(初始版)', N'', N'200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.163', N'2023-08-18 21:18:42.163', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'106', N'11', N'企业-自适应网站模板500A(蓝色版)', N'', N'300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.177', N'2023-08-18 21:18:42.177', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'107', N'11', N'企业-自适应网站模板500B(红色版)', N'', N'400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.190', N'2023-08-18 21:18:42.190', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'108', N'11', N'企业-自适应网站模板500C(黄色版)', N'', N'500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.203', N'2023-08-18 21:18:42.203', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'109', N'11', N'企业-自适应网站模板500D(紫色版)', N'', N'600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.213', N'2023-08-18 21:18:42.213', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'110', N'11', N'企业-自适应网站模板500E(黑色版)', N'', N'700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.227', N'2023-08-18 21:18:42.227', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'111', N'11', N'企业-自适应网站模板500F(绿色版)', N'', N'800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.257', N'2023-08-18 21:18:42.257', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'112', N'11', N'企业-自适应网站模板500G(粉色版)', N'', N'900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.267', N'2023-08-18 21:18:42.267', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'113', N'11', N'企业-自适应网站模板500H(浅绿色版)', N'', N'1000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.280', N'2023-08-18 21:18:42.280', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'114', N'11', N'企业-自适应网站模板500K(其它版)', N'', N'1100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL500K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.290', N'2023-08-18 21:18:42.290', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL500K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'115', N'11', N'企业-自适应网站模板501(初始版)', N'', N'1200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.303', N'2023-08-18 21:18:42.303', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'116', N'11', N'企业-自适应网站模板501A(蓝色版)', N'', N'1300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.313', N'2023-08-18 21:18:42.313', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'117', N'11', N'企业-自适应网站模板501B(红色版)', N'', N'1400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.327', N'2023-08-18 21:18:42.327', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'118', N'11', N'企业-自适应网站模板501C(黄色版)', N'', N'1500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.337', N'2023-08-18 21:18:42.337', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'119', N'11', N'企业-自适应网站模板501D(紫色版)', N'', N'1600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.347', N'2023-08-18 21:18:42.347', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'120', N'11', N'企业-自适应网站模板501E(黑色版)', N'', N'1700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.360', N'2023-08-18 21:18:42.360', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'121', N'11', N'企业-自适应网站模板501F(绿色版)', N'', N'1800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.370', N'2023-08-18 21:18:42.370', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'122', N'11', N'企业-自适应网站模板501G(粉色版)', N'', N'1900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.393', N'2023-08-18 21:18:42.393', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'123', N'11', N'企业-自适应网站模板501H(浅绿色版)', N'', N'2000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.403', N'2023-08-18 21:18:42.403', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'124', N'11', N'企业-自适应网站模板501K(其它版)', N'', N'2100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL501K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.413', N'2023-08-18 21:18:42.413', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL501K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'125', N'11', N'企业-自适应网站模板503(初始版)', N'', N'2200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.427', N'2023-08-18 21:18:42.427', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'126', N'11', N'企业-自适应网站模板503A(蓝色版)', N'', N'2300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.440', N'2023-08-18 21:18:42.440', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'127', N'11', N'企业-自适应网站模板503B(红色版)', N'', N'2400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.453', N'2023-08-18 21:18:42.453', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'128', N'11', N'企业-自适应网站模板503C(黄色版)', N'', N'2500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.497', N'2023-08-18 21:18:42.497', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'129', N'11', N'企业-自适应网站模板503D(紫色版)', N'', N'2600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.510', N'2023-08-18 21:18:42.510', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'130', N'11', N'企业-自适应网站模板503E(黑色版)', N'', N'2700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.520', N'2023-08-18 21:18:42.520', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'131', N'11', N'企业-自适应网站模板503F(绿色版)', N'', N'2800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.533', N'2023-08-18 21:18:42.533', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'132', N'11', N'企业-自适应网站模板503G(粉色版)', N'', N'2900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.543', N'2023-08-18 21:18:42.543', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'133', N'11', N'企业-自适应网站模板503H(浅绿色版)', N'', N'3000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.557', N'2023-08-18 21:18:42.557', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'134', N'11', N'企业-自适应网站模板503K(其它版)', N'', N'3100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL503K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.570', N'2023-08-18 21:18:42.570', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL503K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'135', N'11', N'企业-自适应网站模板504(初始版)', N'', N'3200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.580', N'2023-08-18 21:18:42.580', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'136', N'11', N'企业-自适应网站模板504A(蓝色版)', N'', N'3300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.593', N'2023-08-18 21:18:42.593', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'137', N'11', N'企业-自适应网站模板504B(红色版)', N'', N'3400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.607', N'2023-08-18 21:18:42.607', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'138', N'11', N'企业-自适应网站模板504C(黄色版)', N'', N'3500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.617', N'2023-08-18 21:18:42.617', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'139', N'11', N'企业-自适应网站模板504D(紫色版)', N'', N'3600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.637', N'2023-08-18 21:18:42.637', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'140', N'11', N'企业-自适应网站模板504E(黑色版)', N'', N'3700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.647', N'2023-08-18 21:18:42.647', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'141', N'11', N'企业-自适应网站模板504F(绿色版)', N'', N'3800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.660', N'2023-08-18 21:18:42.660', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'142', N'11', N'企业-自适应网站模板504G(粉色版)', N'', N'3900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.670', N'2023-08-18 21:18:42.670', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'143', N'11', N'企业-自适应网站模板504H(浅绿色版)', N'', N'4000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.683', N'2023-08-18 21:18:42.683', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'144', N'11', N'企业-自适应网站模板504K(其它版)', N'', N'4100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL504K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.697', N'2023-08-18 21:18:42.697', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL504K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'145', N'11', N'企业-自适应网站模板505(初始版)', N'', N'4200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.707', N'2023-08-18 21:18:42.707', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'146', N'11', N'企业-自适应网站模板505A(蓝色版)', N'', N'4300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.720', N'2023-08-18 21:18:42.720', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'147', N'11', N'企业-自适应网站模板505B(红色版)', N'', N'4400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.730', N'2023-08-18 21:18:42.730', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'148', N'11', N'企业-自适应网站模板505C(黄色版)', N'', N'4500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.740', N'2023-08-18 21:18:42.740', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'149', N'11', N'企业-自适应网站模板505D(紫色版)', N'', N'4600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.753', N'2023-08-18 21:18:42.753', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'150', N'11', N'企业-自适应网站模板505E(黑色版)', N'', N'4700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.763', N'2023-08-18 21:18:42.763', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'151', N'11', N'企业-自适应网站模板505F(绿色版)', N'', N'4800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.777', N'2023-08-18 21:18:42.777', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'152', N'11', N'企业-自适应网站模板505G(粉色版)', N'', N'4900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.790', N'2023-08-18 21:18:42.790', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'153', N'11', N'企业-自适应网站模板505H(浅绿色版)', N'', N'5000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.797', N'2023-08-18 21:18:42.797', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'154', N'11', N'企业-自适应网站模板505K(其它版)', N'', N'5100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL505K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.810', N'2023-08-18 21:18:42.810', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL505K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'155', N'11', N'企业-自适应网站模板506(初始版)', N'', N'5200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.820', N'2023-08-18 21:18:42.820', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'156', N'11', N'企业-自适应网站模板506A(蓝色版)', N'', N'5300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.830', N'2023-08-18 21:18:42.830', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'157', N'11', N'企业-自适应网站模板506B(红色版)', N'', N'5400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.840', N'2023-08-18 21:18:42.840', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'158', N'11', N'企业-自适应网站模板506C(黄色版)', N'', N'5500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.853', N'2023-08-18 21:18:42.853', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'159', N'11', N'企业-自适应网站模板506D(紫色版)', N'', N'5600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.863', N'2023-08-18 21:18:42.863', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'160', N'11', N'企业-自适应网站模板506E(黑色版)', N'', N'5700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.880', N'2023-08-18 21:18:42.880', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'161', N'11', N'企业-自适应网站模板506F(绿色版)', N'', N'5800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.893', N'2023-08-18 21:18:42.893', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'162', N'11', N'企业-自适应网站模板506G(粉色版)', N'', N'5900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.907', N'2023-08-18 21:18:42.907', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'163', N'11', N'企业-自适应网站模板506H(浅绿色版)', N'', N'6000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.917', N'2023-08-18 21:18:42.917', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'164', N'11', N'企业-自适应网站模板506K(其它版)', N'', N'6100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL506K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.927', N'2023-08-18 21:18:42.927', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL506K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'165', N'11', N'企业-自适应网站模板507(初始版)', N'', N'6200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.940', N'2023-08-18 21:18:42.940', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'166', N'11', N'企业-自适应网站模板507A(蓝色版)', N'', N'6300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.950', N'2023-08-18 21:18:42.950', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'167', N'11', N'企业-自适应网站模板507B(红色版)', N'', N'6400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.963', N'2023-08-18 21:18:42.963', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'168', N'11', N'企业-自适应网站模板507C(黄色版)', N'', N'6500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.973', N'2023-08-18 21:18:42.973', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'169', N'11', N'企业-自适应网站模板507D(紫色版)', N'', N'6600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.987', N'2023-08-18 21:18:42.987', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'170', N'11', N'企业-自适应网站模板507E(黑色版)', N'', N'6700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:42.997', N'2023-08-18 21:18:42.997', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'171', N'11', N'企业-自适应网站模板507F(绿色版)', N'', N'6800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.007', N'2023-08-18 21:18:43.007', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'172', N'11', N'企业-自适应网站模板507G(粉色版)', N'', N'6900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.020', N'2023-08-18 21:18:43.020', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'173', N'11', N'企业-自适应网站模板507H(浅绿色版)', N'', N'7000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.030', N'2023-08-18 21:18:43.030', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'174', N'11', N'企业-自适应网站模板507H(其它版)', N'', N'7100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL507H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.040', N'2023-08-18 21:18:43.040', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL507H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'175', N'11', N'企业-自适应网站模板508(初始版)', N'', N'7200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.053', N'2023-08-18 21:18:43.053', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'176', N'11', N'企业-自适应网站模板508A(蓝色版)', N'', N'7300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.063', N'2023-08-18 21:18:43.063', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'177', N'11', N'企业-自适应网站模板508B(红色版)', N'', N'7400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.077', N'2023-08-18 21:18:43.077', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'178', N'11', N'企业-自适应网站模板508C(黄色版)', N'', N'7500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.087', N'2023-08-18 21:18:43.087', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'179', N'11', N'企业-自适应网站模板508D(紫色版)', N'', N'7600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.097', N'2023-08-18 21:18:43.097', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'180', N'11', N'企业-自适应网站模板508E(黑色版)', N'', N'7700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.110', N'2023-08-18 21:18:43.110', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'181', N'11', N'企业-自适应网站模板508F(绿色版)', N'', N'7800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.120', N'2023-08-18 21:18:43.120', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'182', N'11', N'企业-自适应网站模板508G(粉色版)', N'', N'7900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.130', N'2023-08-18 21:18:43.130', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'183', N'11', N'企业-自适应网站模板508H(浅绿色版)', N'', N'8000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.140', N'2023-08-18 21:18:43.140', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'184', N'11', N'企业-自适应网站模板508K(其它版)', N'', N'8100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL508K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.153', N'2023-08-18 21:18:43.153', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL508K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'185', N'11', N'企业-自适应网站模板509(初始版)', N'', N'8200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.163', N'2023-08-18 21:18:43.163', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'186', N'11', N'企业-自适应网站模板509A(蓝色版)', N'', N'8300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.177', N'2023-08-18 21:18:43.177', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'187', N'11', N'企业-自适应网站模板509B(红色版)', N'', N'8400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.190', N'2023-08-18 21:18:43.190', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'188', N'11', N'企业-自适应网站模板509C(黄色版)', N'', N'8500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.200', N'2023-08-18 21:18:43.200', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'189', N'11', N'企业-自适应网站模板509D(紫色版)', N'', N'8600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.210', N'2023-08-18 21:18:43.210', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'190', N'11', N'企业-自适应网站模板509E(黑色版)', N'', N'8700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.220', N'2023-08-18 21:18:43.220', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'191', N'11', N'企业-自适应网站模板509F(绿色版)', N'', N'8800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.233', N'2023-08-18 21:18:43.233', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'192', N'11', N'企业-自适应网站模板509G(粉色版)', N'', N'8900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.243', N'2023-08-18 21:18:43.243', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'193', N'11', N'企业-自适应网站模板509H(浅绿色版)', N'', N'9000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.257', N'2023-08-18 21:18:43.257', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'194', N'11', N'企业-自适应网站模板509K(其它版)', N'', N'9100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL509K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.267', N'2023-08-18 21:18:43.267', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL509K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'195', N'11', N'企业-自适应网站模板510(初始版)', N'', N'9200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.277', N'2023-08-18 21:18:43.277', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'196', N'11', N'企业-自适应网站模板510A(蓝色版)', N'', N'9300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510A.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.290', N'2023-08-18 21:18:43.290', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510A/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'197', N'11', N'企业-自适应网站模板510B(红色版)', N'', N'9400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510B.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.300', N'2023-08-18 21:18:43.300', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510B/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'198', N'11', N'企业-自适应网站模板510C(黄色版)', N'', N'9500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510C.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.310', N'2023-08-18 21:18:43.310', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510C/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'199', N'11', N'企业-自适应网站模板510D(紫色版)', N'', N'9600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510D.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.320', N'2023-08-18 21:18:43.320', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510D/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'200', N'11', N'企业-自适应网站模板510E(黑色版)', N'', N'9700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510E.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.333', N'2023-08-18 21:18:43.333', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510E/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'201', N'11', N'企业-自适应网站模板510F(绿色版)', N'', N'9800', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510F.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.343', N'2023-08-18 21:18:43.343', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510F/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'202', N'11', N'企业-自适应网站模板510G(粉色版)', N'', N'9900', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510G.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.357', N'2023-08-18 21:18:43.357', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510G/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'203', N'11', N'企业-自适应网站模板510H(浅绿色版)', N'', N'10000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510H.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.370', N'2023-08-18 21:18:43.370', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510H/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'204', N'11', N'企业-自适应网站模板510K(其它版)', N'', N'10100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL510K.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.380', N'2023-08-18 21:18:43.380', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br><a href=''http://xiyueta.com/tpl/TPL510K/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'205', N'11', N'化工-企业-自适应网站模板1', N'', N'100', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL001.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.410', N'2023-08-18 21:18:43.410', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL001/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'206', N'11', N'教育-企业-自适应网站模板2', N'', N'200', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL002.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.430', N'2023-08-18 21:18:43.430', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL002/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'207', N'11', N'化工-企业-自适应网站模板3', N'', N'300', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL003.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.443', N'2023-08-18 21:18:43.443', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL003/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'208', N'11', N'化工-企业-自适应网站模板4', N'', N'400', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL004.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.457', N'2023-08-18 21:18:43.457', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL004/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'209', N'11', N'化工-企业-自适应网站模板5', N'', N'500', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL005.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.470', N'2023-08-18 21:18:43.470', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL005/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'210', N'11', N'化工-企业-自适应网站模板6', N'', N'600', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL006.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.510', N'2023-08-18 21:18:43.510', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL006/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'211', N'11', N'化工-企业-自适应网站模板7', N'', N'700', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/TPL007.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.520', N'2023-08-18 21:18:43.520', N'', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术
<br><a href=''http://xiyueta.com/tpl/TPL007/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'212', N'11', N'xiyueta.js库介绍', N'', N'10000', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyueta.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.530', N'2023-08-18 21:18:43.530', N'', N'', N'xiyueta.js库是一个快速解析html字符串，遍历网页dom结构的JavaScript库。它通过与jQuery语法使用一致的 API 使 html文档遍历和处理更加简单。xiyueta.js库是先解析网页html文本再遍历html网页dom，xiyueta.js库可以在WEB浏览器里使用，也可以在ASP程序里使用，也可以在nodejs里使用。 xiyueta库在nodejs里使用比cheerio库性能更好，xiyueta库比cheerio库解析html字符串的速度快3至5倍。 xiyueta.js库设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。xiyueta的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口。
<br><a href=''http://xiyueta.com/demo/'' target=''_blank''>查看演示</a>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'213', N'-1', N'品牌优势', N'', N'1', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/pinpaiyoushi.png', N'', N'', N'', N'', N'', N'', N'优势,品牌优势,品牌,xiyueta,xiyuetacms', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.607', N'2023-08-18 21:18:43.607', N'', N'', N'xiyuetaCMS拥有忠实的客户群<br>坚持以热情和友好的态度对待客户<br>致电求助，10分钟安排，1小时全城到达，区域全覆盖<br>坚持为用户提供好的服务，解决客户困难')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'214', N'-1', N'技术优势', N'', N'2', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/jishuyoushi.png', N'', N'xiyueta', N'', N'', N'', N'', N'技术优势,asp技术,php技术,优势', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.617', N'2023-08-18 21:18:43.617', N'', N'', N'2 xiyuetaCMS拥有忠实的客户群<br>坚持以热情和友好的态度对待客户<br>致电求助，10分钟安排，1小时全城到达，区域全覆盖<br>坚持为用户提供好的服务，解决客户困难')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'215', N'-1', N'管理优势', N'', N'3', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/guanliyoushi.png', N'', N'', N'', N'', N'', N'', N'管理优势,管理,优势', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.627', N'2023-08-18 21:18:43.627', N'', N'', N'3 xiyuetaCMS拥有忠实的客户群<br>坚持以热情和友好的态度对待客户<br>致电求助，10分钟安排，1小时全城到达，区域全覆盖<br>坚持为用户提供好的服务，解决客户困难')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'216', N'-1', N'服务优势', N'', N'4', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/fuwuyoushi.png', N'', N'', N'', N'', N'', N'', N'服务优势,优势', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.637', N'2023-08-18 21:18:43.637', N'', N'', N'1 xiyuetaCMS拥有忠实的客户群<br>坚持以热情和友好的态度对待客户<br>致电求助，10分钟安排，1小时全城到达，区域全覆盖<br>坚持为用户提供好的服务，解决客户困难')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'217', N'24', N'xiyuetaCMS官网网址？', N'', N'0', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.673', N'2023-08-18 21:18:43.673', N'', N'', N'xiyuetaCMS官方网址是www.xiyueta.com')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'218', N'24', N'xiyuetaCMS后台程序是什么语言？', N'', N'10', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.687', N'2023-08-18 21:18:43.687', N'', N'', N'xiyuetaCMS后台程序用的是ASP语言。')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'219', N'24', N'xiyueta能做什么？', N'', N'20', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.697', N'2023-08-18 21:18:43.697', N'', N'', N'xiyuetaJS加是xiyueta官方开发的操作html内容JS库')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'220', N'24', N'xiyuetaCMS源码在哪里可以下载？', N'', N'30', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.707', N'2023-08-18 21:18:43.707', N'', N'', N'xiyuetaCMS源码可以在xiyueta.com官网下载')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'221', N'24', N'xiyuetaCMS介绍', N'', N'40', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.720', N'2023-08-18 21:18:43.720', N'', N'', N'xiyuetaCMS开源网站管理系统 v1.1.0，是基于Asp+Access/SQL Server架构的智能系统，集电脑版、手机版、平板版于一体，无缝切换。周期短： 系统使用非常复合网站习惯，上手快，网站制作轻而易举，仿站神器！功能全：系统功能齐全，可以根据做网站需要添加组合插件，可扩展性强。易优化：系统具有非常完善的复合各搜索引擎的优化体系，做网站添加方便。')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'222', N'24', N'xiyuetaCMS最新版本是多少', N'', N'50', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.730', N'2023-08-18 21:18:43.730', N'', N'', N'xiyuetaCMS最新版本是v1.1.0初始版本')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'223', N'24', N'xiyuetaCMS选择模板如何操作', N'', N'60', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.740', N'2023-08-18 21:18:43.740', N'', N'', N'【sortrank】60
登录后台 >>  设置  >> 模板库')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'224', N'24', N'xiyuetaCMS选择模板中模块如何操作', N'', N'70', N'0', N'0', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:43.763', N'2023-08-18 21:18:43.763', N'', N'', N'登录后台 >>  设置  >> 模块库')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'225', N'7', N'cms系统是干嘛的？', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-10 09:14:19.000', N'2023-08-18 21:18:43.800', N'', N'', N'<br>
cms系统指的是“内容管理系统”，是用来发布网络内容的一体化Web管理系统。CMS系统主要有两类功能，一类是搭建网站，另一类是用来管理和发布内容。<br>
<br>
cms系统具有许多基于模板的优秀设计，可以加快网站开发的速度和减少开发的成本。<br>
<br>
一、关于搭建网站<br>
<br>
搭建网站是CMS的主要用途，大家为什么要用CMS来搭建？<br>
<br>
因为用CMS来搭建网站非常方便快捷，CMS一般都支持模块化搭建网站，无需技术人员即可完成搭建工作，没有什么门槛，如果有搭建网站的需求，即使不是专业人士也可以在很短时间内完成，并且如果想要修改更新网站也非常容易，只需要在后台修改相关模块，确认保存后即可上线。<br>
<br>
二、关于发布和管理内容<br>
<br>
首先CMS通常会有一个会员系统，用来对各个用户的权限进行分级，比如超级管理员有着最高的权限，可以看到完整的后台以及使用全部功能；而编辑的权限会相对较小，只能看到和使用后台的部分功能，比如只可以编辑、修改文章以及将文章提交给主编审核等等。<br>
<br>
如果想要发布文章显示到网站上，相关人员需要在后台登录进入一个可视化的操作界面，一般会有个富文本编辑器，除了可以可视化地编辑文章，还可以插上各种图片和视频等等，更加完善一点的CMS，还支持对文章进行分类、排序、打标签、添加文章出处、显示作者、评论区等等，当编辑保存好文章后，可以在后台统一管理，一键上传到网站。<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'226', N'9', N'xiyueta.js库 - 入门指南', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-11 09:14:19.000', N'2023-08-18 21:18:43.833', N'', N'', N'<br>
<br>
xiyueta.js库 - 入门指南<br>
xiyueta.js库是一个快速解析html字符串，遍历网页dom结构的JavaScript库。它通过与jQuery语法使用一致的 API 使 html文档遍历和处理更加简单。xiyueta.js库是先解析网页html文本再遍历html网页dom，xiyueta.js库可以在WEB浏览器里使用，也可以在ASP程序里使用，也可以在nodejs里使用。 xiyueta库在nodejs里使用比cheerio库性能更好，xiyueta库比cheerio库解析html字符串的速度快3至5倍。 xiyueta.js库设计的宗旨是“write Less，Do More”，即倡导写更少的代码，做更多的事情。xiyueta的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口。<br>
<br>
xiyueta.js库兼容性和面向场景<br>
xiyueta.js库兼容绝大多数浏览器，可作为 HTML/CSS文档解析遍历dom助手。<br>
xiyueta.js库同时也可以在nodejs环境里使用，也可以在ASP程序里使用。<br>
<br>
获得 xiyueta<br>
1. 官网首页下载<br>
<br>
你可以在我们的 官网首页 下载到 xiyueta的最新版，它经过了自动化构建，更适合用于生产环境。目录结构如下：<br>
<br>
  ├─xiyueta.min.js //核心库<br>
  │  <br>
  └─src  //源码目录<br>
    ├─xiyueta.js       //HTML解析库<br>
    ├─xiyueta.css.js   //CSS解析库<br>
    ├─xiyueta.more.js  //xiyueta.js库更多自定义属性方法<br>
    ├─common.js        //公共函数库<br>
    ├─url.js           //网址处理<br>
    ├─handle.js        //HTML网页处理<br>
    └─tpl.js           //模板库<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'227', N'9', N'xiyueta.js库介绍', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-12 09:14:19.000', N'2023-08-18 21:18:43.890', N'', N'', N'<br>
<br>
xiyueta.js库介绍<br>
xiyueta.js库是一个快速解析html字符串，遍历网页dom结构的JavaScript库。<br>
<br>
const xiyueta = require(''xiyueta'');<br>
const $ = xiyueta.load(''&lt;h2 class="Title">Hello world&lt;/h2>'');<br>
<br>
$(''h2'').text(123);<br>
$(''h2.title'').addClass(''xyt'');<br>
<br>
$.html();<br>
//=>&lt;h2 class="Title xyt">123&lt;/h2><br>
<br>
<br>
xiyueta.js库特点<br>
熟悉的语法：xiyueta.js实现了jQuery的一个子集，去掉了jQuery中所有与DOM不一致或者是用来填浏览器的坑的东西，重现了jQuery最美妙的API<br>
<br>
快到没朋友：xiyueta.js使用了及其简洁而又标准的DOM模型， 因此对文档的转换，操作，渲染都极其的高效。基本的端到端测试显示它的速度至少是cheerio的3倍<br>
<br>
极其灵活：xiyueta.js使用了xiyueta.com官网作者编写的非常兼容的htmlparser，因此它可以解析几乎所有的HTML和XML<br>
<br>
多端运行：xiyueta.js库可以在nodejs上使用，也可以在web浏览器上使用，还可以在asp程序里使用。<br>
<br>
xiyueta.js库应用<br>
xiyueta.js库是jquery核心功能的一个快速灵活而又简洁的实现，主要是对html字符串中DOM进行操作，同时也可以用在HTML标签对检测，html修复，html标签高亮显示等。<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'228', N'9', N'xiyuetaCMS内容管理系统介绍', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-13 09:14:19.000', N'2023-08-18 21:18:43.933', N'', N'', N'<br>
xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。 产品优势： 源码可控 源码注释详细，便于阅读 代码无后门，统统开源 提供丰富的接口，易于扩展 功能完善 包含管理系统常用的基础功能 拥有众多原创功能模块 集成丰富的优秀插件及页面 多端支持 HTML5响应式设计 支持平板、智能手机、微信浏览器 支持IE8+，支持各种常见的浏览器 上手容易 完善的在线开发文档 你不会？我教你啊 提供授权用户专属VIP技术服务群 低成本 帮您省去了架构师、产品、设计等人员的工作 一次永久授权，终身免费更新 与同类产品相比性价比更高 售后保障 完善的售后保障，5x8小时服务 版本持续更新，满足大众需求 始终采用前沿技术<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'229', N'7', N'xiyuetaCMS系统入门介绍', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-14 09:14:19.000', N'2023-08-18 21:18:43.960', N'', N'', N' <br>
《xiyuetaCMS网站管理系统》集电脑网站、手机网站、微信、平板于一体，共用空间，数据自动同步，是多端合一优秀解决方案。系统采用ASP进行开发，它具有操作简单、功能强大、稳定性好、易扩展、安全性强、后期维护方便等特点，可以帮您迅速、轻松地构建起一个强大专业的企业网站、自定义模型、SEO优化、静态页生成、评论留言、订购、会员、广告、招聘、统计、自助表单等常见企业网站基本功能。<br>
<br>
语言环境：支持IIS6以上版本<br>
<br>
数据库：Access/SQL Server及以上版本<br>
<br>
操作系统：本产品跨平台，支持Windows操作系统<br>
<br>
Web服务器：IIS<br>
<br>
独特功能<br>
电脑网站、手机网站、微信、平板于一体，共用空间，数据自动同步；一键备份数据，方便网站迁移；手机站和电脑站可独立绑定一级域名、共用空间、多端数据同步；领先的静态HTML文件缓存策略技术，通过设置缓存时间，自动生成HTML文件，再无需手工生成HTML；内置搜索引擎优化功能，方便网站优化<br>
<br>
系统设置<br>
基本设置、网站标题，网站关键词，网站描述，联系方式，等设置<br>
<br>
系统管理<br>
数据库备份还原，模板选择，模块选择<br>
<br>
内容管理<br>
频道管理、专题管理、信息管理（各个频道信息增删改查）<br>
<br>
互动管理<br>
在线客服管理、第三方在线客服管理、订单管理、信息评论<br>
<br>
会员管理<br>
会员信息管理、会员分组管理、会员功能设置、管理员信息管理、管理员分组管理<br>
<br>
网站优化SEO<br>
伪静态设置（是否启用伪静态、伪静态扩展名设置）、搜索引擎优化设置（页面标题Title、页面关键词Keywords、页面描述Description）、常用搜索引擎登录入口、生成网站地图、生成关键词内链<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'230', N'6', N'仿站:外贸网站怎么建比较好？', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-10-15 09:14:19.000', N'2023-08-18 21:18:43.993', N'', N'', N'<br>
外贸网站怎么建比较好？<br>
外贸网站建设对于企业来说非常重要，一方面承载着企业的公司和产品展示功能，一方面也是企业进行营销推广的重要工具，此外也是企业进行品牌宣传的重要阵地。英文外贸网站与一般中文网站是有很大不同，除语言上的差异外，在网站建设上也有很大差异。<br>
<br>
一、注册一个专业的域名<br>
作为外贸网站来说建议选择.com的域名，在国际上认可度比较高。域名的选择建议使用企业的核心关键词，可以帮助客户第一时间了解企业是做什么的，如果企业想要以品牌宣传为目的，也可注册品牌名，注意使用英文而不是汉语拼音。域名注册要以简短好记为原则，便于客户记忆。<br>
<br>
二、网站设计符合审美<br>
网站的设计风格往往决定着用户对企业的第一印象，因此一定要重视起来。网站的设计要符合目标客户市场当地的审美习惯和设计风格。此外网站的整体设计风格，建议和总体品牌形象保持一致，企业形象识别系统，加深用户对企业的品牌印象。<br>
<br>
三、良好的用户体验<br>
网站的用户体验不但是搜索引擎优化对网站的要求，也是提升用户转化的关键。用户体验包括的内容有很多，比如网站的打开速度，网站的结构布局，网站内容排版等等。良好的用户体验可以增加用户的浏览时长和访问深度，同时促使用户进行询盘或咨询。<br>
<br>
四、对搜索引擎友好<br>
很多企业早期建好了网站，这两年准备做搜索引擎优化，结果发现网站并不符合优化标准，还需要花时间找建站公司修改或重新建站，耽误进度和资金。因此企业在做网站的时候就需要重视外贸网站是否对搜索引擎友好。具体包括：TDk标签。H标签，alt标签等优化标签的设置，网站面包屑导航，内链的搭建，关键词的合理布局，网站首页新闻板块的添加，网站地图，网站页面静态化等等。企业在建网站时如果不懂优化可以找懂优化的朋友帮忙审查，或者找有优化板块的建站公司来做外贸网站。<br>
<br>
五、清晰的联系方式<br>
想要让有意向的客户发询盘，首先一个基础条件就是有清晰的联系方式和渠道，可以让用户在想要发询盘时可以快速的联系到企业，具体需要包括，留言框的设置，网站底部和联系我们页面需要有企业的邮箱，地址，和电话等，可以让客户通过任何一个他方便的联系方式联系到你。但需要注意，不要为了快速获取客户信息而进行强制登陆等设置，这样做会引起客户反感，反而造成客户的流失。<br>
<br>
特别要注意的是：英文外贸网站建设服务器应该租用国外地区的服务器，以方便国外用户快速浏览访问。网站建设中应该英文内容准备性、标准性、专业性。设置好标题、关键词、专业的描述，这样会事半功倍。<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'231', N'6', N'仿站教程:什么是仿站', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-11-20 09:14:19.000', N'2023-08-18 21:18:44.027', N'', N'', N'<br>
仿站简介<br>
仿站的概念：仿站是针对目标网站进行仿制。仿站主要从页面风格和功能上进行仿制。<br>
我们通常所说的仿站是利用CMS（内容管理系统）作为网站的后台，而仿制的则是目标站的静态模板。<br>
仿站的优点：节省设计成本，开发周期短，费用低。搭建速度快，价格优惠，只需一个后端程序员一个工作日左右即可完成。<br>
仿站的缺点：总有一些美中不足，对于设计要求较高的客户通常无法满足。<br>
<br>
<br>
仿站方法<br>
这里我提供一个比较简单和实用的方法。<br>
1.找到要仿的网站；<br>
2.选择文件→另存为→写入文件名（英文：如：index），选择文件类型（网页全部），最好保存到一个新的文件夹，比如 d：盘 的“mywebsite”；<br>
3.保存的文件夹mywebsite里有一个名为index.htm的文件和一个名为index.files的一个文件夹；<br>
4.index.htm这个文件是网页代码的。而index.files文件夹里存放的是这个网页相关的文件，比如图片gif格式，jpg格式，png格式，还有css文件，js文件等；<br>
5.编写代码，说白了，dede仿站就是把网页中的参数换成dede模板参数；<br>
6.开始：在dw中新建一个站点，把站点指向刚才建立的mywebsite这个文件夹。把index.files文件夹名称更改了，改成img。这时dw提示你是否更新，点击是。再网页中替换index.files为img，更新；<br>
7.然后看<link ………………>中是否有链接的css样式。如果有，把地址复制到地址栏回车下载保存。然后替换成本地文件夹；<br>
8.把网页中相关的css样式拷贝到<style> ………… </style>中，这样做的目的是能快捷方便的调试css样式。等我们调试好以后，在另存到一个独立的css文件中；<br>
<br>
<br>
仿站步骤<br>
1，对目标站分析<br>
如：有哪些功能？是何种语言编写，有哪些复制之处！<br>
2，模板分离，结构分离<br>
将页面分为头部，主体，尾部）三部分<br>
3，垃圾代码清理<br>
清理不需要的标签数据和原文件的静态内容<br>
4，标签替换<br>
将原文件中的静态内容替换成CMS中的各类标签或功能代码<br>
5，网站测试<br>
对前台相应的标签和数据调用方式进行测试<br>
6，验收工作<br>
程序交付与正式上线<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'232', N'7', N'使用xiyuetaCMS系统建站的基本要素？', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-11-21 09:14:19.000', N'2023-08-18 21:18:44.057', N'', N'', N'<br>
做一个网站需要做哪些准备工作呢？<br>
<br>
一个网站组成必须具备：域名、空间服务器、网站程序，这也是网站构成的三个基本要素。<br>
<br>
域名：就是访问网站的网址，譬如xiyueta.com就是域名，个人和企业均可以注册域名。<br>
<br>
空间/服务器：即存放网站程序、数据库、资料文件的远程计算机，企业建站一般使用虚拟主机搭建网站，可以有效的降低成本。<br>
<br>
网站程序：由后台程序和前台模板组成，站长们自己搭建网站可以使用市场较成熟的建站系统，如xiyuetaCMS网站管理系统等等。<br>
<br>
我们在准备搭建自己的网站前，需要注册好属于自己的域名，租赁购买空间主机，并选择合适的网站程序。<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'233', N'7', N'免费搭建一个网站？如何做网站？', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-11-22 09:14:19.000', N'2023-08-18 21:18:44.137', N'', N'', N'<br>
xiyuetaCMS系统是一款免费、开源、轻便、安全、专业建站、PC+手机+微信+响应式网站，解决您所有建站问题<br>
<br>
想知道如何免费搭建一个网站，下面为您介绍：<br>
<br>
第一步：到官网下载免费的程序【下载地址：http://xiyueta.com/case】<br>
第二步：安装xiyuetaCMS系统程序<br>
第三步：浏览器输入域名，打开访问<br>
是不是很简单，这样您就已经搭建好一个免费的网站了！如果您还想获取更多的行业精美模板的，<a href=''http://xiyueta.com/case''>点击获取>></a><br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'234', N'8', N'关键词优化的三大技巧，轻松带来好排名！', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-11-23 09:14:19.000', N'2023-08-18 21:18:44.180', N'', N'', N'<br>
现如今，对于很多企业来说，为了能够更好的进行产品的销售，业绩的提升，都会运用各种各样的方式，而网站建设就是企业营销的一种方式，在网站建设当中都会有关键词的存在，而关键词也需要进行优化，只有优化好了才能有好的排名，吸引到更多用户的点击，那么，关键词优化的技巧有哪些呢？下面小编就来为大家简单介绍一下。<br>
<br>
1、布局要简洁<br>
<br>
对于企业来说，想要更好的进行关键词优化，就需要注重网站的布局，一般来说网站的布局越简单越好，只有简单的网站布局才能够吸引更多用户关注，毕竟在现在社会当中，每一个人的时间都是非常宝贵的，不可能有人花费大量的时间在网站的关键词上面。因此一定要尽可能的优化关键词，不能生搬硬套的去堆积大量的无用的关键词。<br>
<br>
2、内容要更新<br>
<br>
在进行关键词优化时，也需要注重内容的更新，最好的办法就是每天都要定量的去更新一些相关的内容，通过这样的方式就能够使搜索引擎快速的捕捉到网站的内容，在进行内容更新时，对于内容的标题也需要尽可能的使用一些新的关键词，而且还需要坚持原创的、有价值的内容，避免去使用创造性较低的、没有价值的内容，否则也会影响到网站的排名。<br>
<br>
3、内链要做好<br>
<br>
想要使得关键词的优化更好也需要做好内链的添加，很多人都知道内链对于网站排名来说是非常重要的，但是想要做好内链添加也是有一定技术性的，如果不知道应该如何进行内链添加的话，可以打开别人网站去参考一下。<br>
<br>
看了以上的内容之后，相信大家对于关键词优化的技巧已经有所掌握，对于企业来说想要获得更多用户的关注，吸引更多的流量，那么就必须要注重关键词优化，只有做好关键词优化之后，才能够使搜索引擎更快的搜索到企业，并且能够提升企业的排名。当然了，如果自己没有经验的话，建议可以找专业的优化公司来做，这样效果会更好。<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'235', N'8', N'新站优化想要效果好，这些方面要注意！', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2023-08-18 21:18:44.227', N'2023-08-18 21:18:44.227', N'', N'', N'<br>
互联网的迅速发展，让新网站如雨后春笋般涌现，当然了，搜索引擎的算法也在持续的更新和升级，但是有的站长不见得对新站优化知识有深刻的了解，所以造成网站排名、收录以及用户的体验等都不是那么优秀。因此，这些新出现的网站有很多都变为垃圾站点。还有一些是因为网站的基础不好，造成优化的效果非常缓慢。那么，新站优化到底要注意什么呢？下面我们就一起来了解一下。<br>
<br>
1、标题有吸引力<br>
<br>
有一个好的标题，这是吸引更多用户进入你的网站的首要条件。因为大多数的用户都是通过搜索引擎来查找信息的，首先看到的就是标题。因此根据用户的要求，写出能吸引他们视线的好标题是必不可少的。不过如果内容和标题是牛头不对马嘴的，就会给人一种被欺骗的感觉。这样一来下一次别人肯定就不会再进入到你的网站，这对于新站优化是致命的。<br>
<br>
2、新站的内容质量<br>
<br>
有高质量的内容才是新站优化有比较好的效果的基础，那么到底高质量的内容是怎样的呢？就一定要是原创的吗？不见得，高质量的内容首先是能够满足用户的需求，或者是帮助用户解决某些问题的。原创虽然是独特的，但不见得就可以满足用户的需求或者帮助他们真正的解决问题，所以原创内容也不见得用户就一定会喜欢。尽管搜索引擎不是一个个活生生的人，但你不能就觉得它无法对你的网站内容质量好坏进行判断，它会有一套属于自己的算法来对网站内容的质量进行判断。所以，定期更新用户喜欢的高质量内容，有助于新站优化效果的提升，并让搜索引擎蜘蛛定期访问你的站点。<br>
<br>
3、内容发布的时间<br>
<br>
每个文章页面都需要设置一个发布的时间，可能你认为这个时间信息用处不大，如果你真的有这样的思想，那么你很可能就会错过搜索引擎蜘蛛和吸引用户视线的机会。因为搜索引擎蜘蛛也是喜欢新事物的，人类也一样，都偏爱新信息。所以，如果可以合理的通过时间信息告诉用户和搜索引擎蜘蛛，这个页面的内容是最新的，那么这个新页面的点击和访问一定会增加<br>')
GO

INSERT INTO [dbo].[xy_articledetail] ([id], [parentid], [title], [filename], [sortrank], [views], [fabulous], [good], [bad], [smallimage], [bigimage], [author], [flags], [webtitle], [webkeywords], [webdescription], [tags], [price], [nbuy], [tempdataid], [isthrough], [createtime], [updatetime], [ip], [aboutcontent], [bodycontent]) VALUES (N'236', N'6', N'网站运营的日常工作内容有哪些？', N'', N'0', N'0', N'0', N'0', N'0', N'/UploadFiles/testpic/xiyuetafz.jpg', N'', N'xiyueta', N'', N'', N'', N'', N'', N'0', N'0', N'', N'1', N'2021-11-25 09:14:19.000', N'2023-08-18 21:18:44.263', N'', N'', N'<br>
我们也知道，现在越来越多企业注重网络推广宣传，网站搭建好只是第一步，如何让用户搜索到我们，从而达标引流转化的目的，我们还得一番经营，那么，网站运营的日常工作内容有哪些呢？下面跟着小编一起来了解一下：<br>
<br>
　　1、网站内容更新<br>
<br>
　　建网站之后，不能就一直是空的框架，需要不断填充网站的内容信息，只有内容才是用户想要看到的。搜索引擎和用户都喜欢新鲜有用的信息，定期更新网站内容信息，是最基本的运营工作。网站内容更新是SEO优化推广的基础工作之一。<br>
<br>
　　2、站内站外推广<br>
<br>
　　网站建设好之后需要推广别人才能知道网站，上面一条讲的是站内SEO优化推广，除此之外我们还要进行一定的站外网站推广，比如软文发布、外链建设等推广工作，把网站主动推送给想要了解产品的用户，这样网站才能带来利益。<br>
<br>
　　3、回答用户问题<br>
<br>
　　网站建设时一般都会加上QQ、微信、电话号码等，企业应随时查看这些工具，及时解决用户的反馈问题。如果用户长时间得不到回应，用户体验会降低，网站就会损失大量的客源了。有些客户需要线下见面聊的应持续跟进，以提高网站的转化率。<br>
<br>
　　4、数据统计<br>
<br>
　　网站管理员需要做好网站数据统计，比如PV、UV、IP、跳出率、访问时长、关键词等，根据数据分析出网站的哪些页面访问量最高、哪些页面需要改进、哪些关键词转化多等等。透过数据分析，重点优化维护这些页面，吸引更多的用户。<br>
<br>
　　5、定期做数据备份和检查网站问题<br>
<br>
　　网站更新了新内容，一定要做好数据备份，这样您如果操作失误了，或者网站有意外攻击，可以通过往期的备份找回数据，定期检查网站漏洞、链接、图片、文字等等问题。<br>
<br>
　　6、学习优化知识，增加友情链接<br>
<br>
　　学习优化知识，给网站的内容、关键词做好优化，结构排版优化，以及发布一些外链，加快网站的收录和排名。<br>
<br>
　　当然了，网站的后期维护也不仅仅是维护人员的事情，企业中的每一个人，包括管理者、销售员等等，都可以参与其中，为网站的发展出谋划策，传递企业的核心价值，让网站发挥更大的作用。<br>
<br>
　　7、网站的运行监控<br>
<br>
　　网站如果不能正常访问，那用户自然不能获取到页面的信息，网站也就失去了存在的价值。同时搜索引擎也会降低网站的评价，从而影响收录、排名和权重。日常应做好服务器的流量情况、加载速度、安全日志等监控。<br>')
GO

SET IDENTITY_INSERT [dbo].[xy_articledetail] OFF
GO


-- ----------------------------
-- Table structure for xy_articlemessage
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articlemessage]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articlemessage]
GO

CREATE TABLE [dbo].[xy_articlemessage] (
  [id] int  IDENTITY NOT NULL,
  [memberid] int DEFAULT -1 NULL,
  [memberpic] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [articleid] int DEFAULT -1 NULL,
  [parentid] int DEFAULT -1 NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [guestname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [fax] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qq] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [msn] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [company] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [address] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [postcode] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sustain] int DEFAULT 0 NULL,
  [oppose] int DEFAULT 0 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [isthrough] int DEFAULT 0 NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articlemessage] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articlemessage
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articlemessage] ON
GO

SET IDENTITY_INSERT [dbo].[xy_articlemessage] OFF
GO


-- ----------------------------
-- Table structure for xy_articlemessagecount
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articlemessagecount]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articlemessagecount]
GO

CREATE TABLE [dbo].[xy_articlemessagecount] (
  [id] int  IDENTITY NOT NULL,
  [articleid] int DEFAULT -1 NULL,
  [memberid] int DEFAULT -1 NULL,
  [articlemessageid] int DEFAULT -1 NULL,
  [type] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [count] int DEFAULT 1 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articlemessagecount] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articlemessagecount
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articlemessagecount] ON
GO

SET IDENTITY_INSERT [dbo].[xy_articlemessagecount] OFF
GO


-- ----------------------------
-- Table structure for xy_articlepic
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articlepic]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articlepic]
GO

CREATE TABLE [dbo].[xy_articlepic] (
  [id] int  IDENTITY NOT NULL,
  [articleid] int DEFAULT -1 NULL,
  [memberid] int DEFAULT -1 NULL,
  [pic] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tempdataid] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articlepic] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articlepic
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articlepic] ON
GO

SET IDENTITY_INSERT [dbo].[xy_articlepic] OFF
GO


-- ----------------------------
-- Table structure for xy_articlesearch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_articlesearch]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_articlesearch]
GO

CREATE TABLE [dbo].[xy_articlesearch] (
  [id] int  IDENTITY NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [count] int DEFAULT 1 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_articlesearch] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_articlesearch
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_articlesearch] ON
GO

SET IDENTITY_INSERT [dbo].[xy_articlesearch] OFF
GO


-- ----------------------------
-- Table structure for xy_chat
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_chat]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_chat]
GO

CREATE TABLE [dbo].[xy_chat] (
  [id] int  IDENTITY NOT NULL,
  [userid] int DEFAULT -1 NULL,
  [touserid] int DEFAULT -1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isdel] int DEFAULT 0 NULL,
  [isthrough] int DEFAULT 0 NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_chat] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_chat
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_chat] ON
GO

SET IDENTITY_INSERT [dbo].[xy_chat] OFF
GO


-- ----------------------------
-- Table structure for xy_count
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_count]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_count]
GO

CREATE TABLE [dbo].[xy_count] (
  [id] int  IDENTITY NOT NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [useragent] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pv] int DEFAULT 0 NULL,
  [addr] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [intime] datetime DEFAULT getdate() NULL,
  [url] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tourl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [w] int DEFAULT 0 NULL,
  [h] int DEFAULT 0 NULL
)
GO

ALTER TABLE [dbo].[xy_count] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_count
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_count] ON
GO

SET IDENTITY_INSERT [dbo].[xy_count] OFF
GO


-- ----------------------------
-- Table structure for xy_diary
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_diary]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_diary]
GO

CREATE TABLE [dbo].[xy_diary] (
  [Id] int  IDENTITY NOT NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [weather] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [writedatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_diary] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_diary
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_diary] ON
GO

SET IDENTITY_INSERT [dbo].[xy_diary] OFF
GO


-- ----------------------------
-- Table structure for xy_feedback
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_feedback]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_feedback]
GO

CREATE TABLE [dbo].[xy_feedback] (
  [id] int  IDENTITY NOT NULL,
  [columnid] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [feedbacktype] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [guestname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [fax] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qq] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [msn] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [company] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [address] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [postcode] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [isthrough] int DEFAULT 0 NULL,
  [reply] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [replyip] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [replydatetime] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [notebody] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_feedback] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_feedback
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_feedback] ON
GO

SET IDENTITY_INSERT [dbo].[xy_feedback] OFF
GO


-- ----------------------------
-- Table structure for xy_friendlink
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_friendlink]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_friendlink]
GO

CREATE TABLE [dbo].[xy_friendlink] (
  [id] int  IDENTITY NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [smallimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [httpurl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [nofollow] int DEFAULT 1 NULL,
  [target] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '_blank' NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_friendlink] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_friendlink
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_friendlink] ON
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'0', N'xiyueta', N'', N'http://www.xiyueta.com/', N'1', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.320', N'2023-08-18 21:18:44.320', N'')
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'1', N'xiyuetaCMS', N'', N'http://www.xiyueta.com/xiyuetaCMS/', N'2', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.323', N'2023-08-18 21:18:44.323', N'')
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'2', N'xiyueta模板库', N'', N'http://www.xiyueta.com/case/', N'3', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.327', N'2023-08-18 21:18:44.327', N'')
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'3', N'xiyueta模块库', N'', N'http://res.xiyueta.com/', N'4', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.330', N'2023-08-18 21:18:44.330', N'')
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'4', N'github', N'', N'https://github.com/313801120/xiyueta', N'5', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.330', N'2023-08-18 21:18:44.330', N'')
GO

INSERT INTO [dbo].[xy_friendlink] ([id], [title], [smallimage], [httpurl], [sortrank], [nofollow], [target], [ip], [isthrough], [createtime], [updatetime], [bodycontent]) VALUES (N'5', N'gitee', N'', N'https://gitee.com/313801120/xiyueta', N'6', N'1', N'_blank', N'', N'1', N'2023-08-18 21:18:44.340', N'2023-08-18 21:18:44.340', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_friendlink] OFF
GO


-- ----------------------------
-- Table structure for xy_guestbook
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_guestbook]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_guestbook]
GO

CREATE TABLE [dbo].[xy_guestbook] (
  [id] int  IDENTITY NOT NULL,
  [memberid] int DEFAULT -1 NULL,
  [columnid] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [parentid] int DEFAULT -1 NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [guestname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [fax] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qq] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [msn] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [company] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [address] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [postcode] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [isthrough] int DEFAULT 0 NULL,
  [reply] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [replyip] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [replydatetime] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_guestbook] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_guestbook
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_guestbook] ON
GO

SET IDENTITY_INSERT [dbo].[xy_guestbook] OFF
GO


-- ----------------------------
-- Table structure for xy_iislog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_iislog]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_iislog]
GO

CREATE TABLE [dbo].[xy_iislog] (
  [id] int  IDENTITY NOT NULL,
  [browsetime] datetime DEFAULT getdate() NULL,
  [serverip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [method] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [url] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [urlparameter] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [port] int DEFAULT -1 NULL,
  [username] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [userip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [incomingroad] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [statuscode] int DEFAULT -1 NULL,
  [bottomstatuscode] int DEFAULT -1 NULL,
  [win32statuscode] int DEFAULT -1 NULL,
  [handletime] int DEFAULT 0 NULL,
  [useragent] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [filename] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [filetype] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [isthrough] int DEFAULT 0 NULL
)
GO

ALTER TABLE [dbo].[xy_iislog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_iislog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_iislog] ON
GO

SET IDENTITY_INSERT [dbo].[xy_iislog] OFF
GO


-- ----------------------------
-- Table structure for xy_job
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_job]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_job]
GO

CREATE TABLE [dbo].[xy_job] (
  [id] int  IDENTITY NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sex] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [age] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [education] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [workarea] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [monthly] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [starttime] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [endtime] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webtitle] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webkeywords] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webdescription] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [flags] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [isthrough] int DEFAULT 0 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_job] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_job
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_job] ON
GO

SET IDENTITY_INSERT [dbo].[xy_job] OFF
GO


-- ----------------------------
-- Table structure for xy_member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_member]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_member]
GO

CREATE TABLE [dbo].[xy_member] (
  [id] int  IDENTITY NOT NULL,
  [userid] int DEFAULT -1 NULL,
  [level] int DEFAULT 0 NULL,
  [usertype] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [username] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pwd] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [nickname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pic] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [expiredatetime] datetime DEFAULT getdate() NULL,
  [sex] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [fax] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [weixin] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [age] int DEFAULT 18 NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [phone] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qq] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [department] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [idcard] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [dateofbirth] datetime  NULL,
  [address] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [hometown] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [province] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [city] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [wxopenid] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [wxopenidtime] datetime DEFAULT getdate() NULL,
  [lottery] int DEFAULT 0 NULL,
  [money] int DEFAULT 0 NULL,
  [buyshoplist] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qqshowsettxt] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qqshowbitmap] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [boyorgirl] int DEFAULT 0 NULL,
  [chatendtime] datetime DEFAULT getdate() NULL,
  [loginstatus] int DEFAULT 0 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [regip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [regtime] datetime DEFAULT getdate() NULL,
  [lastloginip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [lastlogintime] datetime DEFAULT getdate() NULL,
  [loginip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [logintime] datetime DEFAULT getdate() NULL,
  [logincount] int DEFAULT 0 NULL,
  [onlinetime] datetime DEFAULT getdate() NULL,
  [onlineip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 0 NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_member] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_member
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_member] ON
GO

INSERT INTO [dbo].[xy_member] ([id], [userid], [level], [usertype], [username], [pwd], [nickname], [pic], [expiredatetime], [sex], [fax], [weixin], [age], [tel], [email], [phone], [qq], [department], [idcard], [dateofbirth], [address], [hometown], [province], [city], [wxopenid], [wxopenidtime], [lottery], [money], [buyshoplist], [qqshowsettxt], [qqshowbitmap], [boyorgirl], [chatendtime], [loginstatus], [ip], [regip], [regtime], [lastloginip], [lastlogintime], [loginip], [logintime], [logincount], [onlinetime], [onlineip], [isthrough], [bodycontent]) VALUES (N'0', N'-1', N'0', N'', N'useradmin', N'14e1b600b1fd579f47433b88e8d85291', N'客服', N'', N'2023-08-18 21:18:44.410', N'', N'', N'', N'18', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'2023-08-18 21:18:44.410', N'66', N'0', N'', N'', N'', N'0', N'2023-08-18 21:18:44.410', N'0', N'', N'', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'0', N'2023-08-18 21:18:44.410', N'', N'1', N'')
GO

INSERT INTO [dbo].[xy_member] ([id], [userid], [level], [usertype], [username], [pwd], [nickname], [pic], [expiredatetime], [sex], [fax], [weixin], [age], [tel], [email], [phone], [qq], [department], [idcard], [dateofbirth], [address], [hometown], [province], [city], [wxopenid], [wxopenidtime], [lottery], [money], [buyshoplist], [qqshowsettxt], [qqshowbitmap], [boyorgirl], [chatendtime], [loginstatus], [ip], [regip], [regtime], [lastloginip], [lastlogintime], [loginip], [logintime], [logincount], [onlinetime], [onlineip], [isthrough], [bodycontent]) VALUES (N'1', N'-1', N'0', N'', N'sh001', N'14e1b600b1fd579f47433b88e8d85291', N'张三', N'', N'2023-08-18 21:18:44.410', N'', N'', N'', N'18', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'2023-08-18 21:18:44.410', N'66', N'660000', N'', N'', N'', N'0', N'2023-08-18 21:18:44.410', N'0', N'', N'', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'0', N'2023-08-18 21:18:44.410', N'', N'1', N'')
GO

INSERT INTO [dbo].[xy_member] ([id], [userid], [level], [usertype], [username], [pwd], [nickname], [pic], [expiredatetime], [sex], [fax], [weixin], [age], [tel], [email], [phone], [qq], [department], [idcard], [dateofbirth], [address], [hometown], [province], [city], [wxopenid], [wxopenidtime], [lottery], [money], [buyshoplist], [qqshowsettxt], [qqshowbitmap], [boyorgirl], [chatendtime], [loginstatus], [ip], [regip], [regtime], [lastloginip], [lastlogintime], [loginip], [logintime], [logincount], [onlinetime], [onlineip], [isthrough], [bodycontent]) VALUES (N'2', N'-1', N'0', N'', N'sh002', N'14e1b600b1fd579f47433b88e8d85291', N'李四2', N'', N'2023-08-18 00:00:00.000', N'男', N'', N'', N'18', N'', N'', N'', N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'2023-08-18 21:18:44.410', N'88', N'999999', N'', N'', N'', N'0', N'2023-08-18 21:18:44.410', N'0', N'127.0.0.1', N'127.0.0.1', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'', N'2023-08-18 21:18:44.410', N'0', N'2023-08-18 21:18:44.410', N'', N'1', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_member] OFF
GO


-- ----------------------------
-- Table structure for xy_onepage
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_onepage]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_onepage]
GO

CREATE TABLE [dbo].[xy_onepage] (
  [id] int  IDENTITY NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [smallimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [banner] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [views] int DEFAULT 0 NULL,
  [filename] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webtitle] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webkeywords] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webdescription] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [aboutcontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_onepage] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_onepage
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_onepage] ON
GO

INSERT INTO [dbo].[xy_onepage] ([id], [title], [sortrank], [smallimage], [banner], [views], [filename], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'0', N'关于我们', N'0', N'/uploadfiles/testpic/about.jpg', N'', N'0', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:44.457', N'2023-08-18 21:18:44.457', N'', N'xiyuetaCMS开源网站管理系统 v1.1.0，是基于Asp+Access/SQL Server架构的智能系统，集电脑版、手机版、平板版于一体，无缝切换。周期短：
系统使用非常复合网站习惯，上手快，网站制作轻而易举，仿站神器！功能全：系统功能齐全，可以根据做网站需要添加组合插件，可扩展性强。易优化：系统具有非常完善的复合各搜索引擎的优化体系，做网站添加方便。

admin 后台管理目录 账号密码admin admin
api 上传程序等目录
data 数据库目录
fz 仿站目录
inc 程序和类目录
UploadFiles 上传文件存放目录
web 网站模板目录


common.asp 公共程序文件
default.asp 首页文件
web.config 网站配置文件

技术支持:QQ313801120，学习交流群：35915100。官网：www.xiyueta.com')
GO

SET IDENTITY_INSERT [dbo].[xy_onepage] OFF
GO


-- ----------------------------
-- Table structure for xy_sheshi
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_sheshi]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_sheshi]
GO

CREATE TABLE [dbo].[xy_sheshi] (
  [id] int  IDENTITY NOT NULL,
  [parentid] int DEFAULT -1 NULL,
  [columnname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [columnenname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [httpurl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_sheshi] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_sheshi
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_sheshi] ON
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'0', N'-1', N'四川', N'', N'1', N'1', N'', N'2023-08-18 21:18:44.660', N'2023-08-18 21:18:44.660', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'1', N'0', N'成都', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.667', N'2023-08-18 21:18:44.667', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'2', N'0', N'绵阳', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.670', N'2023-08-18 21:18:44.670', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'3', N'2', N'盐亭', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.673', N'2023-08-18 21:18:44.673', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'4', N'2', N'三台', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.677', N'2023-08-18 21:18:44.677', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'5', N'2', N'梓潼', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.680', N'2023-08-18 21:18:44.680', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'6', N'2', N'平武', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.680', N'2023-08-18 21:18:44.680', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'7', N'2', N'北川', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.687', N'2023-08-18 21:18:44.687', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'8', N'0', N'自贡', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.690', N'2023-08-18 21:18:44.690', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'9', N'0', N'攀枝花', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.690', N'2023-08-18 21:18:44.690', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'10', N'0', N'泸州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.703', N'2023-08-18 21:18:44.703', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'11', N'0', N'德阳', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.707', N'2023-08-18 21:18:44.707', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'12', N'0', N'广元', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.710', N'2023-08-18 21:18:44.710', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'13', N'0', N'遂宁', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.713', N'2023-08-18 21:18:44.713', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'14', N'0', N'内江', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.717', N'2023-08-18 21:18:44.717', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'15', N'0', N'乐山', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.720', N'2023-08-18 21:18:44.720', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'16', N'0', N'资阳', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.723', N'2023-08-18 21:18:44.723', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'17', N'0', N'宜宾', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.727', N'2023-08-18 21:18:44.727', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'18', N'0', N'南充', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.727', N'2023-08-18 21:18:44.727', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'19', N'0', N'达州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.730', N'2023-08-18 21:18:44.730', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'20', N'19', N'宣汉', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.733', N'2023-08-18 21:18:44.733', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'21', N'19', N'开江', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.737', N'2023-08-18 21:18:44.737', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'22', N'19', N'大竹', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.740', N'2023-08-18 21:18:44.740', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'23', N'19', N'渠县', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.740', N'2023-08-18 21:18:44.740', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'24', N'19', N'达川', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.743', N'2023-08-18 21:18:44.743', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'25', N'19', N'万源', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.747', N'2023-08-18 21:18:44.747', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'26', N'0', N'雅安', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.750', N'2023-08-18 21:18:44.750', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'27', N'0', N'广安', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.753', N'2023-08-18 21:18:44.753', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'28', N'0', N'巴中', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.757', N'2023-08-18 21:18:44.757', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'29', N'0', N'眉山', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.760', N'2023-08-18 21:18:44.760', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'30', N'0', N'都江堰', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.760', N'2023-08-18 21:18:44.760', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'31', N'0', N'彭州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.763', N'2023-08-18 21:18:44.763', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'32', N'0', N'崇州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.767', N'2023-08-18 21:18:44.767', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'33', N'0', N'邛崃', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.770', N'2023-08-18 21:18:44.770', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'34', N'0', N'简阳', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.773', N'2023-08-18 21:18:44.773', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'35', N'0', N'广汉', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.773', N'2023-08-18 21:18:44.773', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'36', N'0', N'什邡', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.777', N'2023-08-18 21:18:44.777', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'37', N'0', N'绵竹', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.783', N'2023-08-18 21:18:44.783', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'38', N'0', N'隆昌', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.787', N'2023-08-18 21:18:44.787', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'39', N'0', N'峨眉山', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.790', N'2023-08-18 21:18:44.790', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'40', N'0', N'阆中', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.793', N'2023-08-18 21:18:44.793', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'41', N'0', N'万源', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.797', N'2023-08-18 21:18:44.797', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'42', N'0', N'马尔康', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.800', N'2023-08-18 21:18:44.800', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'43', N'0', N'康定', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.803', N'2023-08-18 21:18:44.803', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'44', N'0', N'西昌', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.807', N'2023-08-18 21:18:44.807', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'45', N'0', N'射洪', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.807', N'2023-08-18 21:18:44.807', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'46', N'0', N'什邡', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.810', N'2023-08-18 21:18:44.810', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'47', N'0', N'绵竹', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.813', N'2023-08-18 21:18:44.813', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'48', N'0', N'隆昌', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.817', N'2023-08-18 21:18:44.817', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'49', N'0', N'峨眉山', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.820', N'2023-08-18 21:18:44.820', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'50', N'0', N'阆中', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.823', N'2023-08-18 21:18:44.823', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'51', N'0', N'万源', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.827', N'2023-08-18 21:18:44.827', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'52', N'0', N'马尔康', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.827', N'2023-08-18 21:18:44.827', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'53', N'0', N'康定', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.830', N'2023-08-18 21:18:44.830', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'54', N'0', N'西昌', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.833', N'2023-08-18 21:18:44.833', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'55', N'-1', N'重庆', N'', N'2', N'1', N'', N'2023-08-18 21:18:44.837', N'2023-08-18 21:18:44.837', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'56', N'55', N'万州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.840', N'2023-08-18 21:18:44.840', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'57', N'55', N'黔江', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.843', N'2023-08-18 21:18:44.843', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'58', N'55', N'涪陵', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.847', N'2023-08-18 21:18:44.847', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'59', N'55', N'渝中', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.850', N'2023-08-18 21:18:44.850', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'60', N'55', N'大渡口', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.853', N'2023-08-18 21:18:44.853', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'61', N'55', N'江北', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.857', N'2023-08-18 21:18:44.857', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'62', N'55', N'沙坪坝', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.860', N'2023-08-18 21:18:44.860', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'63', N'55', N'九龙坡', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.863', N'2023-08-18 21:18:44.863', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'64', N'55', N'南岸', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.880', N'2023-08-18 21:18:44.880', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'65', N'55', N'北碚', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.887', N'2023-08-18 21:18:44.887', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'66', N'55', N'渝北', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.887', N'2023-08-18 21:18:44.887', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'67', N'55', N'巴南', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.890', N'2023-08-18 21:18:44.890', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'68', N'55', N'长寿', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.893', N'2023-08-18 21:18:44.893', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'69', N'55', N'江津', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.897', N'2023-08-18 21:18:44.897', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'70', N'55', N'合川', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.897', N'2023-08-18 21:18:44.897', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'71', N'55', N'南川', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.900', N'2023-08-18 21:18:44.900', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'72', N'55', N'綦江', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.903', N'2023-08-18 21:18:44.903', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'73', N'55', N'大足', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.907', N'2023-08-18 21:18:44.907', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'74', N'55', N'璧山', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.907', N'2023-08-18 21:18:44.907', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'75', N'55', N'铜梁', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.910', N'2023-08-18 21:18:44.910', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'76', N'55', N'潼南', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.913', N'2023-08-18 21:18:44.913', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'77', N'55', N'荣昌', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.917', N'2023-08-18 21:18:44.917', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'78', N'55', N'开州', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.920', N'2023-08-18 21:18:44.920', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'79', N'55', N'梁平', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.923', N'2023-08-18 21:18:44.923', N'')
GO

INSERT INTO [dbo].[xy_sheshi] ([id], [parentid], [columnname], [columnenname], [sortrank], [isthrough], [httpurl], [createtime], [updatetime], [bodycontent]) VALUES (N'80', N'55', N'武隆', N'', N'0', N'1', N'', N'2023-08-18 21:18:44.927', N'2023-08-18 21:18:44.927', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_sheshi] OFF
GO


-- ----------------------------
-- Table structure for xy_systemlog
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_systemlog]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_systemlog]
GO

CREATE TABLE [dbo].[xy_systemlog] (
  [id] int  IDENTITY NOT NULL,
  [msgstr] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [item] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tablename] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [url] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [adminid] int DEFAULT -1 NULL,
  [adminname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_systemlog] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_systemlog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_systemlog] ON
GO

INSERT INTO [dbo].[xy_systemlog] ([id], [msgstr], [item], [tablename], [url], [adminid], [adminname], [ip], [createtime], [bodycontent]) VALUES (N'0', N'恢复默认数据xy_', N'', N'', N'WebData&login=out&n=p2P5y9d3A', N'-1', N'xiyuetaCMS', N'127.0.0.1', N'2023-08-18 21:18:44.000', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_systemlog] OFF
GO


-- ----------------------------
-- Table structure for xy_tags
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_tags]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_tags]
GO

CREATE TABLE [dbo].[xy_tags] (
  [id] int  IDENTITY NOT NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [count] int DEFAULT 1 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_tags] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_tags
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_tags] ON
GO

SET IDENTITY_INSERT [dbo].[xy_tags] OFF
GO


-- ----------------------------
-- Table structure for xy_webcolumn
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_webcolumn]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_webcolumn]
GO

CREATE TABLE [dbo].[xy_webcolumn] (
  [id] int  IDENTITY NOT NULL,
  [columnname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [columnenname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [columntype] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [columnico] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [filename] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [parentid] int DEFAULT -1 NULL,
  [sortrank] int DEFAULT 0 NULL,
  [views] int DEFAULT 0 NULL,
  [smallimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bigimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bannerimage] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [npagesize] int DEFAULT 10 NULL,
  [flags] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [httpurl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webtitle] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webkeywords] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webdescription] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [aboutcontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_webcolumn] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_webcolumn
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_webcolumn] ON
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'0', N'网站首页', N'home', N'home', N'?', N'', N'-1', N'1', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.503', N'2023-08-18 21:18:40.503', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'1', N'关于我们', N'about Us', N'text', N'?', N'', N'-1', N'2', N'0', N'', N'', N'/UploadFiles/testpic/ad-aboutus.jpg', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.510', N'2023-08-18 21:18:40.510', N'介绍关于网站
【parentid】-1
【sortrank】1
【bodycontent】
作者个人介绍<br>
1、2006年进入互联网，专注网站开发10年<br>
2、精通ASP/HTML5/CSS3/JS/Jquery/Canvas/Flash/PHP/VB/等<br>
3、掌握DotNet/Android/JSP/nodeJS/python/BootStrop/PS/PR/FTP/linux等<br>
4、擅长把复杂的事情简单化，独立开发一套PAAJCMS内容管理系统<br>
5、发布【xiyuetaCMS】/【在线ASP转PHP】/【在线格式化ASP】【在线仿站】等开源项目<br>
6、曾在上海、南京等城市从事网站开发工作多年
【/bodycontent】
【aboutcontent】', N'作者个人介绍<br>
1、2006年进入互联网，专注网站开发10年<br>
2、精通ASP/HTML5/CSS3/JS/Jquery/Canvas/Flash/PHP/VB/等<br>
3、掌握DotNet/Android/JSP/nodeJS/python/BootStrop/PS/PR/FTP/linux等<br>
4、擅长把复杂的事情简单化，独立开发一套PAAJCMS内容管理系统<br>
5、发布【xiyuetaCMS】/【在线ASP转PHP】/【在线格式化ASP】【在线仿站】等开源项目<br>
6、曾在上海、南京等城市从事网站开发工作多年')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'2', N'公司简介', N'company', N'text', N'', N'', N'1', N'1', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.537', N'2023-08-18 21:18:40.537', N'', N'xiyuetaCMS内容管理系统,通用型后台权限管理框架，紧随潮流、开箱即用,拥有多种版本选择，随意搭配使用。
产品优势：

源码可控
源码注释详细，便于阅读
代码无后门，统统开源
提供丰富的接口，易于扩展

功能完善
包含管理系统常用的基础功能
拥有众多原创功能模块
集成丰富的优秀插件及页面

多端支持
HTML5响应式设计
支持平板、智能手机、微信浏览器
支持IE8+，支持各种常见的浏览器

上手容易
完善的在线开发文档
你不会？我教你啊
提供授权用户专属VIP技术服务群

低成本
帮您省去了架构师、产品、设计等人员的工作
一次永久授权，终身免费更新
与同类产品相比性价比更高

售后保障
完善的售后保障，5x8小时服务
版本持续更新，满足大众需求
始终采用前沿技术')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'3', N'公司风采', N'company style', N'text', N'', N'', N'1', N'2', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.540', N'2023-08-18 21:18:40.540', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'4', N'公司荣誉', N'company honor', N'text', N'', N'', N'1', N'3', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.543', N'2023-08-18 21:18:40.543', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'5', N'公司致辞', N'company speech', N'text', N'', N'', N'1', N'4', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.547', N'2023-08-18 21:18:40.547', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'6', N'新闻资讯', N'News', N'news', N'?', N'', N'-1', N'3', N'0', N'', N'', N'/UploadFiles/testpic/ad-news.jpg', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.553', N'2023-08-18 21:18:40.553', N'介绍新闻资讯相关内容
【parentid】-1
【sortrank】6
【bodycontent】【/bodycontent】
【aboutcontent】', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'7', N'公司新闻', N'company news', N'news', N'', N'', N'6', N'1', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.557', N'2023-08-18 21:18:40.557', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'8', N'行业新闻', N'industry news', N'news', N'', N'', N'6', N'2', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.560', N'2023-08-18 21:18:40.560', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'9', N'通知公告', N'announcement', N'news', N'', N'', N'6', N'3', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.563', N'2023-08-18 21:18:40.563', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'10', N'产品中心', N'product Center', N'product', N'?', N'', N'-1', N'4', N'0', N'', N'', N'/UploadFiles/testpic/ad-products.jpg', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.567', N'2023-08-18 21:18:40.567', N'介绍产品中心相关内容
【parentid】-1
【sortrank】10
【bodycontent】
这是内容产品中心内容。
【/bodycontent】
【aboutcontent】
这是产品中心里的简要说明内容。', N'这是内容产品中心内容。')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'11', N'响应式模板', N'', N'product', N'', N'', N'10', N'5', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.573', N'2023-08-18 21:18:40.573', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'12', N'企业模板', N'', N'product', N'', N'', N'10', N'10', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.580', N'2023-08-18 21:18:40.580', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'13', N'商务模板', N'', N'product', N'', N'', N'10', N'20', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.600', N'2023-08-18 21:18:40.600', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'14', N'博客模板', N'', N'product', N'', N'', N'10', N'30', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.603', N'2023-08-18 21:18:40.603', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'15', N'HTML5模板', N'', N'product', N'', N'', N'10', N'40', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.607', N'2023-08-18 21:18:40.607', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'16', N'CSS3模板', N'', N'product', N'', N'', N'10', N'50', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.610', N'2023-08-18 21:18:40.610', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'17', N'整站模板', N'', N'product', N'', N'', N'10', N'60', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.613', N'2023-08-18 21:18:40.613', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'18', N'科技模板', N'', N'product', N'', N'', N'10', N'70', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.620', N'2023-08-18 21:18:40.620', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'19', N'简历模板', N'', N'product', N'', N'', N'10', N'80', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.623', N'2023-08-18 21:18:40.623', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'20', N'联系我们', N'contact us', N'text', N'?', N'', N'-1', N'5', N'0', N'', N'', N'/UploadFiles/testpic/ad-contactus.jpg', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.627', N'2023-08-18 21:18:40.627', N'介绍联系我们相关内容
【parentid】-1
【sortrank】20
【bodycontent】  
      <div>        
        2006年进入互联网，专注网站开发10年，精通ASP/HTML/CSS/JS/Jquery/PHP/VB/VB.NET等,擅长把复杂的事情简单化。<br>
      </div>
      
      
      <ul>
        <li>作者：xiyueta</li>
        <li>QQ：<a href="tencent://message/?uin=313801120&amp;Site=作者云祥孙&amp;Menu=yes" class="ablue" rel="nofollow" title="在线与313801120交流">313801120</a></li>
        <li>邮箱：313801120@qq.com </li>
        <li>QQ交流群：<a href="http://shang.qq.com/wpa/qunwpa?idkey=253822bd485c454811141c731156d2ecd4dba04ecf647ce81dc97d16a563137b" rel="nofollow" target="_blank">35915100</a></li>
        <li>作者主页：<a href="https://www.xiyueta.com/">https://www.xiyueta.com</a></li>

        <li>github主页：<a href="https://313801120.github.io/xiyueta/" rel="nofollow">https://313801120.github.io/xiyueta</a>
           &nbsp; &nbsp; <a href="https://xiyueta.js.org/" rel="nofollow">https://xiyueta.js.org/</a>
       </li>
        
        <li>github：<a href="https://github.com/313801120/" target="_blank" rel="nofollow">https://github.com/313801120/</a></li>
        <li>gitee：<a href="https://gitee.com/313801120/xiyueta" target="_blank" rel="nofollow">https://gitee.com/313801120/xiyueta</a></li>
        <li>npm：<a href="https://www.npmjs.com/~xiyueta" target="_blank" rel="nofollow">https://www.npmjs.com/~xiyueta</a></li>
        <li>Stackoverflow：<a href="http://stackoverflow.com/users/6438976/sharembweb" target="_blank" rel="nofollow">http://stackoverflow.com/users/6438976/sharembweb</a></li>
        <li>csdn：<a href="https://blog.csdn.net/mydd3" target="_blank" rel="nofollow">https://blog.csdn.net/mydd3</a></li>

      </ul>
      


【/bodycontent】
【aboutcontent】', N'<div>        
        2006年进入互联网，专注网站开发10年，精通ASP/HTML/CSS/JS/Jquery/PHP/VB/VB.NET等,擅长把复杂的事情简单化。<br>
      </div>
      
      
      <ul>
        <li>作者：xiyueta</li>
        <li>QQ：<a href="tencent://message/?uin=313801120&amp;Site=作者云祥孙&amp;Menu=yes" class="ablue" rel="nofollow" title="在线与313801120交流">313801120</a></li>
        <li>邮箱：313801120@qq.com </li>
        <li>QQ交流群：<a href="http://shang.qq.com/wpa/qunwpa?idkey=253822bd485c454811141c731156d2ecd4dba04ecf647ce81dc97d16a563137b" rel="nofollow" target="_blank">35915100</a></li>
        <li>作者主页：<a href="https://www.xiyueta.com/">https://www.xiyueta.com</a></li>

        <li>github主页：<a href="https://313801120.github.io/xiyueta/" rel="nofollow">https://313801120.github.io/xiyueta</a>
           &nbsp; &nbsp; <a href="https://xiyueta.js.org/" rel="nofollow">https://xiyueta.js.org/</a>
       </li>
        
        <li>github：<a href="https://github.com/313801120/" target="_blank" rel="nofollow">https://github.com/313801120/</a></li>
        <li>gitee：<a href="https://gitee.com/313801120/xiyueta" target="_blank" rel="nofollow">https://gitee.com/313801120/xiyueta</a></li>
        <li>npm：<a href="https://www.npmjs.com/~xiyueta" target="_blank" rel="nofollow">https://www.npmjs.com/~xiyueta</a></li>
        <li>Stackoverflow：<a href="http://stackoverflow.com/users/6438976/sharembweb" target="_blank" rel="nofollow">http://stackoverflow.com/users/6438976/sharembweb</a></li>
        <li>csdn：<a href="https://blog.csdn.net/mydd3" target="_blank" rel="nofollow">https://blog.csdn.net/mydd3</a></li>

      </ul>')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'21', N'在线留言', N'', N'guestbook', N'', N'', N'20', N'5', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.630', N'2023-08-18 21:18:40.630', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'22', N'在线反馈', N'', N'guestbook', N'', N'', N'20', N'10', N'0', N'', N'', N'', N'10', N'top|foot', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.633', N'2023-08-18 21:18:40.633', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'23', N'banner', N'', N'product', N'', N'', N'-1', N'998', N'0', N'', N'', N'', N'10', N'', N'', N'', N'', N'', N'0', N'', N'2023-08-18 21:18:40.637', N'2023-08-18 21:18:40.637', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'24', N'常见问题', N'', N'news', N'', N'', N'-1', N'999', N'0', N'', N'', N'', N'10', N'', N'', N'', N'', N'', N'0', N'', N'2023-08-18 21:18:40.640', N'2023-08-18 21:18:40.640', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'25', N'在线留言', N'guestbook', N'guestbook', N'', N'', N'-1', N'10', N'0', N'', N'', N'/UploadFiles/testpic/ad-guestbook2.jpg', N'10', N'', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.660', N'2023-08-18 21:18:40.660', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'26', N'搜索', N'search', N'search', N'', N'', N'-1', N'100', N'0', N'', N'', N'/UploadFiles/testpic/ad-products.jpg', N'10', N'', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.663', N'2023-08-18 21:18:40.663', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'27', N'网站案例', N'web case', N'case', N'', N'', N'-1', N'200', N'0', N'', N'', N'', N'10', N'', N'', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.670', N'2023-08-18 21:18:40.670', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'28', N'蓝色', N'', N'text', N'', N'', N'27', N'10', N'0', N'', N'', N'', N'10', N'', N'/case/?k=蓝色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.677', N'2023-08-18 21:18:40.677', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'29', N'红色', N'', N'text', N'', N'', N'27', N'20', N'0', N'', N'', N'', N'10', N'', N'/case/?k=红色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.680', N'2023-08-18 21:18:40.680', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'30', N'黄色', N'', N'text', N'', N'', N'27', N'30', N'0', N'', N'', N'', N'10', N'', N'/case/?k=黄色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.683', N'2023-08-18 21:18:40.683', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'31', N'紫色', N'', N'text', N'', N'', N'27', N'40', N'0', N'', N'', N'', N'10', N'', N'/case/?k=紫色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.690', N'2023-08-18 21:18:40.690', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'32', N'黑色', N'', N'text', N'', N'', N'27', N'50', N'0', N'', N'', N'', N'10', N'', N'/case/?k=黑色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.690', N'2023-08-18 21:18:40.690', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'33', N'绿色', N'', N'text', N'', N'', N'27', N'60', N'0', N'', N'', N'', N'10', N'', N'/case/?k=绿色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.697', N'2023-08-18 21:18:40.697', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'34', N'粉色', N'', N'text', N'', N'', N'27', N'70', N'0', N'', N'', N'', N'10', N'', N'/case/?k=粉色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.700', N'2023-08-18 21:18:40.700', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'35', N'浅绿色', N'', N'text', N'', N'', N'27', N'80', N'0', N'', N'', N'', N'10', N'', N'/case/?k=浅绿色', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.703', N'2023-08-18 21:18:40.703', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'36', N'其它', N'', N'text', N'', N'', N'27', N'90', N'0', N'', N'', N'', N'10', N'', N'/case/?k=其它', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.713', N'2023-08-18 21:18:40.713', N'', N'')
GO

INSERT INTO [dbo].[xy_webcolumn] ([id], [columnname], [columnenname], [columntype], [columnico], [filename], [parentid], [sortrank], [views], [smallimage], [bigimage], [bannerimage], [npagesize], [flags], [httpurl], [webtitle], [webkeywords], [webdescription], [isthrough], [ip], [createtime], [updatetime], [aboutcontent], [bodycontent]) VALUES (N'37', N'初始', N'', N'text', N'', N'', N'27', N'100', N'0', N'', N'', N'', N'10', N'', N'/case/?k=初始', N'', N'', N'', N'1', N'', N'2023-08-18 21:18:40.717', N'2023-08-18 21:18:40.717', N'', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_webcolumn] OFF
GO


-- ----------------------------
-- Table structure for xy_webcolumnparam
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_webcolumnparam]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_webcolumnparam]
GO

CREATE TABLE [dbo].[xy_webcolumnparam] (
  [id] int  IDENTITY NOT NULL,
  [parentid] int DEFAULT -1 NULL,
  [title] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [views] int DEFAULT 0 NULL,
  [pic1] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pic2] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [pic3] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param1] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param2] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param3] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param4] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param5] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param6] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param7] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param8] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param9] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param10] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param11] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [param12] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_webcolumnparam] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_webcolumnparam
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_webcolumnparam] ON
GO

SET IDENTITY_INSERT [dbo].[xy_webcolumnparam] OFF
GO


-- ----------------------------
-- Table structure for xy_website
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_website]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_website]
GO

CREATE TABLE [dbo].[xy_website] (
  [id] int  IDENTITY NOT NULL,
  [weburl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webfoot] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [email] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [phone] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tel] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [fax] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [weixin] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qq] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [copyright] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [logo] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [biglogo] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [qrcode] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [address] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [company] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [companyen] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [asporhtml] int DEFAULT 0 NULL,
  [webtitle] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webkeywords] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [webdescription] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [tplname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [domain] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [username] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [version] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [resurl] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [versiontime] datetime DEFAULT getdate() NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_website] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_website
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_website] ON
GO

INSERT INTO [dbo].[xy_website] ([id], [weburl], [webfoot], [email], [phone], [tel], [fax], [weixin], [qq], [copyright], [logo], [biglogo], [qrcode], [address], [company], [companyen], [asporhtml], [webtitle], [webkeywords], [webdescription], [tplname], [domain], [username], [version], [resurl], [versiontime], [createtime], [updatetime], [bodycontent]) VALUES (N'0', N'http://www.xiyueta.com/', N'地址：某某市某某区某某路1号国际1层<br>
邮编：000000<br>
电话：066-000000<br>
邮箱：313801120@qq.com', N'313801120@qq.com', N'18123456789', N'021-6666666', N'021-7777777', N'v123456', N'313801120', N'版权所有：&copy;2022 xiyueta.com ALL RIGHTS RESERVED xiyuetaCMS', N'/UploadFiles/testpic/logo.jpg', N'/UploadFiles/testpic/logo.png', N'/UploadFiles/testpic/qrcode.png', N'某某市某某区某某公路666弄66号', N'xiyuetaCMS网站管理系统', N'SHANGHUI XIYUETA CO., LTD', N'1', N'xiyuetaCMS内容管理系统-xiyueta.com', N'xiyuetaCMS,xiyueta,喜悦TA,xiyueta.com', N'xiyuetaCMS内容管理系统通用型后台权限管理框架，紧随潮流、开箱即用拥有多种版本选择，随意搭配使用', N'', N'', N'test', N'v1.0', N'', N'2023-08-18 21:18:36.530', N'2023-08-18 21:18:36.530', N'2023-08-18 21:18:36.530', N'')
GO

SET IDENTITY_INSERT [dbo].[xy_website] OFF
GO


-- ----------------------------
-- Table structure for xy_workattendance
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_workattendance]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_workattendance]
GO

CREATE TABLE [dbo].[xy_workattendance] (
  [id] int  IDENTITY NOT NULL,
  [userid] int DEFAULT -1 NULL,
  [gotowork] float(53) DEFAULT 0 NULL,
  [askforleave] float(53) DEFAULT 0 NULL,
  [compensatoryleave] float(53) DEFAULT 0 NULL,
  [belate] float(53) DEFAULT 0 NULL,
  [salary] float(53) DEFAULT 0 NULL,
  [netsalary] float(53) DEFAULT 0 NULL,
  [worktime] datetime DEFAULT getdate() NULL,
  [isthrough] int DEFAULT 1 NULL,
  [ip] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_workattendance] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_workattendance
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_workattendance] ON
GO

SET IDENTITY_INSERT [dbo].[xy_workattendance] OFF
GO


-- ----------------------------
-- Table structure for xy_xiyuetaclass
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[xy_xiyuetaclass]') AND type IN ('U'))
	DROP TABLE [dbo].[xy_xiyuetaclass]
GO

CREATE TABLE [dbo].[xy_xiyuetaclass] (
  [id] int  IDENTITY NOT NULL,
  [parentid] int DEFAULT -1 NULL,
  [columnname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [columnenname] nvarchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL,
  [sortrank] int DEFAULT 0 NULL,
  [isthrough] int DEFAULT 1 NULL,
  [createtime] datetime DEFAULT getdate() NULL,
  [updatetime] datetime DEFAULT getdate() NULL,
  [bodycontent] text COLLATE Chinese_PRC_CI_AS DEFAULT '' NULL
)
GO

ALTER TABLE [dbo].[xy_xiyuetaclass] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of xy_xiyuetaclass
-- ----------------------------
SET IDENTITY_INSERT [dbo].[xy_xiyuetaclass] ON
GO

SET IDENTITY_INSERT [dbo].[xy_xiyuetaclass] OFF
GO


-- ----------------------------
-- Auto increment value for xy_admin
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_admin
-- ----------------------------
ALTER TABLE [dbo].[xy_admin] ADD CONSTRAINT [PK__xy_admin__3213E83F139DBB87] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articlecount
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_articlecount
-- ----------------------------
ALTER TABLE [dbo].[xy_articlecount] ADD CONSTRAINT [PK__xy_artic__3213E83F2BAA4F42] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articledetail
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[xy_articledetail]', RESEED, 236)
GO


-- ----------------------------
-- Primary Key structure for table xy_articledetail
-- ----------------------------
ALTER TABLE [dbo].[xy_articledetail] ADD CONSTRAINT [PK__xy_artic__3213E83F04908221] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articlemessage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_articlemessage
-- ----------------------------
ALTER TABLE [dbo].[xy_articlemessage] ADD CONSTRAINT [PK__xy_artic__3213E83F38102627] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articlemessagecount
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_articlemessagecount
-- ----------------------------
ALTER TABLE [dbo].[xy_articlemessagecount] ADD CONSTRAINT [PK__xy_artic__3213E83F4FE7AFB8] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articlepic
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_articlepic
-- ----------------------------
ALTER TABLE [dbo].[xy_articlepic] ADD CONSTRAINT [PK__xy_artic__3213E83F67BF3949] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_articlesearch
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_articlesearch
-- ----------------------------
ALTER TABLE [dbo].[xy_articlesearch] ADD CONSTRAINT [PK__xy_artic__3213E83F5D41AAD6] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_chat
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_chat
-- ----------------------------
ALTER TABLE [dbo].[xy_chat] ADD CONSTRAINT [PK__xy_chat__3213E83F082C08DB] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_count
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_count
-- ----------------------------
ALTER TABLE [dbo].[xy_count] ADD CONSTRAINT [PK__xy_count__3213E83F4223A046] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_diary
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_diary
-- ----------------------------
ALTER TABLE [dbo].[xy_diary] ADD CONSTRAINT [PK__xy_diary__3214EC0737A611D3] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_feedback
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_feedback
-- ----------------------------
ALTER TABLE [dbo].[xy_feedback] ADD CONSTRAINT [PK__xy_feedb__3213E83F7207BD92] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_friendlink
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[xy_friendlink]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table xy_friendlink
-- ----------------------------
ALTER TABLE [dbo].[xy_friendlink] ADD CONSTRAINT [PK__xy_frien__3213E83F37DB1BFD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_guestbook
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_guestbook
-- ----------------------------
ALTER TABLE [dbo].[xy_guestbook] ADD CONSTRAINT [PK__xy_guest__3213E83F5A303401] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_iislog
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_iislog
-- ----------------------------
ALTER TABLE [dbo].[xy_iislog] ADD CONSTRAINT [PK__xy_iislo__3213E83F4E89772B] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_job
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_job
-- ----------------------------
ALTER TABLE [dbo].[xy_job] ADD CONSTRAINT [PK__xy_job__3213E83F46293B54] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_member
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[xy_member]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table xy_member
-- ----------------------------
ALTER TABLE [dbo].[xy_member] ADD CONSTRAINT [PK__xy_membe__3213E83F09DF4723] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_onepage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_onepage
-- ----------------------------
ALTER TABLE [dbo].[xy_onepage] ADD CONSTRAINT [PK__xy_onepa__3213E83F760D58A0] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_sheshi
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[xy_sheshi]', RESEED, 80)
GO


-- ----------------------------
-- Primary Key structure for table xy_sheshi
-- ----------------------------
ALTER TABLE [dbo].[xy_sheshi] ADD CONSTRAINT [PK__xy_shesh__3213E83F3939548A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_systemlog
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_systemlog
-- ----------------------------
ALTER TABLE [dbo].[xy_systemlog] ADD CONSTRAINT [PK__xy_syste__3213E83F2B754518] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_tags
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_tags
-- ----------------------------
ALTER TABLE [dbo].[xy_tags] ADD CONSTRAINT [PK__xy_tags__3213E83F20389C96] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_webcolumn
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[xy_webcolumn]', RESEED, 37)
GO


-- ----------------------------
-- Primary Key structure for table xy_webcolumn
-- ----------------------------
ALTER TABLE [dbo].[xy_webcolumn] ADD CONSTRAINT [PK__xy_webco__3213E83F5110DE1B] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_webcolumnparam
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_webcolumnparam
-- ----------------------------
ALTER TABLE [dbo].[xy_webcolumnparam] ADD CONSTRAINT [PK__xy_webco__3213E83F6AD0B01E] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_website
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_website
-- ----------------------------
ALTER TABLE [dbo].[xy_website] ADD CONSTRAINT [PK__xy_websi__3213E83F1AB4CD6A] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_workattendance
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_workattendance
-- ----------------------------
ALTER TABLE [dbo].[xy_workattendance] ADD CONSTRAINT [PK__xy_worka__3213E83F63849411] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for xy_xiyuetaclass
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table xy_xiyuetaclass
-- ----------------------------
ALTER TABLE [dbo].[xy_xiyuetaclass] ADD CONSTRAINT [PK__xy_xiyue__3213E83F459F2B6F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

