drop database if exists tournament;
 
create database tournament;

use database tournament;

create table player(
    player_id int auto_increment PRIMARY KEY,
    player_name VARCHAR(20),
    player_surname VARCHAR(30),
    player_ageCategory varchar(15),
    player_skiLength varchar(15)
);

create table competition(
    competition_id int auto_increment PRIMARY KEY,
    competition_name VARCHAR(45),
    competition_ageCategory varchar(15),
    competition_skiLength varchar(15)
);

create table player_competition(
    player_id int,
    competition_id int,
    FOREIGN KEY (player_id) REFERENCES player(player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (competition_id) REFERENCES competition(competition_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

INSERT INTO player(player_name, player_surname, player_ageCategory, player_skiLength) VALUES
    ("Adam", "Małysz", "Dorosły", "2m"),
    ("Kamil", "Stoch", "Senior", "< 2m"),
    ("Piotr", "Żyła", "Junior", "< 2m"),
    ("Maciej", "Kot", "Junior", "< 2m"),
    ("Noriaki", "Kasai", "Senior", "> 2m"),
    ("Armin", "Kogler", "Dorosły", "> 2m"),
    ("Jakub", "Janda", "Dorosły", "2m"),
    ("Jan", "Ziobro", "Senior", "> 2m");

INSERT INTO competition(competition_name, competition_ageCategory, competition_skiLength) VALUES
    ("Turniej1", "Junior", "< 2m"),
    ("Turniej2", "Dorosły", "2m");

INSERT INTO player_competition(player_id, competition_id) VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 2);
