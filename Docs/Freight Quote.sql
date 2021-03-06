USE [FreightQuote]
GO
/****** Object:  Table [dbo].[Vender]    Script Date: 08/11/2015 16:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vender]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vender](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Vender] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quote]    Script Date: 08/11/2015 16:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quote](
	[QuoteId] [int] IDENTITY(1,1) NOT NULL,
	[VenderId] [int] NULL,
	[ReferenceNo] [nvarchar](30) NOT NULL,
	[PickupLocation] [nvarchar](50) NOT NULL,
	[DeliveryLocation] [nvarchar](50) NOT NULL,
	[ShipDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Comments] [nvarchar](200) NULL,
 CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED 
(
	[QuoteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_Quote_Vender]    Script Date: 08/11/2015 16:50:00 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quote_Vender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quote]'))
ALTER TABLE [dbo].[Quote]  WITH CHECK ADD  CONSTRAINT [FK_Quote_Vender] FOREIGN KEY([VenderId])
REFERENCES [dbo].[Vender] ([VendorId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quote_Vender]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quote]'))
ALTER TABLE [dbo].[Quote] CHECK CONSTRAINT [FK_Quote_Vender]
GO
