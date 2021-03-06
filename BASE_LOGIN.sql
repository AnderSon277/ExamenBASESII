USE [KT_Escritorio]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[telefono] [varchar](10) NULL,
	[direccion] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[conductor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido] [varchar](30) NULL,
	[telefono] [varchar](10) NULL,
	[direccion] [varchar](40) NULL,
	[vehiculo_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[credenciales_cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](25) NULL,
	[correo] [varchar](40) NULL,
	[contraseña] [varchar](36) NULL,
	[cliente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[credenciales_conductor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](25) NULL,
	[correo] [varchar](40) NULL,
	[contraseña] [varchar](36) NULL,
	[conductor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ordenes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[costo] [numeric](10, 0) NULL,
	[ubicacion_inicial] [varchar](40) NULL,
	[ubicacion_final] [varchar](40) NULL,
	[cliente_id] [int] NULL,
	[conductor_id] [int] NULL,
	[metodo_pago] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vehiculo]    Script Date: 06/12/2019 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[placa] [varchar](7) NOT NULL,
	[chassis] [varchar](18) NOT NULL,
	[marca] [varchar](20) NULL,
	[modelo] [varchar](20) NULL,
	[tipo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id], [cedula], [nombre], [apellido], [telefono], [direccion]) VALUES (1, N'1727337501', N'Xavier', N'Calle', N'0981230929', N'El Condado')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[conductor] ON 

INSERT [dbo].[conductor] ([id], [cedula], [nombre], [apellido], [telefono], [direccion], [vehiculo_id]) VALUES (1, N'0102248489', N'Anderson', N'Cordova', N'0993335956', N'Zolanda', NULL)
SET IDENTITY_INSERT [dbo].[conductor] OFF
SET IDENTITY_INSERT [dbo].[credenciales_cliente] ON 

INSERT [dbo].[credenciales_cliente] ([id], [usuario], [correo], [contraseña], [cliente_id]) VALUES (1, N'xavier', N'xavier.calle@epn.edu.ec', N'inmejia1998', 1)
SET IDENTITY_INSERT [dbo].[credenciales_cliente] OFF
SET IDENTITY_INSERT [dbo].[credenciales_conductor] ON 

INSERT [dbo].[credenciales_conductor] ([id], [usuario], [correo], [contraseña], [conductor_id]) VALUES (1, N'anderson', N'anderson.cordova@epn.edu.ec', N'19981009', 1)
SET IDENTITY_INSERT [dbo].[credenciales_conductor] OFF
SET IDENTITY_INSERT [dbo].[ordenes] ON 

INSERT [dbo].[ordenes] ([id], [fecha], [costo], [ubicacion_inicial], [ubicacion_final], [cliente_id], [conductor_id], [metodo_pago]) VALUES (1, CAST(N'2016-12-10' AS Date), CAST(50 AS Numeric(10, 0)), N'El Condado', N'San Roque', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ordenes] OFF
ALTER TABLE [dbo].[ordenes] ADD  DEFAULT ((0)) FOR [costo]
GO
ALTER TABLE [dbo].[conductor]  WITH CHECK ADD FOREIGN KEY([vehiculo_id])
REFERENCES [dbo].[vehiculo] ([id])
GO
ALTER TABLE [dbo].[credenciales_cliente]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[credenciales_conductor]  WITH CHECK ADD FOREIGN KEY([conductor_id])
REFERENCES [dbo].[conductor] ([id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD FOREIGN KEY([conductor_id])
REFERENCES [dbo].[conductor] ([id])
GO
