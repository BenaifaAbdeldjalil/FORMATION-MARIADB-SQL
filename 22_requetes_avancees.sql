-- =========================================================
-- PARTIE 22 : REQUETES AVANCEES
-- =========================================================
-- Théorie :
-- On peut combiner JOIN, GROUP BY, fonctions d'agrégat pour obtenir des statistiques avancées
--
-- Exemple pratique :
-- 1. Meilleur élève par cours
-- 2. Moyenne générale par classe

-- 1. Meilleur élève par cours
SELECT co.nom AS cours, e.nom, e.prenom, MAX(n.note) AS meilleure_note
FROM notes n
JOIN eleves e ON n.eleve_id = e.id
JOIN cours co ON n.cours_id = co.id
GROUP BY co.id;

-- 2. Moyenne générale par classe
SELECT c.nom AS classe, ROUND(AVG(n.note),2) AS moyenne_classe
FROM classes c
JOIN eleves e ON c.id = e.classe_id
JOIN notes n ON e.id = n.eleve_id
GROUP BY c.id;
