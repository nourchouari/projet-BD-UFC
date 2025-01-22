-----------------------------------
DROP SCHEMA IF EXISTS ufc cascade;
CREATE SCHEMA ufc ;
-----------------------------------

-- Création de la table Utilisateur
CREATE TABLE ufc.Utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    carte BIGINT(16),
    statut VARCHAR(30)
);

-- Création de la table Abonnement
CREATE TABLE ufc.Abonnement (
    id_abonnement INT AUTO_INCREMENT PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    statut VARCHAR(30),
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES ufc.Utilisateur(id_utilisateur)
);

-- Création de la table Evenement
CREATE TABLE ufc.Evenement (
    nom VARCHAR(150) NOT NULL,
    date DATE NOT NULL,
    lieu VARCHAR(200) NOT NULL,
    PRIMARY KEY (nom, date)
);

-- Création de la table Combattant
CREATE TABLE ufc.Combattant (
    id_combattant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    nationalite VARCHAR(50),
    categorie_poid VARCHAR(70),
    victoire INT DEFAULT 0,
    defaite INT DEFAULT 0
);

-- Création de la table Combattre
CREATE TABLE ufc.Combattre (
    resultat VARCHAR(15),
    methode_victoire VARCHAR(150),
    round_fin_combat INT,
    id_combattant1 INT,
    id_combattant2 INT,
    nom_evenement VARCHAR(150),
    date_evenement DATE,
    FOREIGN KEY (id_combattant1) REFERENCES ufc.combattant(id_combattant),
    FOREIGN KEY (id_combattant2) REFERENCES ufc.combattant(id_combattant),
    FOREIGN KEY (nom_evenement, date_evenement) REFERENCES ufc.Evenement(nom, date)
);

-- Création de la table Classement
CREATE TABLE ufc.Classement (
    poids VARCHAR(200) NOT NULL,
    classement INT,
    id_combattant INT,
    PRIMARY KEY (poids, id_combattant),
    FOREIGN KEY (id_combattant) REFERENCES ufc.Combattant(id_combattant)
);

-- Insertion dans ufc.utilisateur (20 instances)
INSERT INTO ufc.Utilisateur (nom, prenom, email, numero, carte) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', '0612345678', 1234567890123456),
('Nguyen', 'Thi', 'thi.nguyen@example.com', '0612345679', 1234567890123457),
('Smith', 'John', 'john.smith@example.com', '0612345680', 1234567890123458),
('Dubois', 'Fatou', 'fatou.dubois@example.com', '0612345681', 1234567890123459),
('Martinez', 'Carlos', 'carlos.martinez@example.com', '0612345682', 1234567890123460),
('Chen', 'Li', 'li.chen@example.com', '0612345683', 1234567890123461),
('Ali', 'Amina', 'amina.ali@example.com', '0612345684', 1234567890123462),
('Kumar', 'Ravi', 'ravi.kumar@example.com', '0612345685', 1234567890123463),
('Garcia', 'Maria', 'maria.garcia@example.com', '0612345686', 1234567890123464),
('Müller', 'Hans', 'hans.muller@example.com', '0612345687', 1234567890123465),
('Silva', 'Ana', 'ana.silva@example.com', '0612345688', 1234567890123466),
('Johnson', 'Emily', 'emily.johnson@example.com', '0612345689', 1234567890123467),
('Hassan', 'Omar', 'omar.hassan@example.com', '0612345690', 1234567890123468),
('Tanaka', 'Yuki', 'yuki.tanaka@example.com', '0612345691', 1234567890123469),
('Lévy', 'Sarah', 'sarah.levy@example.com', '0612345692', 1234567890123470),
('El-Sayed', 'Ahmed', 'ahmed.elsayed@example.com', '0612345693', 1234567890123471),
('Bennani', 'Amina', 'amina.bennani@example.com', '0612345694', 1234567890123472),
('Haddad', 'Youssef', 'youssef.haddad@example.com', '0612345695', 1234567890123473),
('Nasr', 'Layla', 'layla.nasr@example.com', '0612345696', 1234567890123474),
('Saad', 'Hassan', 'hassan.saad@example.com', '0612345697', 1234567890123475);

-- Insertion dans ufc.abonnement (15 instances)
INSERT INTO ufc.Abonnement (date_debut, date_fin, statut, id_utilisateur) VALUES
('2024-01-01', '2024-12-31', 'Actif', 1),
('2023-06-01', '2024-05-31', 'Inactif', 2),
('2023-09-01', '2024-08-31', 'Actif', 3),
('2024-02-01', '2025-01-31', 'Actif', 4),
('2023-03-01', '2024-02-29', 'Inactif', 5),
('2024-01-15', '2024-12-15', 'Actif', 6),
('2023-10-01', '2024-09-30', 'Inactif', 7),
('2024-04-01', '2025-03-31', 'Actif', 8),
('2024-05-01', '2025-04-30', 'Actif', 9),
('2023-12-01', '2024-11-30', 'Inactif', 10),
('2024-06-01', '2025-05-31', 'Actif', 11),
('2024-07-01', '2025-06-30', 'Actif', 12),
('2024-08-01', '2025-07-31', 'Inactif', 13),
('2024-09-01', '2025-08-31', 'Actif', 14),
('2024-10-01', '2025-09-30', 'Actif', 15);

-- Insertion dans ufc.evenement (15 instances)
INSERT INTO ufc.Evenement (nom, date, lieu) VALUES
('Championnat Régional', '2024-03-01', 'Paris'),
('Coupe Nationale', '2024-04-15', 'Lyon'),
('Open International', '2024-05-20', 'Marseille'),
('Tournoi Européen', '2024-06-10', 'Berlin'),
('Championnat Mondial', '2024-07-25', 'Tokyo'),
('Grand Prix', '2024-08-05', 'New York'),
('Open Asiatique', '2024-09-15', 'Séoul'),
('Open Africain', '2024-10-25', 'Johannesbourg'),
('Tournoi des Champions', '2024-11-30', 'Montréal'),
('Festival de Combat', '2024-12-10', 'Madrid'),
('Ligue Nationale', '2025-01-15', 'Paris'),
('Elite Cup', '2025-02-20', 'Londres'),
('Master Clash', '2025-03-25', 'Rome'),
('World Combat', '2025-04-30', 'Dubaï'),
('Legend Series', '2025-05-10', 'Sydney');

-- Insertion dans ufc.combattant (15 instances)
INSERT INTO ufc.Combattant (nom, prenom, nationalite, categorie_poid, victoire, defaite) VALUES
('McGregor', 'Conor', 'Irlande', 'Poids Léger', 22, 6),
('Nurmagomedov', 'Khabib', 'Russie', 'Poids Léger', 29, 0),
('Jones', 'Jon', 'USA', 'Poids Lourd', 26, 1),
('Silva', 'Anderson', 'Brésil', 'Poids Moyen', 34, 11),
('Adesanya', 'Israel', 'Nigéria', 'Poids Moyen', 24, 2),
('Miocic', 'Stipe', 'USA', 'Poids Lourd', 20, 4),
('Ngannou', 'Francis', 'Cameroun', 'Poids Lourd', 17, 3),
('Cejudo', 'Henry', 'USA', 'Poids Coq', 16, 2),
('Holloway', 'Max', 'USA', 'Poids Plume', 23, 7),
('Volkanovski', 'Alexander', 'Australie', 'Poids Plume', 24, 1),
('Ferguson', 'Tony', 'USA', 'Poids Léger', 25, 8),
('St-Pierre', 'Georges', 'Canada', 'Poids Mi-Moyen', 26, 2),
('Usman', 'Kamaru', 'Nigéria', 'Poids Mi-Moyen', 20, 3),
('Cormier', 'Daniel', 'USA', 'Poids Lourd', 22, 3),
('Diaz', 'Nate', 'USA', 'Poids Léger', 21, 13);

-- Insertion dans ufc.classement (15 instances)
INSERT INTO ufc.Classement (poids, classement, id_combattant) VALUES
('Poids Léger', 1, 2),
('Poids Léger', 2, 1),
('Poids Lourd', 1, 3),
('Poids Lourd', 2, 7),
('Poids Moyen', 1, 5),
('Poids Moyen', 2, 4),
('Poids Mi-Moyen', 1, 12),
('Poids Mi-Moyen', 2, 13),
('Poids Plume', 1, 10),
('Poids Plume', 2, 9),
('Poids Léger', 3, 15),
('Poids Léger', 4, 11),
('Poids Coq', 1, 8),
('Poids Lourd', 3, 6),
('Poids Lourd', 4, 14);

