-- ============================================================================
-- Diagram Name: commands_db
-- Created on: 29/09/2010 05:47:32
-- Diagram Version: 1.0.0
-- ============================================================================

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

-- INSERT INTO `systeme` (`param`, `val`) VALUES ('mdpadmin', MD5('somerandompassword'));
INSERT INTO `systeme` (`param`, `val`) VALUES ('cv', '1');

INSERT INTO `categories` VALUES (1,'Fruits','You know what fruits are :) ');
INSERT INTO `categories` VALUES (2,'Vegetables','Hmm...');
INSERT INTO `categories` VALUES (3,'Spice','Used to flavour food');

INSERT INTO produits (id, nom, description, prix, categorie)
VALUES
(100, 'Apple', 'A round fruit with a red or green skin', 1, 1),
(101, 'Banana', 'A long yellow fruit with a sweet taste', 1, 1),
(102, 'Orange', 'A round citrus fruit with a juicy orange flesh', 1, 1),
(103, 'Strawberry', 'A small red fruit with a sweet taste', 3, 1),
(104, 'Grapes', 'Small round fruit that grow in bunches on a vine', 4, 1),
(105, 'Pineapple', 'A tropical fruit with a tough exterior and sweet interior', 5, 1),
(106, 'Mango', 'A sweet juicy tropical fruit with a yellow flesh', 2, 1),
(107, 'Peach', 'A round fruit with a fuzzy exterior and sweet juicy interior', 2, 1),
(108, 'Cherry', 'A small red fruit with a sweet taste', 3, 1),
(109, 'Blueberries', 'A small blue fruit with a sweet taste', 4, 1),
(110, 'Raspberry', 'A small red fruit with a sweet tart taste', 5, 1),
(111, 'Blackberry', 'A small black fruit with a sweet taste', 6, 1),
(112, 'Watermelon', 'A large juicy fruit with a green exterior and pink interior', 7, 1),
(113, 'Kiwi', 'A small brown fruit with a green interior and a sweet taste', 2, 1),
(114, 'Cantaloupe', 'A round fruit with a orange interior and sweet taste', 3, 1),
(115, 'Honeydew', 'A round fruit with a green interior and sweet taste', 4, 1),
(116, 'Tomato', 'A round fruit with a red skin and juicy interior', 1, 1),
(117, 'Avocado', 'A pear-shaped fruit with a green exterior and creamy interior', 3, 1),
(118, 'Coconut', 'A large round fruit with a tough exterior and a white interior', 5, 1),
(119, 'Lemon', 'A round citrus fruit with a tart taste', 2, 1),
(120, 'Lime', 'A small round citrus fruit with a tart taste', 1, 1),
(121, 'Ginger', 'A root with a spicy taste', 4, 1),
(122, 'Garlic', 'A bulb with a strong taste', 3, 1),
(123, 'Lettuce', 'A leafy green vegetable', 2, 1),
(124, 'Spinach', 'A leafy green vegetable', 3, 1),
(125, 'Carrot', 'An orange root vegetable', 1, 1);

INSERT INTO produits (id, nom, description, prix, categorie)
VALUES
(200, 'Tomato', 'A round fruit with a red skin and juicy interior', 1, 2),
(201, 'Avocado', 'A pear-shaped fruit with a green exterior and creamy interior', 3, 2),
(202, 'Lettuce', 'A leafy green vegetable', 2, 2),
(203, 'Spinach', 'A leafy green vegetable', 3, 2),
(204, 'Carrot', 'An orange root vegetable', 1, 2),
(205, 'Potato', 'A brown skinned and white fleshed root vegetable', 2, 2),
(206, 'Onion', 'A bulb vegetable with a strong taste', 1, 2),
(207, 'Garlic', 'A bulb vegetable with a strong taste', 3, 2),
(208, 'Broccoli', 'A green vegetable with clusters of small flowers', 4, 2),
(209, 'Cauliflower', 'A white vegetable with clusters of small flowers', 5, 2),
(210, 'Green Beans', 'A long thin green vegetable', 3, 2),
(211, 'Peas', 'Small round green vegetables', 4, 2),
(212, 'Corn', 'A yellow vegetable with kernels on a cob', 5, 2),
(213, 'Eggplant', 'A purple fruit with a spongy texture', 4, 2),
(214, 'Zucchini', 'A green summer squash', 2, 2),
(215, 'Squash', 'A round yellow fruit with a sweet taste', 3, 2),
(216, 'Cucumber', 'A long green fruit with a cool crunchy texture', 1, 2),
(217, 'Pepper', 'A vegetable that comes in a variety of colors with a sweet taste', 2, 2),
(218, 'Mushroom', 'A fungus that grows in the dark', 4, 2),
(219, 'Asparagus', 'A green vegetable with a tender stem', 5, 2),
(220, 'Artichoke', 'A vegetable with a tough exterior and a tender interior', 6, 2),
(221, 'Radish', 'A small round vegetable with a crisp texture and a spicy taste', 1, 2),
(222, 'Turnip', 'A white root vegetable with a slightly sweet taste', 2, 2),
(223, 'Pumpkin', 'A large round orange fruit with a sweet taste', 5, 2),
(224, 'Beetroot', 'A round root vegetable with a sweet earthy taste', 3, 2),
(225, 'Sweet Potato', 'A sweet tasting root vegetable with a orange flesh', 4, 2);

INSERT INTO produits (id, nom, description, prix, categorie)
VALUES
(300, 'Cinnamon', 'A sweet and warm spice', 8, 3),
(301, 'Ginger', 'A spicy and aromatic root', 7, 3),
(302, 'Turmeric', 'A bright yellow spice with a warm bitter taste', 10, 3),
(303, 'Cloves', 'A sweet and slightly bitter spice', 9, 3),
(304, 'Cumin', 'A warm and earthy spice', 8, 3),
(305, 'Cardamom', 'A sweet and aromatic spice', 12, 3),
(306, 'Black Pepper', 'A hot and pungent spice', 9, 3),
(307, 'Mustard', 'A spicy and pungent seed', 8, 3),
(308, 'Coriander', 'A warm and slightly citrusy spice', 7, 3),
(309, 'Fennel', 'A sweet and slightly licorice-tasting spice', 10, 3),
(310, 'Curry Powder', 'A blend of spices with a warm taste', 12, 3),
(311, 'Cayenne Pepper', 'A hot and spicy red pepper', 9, 3),
(312, 'Saffron', 'A sweet and fragrant spice', 20, 3),
(313, 'Paprika', 'A mild and slightly sweet red pepper', 10, 3),
(314, 'Star Anise', 'A sweet and slightly licorice-tasting spice', 15, 3),
(315, 'Basil', 'A sweet and slightly peppery herb', 8, 3),
(316, 'Oregano', 'A warm and slightly bitter herb', 7, 3),
(317, 'Rosemary', 'A slightly piney and fragrant herb', 10, 3),
(318, 'Thyme', 'A slightly earthy and pungent herb', 9, 3),
(319, 'Mint', 'A sweet and refreshing herb', 8, 3),
(320, 'Sage', 'A slightly earthy and pungent herb', 10, 3),
(321, 'Parsley', 'A slightly earthy and fragrant herb', 8, 3),
(322, 'Tarragon', 'A slightly sweet and licorice-tasting herb', 9, 3),
(323, 'Chives', 'A mild and slightly sweet herb', 7, 3),
(324, 'Dill', 'A sweet and slightly sour herb', 8, 3),
(325, 'Marjoram', 'A sweet and slightly bitter herb', 9, 3);


SET FOREIGN_KEY_CHECKS=1;
