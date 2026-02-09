-- =========================================================
-- PARTIE 04 : CONTRAINTES
-- =========================================================
-- Ajout des clés étrangères et autres contraintes

ALTER TABLE eleves
ADD CONSTRAINT fk_eleves_classes
FOREIGN KEY (classe_id) REFERENCES classes(id);

ALTER TABLE cours
ADD CONSTRAINT fk_cours_professeurs
FOREIGN KEY (professeur_id) REFERENCES professeurs(id);

ALTER TABLE notes
ADD CONSTRAINT fk_notes_eleves
FOREIGN KEY (eleve_id) REFERENCES eleves(id),
ADD CONSTRAINT fk_notes_cours
FOREIGN KEY (cours_id) REFERENCES cours(id);

-- Vérification : SHOW CREATE TABLE eleves;
