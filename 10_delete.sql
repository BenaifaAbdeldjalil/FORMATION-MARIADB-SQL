-- =========================================================
-- PARTIE 10 : DELETE
-- =========================================================
-- Théorie :
-- DELETE permet de supprimer des lignes d'une table.
-- Attention : sans WHERE, toutes les lignes seront supprimées !
--
-- Exemple pratique :
-- 1. Supprimer un cours
-- 2. Supprimer un élève

-- 1. Supprimer le cours 'Histoire-Géo'
DELETE FROM cours WHERE nom='Histoire-Géo';

-- 2. Supprimer l'élève Pierre Bernard
DELETE FROM eleves WHERE nom='Bernard' AND prenom='Pierre';
