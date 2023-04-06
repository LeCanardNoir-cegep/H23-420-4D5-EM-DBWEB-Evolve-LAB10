
	-- Nouvelle procédure
	USE Lab10
	GO

	CREATE PROCEDURE Musique.USP_ChanteurChansons
	@ChanteurID int
	AS
	BEGIN
		-- ?
		SELECT	C1.ChansonID,
				C1.Nom,
				C1.ChanteurID
		FROM Musique.Chanson AS C1
		WHERE C1.ChanteurID = @ChanteurID
	END
	GO