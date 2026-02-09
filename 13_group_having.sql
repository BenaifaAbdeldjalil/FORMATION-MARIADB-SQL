-- =========================================================
-- PARTIE 13 : GROUP BY / HAVING / AGGREGATS
-- =========================================================
-- Théorie :
-- GROUP BY permet de regrouper des lignes selon une ou plusieurs colonnes.
-- Les fonctions d'agrégat permettent de calculer des valeurs sur un groupe :
--  - COUNT() : nombre de lignes
--  - SUM() : somme
--  - AVG() : moyenne
--  - MAX() / MIN() : maximum / minimum
-- HAVING permet de filtrer les groupes (comme WHERE mais sur les agrégats)
--
-- Exemple pratique :
-- 1. Moyenne générale par élève
-- 2. Moyenne par cours

-- 1. Moyenne par élève
SELECT e.nom, e.prenom, ROUND(AVG(n.note),2) AS moyenne_generale
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY e.id
HAVING AVG(n.note) >= 12;

-- 2. Moyenne par cours
SELECT co.nom AS cours, ROUND(AVG(n.note),2) AS moyenne_cours
FROM cours co
JOIN notes n ON co.id = n.cours_id
GROUP BY co.id;
