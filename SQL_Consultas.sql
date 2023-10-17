-- Visualizar os dados

SELECT *
FROM Paciente
SELECT *
FROM Medico
SELECT *
FROM Especialidade
SELECT *
FROM Consulta


-- Criação do banco de dados

CREATE DATABASE Clinica
GO
USE Clinica

-- Criação das tabelas

CREATE TABLE Paciente(
Num_Beneficiario		INT	not null,
Nome					VARCHAR(100)	not null,
Logradouro	VARCHAR(200)	not null,
Numero INT not null,
CEP CHAR(8) not null,
Complemento VARCHAR(255) not null,
Telefone VARCHAR(11) not null
PRIMARY KEY (Num_Beneficiario)
)

CREATE TABLE Especialidade(
ID INT not null,
Especialidade VARCHAR(100) not null
PRIMARY KEY (ID)
)

CREATE TABLE Medico(
Codigo INT not null,
Nome VARCHAR(100) not null,
Logradouro VARCHAR(100) not null,
Numero INT not null,
CEP CHAR(8) not null,
Complemento VARCHAR(255) not null,
Contato VARCHAR(11) not null,
EspecialidadeID INT not null
PRIMARY KEY (Codigo)
FOREIGN KEY (EspecialidadeID) REFERENCES Especialidade(ID)
)

CREATE TABLE Consulta(
PacienteNum_Beneficiario INT not null,
Medico_Codigo INT not null,
Data_hora DATETIME not null,
Observacao VARCHAR(255) not null
PRIMARY KEY (Data_hora)
FOREIGN KEY (PacienteNum_Beneficiario) REFERENCES Paciente(Num_Beneficiario),
FOREIGN KEY (Medico_Codigo) REFERENCES Medico(Codigo)
)

-- Inserção de dados

INSERT INTO Especialidade VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatria')

INSERT INTO Paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, 02345000, 'Casa', 922229999),
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, 03254010, 'Bloco B. Apto 25', 923450987),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, 06987020, 'Apto 1208', 912348765),
(99904, 'José Araujo', 'R. XV de Novembro', 18, 03678000, 'Casa', 94567312),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, 01214000, 'Conjunto 3 - Apto 801', 912095674)

INSERT INTO Medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, 03698000, 'Casa', 915689456, 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, 02145070, 'Casa', 923235454, 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, 05241000, 'Apto 205', 963698585, 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, 03145000, 'Apto 602', 932458745, 3)

INSERT INTO Consulta VALUES
(99901, 100002, '09-04-2021 13:20', 'Infecção Urina'),
(99902, 100003, '09-04-2021 13:15', 'Gripe'),
(99901, 100001, '09-04-2021 12:30', 'Infecção Garganta')

ALTER TABLE Medico
ADD dia_atendimento VARCHAR(255)


UPDATE Medico
SET dia_atendimento = 'Passa a atender na 2ª feira'
WHERE Codigo = 100001

UPDATE Medico
SET dia_atendimento = 'Passa a atender na 4ª feira'
WHERE Codigo = 100002

UPDATE Medico
SET dia_atendimento = 'Passa a atender na 2ª feira'
WHERE Codigo = 100003

UPDATE Medico
SET dia_atendimento = 'Passa a atender na 5ª feira'
WHERE Codigo = 100004

DELETE Especialidade
WHERE Especialidade = 'Pediatria'

EXEC sp_rename 'Medico.dia_atendimento', 'dia_semana_atendimento', 'column'

UPDATE Medico
SET Logradouro = 'Av. Bras Leme', Numero = 876, Complemento = 'Apto. 504', CEP = 02122000
WHERE Nome = 'Lucas Borges'

ALTER TABLE Consulta
ALTER COLUMN Observacao VARCHAR(200) not null