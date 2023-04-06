
	-- Nouvelle vue
	USE Lab10
	GO
	CREATE VIEW Musique.VW_ChanteurNbChansons AS
	
	-- ?
	SELECT	C1.ChanteurID,
			C1.Nom, 
			C1.DateNaissance, 
			COUNT(C2.ChansonID) AS NbChansons
	FROM Musique.Chanteur AS C1
	INNER JOIN Musique.Chanson AS C2
	ON C2.ChanteurID = C1.ChanteurID
	GROUP BY C1.ChanteurID, C1.Nom, C1.DateNaissance;
	
	GO
	
	-- Résultat souhaité : id du chanteur, nom du chanteur, date de naissance et son nombre de chansons
	
	-- ChanteurID | Nom | Date de naissance | Nombre de chansons
	-- -----------|-----|-------------------|-------------------