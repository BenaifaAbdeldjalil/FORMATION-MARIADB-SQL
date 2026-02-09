-- =========================================================
-- PARTIE 14 : VUES
-- =========================================================
-- Théorie :
-- Une vue est une table virtuelle créée à partir d'une requête SELECT.
-- Elle permet de simplifier l'accès aux données, centraliser les calculs, ou masquer certaines colonnes.
--
-- Exemple pratique :
-- 1. Vue des élèves avec nom, prénom et classe
-- 2. Vue des notes avec nom élève et nom cours

-- 1. Vue des élèves
CREATE VIEW vue_eleves AS
SELECT nom, prenom, classe_id FROM eleves;

-- 2. Vue des notes
CREATE VIEW vue_notes AS
SELECT e.nom AS eleve, co.nom AS cours, n.note
FROM notes n
JOIN eleves e ON n.eleve_id = e.id
JOIN cours co ON n.cours_id = co.id;
