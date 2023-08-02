CREATE TABLE [Books] (
	Id integer IDENTITY(1,1) NOT NULL ,
	Title nvarchar(255) NOT NULL,
	PublishedYear datetime NOT NULL,
	CategoryID integer NOT NULL,
	AuthorID integer NOT NULL,
  CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Authors] (
	AuthorID integer IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	BirthDate datetime NOT NULL,
  CONSTRAINT [PK_AUTHORS] PRIMARY KEY CLUSTERED
  (
  [AuthorID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Categories] (
	CategoryID integer IDENTITY(1,1) NOT NULL,
	CategoryName nvarchar(50) NOT NULL,
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [CategoryID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Borrowers] (
	BorrowerID integer IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	Address nvarchar(255) NOT NULL,
	PhoneNumber nvarchar(20) NOT NULL,
	Email nvarchar(100) NOT NULL,
  CONSTRAINT [PK_BORROWERS] PRIMARY KEY CLUSTERED
  (
  [BorrowerID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Borrowings] (
	BorrowingID integer IDENTITY(1,1) NOT NULL,
	BookID integer NOT NULL,
	BorrowerID integer NOT NULL,
	BorrowedDate datetime NOT NULL,
	DueDate datetime NOT NULL,
	ReturnedDate datetime NOT NULL,
  CONSTRAINT [PK_BORROWINGS] PRIMARY KEY CLUSTERED
  (
  [BorrowingID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Reservations] (
	ReservationID integer IDENTITY(1,1) NOT NULL,
	BookID integer NOT NULL,
	BorrowerID integer NOT NULL,
	ReservationDate datetime NOT NULL,
	Status nvarchar(20) NOT NULL,
  CONSTRAINT [PK_RESERVATIONS] PRIMARY KEY CLUSTERED
  (
  [ReservationID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [Books_fk0] FOREIGN KEY ([CategoryID]) REFERENCES [Categories]([CategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Books] CHECK CONSTRAINT [Books_fk0]
GO
ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [Books_fk1] FOREIGN KEY ([AuthorID]) REFERENCES [Authors]([AuthorID])
ON UPDATE CASCADE
GO
ALTER TABLE [Books] CHECK CONSTRAINT [Books_fk1]
GO




ALTER TABLE [Borrowings] WITH CHECK ADD CONSTRAINT [Borrowings_fk0] FOREIGN KEY ([BookID]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Borrowings] CHECK CONSTRAINT [Borrowings_fk0]
GO
ALTER TABLE [Borrowings] WITH CHECK ADD CONSTRAINT [Borrowings_fk1] FOREIGN KEY ([BorrowerID]) REFERENCES [Borrowers]([BorrowerID])
ON UPDATE CASCADE
GO
ALTER TABLE [Borrowings] CHECK CONSTRAINT [Borrowings_fk1]
GO

ALTER TABLE [Reservations] WITH CHECK ADD CONSTRAINT [Reservations_fk0] FOREIGN KEY ([BookID]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Reservations] CHECK CONSTRAINT [Reservations_fk0]
GO
ALTER TABLE [Reservations] WITH CHECK ADD CONSTRAINT [Reservations_fk1] FOREIGN KEY ([BorrowerID]) REFERENCES [Borrowers]([BorrowerID])
ON UPDATE CASCADE
GO
ALTER TABLE [Reservations] CHECK CONSTRAINT [Reservations_fk1]
GO

