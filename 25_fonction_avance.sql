-- =========================================================
-- PARTIE 25 : FONCTIONS AVANCEES
-- =========================================================
-- Théorie :
-- Les fonctions stockées peuvent effectuer des calculs complexes et retourner des résultats
--
-- Exemple pratique : fonction pour savoir si un élève a la moyenne
DELIMITER $$

CREATE FUNCTION a_la_moyenne(eleve INT) RETURNS BOOLEAN
BEGIN
  DECLARE m DECIMAL(4,2);
  SELECT AVG(note) INTO m FROM notes WHERE eleve_id = eleve;
  RETURN m >= 10;
END$$

DELIMITER ;
