-- =========================================================
-- PARTIE 20 : SECURITE (USERS / PRIVILEGES)
-- =========================================================
-- Théorie :
-- Les utilisateurs et privilèges permettent de sécuriser l'accès à la base de données
-- GRANT : attribuer des droits
-- REVOKE : retirer des droits

-- Exemple pratique :
-- 1. Création d'un utilisateur lecteur
CREATE USER 'lecteur'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON gestion_ecole.* TO 'lecteur'@'localhost';

-- 2. Création d'un utilisateur admin
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON gestion_ecole.* TO 'admin'@'localhost';
