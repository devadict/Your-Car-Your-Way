CREATE DATABASE IF NOT EXISTS ycyw;

USE ycyw;


CREATE TABLE `user` (
  `id` integer PRIMARY KEY NOT NULL,
  `adresse_id` integer COMMENT '1',
  `nom` varchar(100) NOT NULL COMMENT 'Franklin',
  `prenom` varchar(50) COMMENT 'Roosevelt',
  `email` varchar(50) COMMENT 'franroo@gmail.com',
  `role` varchar(10) COMMENT 'admin, client, support',
  `created_at` timestamp COMMENT 'now',
  FOREIGN KEY (`adresse_id`) REFERENCES `adresse`(`adresse_id`)
);

CREATE TABLE `agence` (
  `agence_id` integer PRIMARY KEY NOT NULL,
  `adresse_id` integer,
  `nom` varchar(50) COMMENT 'Agence de Toulouse',
  FOREIGN KEY (`adresse_id`) REFERENCES `adresse`(`adresse_id`)
);

CREATE TABLE `carburant` (
  `carburant_id` integer PRIMARY KEY NOT NULL,
  `note_ecologique` integer COMMENT '4',
  `nom` varchar(100) COMMENT 'Sans plomb 98',
  `details` varchar(255) COMMENT 'Le sans plomb 98 est un carburant...'
);

CREATE TABLE `type` (
  `type_id` integer PRIMARY KEY NOT NULL,
  `nom` varchar(100) COMMENT '4 fois 4, Berline, Espace',
  `description` varchar(255) COMMENT 'Le 4 fois 4 est idéal pour vos balades à la montagne etc...'
);

CREATE TABLE `fonctionnalite` (
  `fonctionnalite_id` integer PRIMARY KEY NOT NULL,
  `nom` varchar(100) COMMENT 'Climatisation, Toit ouvrant, Conduite autonome, Semi Autonome',
  `description` varchar(255) COMMENT 'Le toit ouvrant vous permettra de profiter pleinement de la vue'
);

CREATE TABLE `vehicule` (
  `vehicule_id` integer PRIMARY KEY NOT NULL,
  `carburant_id` integer COMMENT '1',
  `type_id` integer COMMENT '1',
  `marque_id` integer COMMENT '1',
  `passagers` integer COMMENT '5',
  `modele` varchar(100) COMMENT 'Land Cruiser',
  `description` varchar(255) COMMENT 'Parfaite pour des terrains hostiles',
  `tarif_journalier` decimal COMMENT '200',
  FOREIGN KEY (`carburant_id`) REFERENCES `carburant`(`carburant_id`),
  FOREIGN KEY (`type_id`) REFERENCES `type`(`type_id`),
  FOREIGN KEY (`marque_id`) REFERENCES `marque`(`marque_id`)
);

CREATE TABLE `vehicule_agence` (
  `vehicule_id` integer,
  `agence_id` integer,
  PRIMARY KEY (`vehicule_id`, `agence_id`),
  FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule`(`vehicule_id`),
  FOREIGN KEY (`agence_id`) REFERENCES `agence`(`agence_id`)
);

CREATE TABLE `vehicule_fonctionnalite` (
  `vehicule_id` integer,
  `fonctionnalite_id` integer,
  -- Add any additional attributes related to the association here
  PRIMARY KEY (`vehicule_id`, `fonctionnalite_id`),
  FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule`(`vehicule_id`),
  FOREIGN KEY (`fonctionnalite_id`) REFERENCES `fonctionnalite`(`fonctionnalite_id`)
);

CREATE TABLE `adresse` (
  `adresse_id` integer NOT NULL,
  `numero` integer,
  `rue` varchar(255),
  `code_postal` varchar(100),
  `ville` varchar(100),
  `pays` varchar(255)
);

CREATE TABLE `location` (
  `location_id` integer PRIMARY KEY NOT NULL,
  `vehicule_id` integer,
  `user_id` integer,
  `agence_id` integer,
  `created_at` timestamp,
  `date_debut` datetime,
  `date_fin` datetime,
  `moyen_paiement` varchar(100),
  `tarif_journalier` decimal,
  `carburant_fin` varchar(255) COMMENT 'Plein, Demi plein, Electirque',
  `montant_total` decimal,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
  FOREIGN KEY (`agence_id`) REFERENCES `agence`(`agence_id`),
  FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule`(`vehicule_id`)
);

CREATE TABLE `marque` (
  `marque_id` integer PRIMARY KEY NOT NULL,
  `nom` varchar(100),
  `description` varchar(255)
);