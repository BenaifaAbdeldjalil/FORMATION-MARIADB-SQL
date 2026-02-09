-- =========================================================
-- PARTIE 04 : CLÉ PRIMAIRE
-- =========================================================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);

-- EXERCICE : ajouter clé primaire à table livres
-- CORRECTION
-- CREATE TABLE livres (id INT AUTO_INCREMENT PRIMARY KEY, titre VARCHAR(100));
