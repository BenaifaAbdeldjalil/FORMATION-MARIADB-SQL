-- =========================================================
-- 3️⃣ FONCTIONS DATE / TEMPS
-- =========================================================
-- Théorie :
-- NOW() : date + heure actuelles
-- CURDATE() : date du jour
-- DATE_ADD(date, INTERVAL n unit) : ajouter intervalle
-- DATEDIFF(d1,d2) : différence en jours
-- YEAR(date), MONTH(date), DAY(date) : extraire composants
-- TIMESTAMPDIFF(unit,d1,d2) : différence dans l’unité (YEAR, MONTH, DAY)
-- DATE_FORMAT(date, format) : formater date

-- Exemple 1 : Age des élèves en jours et en années
SELECT 
    e.nom, e.prenom,
    CURDATE() AS date_aujourdhui,
    DATEDIFF(CURDATE(), e.date_naissance) AS age_jours,
    TIMESTAMPDIFF(YEAR,e.date_naissance,CURDATE()) AS age_annees,
    DATE_ADD(e.date_naissance, INTERVAL 10 YEAR) AS date_plus_10_ans
FROM eleves e;

-- Exemple 2 : Date et heure d’insertion des notes
SELECT 
    n.id, e.nom, co.nom AS cours,
    n.note,
    n.date_note AS date_originale,
    DATE_ADD(n.date_note, INTERVAL 7 DAY) AS date_semaine_suivante,
    DATE_FORMAT(n.date_note,'%d/%m/%Y') AS date_fr
FROM notes n
JOIN eleves e ON n.eleve_id = e.id
JOIN cours co ON n.cours_id = co.id;

-- Exemple 3 : Moyenne des notes par année de naissance
SELECT 
    YEAR(e.date_naissance) AS annee_naissance,
    AVG(n.note) AS moyenne_par_annee
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY YEAR(e.date_naissance)
ORDER BY annee_naissance;
