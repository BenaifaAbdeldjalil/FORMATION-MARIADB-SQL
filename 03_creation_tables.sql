-- =========================================================
-- PARTIE 03 : CREATION DES TABLES PRINCIPALES
-- =========================================================
-- Tables : classes, eleves, professeurs, cours, notes

CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    niveau VARCHAR(20)
);

CREATE TABLE professeurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    professeur_id INT
);

CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    classe_id INT
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleve_id INT NOT NULL,
    cours_id INT NOT NULL,
    note DECIMAL(4,2),
    date_note DATE DEFAULT (CURRENT_DATE),
    commentaire TEXT
);
