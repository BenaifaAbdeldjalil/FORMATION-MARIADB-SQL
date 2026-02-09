-- =========================================================
-- PARTIE 04 : CONTRAINTES
-- =========================================================
-- Théorie :
-- Les contraintes permettent d'assurer l'intégrité des données dans une base.
-- Les contraintes les plus utilisées sont :
-- 1. PRIMARY KEY : identifie de manière unique chaque ligne d'une table
-- 2. FOREIGN KEY : relie une colonne à une clé primaire d'une autre table
-- 3. UNIQUE : assure que toutes les valeurs d'une colonne sont uniques
-- 4. NOT NULL : empêche une colonne d'avoir la valeur NULL
-- 5. CHECK : impose une condition sur les valeurs d'une colonne
--
-- Exemple pratique :
-- Ajouter des contraintes sur les tables déjà créées
-- - eleves.classe_id doit référencer classes.id
-- - cours.professeur_id doit référencer professeurs.id
-- - notes.eleve_id doit référencer eleves.id
-- - notes.cours_id doit référencer cours.id

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

-- Bonus : Exemple de contrainte CHECK sur notes
ALTER TABLE notes
ADD CONSTRAINT check_note CHECK (note BETWEEN 0 AND 20);
