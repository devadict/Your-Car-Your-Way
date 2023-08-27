CREATE TABLE `user` (
  `id` integer PRIMARY KEY NOT NULL,
  `adresse_id` integer COMMENT '1',
  `nom` varchar(255) NOT NULL COMMENT 'Franklin',
  `prenom` varchar(255) COMMENT 'Roosevelt',
  `email` varchar(255) COMMENT 'franroo@gmail.com',
  `role` varchar(255) COMMENT 'admin, client, support',
  `created_at` timestamp COMMENT 'now'
);

CREATE TABLE `agence` (
  `agence_id` integer PRIMARY KEY,
  `adresse_id` integer,
  `nom` varchar(255) COMMENT 'Agence de Toulouse'
);

CREATE TABLE `carburant` (
  `carburant_id` integer PRIMARY KEY,
  `note_ecologique` integer COMMENT '4/5',
  `nom` varchar(255) COMMENT 'Sans plomb 98',
  `details` varchar(255) COMMENT 'Le sans plomb 98 est un carburant...'
);

CREATE TABLE `type` (
  `type_id` integer PRIMARY KEY,
  `nom` varchar(255) COMMENT '4 fois 4, Berline, Espace',
  `description` varchar(255) COMMENT 'Le 4 fois 4 est idéal pour vos balades à la montagne etc...'
);

CREATE TABLE `fonctionnalite` (
  `fonctionnalite_id` integer PRIMARY KEY,
  `nom` varchar(255) COMMENT 'Climatisation, Toit ouvrant, Conduite autonome, Semi Autonome',
  `description` varchar(255) COMMENT 'Le toit ouvrant vous permettra de profiter pleinement de la vue'
);

CREATE TABLE `vehicule` (
  `vehicule_id` integer PRIMARY KEY,
  `agence_id` integer COMMENT '1',
  `carburant_id` integer COMMENT '1',
  `type_id` integer COMMENT '1',
  `marque_id` integer COMMENT '1',
  `fonctionnalite_id` integer COMMENT '1',
  `passagers` integer COMMENT '5',
  `modele` varchar(255) COMMENT 'Land Cruiser',
  `description` varchar(255) COMMENT 'Parfaite pour des terrains hostiles',
  `tarif_journalier` decimal COMMENT '200'
);

CREATE TABLE `adresse` (
  `adresse_id` integer,
  `numero` integer,
  `rue` varchar(255),
  `code_postal` varchar(255),
  `ville` varchar(255),
  `pays` varchar(255)
);

CREATE TABLE `location` (
  `location_id` integer PRIMARY KEY,
  `vehicule_id` integer,
  `user_id` integer,
  `agence_id` integer,
  `created_at` timestamp,
  `date_debut` datetime,
  `date_fin` datetime,
  `moyen_paiement` varchar(255),
  `tarif_journalier` decimal,
  `carburant_fin` varchar(255) COMMENT 'Plein, Demi plein, Electirque',
  `montant_total` decimal
);

CREATE TABLE `marque` (
  `marque_id` integer PRIMARY KEY,
  `nom` varchar(255),
  `description` varchar(255)
);

ALTER TABLE `fonctionnalite` ADD CONSTRAINT `name` FOREIGN KEY (`fonctionnalite_id`) REFERENCES `vehicule` (`fonctionnalite_id`);

ALTER TABLE `marque` ADD CONSTRAINT `name` FOREIGN KEY (`marque_id`) REFERENCES `vehicule` (`marque_id`);

ALTER TABLE `type` ADD CONSTRAINT `name` FOREIGN KEY (`type_id`) REFERENCES `vehicule` (`type_id`);

ALTER TABLE `user` ADD CONSTRAINT `name` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`adresse_id`);

ALTER TABLE `agence` ADD CONSTRAINT `name` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`adresse_id`);

ALTER TABLE `vehicule` ADD CONSTRAINT `name` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`agence_id`);

ALTER TABLE `location` ADD CONSTRAINT `name` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`agence_id`);

ALTER TABLE `location` ADD CONSTRAINT `name` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`vehicule_id`);

ALTER TABLE `vehicule` ADD CONSTRAINT `name` FOREIGN KEY (`carburant_id`) REFERENCES `carburant` (`carburant_id`);

ALTER TABLE `location` ADD CONSTRAINT `name` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `vehicule` ADD FOREIGN KEY (`type_id`) REFERENCES `vehicule` (`carburant_id`);
