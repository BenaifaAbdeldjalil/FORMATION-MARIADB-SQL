-- =========================================================
-- PARTIE 21 : PROCEDURES STOCKEES
-- =========================================================
-- Théorie :
-- Une procédure stockée est un bloc SQL enregistré dans la base de données.
-- Elle permet d'exécuter plusieurs commandes SQL en une seule fois.
-- Utile pour automatiser des tâches ou centraliser des calculs
--
-- Exemple pratique : procédure pour mettre à jour une note d'un élève

DELIMITER $$

CREATE PROCEDURE maj_note(IN pid INT, IN pnote DECIMAL(4,2))
BEGIN
  UPDATE notes SET note=pnote WHERE id=pid;
END$$

DELIMITER ;
