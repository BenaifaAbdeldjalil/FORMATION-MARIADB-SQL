-- =========================================================
-- PARTIE 11 : LIKE / BETWEEN / IN
-- =========================================================
-- Théorie :
-- LIKE : filtre les chaînes de caractères avec des motifs (% pour plusieurs caractères, _ pour un seul)
-- BETWEEN : sélectionne les valeurs entre deux limites inclusives
-- IN : sélectionne les valeurs présentes dans une liste
--
-- Exemple pratique :
-- 1. Élèves dont le nom commence par 'D'
-- 2. Notes entre 12 et 16
-- 3. Professeurs avec id 1 ou 3

-- 1. LIKE
SELECT * FROM eleves WHERE nom LIKE 'D%';

-- 2. BETWEEN
SELECT * FROM notes WHERE note BETWEEN 12 AND 16;

-- 3. IN
SELECT * FROM professeurs WHERE id IN (1,3);
