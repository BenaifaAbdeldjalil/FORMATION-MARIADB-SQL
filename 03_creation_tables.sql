-- =========================================================
-- PARTIE 03 : CREATION DES TABLES PRINCIPALES
-- =========================================================
-- Théorie :
-- Ici nous allons créer les tables principales de notre base "gestion_ecole".
-- Une table est une structure qui contient des colonnes (champs) et des lignes (enregistrements).
-- Chaque table doit avoir au moins une clé primaire pour identifier de manière unique chaque ligne.
-- 
-- Nous allons créer les tables suivantes :
-- 1. classes : contient l'id, le nom et le niveau de la classe
-- 2. professeurs : contient l'id et le nom du professeur
-- 3. cours : contient l'id, le nom du cours et l'id du professeur qui le donne
-- 4. eleves : contient l'id, nom, prénom, date de naissance et l'id de la classe
-- 5. notes : contient l'id, l'id de l'élève, l'id du cours, la note, la date et un commentaire
--
-- Exemple pratique : créer la table "cours" avec 3 colonnes
-- - id : INT AUTO_INCREMENT PRIMARY KEY (identifiant unique)
-- - nom : VARCHAR(100) NOT NULL (nom du cours)
-- - professeur_id : INT (clé étrangère vers professeurs)

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
