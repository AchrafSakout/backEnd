-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 30 juin 2021 à 01:02
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_besafe`
--

-- --------------------------------------------------------

--
-- Structure de la table `anomalie`
--

CREATE TABLE `anomalie` (
  `id` bigint(20) NOT NULL,
  `date_annomalie` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `laltitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `nombre_like` int(11) NOT NULL,
  `statut_anomalie` varchar(255) DEFAULT NULL,
  `users_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `anomalie`
--

INSERT INTO `anomalie` (`id`, `date_annomalie`, `description`, `laltitude`, `longitude`, `nombre_like`, `statut_anomalie`, `users_id`) VALUES
(1, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 1),
(2, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 1),
(3, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 1),
(4, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 2),
(5, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 2),
(6, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 2),
(7, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 3),
(8, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 3),
(9, '2021-06-29 22:56:12', 'Ceci est un test de description pour une anomalie !', '31.626598', '8.008577', 0, 'ENATTENTE', 3);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` bigint(20) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `anomalie_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `commentaire`, `anomalie_id`) VALUES
(1, 'ceci est un test commentaire !', 1),
(2, 'ceci est un test commentaire !', 2),
(3, 'ceci est un test commentaire !', 3),
(4, 'ceci est un test commentaire !', 4),
(5, 'ceci est un test commentaire !', 5),
(6, 'ceci est un test commentaire !', 6),
(7, 'ceci est un test commentaire !', 7),
(8, 'ceci est un test commentaire !', 8),
(9, 'ceci est un test commentaire !', 9);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`role`) VALUES
('ADMIN'),
('USER');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `active`, `email`, `nom`, `password`, `prenom`) VALUES
(1, b'1', 'test1@hotmail.com', 'Achraf', '$2a$10$UCui452QVD.yRBinvpzl/et9XtIQH0tsdctfbv6GZblpSE7zBttEi', 'Achraf'),
(2, b'1', 'test1@hotmail.com', 'Zahira', '$2a$10$UCui452QVD.yRBinvpzl/et9XtIQH0tsdctfbv6GZblpSE7zBttEi', 'Zahira'),
(3, b'1', 'test1@hotmail.com', 'Oumaima', '$2a$10$UCui452QVD.yRBinvpzl/et9XtIQH0tsdctfbv6GZblpSE7zBttEi', 'Oumaima');

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

CREATE TABLE `users_roles` (
  `username` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users_roles`
--

INSERT INTO `users_roles` (`username`, `role`) VALUES
('Achraf', 'ADMIN'),
('Oumaima', 'ADMIN'),
('Zahira', 'ADMIN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `anomalie`
--
ALTER TABLE `anomalie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKevkbkr3ad861k2x44q4dip5q1` (`users_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqo5ilwit3vhomura4bpdt3qvo` (`anomalie_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`username`,`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `anomalie`
--
ALTER TABLE `anomalie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
