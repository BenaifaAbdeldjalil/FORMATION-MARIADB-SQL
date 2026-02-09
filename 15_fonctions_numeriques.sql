-- =========================================================
-- PARTIE 26 : FONCTIONS INTEGREES (NUMERIQUES, TEXTE, DATE)
-- =========================================================
-- Objectif : apprendre à utiliser les fonctions intégrées de MariaDB
-- sur nos tables d’école (eleves, notes, cours, classes)
-- pour manipuler des nombres, du texte et des dates.

-- =========================================================
-- 1️⃣ FONCTIONS NUMERIQUES
-- =========================================================
-- Théorie :
-- SUM(expr) : somme
-- AVG(expr) : moyenne
-- ROUND(expr,n) : arrondi à n décimales
-- FLOOR(expr) : arrondi inférieur
-- CEIL(expr) : arrondi supérieur
-- MOD(a,b) : reste de la division a / b

-- Exemple 1 : Moyenne et total des notes par élève
SELECT 
    e.nom, e.prenom,
    SUM(n.note) AS total_notes,
    AVG(n.note) AS moyenne_exacte,
    ROUND(AVG(n.note),2) AS moyenne_arrondie,
    FLOOR(AVG(n.note)) AS moyenne_inf,
    CEIL(AVG(n.note)) AS moyenne_sup
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY e.id;

-- Exemple 2 : Moyenne par cours et reste de la division de la note maximale par 5
SELECT 
    co.nom AS cours,
    AVG(n.note) AS moyenne_cours,
    MAX(n.note) AS note_max,
    MOD(MAX(n.note),5) AS reste_division_5
FROM cours co
JOIN notes n ON co.id = n.cours_id
GROUP BY co.id;

