-- =========================================================
-- EXERCICE FINAL : GESTION D’UNE ECOLE
-- =========================================================
-- Objectif :
-- Vous devez créer une base de données pour gérer une école avec :
-- - Classes, élèves, professeurs, cours, notes
-- - Contraintes (PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE)
-- - Requêtes avancées (SELECT, JOIN, GROUP BY, HAVING)
-- - Fonctions, triggers, transactions, vues et logs JSON
--
-- Partie 1 : Créer la base et les tables avec les bonnes contraintes
-- Partie 2 : Insérer des données cohérentes pour 4 classes, 8 élèves, 3 professeurs et 5 cours
-- Partie 3 : Requêtes avancées
-- Partie 4 : Création de fonctions et triggers
-- Partie 5 : Requêtes combinées avec vues et JSON
--
-- Explications supplémentaires :
-- - La fonction 'a_la_moyenne' doit vérifier si un élève a une moyenne générale >= 10
-- - Le trigger 'after_insert_note' doit automatiquement créer un log JSON après chaque insertion de note
-- - Les transactions doivent permettre de modifier plusieurs notes en une seule opération atomique


-- =========================================================
-- 00. Création de la base
-- =========================================================
CREATE DATABASE IF NOT EXISTS gestion_ecole CHARACTER SET utf8mb4;
USE gestion_ecole;

-- =========================================================
-- 01. Création des tables principales
-- =========================================================
CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    niveau VARCHAR(20)
);

CREATE TABLE professeurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    professeur_id INT,
    FOREIGN KEY (professeur_id) REFERENCES professeurs(id)
);

CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES classes(id)
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleve_id INT NOT NULL,
    cours_id INT NOT NULL,
    note DECIMAL(4,2) CHECK (note BETWEEN 0 AND 20),
    date_note DATE DEFAULT CURRENT_DATE,
    commentaire TEXT,
    FOREIGN KEY (eleve_id) REFERENCES eleves(id),
    FOREIGN KEY (cours_id) REFERENCES cours(id)
);

CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data JSON
);

-- =========================================================
-- 02. Insertion des données
-- =========================================================
INSERT INTO classes (nom, niveau) VALUES 
('6ème A', '6ème'), 
('5ème B', '5ème'), 
('4ème A', '4ème'), 
('3ème B', '3ème');

INSERT INTO professeurs (nom) VALUES
('Mme Bernard'), 
('M. Leroy'), 
('Mme Dupont');

INSERT INTO cours (nom, professeur_id) VALUES
('Mathématiques', 1), 
('Français', 2), 
('Histoire-Géo', 3),
('Sciences', 1),
('Anglais', 2);

INSERT INTO eleves (nom, prenom, date_naissance, classe_id) VALUES
('Dupont','Jean','2012-05-15',1),
('Martin','Sophie','2011-08-22',2),
('Bernard','Pierre','2010-11-30',3),
('Durand','Alice','2012-02-10',1),
('Petit','Lucas','2011-06-18',2),
('Moreau','Emma','2010-09-25',3),
('Fabre','Léo','2009-12-05',4),
('Roux','Clara','2010-03-17',4);

INSERT INTO notes (eleve_id, cours_id, note) VALUES
(1,1,15.5),(1,2,12.0),(1,4,14.0),
(2,1,18.0),(2,2,14.0),(2,5,16.0),
(3,3,14.5),(3,1,13.0),
(4,1,11.0),(4,2,13.0),
(5,1,10.5),(5,4,15.0),
(6,2,16.0),(6,3,14.0),
(7,4,12.5),(7,5,11.0),
(8,1,17.0),(8,2,14.5);

-- =========================================================
-- 03. Fonction pour vérifier si un élève a la moyenne
-- =========================================================
DELIMITER $$
CREATE FUNCTION a_la_moyenne(eleve INT) RETURNS BOOLEAN
BEGIN
  DECLARE m DECIMAL(4,2);
  SELECT AVG(note) INTO m FROM notes WHERE eleve_id = eleve;
  RETURN m >= 10;
END$$
DELIMITER ;

-- Explication : 
-- Cette fonction prend l'id d'un élève et retourne TRUE si sa moyenne >=10, sinon FALSE.
-- Exemple d'utilisation : 
-- SELECT nom, prenom FROM eleves WHERE a_la_moyenne(id);

-- =========================================================
-- 04. Trigger pour journalisation automatique des notes
-- =========================================================
DELIMITER $$
CREATE TRIGGER after_insert_note
AFTER INSERT ON notes
FOR EACH ROW
BEGIN
  INSERT INTO logs (data) VALUES (
    CONCAT('{"action":"insert_note","eleve_id":', NEW.eleve_id,
           ',"cours_id":', NEW.cours_id,
           ',"note":', NEW.note,'}')
  );
END$$
DELIMITER ;

-- Explication :
-- À chaque insertion d'une note, ce trigger crée automatiquement un log JSON
-- dans la table 'logs'. Cela permet de garder un historique des actions.

-- =========================================================
-- 05. Requêtes avancées
-- =========================================================
-- Moyenne par élève
SELECT e.nom, e.prenom, ROUND(AVG(n.note),2) AS moyenne_generale
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY e.id
ORDER BY moyenne_generale DESC;

-- Meilleur élève par cours
SELECT co.nom AS cours, e.nom, e.prenom, MAX(n.note) AS meilleure_note
FROM notes n
JOIN eleves e ON n.eleve_id = e.id
JOIN cours co ON n.cours_id = co.id
GROUP BY co.id;

-- Élèves ayant la moyenne
SELECT nom, prenom FROM eleves WHERE a_la_moyenne(id);

-- =========================================================
-- 06. Vues pour simplifier les requêtes
-- =========================================================
CREATE VIEW vue_moyennes AS
SELECT e.nom, e.prenom, ROUND(AVG(n.note),2) AS moyenne_generale
FROM eleves e
JOIN notes n ON e.id = n.eleve_id
GROUP BY e.id;

-- Exemple d'utilisation de la vue :
-- SELECT * FROM vue_moyennes WHERE moyenne_generale >= 15;

-- =========================================================
-- 07. Transaction : mise à jour multiple de notes
-- =========================================================
START TRANSACTION;
UPDATE notes SET note=16 WHERE eleve_id=4 AND cours_id=1;
UPDATE notes SET note=15 WHERE eleve_id=4 AND cours_id=2;
COMMIT;

-- Explication :
-- Toutes les modifications sont validées ensemble avec COMMIT.
-- Si une erreur survenait, on pourrait utiliser ROLLBACK pour annuler toutes les modifications.

-- =========================================================
-- 08. Requêtes JSON : afficher les logs
-- =========================================================
SELECT data->>'$.action' AS action, data->>'$.eleve_id' AS eleve_id, data->>'$.note' AS note
FROM logs;

-- Explication :
-- Cette requête extrait les informations JSON générées automatiquement par le trigger
-- et permet de voir les actions réalisées sur les notes.
