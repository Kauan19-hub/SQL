CREATE DATABASE farmácia;

USE farmacia;

CREATE TABLE Farmácia (
	idFarmácia INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL,
    nome VARCHAR(12) NOT NULL,
    endereco VARCHAR(20) NOT NULL,
    email VARCHAR(35) NOT NULL,
    telefone VARCHAR(15) NOT NULL
    
);

CREATE TABLE Funcionário (
	idFuncionário INT AUTO_INCREMENT PRIMARY KEY,
    RG VARCHAR(10) NOT NULL,
    nome VARCHAR(35) NOT NULL,
    celular VARCHAR(9),
    id_Farmácia INT,
	FOREIGN KEY (id_Farmácia) REFERENCES Farmácia(idFarmácia)
    
    
);

CREATE TABLE Produto (
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    código INT,
    preço DECIMAL(10,2),
    id_Farmácia INT,
    FOREIGN KEY (id_Farmácia) REFERENCES Farmácia(idFarmácia)
);

ALTER TABLE Funcionário
ADD FOREIGN KEY (id_Farmácia) REFERENCES Farmácia(idFarmácia);


-- ALTER TABLE: Editar tabela
-- ADD KEY: Adicionar nova chave