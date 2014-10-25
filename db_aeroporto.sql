CREATE DATABASE db_aeroporto;

USE db_aeroporto;

CREATE TABLE enderecos (
	id_endereco int auto_increment,
	bairro varchar(45) NOT NULL,
	cidade varchar(45) NOT NULL,
	estado varchar(45) NOT NULL,
	logradouro varchar(45) NOT NULL,
	numero int NOT NULL,
	CONSTRAINT pk_endereco PRIMARY KEY(id_endereco)
);

CREATE TABLE funcionarios (
	matricula int auto_increment,
	id_endereco int NOT NULL,
	nome varchar(45) NOT NULL,
	cpf varchar(45) NOT NULL,
	telefone varchar(45),
	salario varchar(45) NOT NULL,
	companhia varchar(45) NOT NULL,
	tecnico boolean NOT NULL,
	CONSTRAINT pk_funcionario PRIMARY KEY(matricula),
	CONSTRAINT fk_funcionario_endereco FOREIGN KEY(id_endereco) REFERENCES enderecos(id_endereco)
);

CREATE TABLE modelos (
	numero_modelo varchar(45),
	capacidade int NOT NULL,
	peso int NOT NULL,
	autonomia varchar(15) NOT NULL,
	CONSTRAINT pk_modelo PRIMARY KEY(numero_modelo)
);

CREATE TABLE avioes (
	numero_registro int,
	numero_modelo varchar(45) NOT NULL,
	CONSTRAINT pk_aviao PRIMARY KEY(numero_registro),
	CONSTRAINT fk_aviao_modelo FOREIGN KEY(numero_modelo) REFERENCES modelos(numero_modelo)
);

CREATE TABLE especialidades (
	matricula_tecnico int NOT NULL,
	numero_modelo varchar(45) NOT NULL,
	experiencia varchar(45) NOT NULL,
	CONSTRAINT pk_especialidades PRIMARY KEY(matricula_tecnico, numero_modelo),
	CONSTRAINT fk_especialidades_funcionario FOREIGN KEY(matricula_tecnico) REFERENCES funcionarios(matricula),
	CONSTRAINT fk_especialidades_modelo FOREIGN KEY(numero_modelo) REFERENCES modelos(numero_modelo)
);

CREATE TABLE testes (
	numero_teste INT,
	nome varchar(45) NOT NULL,
	pontuacao_maxima decimal NOT NULL,
	CONSTRAINT pk_testes PRIMARY KEY(numero_teste)
);

CREATE TABLE controlador_trafego (
	id_controlador_trafego int,
	funcionario int NOT NULL,
	ultimo_exame varchar(30) NOT NULL,
	CONSTRAINT pk_controlador_trafego PRIMARY KEY(id_controlador_trafego),
	CONSTRAINT fk_controlador_trafego_funcionario FOREIGN KEY(funcionario) REFERENCES funcionarios(matricula)
);

CREATE TABLE evento_teste (
	numero_aviao int,
	numero_teste int,
	matricula_tecnico int,
	data_teste varchar(30) NOT NULL,
	qtd_horas int NOT NULL,
	pontuacao decimal NOT NULL,
	CONSTRAINT pk_evento_teste PRIMARY KEY(numero_aviao, numero_teste, matricula_tecnico),
	CONSTRAINT fk_evento_teste_aviao FOREIGN KEY(numero_aviao) REFERENCES avioes(numero_registro),
	CONSTRAINT fk_evento_teste_testes FOREIGN KEY(numero_teste) REFERENCES testes(numero_teste),
	CONSTRAINT fk_evento_teste_tecnico FOREIGN KEY(matricula_tecnico) REFERENCES funcionarios(matricula)
);
