-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 21 mrt 2023 om 12:43
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `img`, `description`) VALUES
(1, 'Vegetarische Pizza', '/img/vegetarische-pizza.jpg', 'Bij De PPC ben je altijd welkom om lekker te lunchen, borrelen of dineren. Het is een plek voor iedereen die van ambachtelijke Romeinse pizza\'s houdt en graag een glas prosecco drinkt. Maar niks chics hoor!'),
(2, 'Vlees Pizza', '/img/vlees-pizza.jpg', 'Bij De PPC ben je altijd welkom om lekker te lunchen, borrelen of dineren. Het is een plek voor iedereen die van ambachtelijke Romeinse pizza\'s houdt en graag een glas prosecco drinkt. Maar niks chics hoor!'),
(3, 'Vis Pizza', '/img/vis-pizza.jpg', 'Bij De PPC ben je altijd welkom om lekker te lunchen, borrelen of dineren. Het is een plek voor iedereen die van ambachtelijke Romeinse pizza\'s houdt en graag een glas prosecco drinkt. Maar niks chics hoor!');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230228135813', '2023-02-28 14:58:32', 64),
('DoctrineMigrations\\Version20230304114324', '2023-03-04 12:43:48', 559),
('DoctrineMigrations\\Version20230321105235', '2023-03-21 11:52:45', 160);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `price`, `description`, `img`) VALUES
(1, 1, 'Champignons En Taleggio', 20, 'Pizza met champignons en taleggio is een heerlijke en smaakvolle pizza met romige kaas en hartige paddenstoelen.', '/img/vegetarische-pizza-champignons.jpg'),
(2, 1, 'Pizzetta', 15, 'Pizzetta-pizza is een kleinere pizza van persoonlijk formaat die perfect is om alleen van te genieten of om te delen met een vriend. Ondanks zijn kleine formaat is deze pizza groots van smaak en zal hij zeker aan je trek voldoen.', '/img/vegetarische-pizza-pizzetta.jpg'),
(3, 1, 'Pizza Bianca', 23, 'Bianca is een klassieke Italiaanse pizza die bekend staat om zijn eenvoudige maar heerlijke smaken. In tegenstelling tot traditionele pizza\'s die tomatensaus gebruiken, wordt bianca gemaakt met een basis van olijfolie, knoflook en een snufje zeezout.', '/img/vegetarische-pizza-binaca.jpg'),
(4, 2, 'Hawaii Pizza', 25, 'Hawaï-pizza is een unieke en heerlijke pizza die bij velen geliefd is vanwege de combinatie van hartige en zoete smaken.', '/img/vlees-pizza-hawaii.jpg'),
(5, 2, 'Teriyaki Chicken Pizza', 25, 'Teriyaki Chicken pizza is een heerlijke en unieke pizza die de gedurfde smaken van de Japanse keuken combineert met klassieke Italiaanse pizza.', '/img/vlees-pizza-chicken.jpg'),
(6, 2, 'Double Pepperoni Pizza', 25, 'Double Pepperoni-pizza is een klassieke en populaire pizza die perfect is voor degenen die van een beetje extra pit en smaak in hun pizza houden.', '/img/vlees-pizza-doublePepperoni.jpg'),
(7, 3, 'Tuna Pizza', 17, 'De pizza heeft een basis van tomatensaus en mozzarellakaas en wordt vervolgens gegarneerd met malse stukjes tonijn die zijn gemarineerd in een pittige en smaakvolle dressing.', '/img/vis-pizza-tuna.jpg'),
(8, 3, 'Zalm Pizza', 17, 'De pizza heeft een basis van tomatensaus en mozzarellakaas en wordt vervolgens belegd met malse plakjes verse zalm die op smaak zijn gebracht met aromatische kruiden en specerijen.', '/img/vis-pizza-zalm.jpg'),
(9, 3, 'Shrimp Pizza', 19, 'De pizza heeft een basis van tomatensaus en mozzarella en wordt vervolgens belegd met sappige garnalen die op smaak zijn gebracht met aromatische kruiden en specerijen.', '/img/vis-pizza-shrimp.jpg');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F52993984584665A` (`product_id`);

--
-- Indexen voor tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F52993984584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Beperkingen voor tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
