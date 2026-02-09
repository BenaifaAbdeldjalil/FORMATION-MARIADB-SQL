-- =========================================================
-- PARTIE 06 : CLÉ ÉTRANGÈRE
-- =========================================================
CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    niveau VARCHAR(20)
);

CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES classes(id)
);

-- EXERCICE : créer tables professeurs et cours avec FK
-- CORRECTION
-- CREATE TABLE professeurs (id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(50));
-- CREATE TABLE cours (id INT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(50), professeur_id INT, FOREIGN KEY (professeur_id) REFERENCES professeurs(id));
