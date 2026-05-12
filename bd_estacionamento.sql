CREATE DATABASE estacionamento_db;

USE estacionamento_db;

-- depois aplicar restrições e normalização

CREATE TABLE veiculo_tbl (
	placa VARCHAR(7) PRIMARY KEY NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL
);

CREATE TABLE proprietario_tbl (
	cpf VARCHAR(12) PRIMARY KEY NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(500) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    genero VARCHAR(10) NOT NULL,
	CONSTRAINT FOREIGN KEY (cpf) REFERENCES veiculo_tbl(placa)  
);

CREATE TABLE registro_tbl (
	codigo INT  PRIMARY KEY AUTO_INCREMENT,
    dataEntrada DATE NOT NULL,
	horarioEntrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    dataSaida DATE NOT NULL,
    horarioSaida TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_proprietario VARCHAR(12) NOT NULL,
    statusRegistro TINYINT NOT NULL DEFAULT "Inativo",
    CONSTRAINT FOREIGN KEY (id_proprietario) REFERENCES praprietario_tbl(CPF) 
);

CREATE TABLE vaga_tbl (
	id_vaga INT PRIMARY KEY AUTO_INCREMENT,
	statusVaga TINYINT NOT NULL DEFAULT "Inativo",
    tipo VARCHAR(50) NOT NULL,
	CONSTRAINT FOREIGN KEY (id_vaga) REFERENCES registro_tbl(codigo) 
)