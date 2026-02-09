-- =========================================================
-- PARTIE 17 : FONCTIONS
-- =========================================================
-- Théorie :
-- Une fonction stockée retourne une valeur et peut être utilisée dans des requêtes SQL.
-- Utile pour encapsuler des calculs réutilisables
--
-- Exemple pratique : fonction pour calculer la moyenne des notes d'un élève

DELIMITER $$

CREATE FUNCTION moyenne_notes(eleve INT) RETURNS DECIMAL(4,2)
BEGIN
  DECLARE m DECIMAL(4,2);
  SELECT AVG(note) INTO m FROM notes WHERE eleve_id = eleve;
  RETURN m;
END$$

DELIMITER ;
