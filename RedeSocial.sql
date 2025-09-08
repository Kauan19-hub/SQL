CREATE DATABASE RedeSocial;

USE RedeSocial;

-- Tabela Usuários
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Idade INT,
    Cidade VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    NomeUser VARCHAR(50) UNIQUE,
    Senha VARCHAR(100),
    Tipo ENUM('Estudante', 'Adm')

);

-- Tabela Atividades
CREATE TABLE Atividades (
    AtividadeID AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    Descricao TEXT,
    Datas DATE,
    Locas VARCHAR(100),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    CriadorID INT,
    FOREIGN KEY (CriadorID) REFERENCES Usuarios(UsuarioID)

);

-- Tabela Categorias
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) UNIQUE

);

-- Tabela Participações em Atividades 
CREATE TABLE Participacoes (
    ParticipacaoID INT AUTO_INCREMENT PRIMARY KEY,
    AtividadeID INT,
    UsuarioID INT,
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)

);

-- Tabela de Conexões Entre Usuários
CREATE TABLE Conexoes (
    ConexaoID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID1 INT,
    UsuarioID2 INT,
    FOREIGN KEY (UsuarioID1) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (UsuarioID2) REFERENCES Usuarios(UsuarioID),
    UNIQUE(UsuarioID1, UsuarioID2)

);

-- Tabela de Comentários nas Atividades
CREATE TABLE Comentarios (
    ComentarioID INT AUTO_INCREMENT PRIMARY KEY,
    AtividadeID INT,
    UsuarioID INT, 
    Comentario TEXT,
    DataComentário TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)

);

-- Inserir 10 usuários
/*
INSERT INTO Usuarios (Nome, Idade, Cidade, Email, NomeUser, Senha, Tipo) VALUES
('João Silva', 25, 'São Paulo', 'joao@gmail.com', 'joaos', '1234', 'Estudante'),
('Maria Lima', 30, 'Rio de Janeiro', 'maria@gmail.com', 'marial', 'abcd', 'Estudante'),
('Carlos Souza', 28, 'Belo Horizonte', 'carlos@gmail.com', 'carloss', 'senha1', 'Estudante'),
('Ana Beatriz', 22, 'Curitiba', 'ana@gmail.com', 'anab', 'senha2', 'Estudante'),
('Rafael Mendes', 35, 'Fortaleza', 'rafael@gmail.com', 'rafaelm', 'senha3', 'Adm'),
('Juliana Castro', 27, 'Recife', 'juliana@gmail.com', 'julianac', 'senha4', 'Estudante'),
('Eduardo Alves', 24, 'Brasília', 'eduardo@gmail.com', 'eduardoa', 'senha5', 'Estudante'),
('Patrícia Nogueira', 29, 'Salvador', 'patricia@gmail.com', 'patrician', 'senha6', 'Adm'),
('Fernanda Rocha', 31, 'Manaus', 'fernanda@gmail.com', 'fernandar', 'senha7', 'Estudante'),
('Vinícius Torres', 26, 'Belém', 'vinicius@gmail.com', 'viniciust', 'senha8', 'Estudante');

-- Inserir 7 categorias
INSERT INTO Categorias (Nome) VALUES
('Esportes'),
('Tecnologia'),
('Arte'),
('Música'),
('Educação'),
('Voluntariado'),
('Ciência');

-- Inserir 8 atividades
INSERT INTO Atividades (Titulo, Descricao, Datas, Locas, CategoriaID, CriadorID) VALUES
('Corrida no Parque', 'Evento de corrida de 5km.', '2025-09-15', 'Parque Ibirapuera', 1, 1),
('Hackathon Universitário', 'Maratona de programação de 24h.', '2025-09-20', 'USP', 2, 2),
('Oficina de Pintura', 'Aula gratuita de pintura artística.', '2025-09-18', 'Centro Cultural SP', 3, 3),
('Concerto de Violão', 'Apresentação ao vivo de músicos locais.', '2025-09-22', 'Teatro Municipal', 4, 4),
('Palestra sobre IA', 'Discussão sobre Inteligência Artificial.', '2025-09-25', 'Unicamp', 2, 5),
('Aula de Dança', 'Dança de salão para iniciantes.', '2025-09-28', 'Ginásio Municipal', 4, 6),
('Feira de Ciências', 'Exposição de projetos estudantis.', '2025-09-30', 'Colégio Estadual', 7, 7),
('Mutirão de Limpeza', 'Ação voluntária de limpeza urbana.', '2025-09-19', 'Praia de Boa Viagem', 6, 8);

-- Inserir 4 participações
INSERT INTO Participacoes (AtividadeID, UsuarioID) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 5);

-- Inserir 5 conexões
INSERT INTO Conexoes (UsuarioID1, UsuarioID2) VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6);

-- Inserir 9 comentários
INSERT INTO Comentarios (AtividadeID, UsuarioID, Comentario) VALUES
(1, 2, 'Muito animado para a corrida!'),
(2, 3, 'Vai ser um ótimo hackathon!'),
(3, 4, 'Adoro pintura!'),
(4, 5, 'Show imperdível.'),
(5, 6, 'Ansioso pela palestra.'),
(6, 7, 'Nunca dancei, vai ser legal!'),
(7, 8, 'Levando meu projeto!'),
(8, 9, 'Bela iniciativa.'),
(1, 10, 'Vamos correr juntos!');

-- Inserir mais 10 usuários
INSERT INTO Usuarios (Nome, Idade, Cidade, Email, NomeUser, Senha, Tipo) VALUES
('Larissa Melo', 21, 'São Luís', 'larissa@gmail.com', 'larissam', 'senha9', 'Estudante'),
('Marcelo Dias', 33, 'Florianópolis', 'marcelo@gmail.com', 'marcelod', 'senha10', 'Estudante'),
('Tatiane Gomes', 26, 'Porto Alegre', 'tatiane@gmail.com', 'tatianeg', 'senha11', 'Adm'),
('Roberto Lima', 38, 'João Pessoa', 'roberto@gmail.com', 'robertol', 'senha12', 'Estudante'),
('Camila Andrade', 29, 'Teresina', 'camila@gmail.com', 'camilaa', 'senha13', 'Estudante'),
('Bruno Ferreira', 30, 'Natal', 'bruno@gmail.com', 'brunof', 'senha14', 'Estudante'),
('Helena Barbosa', 27, 'Campo Grande', 'helena@gmail.com', 'helenab', 'senha15', 'Estudante'),
('Gustavo Ramos', 34, 'Aracaju', 'gustavo@gmail.com', 'gustavor', 'senha16', 'Adm'),
('Amanda Costa', 25, 'Maceió', 'amanda@gmail.com', 'amandac', 'senha17', 'Estudante'),
('Lucas Oliveira', 32, 'Cuiabá', 'lucas@gmail.com', 'lucaso', 'senha18', 'Estudante');

-- Inserir mais 5 atividades com mais detalhes e criador específico (usuário 5)
INSERT INTO Atividades (Titulo, Descricao, Datas, Locas, CategoriaID, CriadorID) VALUES
('Curso de Python', 'Curso introdutório à linguagem Python.', '2025-10-01', 'Sala 101 - IFSP', 2, 5),
('Trilha na Serra', 'Caminhada ecológica com guia.', '2025-10-03', 'Serra da Cantareira', 1, 5),
('Oficina de Robótica', 'Montagem de robôs com kits Lego.', '2025-10-05', 'SENAI', 2, 5),
('Festival de Bandas', 'Bandas locais se apresentam ao ar livre.', '2025-10-08', 'Praça Central', 4, 5),
('Dia do Livro', 'Feira de troca e doação de livros.', '2025-10-10', 'Biblioteca Pública', 5, 5);



-- Selecionar todos os registros da tabela Participações
SELECT * FROM Participacoes;

-- Selecionar todas as conexões feitas entre usuários
SELECT * FROM Conexoes;

-- Selecionar todos os comentários feitos em atividades
SELECT * FROM Comentarios;

-- Nome e Cidade de todos os usuários
SELECT Nome, Cidade FROM Usuarios;

-- Título e Data de todas as atividades
SELECT Titulo, Datas FROM Atividades;
