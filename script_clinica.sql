CREATE DATABASE IF NOT EXISTS clinica_veterinaria;
USE clinica_veterinaria;

-- Criacao das Tabelas
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(150),
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE animais (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(20) NOT NULL,
    raca VARCHAR(30),
    data_nasc YEAR,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_animais_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_consultas_animais FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

-- Carga de Dados (Inserts Individuais)

-- 5 Clientes
INSERT INTO clientes (nome, telefone, email) VALUES ('Carlos Silva', '19987654321', 'carlos@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Mariana Alves', '19991234567', 'mariana@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Roberto Souza', '19988887777', NULL);
INSERT INTO clientes (nome, telefone, email) VALUES ('Fernanda Lima', '19977776666', 'nanda@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Lucas Mendes', '19999990000', 'lucas@email.com');

-- 8 Animais
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Thor', 'Cão', 'Golden Retriever', 2020);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Mel', 'Gato', 'Persa', 2022);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (2, 'Bob', 'Cão', 'Poodle', 2018);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (3, 'Rex', 'Cão', 'Vira-lata', 2019);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (3, 'Mia', 'Gato', 'Siames', 2021);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (4, 'Pipoca', 'Coelho', NULL, 2023);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Max', 'Cão', 'Pastor Alemão', 2017);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (5, 'Nina', 'Gato', 'SRD', 2020);

-- 10 Consultas
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-03-10', 'Vacinação anual V10');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (2, '2026-03-12', 'Limpeza periodontal');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-03-15', 'Check-up de rotina');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (4, '2026-03-18', 'Consulta dermatológica por coceira');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (5, '2026-03-20', 'Retorno pós-cirúrgico');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (6, '2026-03-22', 'Corte de dentes e unhas');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (7, '2026-03-25', 'Exame de sangue completo');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (8, '2026-03-28', 'Aplicação de vermífugo');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-04-05', 'Reavaliação ortopédica');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (3, '2026-04-10', 'Aplicação de vacina antirrábica');

-- Consultas de Validação

-- 1. Listar todos os animais com o nome do seu dono
SELECT 
    a.id_animal,
    a.nome AS nome_animal,
    a.especie,
    c.nome AS nome_dono,
    c.telefone
FROM animais a
INNER JOIN clientes c ON a.id_cliente = c.id_cliente;

-- 2. Listar todas as consultas ordenadas por data de realização
SELECT 
    c.id_consulta,
    a.nome AS nome_animal,
    c.data_consulta,
    c.descricao
FROM consultas c
INNER JOIN animais a ON c.id_animal = a.id_animal
ORDER BY c.data_consulta ASC;