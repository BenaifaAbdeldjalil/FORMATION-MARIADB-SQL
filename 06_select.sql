-- =========================================================
-- PARTIE 06 : SELECT
-- =========================================================
-- Théorie :
-- La commande SELECT permet de récupérer des données d'une table.
-- On peut sélectionner toutes les colonnes (*) ou seulement certaines colonnes.
-- On peut également renommer les colonnes avec AS pour améliorer la lisibilité.
--
-- Exemple pratique :
-- 1. Afficher tous les élèves
-- 2. Afficher tous les cours avec le nom du professeur correspondant

-- 1. Tous les élèves
SELECT * FROM eleves;

-- 2. Tous les cours avec leur professeur
SELECT co.nom AS cours, p.nom AS professeur
FROM cours co
JOIN professeurs p ON co.professeur_id = p.id;

-- =========================================================
-- PARTIE 07 : WHERE
-- =========================================================
-- Théorie :
-- WHERE permet de filtrer les lignes selon une condition.
-- On peut utiliser des opérateurs =, <, >, <=, >=, !=, LIKE, BETWEEN, IN...
--
-- Exemple pratique :
-- 1. Sélectionner les élèves de la classe 6ème A
-- 2. Sélectionner les notes supérieures à 15

-- 1. Élèves de la classe 6ème A
SELECT nom, prenom FROM eleves WHERE classe_id = 1;

-- 2. Notes supérieures à 15
SELECT * FROM notes WHERE note > 15;

-- =========================================================
-- PARTIE 08 : ORDER BY / LIMIT
-- =========================================================
-- Théorie :
-- ORDER BY permet de trier les résultats par une ou plusieurs colonnes (ASC ou DESC)
-- LIMIT permet de limiter le nombre de lignes retournées
--
-- Exemple pratique :
-- 1. Trier les élèves par nom croissant
-- 2. Afficher seulement les 2 premiers cours par nom

-- 1. Tri par nom
SELECT * FROM eleves ORDER BY nom ASC;

-- 2. Limiter à 2 résultats
SELECT * FROM cours ORDER BY nom LIMIT 2;


