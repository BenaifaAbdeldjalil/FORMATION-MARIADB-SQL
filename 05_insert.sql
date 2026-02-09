-- =========================================================
-- PARTIE 05 : INSERTION DE DONNEES COHERENTES
-- =========================================================
-- Insertion des classes
INSERT INTO classes (nom, niveau) VALUES
('6ème A', '6ème'),
('5ème B', '5ème'),
('4ème A', '4ème');

-- Insertion des professeurs
INSERT INTO professeurs (nom) VALUES
('Mme Bernard'),
('M. Leroy'),
('Mme Dupont');

-- Insertion des cours
INSERT INTO cours (nom, professeur_id) VALUES
('Mathématiques', 1),
('Français', 2),
('Histoire-Géo', 3);

-- Insertion des élèves
INSERT INTO eleves (nom, prenom, date_naissance, classe_id) VALUES
('Dupont', 'Jean', '2012-05-15', 1),
('Martin', 'Sophie', '2011-08-22', 2),
('Bernard', 'Pierre', '2010-11-30', 3);

-- Insertion des notes
INSERT INTO notes (eleve_id, cours_id, note) VALUES
(1, 1, 15.5),
(1, 2, 12.0),
(2, 1, 18.0),
(3, 3, 14.5);
