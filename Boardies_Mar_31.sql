USE [Boardies]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03/26/2021 13:09:15 PM ******/
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Price] [decimal] NOT NULL,
	[CartProductImage] [varchar](50) NOT NULL,
	[ProductCate] [varchar](58) NOT NULL,
	[CartProductQuantity] [int] NOT NULL,
	[UserEmail] [varchar](50) NOT NULL
  )
  GO
  /****** Object:  Table [dbo].[Addresses]    Script Date: 03/19/2021 7:49:21 PM ******/
CREATE TABLE [dbo].[Addresses](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[address1] [varchar](255) NOT NULL,
	[address2] [varchar](255) NULL,
	[city] [varchar](28) NOT NULL,
	[province] [varchar](28) NOT NULL,
	[postalCode] [varchar](7) NOT NULL,
	[country] [varchar](28) NOT NULL,
	[phone] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] NOT NULL,
	[categoryName] [varchar](58) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[image] [varchar](58) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [smallint] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[addressID] [int] NOT NULL,
	[subTotal] [decimal](10, 2) NULL,
	[discount] [decimal](10, 2) NULL,
	[shippingFee] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
	[orderDate] [datetime] NULL,
	[status] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](40) NOT NULL,
	[categoryID] [int] NULL,
	[productPrice] [decimal](10, 2) NULL,
	[unitsInStock] [smallint] NULL,
	[productDescription] [varchar](max) NOT NULL,
	[manufactureYear] [smallint] NOT NULL,
	[productImage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreOrder]    Script Date: 1/4/2021 22:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreOrder](
	[PreOrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[TotalPrePrice] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PreOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[promotionID] [int] NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/19/2021 7:49:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [varchar](50) NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[phone] [varchar](12) NULL,
	[email] [varchar](50) NOT NULL,
	[userName] [varchar](30) NOT NULL,
	[userPassword] [varchar](150) NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([addressID], [userID], [fullName], [address1], [address2], [city], [province], [postalCode], [country], [phone]) VALUES (1, N's8tv8ru2m', N'John Doe', N'PickInStore', N'20 Woodlawn Road East', N'Guelph', N'Yukon', N'N1H1G7', N'Canada', N'5198222344')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (1, N'Child', N'Game for Child', N'https://i.ibb.co/svbRMpf/Child.jpg')
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (2, N'Family', N'Game for Family', N'https://i.ibb.co/SQCTJxL/Family.jpg')
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (3, N'Strategy Light', N'Game for Strategy Light', N'https://i.ibb.co/3v8fhJ9/Strategy-Light.jpg')
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (4, N'Strategy Advanced', N'Game for Strategy Advanced', N'https://i.ibb.co/XynZz4s/Strategy-Advanced.jpg')
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (5, N'Wargames', N'Game for War', N'https://i.ibb.co/wQ239L3/Wargames.jpg')
INSERT [dbo].[Categories] ([categoryID], [categoryName], [description], [image]) VALUES (6, N'Adventures', N'Game for Adventures', N'https://i.ibb.co/QvtGqWd/Adventures.jpg')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (1, N'Monza', 1, CAST(45.00 AS Decimal(10, 2)), 20, N'Player: 2-6, Age: Above 5, Game time: approx. 10-15 mins, In the game, all dice are rolled each roun', 2020, N'https://i.ibb.co/TckCw0t/monza.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (2, N'Story Cubes', 1, CAST(20.00 AS Decimal(10, 2)), 20, N'Throw 9 dice and tell the story in the thrown pattern. " Story Cubes" offers endless creative possibilities. There is no right or wrong story. Anyone can write their own story. Great for families, travel, entertainment and parties! " Story Cubes" brings joy to everyone! The only rule: there is no wrong answer', 2020, N'https://i.ibb.co/kckY7mH/storycubes.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (3, N'Geometric Art', 1, CAST(35.00 AS Decimal(10, 2)), 20, N'Player: 3-5, Age: Above 7, Game time: approx. 30 mins, Utilizing various geometric symbols as creative media, everyone draws and guesses questions in turn. The goal is to get the viewer to understand your work and guess the name of your painting.', 2020, N'https://i.ibb.co/DYpfthp/geometricart.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (4, N'Rat a Tat Roll', 1, CAST(40.00 AS Decimal(10, 2)), 20, N'Player: 2-5, Age: Above 6, Game time: approx. 15 mins, Travel around the country on the game board and try to collect low number cards (cats) while avoiding high number cards (rats). Choose one, two, or three dice and store the reroll board in case you miss the point you want to stay. Always pay attention to the "peeping" and "exchange" of the game. Be especially careful in black spots where opportunities and destiny can be intertwined and things can really get confused. The player with the lowest total score wins!', 2020, N'https://i.ibb.co/wMhLPDt/ratatatroll.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (5, N'Metro X', 1, CAST(35.00 AS Decimal(10, 2)), 20, N'Player: 1-6, Age: Above 8, Game time: approx. 20 mins, Flip a card, choose a subway line, and cross off the given number of stops on your map. Earn bonuses for making transfers, but lose points for incomplete tracks. Everyone plays at the same time, so theres never a dull moment as you race to complete routes. Get the highest score and become an underground sensation!', 2020, N'https://i.ibb.co/HC6sPrQ/metrox.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (6, N'FROZEN II', 1, CAST(25.00 AS Decimal(10, 2)), 20, N'Player: 2-5, Age: Above 4, Game time: approx. 10 mins, Multiplayer participation in four game modes is more exciting and fun than heart disease, as long as you observe carefully and react quickly. Try it, be aware that everyone is addicted! The game can stimulate the observation, reaction and concentration of all players, and the process of play can further develop the players social interaction skills. The round tin box is light and easy to carry, and you can play along the way!', 2020, N'https://i.ibb.co/c8BBj5F/frozenii.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (7, N'Carcassonne', 2, CAST(30.00 AS Decimal(10, 2)), 20, N'Player: 2-6, Age: Above 7, Game time: approx. 40 mins, This extended version should be used with the base version of Cagason. You can add all or part of the accessories for this extension to the base version to play the game. You can also use other extensions to enjoy Cagasons unique experience as you like.', 2020, N'https://i.ibb.co/RQnmyTP/carcassonne.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (8, N'Azul: Stained Glass of Sintra', 2, CAST(55.00 AS Decimal(10, 2)), 20, N'Player: 2-4, Age: Above 8, Game time: approx. 30-45 mins, Welcome to Sintra Palace, a stained glass craftsman from all over the world! Her magnificent beauty and her noble and elegant temperament gave her the honor of her "World Cultural Heritage". Now is the day of maintenance and renovation. Can her superior technology make her beautiful again?The game concept of this game is very different from the previous game. Although there is a tradition of choosing bricks in order, each player has his or her own topic structure and pace choices that will have a significant impact on the entire gaming experience. When faced with a new game, the strategic background of the player is stimulated.', 2020, N'https://i.ibb.co/c89NCyq/azul.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (9, N'Welcome', 2, CAST(35.00 AS Decimal(10, 2)), 20, N'Player: 1-100, Age: Above 10, Game time: approx. 25 mins, 
To plan and build three streets, you need to compete with other players. Considering the large parks and exquisite pools, who will complete the city planning fastest, building a community that people will talk about and achieving the best results?

Everyone decides which number to use from the same card and the special effects to combine with it. You can be the best architect only if the combination of the two is used perfectly!
', 2020, N'https://i.ibb.co/K7yKX9N/welcome.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (10, N'Minecraft', 2, CAST(70.00 AS Decimal(10, 2)), 20, N'Player: 2-4, Age: Above 10, Game time: approx. 30-60 mins, 
Think resources wisely, build magnificent buildings, and bravely challenge dangerous monsters and conspiracy enemies. At the end of the game, the player with the highest score wins.
', 2020, N'https://i.ibb.co/CQP1NV8/minecraft.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (11, N'Europa 1912', 2, CAST(30.00 AS Decimal(10, 2)), 20, N'Player: 2-5, Age: Above 8, Game time: approx. 30-60 mins, 
Railway Mission Europe 1912 has been expanded to include 101 destination tickets (46 original tickets and 55 new tickets), and the European version of Railway Mission Europe adds three new ways to play. Based on the original, we have added 19 new routes and some big European cities.
', 2020, N'https://i.ibb.co/R0pdLD3/europa1912.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (12, N'Zertz', 3, CAST(50.00 AS Decimal(10, 2)), 20, N'Player: 2, Age: Above 13, Game time: approx. 30-60 mins, 
Join the tee to the chess board, place the ball and remove the tee during the round, or capture the ball on the chess board crossing an adjacent ball.
The player who first captures the specified color and number of balls wins.
', 2020, N'https://i.ibb.co/rFjBMWS/zertz.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (13, N'Century (Golem Edition)', 3, CAST(50.00 AS Decimal(10, 2)), 20, N'Player: 2-4, Age: Above 8, Game time: approx. 45 mins, Guides is included in the game.', 2020, N'https://i.ibb.co/qdV5kP0/century.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (14, N'Twilight Imperium 4th edition', 4, CAST(235.00 AS Decimal(10, 2)), 20, N'Player: 2-4, Age: Above 14, Game time: above 240 mins, 
Twilight Imperium (Fourth Edition) is a game of galactic conquest in which three to six players take on the role of one of seventeen factions vying for galactic domination through military might, political maneuvering, and economic bargaining. Every faction offers a completely different play experience, from the wormhole-hopping Ghosts of Creuss to the Emirates of Hacan, masters of trade and economics. These seventeen races are offered many paths to victory, but only one may sit upon the throne of Mecatol Rex as the new masters of the galaxy.
', 2020, N'https://i.ibb.co/WttLB7Y/twilight.jpg')
INSERT [dbo].[Products] ([productID], [productName], [categoryID], [productPrice], [unitsInStock], [productDescription], [manufactureYear], [productImage]) VALUES (15, N'Fresco', 4, CAST(85.00 AS Decimal(10, 2)), 20, N'Player: 3-4, Age: Above 10, Game time: approx. 60 mins, 
In Fresco, players are master painters working to restore a fresco in a Renaissance church.

Each round begins with players deciding what time they would like to wake up for the day. The earlier you wake up, the earlier you will be in turn order, and the better options you will be guaranteed to have. Wake up early too often, however, and your apprentices will become unhappy and stop working as efficiently. They would much rather sleep in!
', 2020, N'https://i.ibb.co/1vMcf1s/fresco.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Users] ([userID], [fullName], [phone], [email], [userName], [userPassword], [isAdmin]) VALUES (N'12232', N'admin', NULL, N'admin@boardies.com', N'admin@boardies.com', N'$2a$10$qE1.8TVJCsLvHTjsVdILve95CDzaJ0PBWldoHJ8Ht7GqBw55BU36C', 1)
INSERT [dbo].[Users] ([userID], [fullName], [phone], [email], [userName], [userPassword], [isAdmin]) VALUES (N's8tv8ru2m', N'mark', N'', N'usertest123@gmail.com', N'usertest123@gmail.com', N'$2a$10$m4FrMHGc/1qZcEMQ5w3w2OumXnAQxpFo9w.rIrJw0/cdzY1Aj5YnK', 0)
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__produc__31EC6D26]  DEFAULT ((0)) FOR [productPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__unitsI__32E0915F]  DEFAULT ((0)) FOR [unitsInStock]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Users_userID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Users_userID]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
