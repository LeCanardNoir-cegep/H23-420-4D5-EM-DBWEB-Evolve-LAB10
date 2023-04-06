
	-- Nouvelle colonne pour la PK et la FK
	USE Lab10
	GO
	ALTER TABLE Musique.Chanteur
	ADD ChanteurID INT IDENTITY(1,1);
	GO
	
	USE Lab10
	GO
	ALTER TABLE Musique.Chanson
	ADD ChanteurID INT;
	GO

	
	-- Supprimer les anciennes contraintes FK puis PK (attention, l'ordre de suppression est important ici)
	
	USE Lab10
	GO
	ALTER TABLE Musique.Chanson
	DROP CONSTRAINT FK_Chanson_NomChanteur;
	GO

	USE Lab10
	GO
	ALTER TABLE Musique.Chanteur
	DROP CONSTRAINT PK_Chanteur_Nom;
	GO
	

	
	-- Nouvelles contraintes PK puis FK	
	USE Lab10
	GO
	ALTER TABLE Musique.Chanteur
	ADD CONSTRAINT PK_Chanteur_ID PRIMARY KEY (ChanteurID);
	GO
	
	USE Lab10
	GO
	ALTER TABLE Musique.Chanson
	ADD CONSTRAINT FK_Chanson_ChanteurID FOREIGN KEY (ChanteurID) REFERENCES Musique.Chanteur(ChanteurID);
	GO



	
	-- Remplir la nouvelle colonne FK
	USE Lab10
	GO
	UPDATE Musique.Chanson
	SET ChanteurID = (SELECT C.ChanteurID FROM Musique.Chanteur AS C WHERE C.Nom = NomChanteur);
	GO
	

	
	-- Supprimer l'ancienne colonne FK (On veut garder le nom des chanteurs, donc on ne supprime pas l'ancienne PK !)
	USE Lab10
	GO
	ALTER TABLE Musique.Chanson
	DROP COLUMN NomChanteur;
	GO

	