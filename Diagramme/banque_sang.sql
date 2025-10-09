-- ===========================
-- Base de données : banque_sang
-- ===========================

-- TABLE : personne
CREATE TABLE personne (
  id SERIAL PRIMARY KEY,
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
  cin VARCHAR(50) UNIQUE NOT NULL,
  telephone VARCHAR(30),
  email VARCHAR(100),
  sexe VARCHAR(10),
  date_naissance DATE,
  groupe_sanguin VARCHAR(10)
);

-- TABLE : donneur
CREATE TABLE donneur (
  id SERIAL PRIMARY KEY,
  personne_id INT REFERENCES personne(id) ON DELETE CASCADE,
  poids NUMERIC(5,2),
  date_dernier_don DATE,
  disponibilite VARCHAR(20) DEFAULT 'DISPONIBLE' -- DISPONIBLE / NON_DISPONIBLE / NON_ELIGIBLE
);

-- TABLE : receveur
CREATE TABLE receveur (
  id SERIAL PRIMARY KEY,
  personne_id INT REFERENCES personne(id) ON DELETE CASCADE,
  besoin VARCHAR(20),   -- CRITIQUE / URGENT / NORMAL
  poches_requises INT,
  poches_recues INT DEFAULT 0,
  etat VARCHAR(20) DEFAULT 'EN_ATTENTE' -- EN_ATTENTE / SATISFAIT
);

-- TABLE : conditions médicales (maladies)
CREATE TABLE medical_condition (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(100) UNIQUE
);

-- TABLE : donneur_condition (relation plusieurs-à-plusieurs)
CREATE TABLE donneur_condition (
  donneur_id INT REFERENCES donneur(id) ON DELETE CASCADE,
  condition_id INT REFERENCES medical_condition(id) ON DELETE CASCADE,
  PRIMARY KEY (donneur_id, condition_id)
);

-- TABLE : association (sang entre donneur et receveur)
CREATE TABLE association (
  id SERIAL PRIMARY KEY,
  donneur_id INT REFERENCES donneur(id) ON DELETE CASCADE,
  receveur_id INT REFERENCES receveur(id) ON DELETE CASCADE,
  date_association DATE DEFAULT CURRENT_DATE,
  statut VARCHAR(20) DEFAULT 'CONFIRMÉ'
);
