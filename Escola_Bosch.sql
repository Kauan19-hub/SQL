CREATE DATABASE Escola_Bosch

Use Escola_Bosch

-- Tabela dos Professores
CREATE TABLE Professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(250) NOT NULL UNIQUE,
    nome VARCHAR(250) NOT NULL,
    senha VARCHAR(250) NOT NULL

);

-- Tabela das Turmas
CREATE TABLE Turma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_identificacao INT NOT NULL,
    id_professor INT,
    nome VARCHAR(250) NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id) ON DELETE SET NULL

);

-- Tabela das Atividades
CREATE TABLE Atividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_turma INT,
    descricao TEXT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES Turma(id) ON DELETE SET NULL

);

-- Inserir o Professor
INSERT INTO Professor(email, nome, senha)
VALUES ("J. K. John", "johny@322bosch.com", "202525");

-- Consultar o Professor
SELECT * FROM Professor WHERE email = "johny@322bosch.com";

-- Modificar os Dados do Professor 
UPDATE Professor
SET senha = "202626"
WHERE id = 1;

-- Deletar o Professor (Tabela)
DELETE FROM Professor WHERE id = 1;

-- Inserir a Turma
INSERT INTO Turma(num_identificacao, id_professor, nome)
VALUES (101, "Back-End", 1)

--Consultar a Turma
SELECT * FROM Turma WHERE id_professor = 1;

-- Modificar os Dados da Turma 
UPDATE Turma
SET nome = "Back-End"
WHERE id = 1;

-- Deletar a Turma
DELETE FROM Turma WHERE id = 1;

-- Inserir as Atividades
INSERT INTO Atividades (id_turma, descricao)
VALUES ("Avaliação de Back-End e População de Dados no Ambiente Virtual, com Bibliotecas OPENPYXL e PANDAS", 1);

-- Exigir as Atividades da Turma
SELECT * FROM Atividades WHERE id_turma = 1;

-- Modificar as Atividades
UPDATE Atividades
SET descricao = "Práticas"
WHERE id = 1;

-- Deletar as Atividades
DELETE FROM Atividades WHERE id = 1;