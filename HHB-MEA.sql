
        
CREATE TABLE Agence
(
  num_agence     INT     NOT NULL,
  nom_agence     VARCHAR NULL    ,
  adresse_agence VARCHAR NULL    ,
  tel_agence     INT     NULL    ,
  PRIMARY KEY (num_agence)
);

CREATE TABLE Client
(
  num_client           INT     NOT NULL,
  nom_client           VARCHAR NULL    ,
  prenom               VARCHAR NULL    ,
  adresse_client       VARCHAR NULL    ,
  identifiant_internet VARCHAR NULL    ,
  mdp_internet         VARCHAR NULL    ,
  PRIMARY KEY (num_client)
);

CREATE TABLE Compte
(
  num_compte     INT  NOT NULL,
  solde          INT  NULL    ,
  date_ouverture DATE NOT NULL,
  date_fermeture DATE NULL    ,
  id_type        INT  NOT NULL,
  PRIMARY KEY (num_compte)
);

CREATE TABLE Date
(
  date DATE NOT NULL,
  PRIMARY KEY (date)
);

CREATE TABLE dependre
(
  num_agence INT  NOT NULL,
  num_client INT  NOT NULL,
  date       DATE NOT NULL,
  PRIMARY KEY (num_agence, num_client, date)
);

CREATE TABLE Operation
(
  id_operation            INT     NOT NULL,
  designation             VARCHAR NULL    ,
  type_operation          VARCHAR NULL    ,
  montant                 INT     NULL    ,
  date                    DATE    NOT NULL,
  num_compte_expediteur   INT     NOT NULL,
  num_compte_destinataire INT     NOT NULL,
  PRIMARY KEY (id_operation)
);

CREATE TABLE posseder
(
  num_client INT NOT NULL,
  num_compte INT NOT NULL,
  PRIMARY KEY (num_client, num_compte)
);

CREATE TABLE remunerer
(
  taux_interet FLOAT NULL    ,
  date_debut   DATE  NOT NULL,
  id_type      INT   NOT NULL,
  date_fin     DATE  NULL    ,
  PRIMARY KEY (date_debut, id_type)
);

CREATE TABLE Type_compte
(
  id_type     INT     NOT NULL,
  designation VARCHAR NULL    ,
  PRIMARY KEY (id_type)
);

ALTER TABLE dependre
  ADD CONSTRAINT FK_Agence_TO_dependre
    FOREIGN KEY (num_agence)
    REFERENCES Agence (num_agence);

ALTER TABLE dependre
  ADD CONSTRAINT FK_Client_TO_dependre
    FOREIGN KEY (num_client)
    REFERENCES Client (num_client);

ALTER TABLE dependre
  ADD CONSTRAINT FK_Date_TO_dependre
    FOREIGN KEY (date)
    REFERENCES Date (date);

ALTER TABLE Compte
  ADD CONSTRAINT FK_Date_TO_Compte
    FOREIGN KEY (date_ouverture)
    REFERENCES Date (date);

ALTER TABLE remunerer
  ADD CONSTRAINT FK_Date_TO_remunerer
    FOREIGN KEY (date_debut)
    REFERENCES Date (date);

ALTER TABLE remunerer
  ADD CONSTRAINT FK_Date_TO_remunerer1
    FOREIGN KEY (date_fin)
    REFERENCES Date (date);

ALTER TABLE remunerer
  ADD CONSTRAINT FK_Type_compte_TO_remunerer
    FOREIGN KEY (id_type)
    REFERENCES Type_compte (id_type);

ALTER TABLE Operation
  ADD CONSTRAINT FK_Date_TO_Operation
    FOREIGN KEY (date)
    REFERENCES Date (date);

ALTER TABLE Operation
  ADD CONSTRAINT FK_Compte_TO_Operation
    FOREIGN KEY (num_compte_expediteur)
    REFERENCES Compte (num_compte);

ALTER TABLE Compte
  ADD CONSTRAINT FK_Date_TO_Compte1
    FOREIGN KEY (date_fermeture)
    REFERENCES Date (date);

ALTER TABLE posseder
  ADD CONSTRAINT FK_Client_TO_posseder
    FOREIGN KEY (num_client)
    REFERENCES Client (num_client);

ALTER TABLE posseder
  ADD CONSTRAINT FK_Compte_TO_posseder
    FOREIGN KEY (num_compte)
    REFERENCES Compte (num_compte);

ALTER TABLE Compte
  ADD CONSTRAINT FK_Type_compte_TO_Compte
    FOREIGN KEY (id_type)
    REFERENCES Type_compte (id_type);

ALTER TABLE Operation
  ADD CONSTRAINT FK_Compte_TO_Operation1
    FOREIGN KEY (num_compte_destinataire)
    REFERENCES Compte (num_compte);

        
      