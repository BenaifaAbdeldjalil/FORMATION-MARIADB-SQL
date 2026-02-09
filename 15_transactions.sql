-- =========================================================
-- PARTIE 15 : TRANSACTIONS
-- =========================================================
-- Théorie :
-- Une transaction permet de regrouper plusieurs opérations SQL en une seule unité.
-- - COMMIT : valide la transaction
-- - ROLLBACK : annule la transaction
-- Utile pour garantir l'intégrité des données

-- Exemple pratique :
-- Modification de notes en transaction

-- Début de la transaction
START TRANSACTION;

-- Mise à jour temporaire
UPDATE notes SET note=14 WHERE eleve_id=2 AND cours_id=1;

-- Annulation de la transaction
ROLLBACK;

-- Refaire la modification et valider
START TRANSACTION;
UPDATE notes SET note=17 WHERE eleve_id=2 AND cours_id=1;
COMMIT;
