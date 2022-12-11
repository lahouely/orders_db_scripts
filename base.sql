-- =============================================================================
-- Diagram Name: commands_db
-- Created on: 29/09/2010 05:47:32
-- Diagram Version: 1.0.0
-- =============================================================================
SET FOREIGN_KEY_CHECKS=0;

-- Drop table categories
DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) ZEROFILL NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(50),
  PRIMARY KEY(`id`)
)
ENGINE=INNODB;

-- Drop table cv
DROP TABLE IF EXISTS `cv`;

CREATE TABLE `cv` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50),
  `prenom` varchar(50),
  `niveau` varchar(50),
  PRIMARY KEY(`id`)
)
ENGINE=INNODB;

-- Drop table utilisateurs
DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(100),
  `motdepasse` char(32),
  `nom` varchar(50),
  `prenom` varchar(50),
  `adresse` varchar(100),
  `tel` varchar(50),
  `confirmation` char(10),
  `dateinscription` date,
  `lastcommande` int(11),
  PRIMARY KEY(`id`)
)
ENGINE=INNODB;

-- Drop table systeme
DROP TABLE IF EXISTS `systeme`;

CREATE TABLE `systeme` (
  `param` varchar(20) NOT NULL,
  `val` varchar(200),
  PRIMARY KEY(`param`)
)
ENGINE=INNODB;

-- Drop table commandes
DROP TABLE IF EXISTS `commandes`;

CREATE TABLE `commandes` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datecommande` date NOT NULL,
  `etat` int(11) NOT NULL,
  `utilisateur` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `adresselivraison` varchar(50),
  PRIMARY KEY(`id`),
  CONSTRAINT `Ref_04` FOREIGN KEY (`utilisateur`)
    REFERENCES `utilisateurs`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE=INNODB;

-- Drop table produits
DROP TABLE IF EXISTS `produits`;

CREATE TABLE `produits` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200),
  `prix` float(10,2),
  `categorie` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY(`id`),
  CONSTRAINT `Ref_01` FOREIGN KEY (`categorie`)
    REFERENCES `categories`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE=INNODB;

-- Drop table detailcommandes
DROP TABLE IF EXISTS `detailcommandes`;

CREATE TABLE `detailcommandes` (
  `commande` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `produit` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `quantite` int(11) UNSIGNED NOT NULL,
  `prix` float(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY(`commande`, `produit`),
  CONSTRAINT `Ref_02` FOREIGN KEY (`commande`)
    REFERENCES `commandes`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Ref_05` FOREIGN KEY (`produit`)
    REFERENCES `produits`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE=INNODB;

SET FOREIGN_KEY_CHECKS=1;
