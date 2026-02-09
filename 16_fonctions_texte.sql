
-- =========================================================
-- 2️⃣ FONCTIONS TEXTE / CHAINE
-- =========================================================
-- Théorie :
-- CONCAT(a,b,...) : concatène des chaînes
-- LENGTH(str) : longueur
-- UPPER(str)/LOWER(str) : majuscule/minuscule
-- SUBSTRING(str,pos,len) : sous-chaîne
-- REPLACE(str,old,new) : remplacement texte
-- LEFT(str,n), RIGHT(str,n) : n premiers ou derniers caractères

-- Exemple 1 : Nom complet et transformation
SELECT 
    CONCAT(e.prenom,' ',e.nom) AS nom_complet,
    LENGTH(e.nom) AS longueur_nom,
    UPPER(e.nom) AS nom_majuscule,
    LOWER(e.prenom) AS prenom_minuscule,
    SUBSTRING(e.nom,1,3) AS debut_nom,
    REPLACE(e.nom,'a','@') AS nom_remplace_a
FROM eleves e;

-- Exemple 2 : Création d’un code élève unique
-- Exemple : première lettre du prénom + 3 lettres du nom + id
SELECT 
    CONCAT(UPPER(LEFT(e.prenom,1)),
           UPPER(SUBSTRING(e.nom,1,3)),
           e.id) AS code_eleve
FROM eleves e;
