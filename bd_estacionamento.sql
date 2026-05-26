CREATE DATABASE estacionamento_db;
USE estacionamento_db;

CREATE TABLE vaga_tbl (
    id_vaga INT PRIMARY KEY AUTO_INCREMENT,
    statusVaga ENUM('Vazio', 'Ocupado') NOT NULL DEFAULT 'Vazio',
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE veiculo_tbl (
    placa VARCHAR(7) PRIMARY KEY NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    marca VARCHAR(50) NOT NULL
);

CREATE TABLE proprietario_tbl (
    cpf VARCHAR(11) PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    genero ENUM('M', 'F', 'Outro') NOT NULL,
    placa_veiculo VARCHAR(7),
    CONSTRAINT fk_veiculo_prop FOREIGN KEY (placa_veiculo) REFERENCES veiculo_tbl(placa)
);

CREATE TABLE endereco_tbl(
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(8) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    id_proprietario VARCHAR(11),
    CONSTRAINT fk_end_proprietario FOREIGN KEY (id_proprietario) REFERENCES proprietario_tbl(cpf) ON DELETE CASCADE
);

CREATE TABLE telefone_tbl(
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    ddd VARCHAR(3) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    id_proprietario VARCHAR(11),
    CONSTRAINT fk_tel_proprietario FOREIGN KEY (id_proprietario) REFERENCES proprietario_tbl(cpf) ON DELETE CASCADE
);

CREATE TABLE registro_tbl (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_saida DATETIME,
    id_proprietario VARCHAR(11),
    id_vaga INT,
    statusRegistro ENUM('Inativo', 'Ativo') NOT NULL DEFAULT 'Ativo',
    CONSTRAINT fk_reg_proprietario FOREIGN KEY (id_proprietario) REFERENCES proprietario_tbl(cpf),
    CONSTRAINT fk_reg_vaga FOREIGN KEY (id_vaga) REFERENCES vaga_tbl(id_vaga)
);

INSERT INTO veiculo_tbl (placa, modelo, ano, cor, marca) VALUES 
('ABC1D23', 'Civic', 2022, 'Cinza', 'Honda'),
('XYZ4E56', 'Onix', 2021, 'Branco', 'Chevrolet'),
('LPT9K12', 'Corolla', 2023, 'Preto', 'Toyota'),
('KJG3H44', 'HB20', 2020, 'Prata', 'Hyundai'),
('OWQ7M88', 'Compass', 2024, 'Azul', 'Jeep');

INSERT INTO proprietario_tbl (cpf, nome, email, genero, placa_veiculo) VALUES 
('11122233344', 'Ricardo Silva', 'ricardo@email.com', 'M', 'ABC1D23'),
('55566677788', 'Ana Oliveira', 'ana.oli@email.com', 'F', 'XYZ4E56'),
('99900011122', 'Beatriz Souza', 'bia.souza@email.com', 'F', 'LPT9K12'),
('33344455566', 'Carlos Mendes', 'cadu.mendes@email.com', 'M', 'KJG3H44'),
('77788899900', 'Juliana Costa', 'ju.costa@email.com', 'F', 'OWQ7M88');

INSERT INTO endereco_tbl (cep, rua, bairro, cidade, estado, numero, id_proprietario) VALUES 
('01001000', 'Praça da Sé', 'Sé', 'São Paulo', 'SP', '100', '11122233344'),
('20040002', 'Av. Rio Branco', 'Centro', 'Rio de Janeiro', 'RJ', '25', '55566677788'),
('30140061', 'Rua Sergipe', 'Savassi', 'Belo Horizonte', 'MG', '500', '99900011122'),
('70070010', 'Eixo Monumental', 'Asa Sul', 'Brasília', 'DF', 'S/N', '33344455566'),
('80010010', 'Rua XV de Novembro', 'Centro', 'Curitiba', 'PR', '12', '77788899900');

INSERT INTO telefone_tbl (ddd, numero, id_proprietario) VALUES 
('11', '988887777', '11122233344'),
('21', '977776666', '55566677788'),
('31', '966665555', '99900011122'),
('61', '955554444', '33344455566'),
('41', '944443333', '77788899900');

INSERT INTO vaga_tbl (statusVaga, tipo) VALUES 
('Ocupado', 'Coberta'),
('Ocupado', 'Padrão'),
('Vazio', 'Deficiente'),
('Ocupado', 'Moto'),
('Vazio', 'Padrão');

INSERT INTO registro_tbl (data_entrada, id_proprietario, id_vaga, statusRegistro) VALUES 
('2024-05-20 08:30:00', '11122233344', 1, 'Ativo'),
('2024-05-20 09:15:00', '55566677788', 2, 'Ativo'),
('2024-05-20 10:00:00', '33344455566', 4, 'Ativo'),
('2024-05-19 14:00:00', '99900011122', 3, 'Inativo'),
('2024-05-18 18:00:00', '77788899900', 5, 'Inativo');