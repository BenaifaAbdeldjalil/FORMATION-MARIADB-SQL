-- =========================================================
-- PARTIE 07 : INSERT
-- =========================================================
INSERT INTO classes (nom, niveau) VALUES ('6ème A','6ème'),('5ème B','5ème');
INSERT INTO eleves (nom, prenom, classe_id) VALUES ('Dupont','Jean',1),('Martin','Sophie',2);
INSERT INTO professeurs (nom) VALUES ('Mme Bernard'),('M. Leroy');
INSERT INTO cours (nom, professeur_id) VALUES ('Mathématiques',1),('Français',2);

-- EXERCICE : ajouter 2 classes, 3 élèves, 2 professeurs, 3 cours
-- CORRECTION
-- INSERT INTO classes (nom,niveau) VALUES ('4ème A','4ème'),('3ème B','3ème');
-- INSERT INTO eleves (nom,prenom,classe_id) VALUES ('Bernard','Pierre',3),('Dupuis','Claire',4),('Martin','Lucas',3);
-- INSERT INTO professeurs (nom) VALUES ('Mme Dupont'),('M. Fabre');
-- INSERT INTO cours (nom,professeur_id) VALUES ('Histoire-Géo',3),('Physique',4),('Français avancé',3);
