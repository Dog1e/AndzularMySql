drop database if exists tournament;
 
create database tournament;

use database tournament;

create table ageCategory(
    ageCategory_id int auto_increment PRIMARY KEY,
    ageCategory_name VARCHAR(15)
);

create table skisLength(
    skisLength_id int auto_increment PRIMARY KEY,
    skisLength_name varchar(15)
);

create table coach(
    coach_id int auto_increment PRIMARY KEY,
    coach_name VARCHAR(20),
    coach_surname VARCHAR(30),
    coach_login VARCHAR(20),
    coach_password VARCHAR(20)
);

create table player(
    player_id int auto_increment PRIMARY KEY,
    player_name VARCHAR(20),
    player_surname VARCHAR(30),
    player_ageCategory int,
    player_skisLength int,
    FOREIGN KEY (player_ageCategory) REFERENCES ageCategory(ageCategory_id) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (player_skisLength) REFERENCES skisLength(skisLength_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

create table competition(
    competition_id int auto_increment PRIMARY KEY,
    competition_name VARCHAR(45),
    competition_ageCategory int,
    competition_skisLength int,
    FOREIGN KEY (competition_ageCategory) REFERENCES ageCategory(ageCategory_id) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (competition_skisLength) REFERENCES skisLength(skisLength_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

create table player_competition(
    player_competition int auto_increment PRIMARY KEY,
    player_id int,
    competition_id int,
    FOREIGN KEY (player_id) REFERENCES player(player_id) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (competition_id) REFERENCES competition(competition_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

INSERT INTO ageCategory(ageCategory_name) VALUES
    ("Junior"),
    ("Adult"),
    ("Senior");

INSERT INTO skisLength(skisLength_name) VALUES
    ("less than 2m"),
    ("2m"),
    ("more than 2m");

INSERT INTO player(player_name, player_surname, player_ageCategory, player_skisLength) VALUES
    ("Adam", "Małysz", 2, 2),
    ("Kamil", "Stoch", 3, 1),
    ("Piotr", "Żyła", 1, 1),
    ("Maciej", "Kot", 1, 1),
    ("Noriaki", "Kasai", 3, 3),
    ("Armin", "Kogler", 2, 3),
    ("Jakub", "Janda", 2, 2),
    ("Jan", "Ziobro", 3, 3);

INSERT INTO coach(coach_name, coach_surname, coach_login, coach_password) VALUES
    ("Tom", "Mueller", "MT123098", "12345"),
    ("Maxim", "Lucas", "ML123098", "11111"),
    ("Ellie", "Saunders", "ES123098", "01010");

INSERT INTO competition(competition_name, competition_ageCategory, competition_skisLength) VALUES
    ("Turniej1", 2, 3),
    ("Turniej2", 1, 1);

INSERT INTO player_competition(player_id, competition_id) VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 2);