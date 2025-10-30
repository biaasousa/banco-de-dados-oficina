/*-------------------- CRIAÇÃO DO BANCO DE DADOS --------------------*/
CREATE DATABASE IF NOT EXISTS estacionamento;
USE estacionamento;

/*-------------------- CRIAÇÃO DE TABELAS --------------------*/
-- Tabela clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150)
);

-- Tabela veiculos
CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    placa VARCHAR(10) UNIQUE,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    cor VARCHAR(30),
    ano INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela registros
CREATE TABLE registros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT,
    data_entrada DATETIME NOT NULL,
    data_saida DATETIME,
    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

/*-------------------- INSERTS TABELA CLIENTES --------------------*/
INSERT INTO clientes (nome, telefone, email, endereco) VALUES
('Mariana Ribeiro','91234-0001','mariana.r@email.com','Av. Central, 101'),
('Pedro Gomes','91234-0002','pedro.g@email.com','Rua das Flores, 22'),
('Camila Torres','91234-0003','camila.t@email.com','Av. Paulista, 350'),
('Rafael Moreira','91234-0004','rafael.m@email.com','Rua Verde, 77'),
('Juliana Castro','91234-0005','juliana.c@email.com','Av. Azul, 15'),
('Thiago Silva','91234-0006','thiago.s@email.com','Rua do Sol, 90'),
('Beatriz Carvalho','91234-0007','bia.c@email.com','Travessa Leste, 12'),
('Rodrigo Mendes','91234-0008','rodrigo.m@email.com','Rua Norte, 45'),
('Larissa Almeida','91234-0009','larissa.a@email.com','Av. Oeste, 300'),
('Mateus Fernandes','91234-0010','mateus.f@email.com','Rua Jardim, 210'),
('Patrícia Oliveira','91234-0011','patricia.o@email.com','Av. Brasil, 500'),
('Leonardo Rocha','91234-0012','leo.r@email.com','Rua Sul, 80');

/*-------------------- INSERTS TABELA VEICULOS --------------------*/
INSERT INTO veiculos (cliente_id, placa, marca, modelo, cor, ano) VALUES
(1,'XYZ1A11','Chevrolet','Cruze','Prata',2021),
(1,'XYZ2B22','Hyundai','i30','Preto',2018),
(2,'JKL3C33','Fiat','Mobi','Vermelho',2020),
(2,'JKL4D44','VW','Voyage','Branco',2019),
(3,'MNO5E55','Toyota','Etios','Azul',2017),
(3,'MNO6F66','Honda','City','Cinza',2022),
(4,'PQR7G77','Ford','Fusion','Preto',2016),
(4,'PQR8H88','Jeep','Compass','Prata',2021),
(5,'STU9I99','Renault','Sandero','Branco',2018),
(5,'STU0J00','Peugeot','308','Vermelho',2022),
(6,'VWX1K11','Nissan','March','Prata',2017),
(6,'VWX2L22','Chevrolet','Spin','Cinza',2019),
(7,'YZA3M33','Honda','HR-V','Branco',2023),
(7,'YZA4N44','Toyota','SW4','Preto',2020),
(8,'BCD5O55','VW','Saveiro','Vermelho',2021),
(8,'BCD6P66','Fiat','Toro','Branco',2022),
(9,'EFG7Q77','Hyundai','Santa Fe','Azul',2019),
(9,'EFG8R88','Renault','Logan','Cinza',2020),
(10,'HIJ9S99','Ford','Ka Sedan','Prata',2017),
(10,'HIJ0T00','Peugeot','3008','Preto',2021),
(11,'KLM1U11','Chevrolet','Cobalt','Branco',2016),
(11,'KLM2V22','Nissan','Sentra','Prata',2020),
(12,'NOP3W33','Toyota','Corolla Cross','Preto',2022),
(12,'NOP4X44','VW','Amarok','Cinza',2023);

/*-------------------- INSERTS TABELA REGISTROS --------------------*/
INSERT INTO registros (veiculo_id, data_entrada, data_saida) VALUES
(1,'2025-08-20 08:15:00','2025-08-20 12:20:00'),
(2,'2025-08-20 09:10:00',NULL),
(3,'2025-08-21 07:45:00','2025-08-21 17:50:00'),
(4,'2025-08-21 08:25:00','2025-08-21 11:55:00'),
(5,'2025-08-22 09:05:00','2025-08-22 14:30:00'),
(6,'2025-08-22 10:15:00','2025-08-22 15:45:00'),
(7,'2025-08-23 08:30:00','2025-08-23 18:10:00'),
(8,'2025-08-23 09:40:00','2025-08-23 13:20:00'),
(9,'2025-08-24 07:50:00','2025-08-24 12:40:00'),
(10,'2025-08-24 10:05:00','2025-08-24 17:25:00'),
(11,'2025-08-20 11:15:00','2025-08-20 12:10:00'),
(12,'2025-08-20 14:10:00','2025-08-20 17:50:00'),
(13,'2025-08-21 08:05:00','2025-08-21 11:45:00'),
(14,'2025-08-21 13:10:00','2025-08-21 18:00:00'),
(15,'2025-08-22 07:55:00','2025-08-22 10:55:00'),
(16,'2025-08-22 12:20:00','2025-08-22 19:00:00'),
(17,'2025-08-23 08:15:00','2025-08-23 16:40:00'),
(18,'2025-08-23 09:25:00','2025-08-23 14:50:00'),
(19,'2025-08-24 08:00:00','2025-08-24 12:35:00'),
(20,'2025-08-24 14:30:00','2025-08-24 18:15:00');

/*-------------------- CONSULTAS DAS TABELAS --------------------*/
-- Listar todos os clientes
SELECT * FROM clientes;

-- Listar veículos por modelo
SELECT * FROM veiculos ORDER BY modelo;

-- Mostrar os 2 primeiros registros de entrada
SELECT * FROM registros ORDER BY data_entrada LIMIT 2;

-- Veículos ainda no estacionamento
SELECT * FROM registros WHERE data_saida IS NULL;

/*-------------------- ALTERAÇÕES --------------------*/
-- Adicionar DataNascimento
ALTER TABLE clientes ADD DataNascimento DATE;

-- Atualizar datas de nascimento (exemplo)
UPDATE clientes SET DataNascimento='1992-03-15' WHERE id=1;
UPDATE clientes SET DataNascimento='1987-07-09' WHERE id=2;

-- Remover coluna endereco
ALTER TABLE clientes DROP COLUMN endereco;

-- Deletar cliente 6, seus veículos e registros
DELETE r FROM registros r
JOIN veiculos v ON r.veiculo_id = v.id
WHERE v.cliente_id = 6;

DELETE FROM veiculos WHERE cliente_id = 6;
DELETE FROM clientes WHERE id = 6;