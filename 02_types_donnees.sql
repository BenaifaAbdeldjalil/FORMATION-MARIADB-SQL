-- =========================================================
-- PARTIE 02 : TYPES DE DONNEES
-- =========================================================
-- Nous utiliserons : INT, VARCHAR, DECIMAL, DATE, BOOLEAN, TEXT
-- Exemple :
CREATE TABLE test_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    note DECIMAL(4,2),
    actif BOOLEAN,
    date_naissance DATE,
    commentaire TEXT
);
