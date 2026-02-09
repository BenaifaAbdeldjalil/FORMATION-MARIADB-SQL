-- =========================================================
-- PARTIE 24 : TRIGGERS AVANCES
-- =========================================================
-- Théorie :
-- Les triggers peuvent mettre à jour automatiquement d'autres tables ou vérifier des règles
--
-- Exemple pratique :
-- Après insertion d'une note, on écrit un log JSON dans la table logs

DELIMITER $$

CREATE TRIGGER after_insert_note
AFTER INSERT ON notes
FOR EACH ROW
BEGIN
  INSERT INTO logs (data) VALUES (CONCAT('{"action":"insert_note","eleve_id":', NEW.eleve_id, ',"cours_id":', NEW.cours_id, ',"note":', NEW.note, '}'));
END$$

DELIMITER ;
