-- =========================================================
-- PARTIE 16 : TRIGGERS
-- =========================================================
-- Théorie :
-- Un trigger (déclencheur) est un code SQL exécuté automatiquement avant ou après une action (INSERT, UPDATE, DELETE).
-- Utile pour vérifier des règles ou mettre à jour automatiquement des champs

-- Exemple pratique :
-- Avant l'insertion d'un élève, si le nom est NULL, on le remplace par 'Inconnu'

DELIMITER $$

CREATE TRIGGER before_insert_eleves
BEFORE INSERT ON eleves
FOR EACH ROW
BEGIN
  IF NEW.nom IS NULL THEN
    SET NEW.nom = 'Inconnu';
  END IF;
END$$

DELIMITER ;
