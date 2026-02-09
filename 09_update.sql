-- =========================================================
-- PARTIE 09 : UPDATE
-- =========================================================
-- Théorie :
-- UPDATE permet de modifier des lignes existantes dans une table.
-- Il est recommandé d'utiliser WHERE pour ne pas mettre à jour toutes les lignes par erreur.
--
-- Exemple pratique :
-- 1. Modifier le niveau de la classe '5ème B'
-- 2. Corriger la note de Jean Dupont en Mathématiques

-- 1. Mise à jour du niveau
UPDATE classes SET niveau='5ème avancée' WHERE nom='5ème B';

-- 2. Mise à jour de la note
UPDATE notes SET note=16.0 WHERE eleve_id=1 AND cours_id=1;
