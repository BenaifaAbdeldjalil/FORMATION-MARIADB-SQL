-- =========================================================
-- PARTIE 12 : JOIN
-- =========================================================
-- Théorie :
-- JOIN permet de combiner plusieurs tables selon une relation (généralement via une clé étrangère)
-- Types : INNER JOIN (seulement les correspondances), LEFT JOIN, RIGHT JOIN
--
-- Exemple pratique :
-- 1. Afficher élèves et leur classe
-- 2. Afficher notes avec nom de l'élève et nom du cours

-- 1. Élèves avec leur classe
SELECT e.nom, e.prenom, c.nom AS classe
FROM eleves e
JOIN classes c ON e.classe_id = c.id;

-- 2. Notes avec détails
SELECT n.note, e.nom AS eleve, co.nom AS cours
FROM notes n
JOIN eleves e ON n.eleve_id = e.id
JOIN cours co ON n.cours_id = co.id;
