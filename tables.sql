CREATE SCHEMA if NOT EXISTS `db`;
USE `db`;

# System
CREATE TABLE `users` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `dion_id` varchar(10) NOT NULL,
 `email_id` varchar(8) NOT NULL,
 `password` varchar(8) NOT NULL,
 PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `mail` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `sender` text NOT NULL,
 `recipient` text NOT NULL,
 `date` timestamp NOT NULL DEFAULT current_timestamp(),
 `content` blob NOT NULL,
 PRIMARY KEY (`id`)
);

# Pokemon Crystal (BXTJ)
CREATE TABLE IF NOT EXISTS `bxtj_battle_tower_records` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `room` int(10) unsigned NOT NULL,
 `level` int(1) unsigned NOT NULL,
 `email` varchar(30) NOT NULL,
 `trainer_id` int(10) unsigned NOT NULL,
 `secret_id` int(10) unsigned NOT NULL,
 `name` binary(5) NOT NULL,
 `class` binary(1) NOT NULL,
 `pokemon1` binary(54) NOT NULL,
 `pokemon2` binary(54) NOT NULL,
 `pokemon3` binary(54) NOT NULL,
 `message_start` binary(12) NOT NULL,
 `message_win` binary(12) NOT NULL,
 `message_lose` binary(12) NOT NULL,
 `num_trainers_defeated` int(10) unsigned NOT NULL,
 `num_turns_required` int(10) unsigned NOT NULL,
 `damage_taken` int(10) unsigned NOT NULL,
 `num_fainted_pokemon` int(10) unsigned NOT NULL,
 PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `bxtj_battle_tower_trainers` (
 `room` int(10) unsigned NOT NULL,
 `level` int(1) unsigned NOT NULL,
 `no` int(1) unsigned NOT NULL,
 `name` binary(5) NOT NULL,
 `class` binary(1) NOT NULL,
 `pokemon1` binary(54) NOT NULL,
 `pokemon2` binary(54) NOT NULL,
 `pokemon3` binary(54) NOT NULL,
 `message_start` binary(12) NOT NULL,
 `message_win` binary(12) NOT NULL,
 `message_lose` binary(12) NOT NULL,
 PRIMARY KEY (`room`,`level`,`no`)
);
CREATE TABLE IF NOT EXISTS `bxtj_battle_tower_leaders` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` binary(5) NOT NULL,
 `room` int(11) unsigned NOT NULL,
 `level` int(1) unsigned NOT NULL,
 PRIMARY KEY (`id`)
);

# Pokemon Crystal (BXTE)
CREATE TABLE IF NOT EXISTS `bxte_battle_tower_records` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `room` int(10) unsigned NOT NULL,
 `level` int(1) unsigned NOT NULL,
 `email` varchar(30) NOT NULL,
 `trainer_id` int(10) unsigned NOT NULL,
 `secret_id` int(10) unsigned NOT NULL,
 `name` binary(7) NOT NULL,
 `class` binary(1) NOT NULL,
 `pokemon1` binary(59) NOT NULL,
 `pokemon2` binary(59) NOT NULL,
 `pokemon3` binary(59) NOT NULL,
 `message_start` binary(12) NOT NULL,
 `message_win` binary(12) NOT NULL,
 `message_lose` binary(12) NOT NULL,
 `num_trainers_defeated` int(10) unsigned NOT NULL,
 `num_turns_required` int(10) unsigned NOT NULL,
 `damage_taken` int(10) unsigned NOT NULL,
 `num_fainted_pokemon` int(10) unsigned NOT NULL,
 PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `bxte_battle_tower_trainers` (
 `room` int(10) unsigned NOT NULL,
 `level` int(1) unsigned NOT NULL,
 `no` int(1) unsigned NOT NULL,
 `name` binary(10) NOT NULL,
 `class` binary(1) NOT NULL,
 `pokemon1` binary(59) NOT NULL,
 `pokemon2` binary(59) NOT NULL,
 `pokemon3` binary(59) NOT NULL,
 `message_start` binary(12) NOT NULL,
 `message_win` binary(12) NOT NULL,
 `message_lose` binary(12) NOT NULL,
 PRIMARY KEY (`room`,`level`,`no`)
);
CREATE TABLE IF NOT EXISTS `bxte_battle_tower_leaders` (
 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
 `name` binary(7) NOT NULL,
 `room` int(11) unsigned NOT NULL,
 `level` int(11) unsigned NOT NULL,
 PRIMARY KEY (`id`)
);

# Mario Kart Advance (AMKJ)
CREATE TABLE IF NOT EXISTS `amkj_rule` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `file_name` text NOT NULL,
 `start_date` date NOT NULL,
 `end_date` date NOT NULL,
 `next_start_date` date NOT NULL,
 `next_end_date` date NOT NULL,
 `entry_start_date` date NOT NULL,
 `entry_end_date` date NOT NULL,
 `ranking_start_date` date NOT NULL,
 `ranking_end_date` date NOT NULL,
 `coins_enabled` tinyint(1) NOT NULL,
 `items_enabled` tinyint(1) NOT NULL,
 `start_item_triple_shroom_enabled` tinyint(1) NOT NULL,
 `shrooms_only_enabled` tinyint(1) NOT NULL,
 `cpu_enabled` tinyint(1) NOT NULL,
 `character` tinyint(1) NOT NULL,
 `start_coins` tinyint(1) NOT NULL,
 `five_laps_enabled` tinyint(1) NOT NULL,
 `course` tinyint(2) NOT NULL,
 `num_attempts` tinyint(2) NOT NULL,
 `message` text DEFAULT NULL,
 PRIMARY KEY (`id`)
);