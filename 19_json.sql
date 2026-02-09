-- =========================================================
-- PARTIE 19 : JSON
-- =========================================================
-- Théorie :
-- MariaDB supporte les colonnes JSON pour stocker des données semi-structurées
--
-- Exemple pratique :
-- Stocker des logs d'actions en format JSON

CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data JSON
);

INSERT INTO logs (data) VALUES ('{"action":"login","user":"Dupont"}');
