-- =========================================================
-- PARTIE 02 : TYPES DE DONNÉES
-- =========================================================
CREATE TABLE exemple_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    description TEXT,
    prix DECIMAL(10,2),
    actif BOOLEAN,
    date_creation DATE
);

-- EXERCICE : créer table produit avec nom, prix, stock
-- CORRECTION
-- CREATE TABLE produit (id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(50), prix DECIMAL(10,2), stock INT);
