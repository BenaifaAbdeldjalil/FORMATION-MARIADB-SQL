-- =========================================================
-- PARTIE 18 : INDEX
-- =========================================================
-- Théorie :
-- Un index permet d'accélérer la recherche dans une table sur certaines colonnes.
-- Attention : trop d'index ralentit les INSERT/UPDATE
--
-- Exemple pratique :
-- Index sur le nom des élèves et sur le nom des cours

CREATE INDEX idx_nom_eleves ON eleves(nom);
CREATE INDEX idx_nom_cours ON cours(nom);
