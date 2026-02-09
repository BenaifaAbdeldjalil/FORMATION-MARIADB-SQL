-- =========================================================
-- PARTIE 23 : VUES AVANCEES
-- =========================================================
-- Théorie :
-- On peut créer des vues combinant plusieurs tables et calculs
--
-- Exemple pratique :
-- Vue des élèves avec leur moyenne générale

CREATE VIEW vue_moyenne_eleves AS
SELECT e.nom, e.prenom, ROUND(AVG(n.note),2) AS moyenne_generale
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY e.id;
