--Criação do banco de dados
CREATE DATABASE clinicaOdontologica;

--Criação da tabela atendente com suas colunas
CREATE TABLE atendente (
    idAtendente SERIAL PRIMARY KEY,
    nome VARCHAR(50)
);

--Criação da tabela dentista com suas colunas
CREATE TABLE dentista (
    idDentista SERIAL PRIMARY KEY,
    especialidade VARCHAR(50),
    nome_completo VARCHAR(50),
    registro_profissional VARCHAR(50),
    hora_de_atendimento VARCHAR(50),
    CPF VARCHAR(11)
);

--Criação da tabela paciente com suas colunas
CREATE TABLE paciente (
    idPaciente SERIAL PRIMARY KEY,
    data_nascimento DATE,
    endereco VARCHAR(150),
    telefone VARCHAR(12),
    CPF VARCHAR(11),
    email VARCHAR(50),
    historico_de_consultas VARCHAR(200),
    nome_completo VARCHAR(100)
);

--Criação da tabela consulta com suas colunas
CREATE TABLE consulta (
    idConsulta SERIAL PRIMARY KEY,
    data_horario TIMESTAMP,
    idPaciente INT REFERENCES paciente(idPaciente) ON DELETE CASCADE,
    idDentista INT REFERENCES dentista(idDentista) ON DELETE CASCADE,
    descricao_do_atendimento VARCHAR(100),
    prescricao VARCHAR(100)
);

--Criação da tabela procedimento odontológico com suas colunas
CREATE TABLE procedimento_odontologico (
    idProcedimento SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    nome VARCHAR(50),
    duracao_media TIME
);

-- Criação da tabela de relacionamento entre procedimentos e consultas (M:N)
-- Essa tabela serve para associar múltiplos procedimentos a múltiplas consultas.
CREATE TABLE procedimento_consulta (
    idProcedimento_Consulta SERIAL PRIMARY KEY,
    idProcedimento INT REFERENCES procedimento_odontologico(idProcedimento) ON DELETE CASCADE,
    idConsulta INT REFERENCES consulta(idConsulta) ON DELETE CASCADE
);

-- Criação da tabela de relacionamento entre atendente e consultas (M:N)
CREATE TABLE atendente_consulta (
    idAtendente_Consulta SERIAL PRIMARY KEY,
    idAtendente INT REFERENCES atendente(idAtendente) ON DELETE CASCADE,
    idConsulta INT REFERENCES consulta(idConsulta) ON DELETE CASCADE
);

-- Inserindo os atendentes na tabela atendente
INSERT INTO atendente(nome) VALUES 
('João Silva'), 
('Maria Oliveira'), 
('Carlos Santos'),
('Roberto Lima'),
('Fernanda Souza'),
('Gustavo Almeida'),
('Camila Ferreira'),
('Eduardo Ramos'),
('Beatriz Castro'),
('Thiago Mendes');

-- Inserindo os procedimentos odontológicos na tabela procedimento_odontologico com descrição, nome e duração média.
INSERT INTO procedimento_odontologico (descricao, nome, duracao_media) VALUES 
('Tratamento de canal do dente afetado, aliviando a dor e preservando a estrutura dentária', 'Tratamento de Canal', '02:30:00'),
('Aplicação de gel clareador para melhorar a estética do sorriso', 'Clareamento Dental', '01:00:00'),
('Remoção de cárie e restauração do dente com material estético', 'Restauração Dental', '00:45:00'),
('Extração de dente comprometido ou siso', 'Extração Dental', '01:30:00'),
('Consulta de rotina para avaliação da saúde bucal', 'Exame de Rotina', '00:30:00'),
('Limpeza dental para remoção de tártaro e polimento', 'Limpeza Dental', '00:40:00'),
('Tratamento ortodôntico inicial para colocação de aparelho fixo', 'Aparelho Ortodôntico', '02:00:00'),
('Aplicação de flúor para prevenir cáries', 'Aplicação de Flúor', '00:20:00'),
('Diagnóstico e tratamento de gengivite ou periodontite', 'Tratamento Periodontal', '01:15:00'),
('Consulta para planejamento e execução de implante dental', 'Implante Dental', '03:00:00');

-- Inserindo os novos pacientes na tabela paciente
INSERT INTO paciente (idPaciente, nome_completo, cpf, data_nascimento, telefone, email, endereco, historico_de_consultas) 
VALUES 
(1, 'Ana Silva', '12345678901', '1990-03-15', '21987654321', 'ana.silva@gmail.com', 'Rua das Flores, 123', NULL),
(2, 'João Oliveira', '23456789012', '1985-06-22', '21988776655', 'joao.oliveira@gmail.com', 'Av. Central, 456', NULL),
(3, 'Maria Santos', '34567890123', '1992-01-10', '21999887766', 'maria.santos@gmail.com', 'Rua Bela Vista, 789', NULL),
(4, 'Carlos Pereira', '45678901234', '1988-07-30', '21996655443', 'carlos.pereira@gmail.com', 'Rua do Sol, 101', NULL),
(5, 'Fernanda Costa', '56789012345', '1995-11-05', '21995432122', 'fernanda.costa@gmail.com', 'Praça da Luz, 202', NULL),
(6, 'Gabriel Lima', '67890123456', '1990-02-18', '21994321011', 'gabriel.lima@gmail.com', 'Av. das Nações, 303', NULL),
(7, 'Isabela Rocha', '78901234567', '1987-12-12', '21993210987', 'isabela.rocha@gmail.com', 'Rua Harmonia, 404', NULL),
(8, 'Ricardo Nunes', '89012345678', '1993-05-25', '21992109876', 'ricardo.nunes@gmail.com', 'Rua da Paz, 505', NULL),
(9, 'Juliana Carvalho', '90123456789', '1998-09-09', '21991098765', 'juliana.carvalho@gmail.com', 'Av. Primavera, 606', NULL),
(10, 'Lucas Almeida', '01234567890', '1989-08-19', '21990987654', 'lucas.almeida@gmail.com', 'Rua Esperança, 707', NULL),
(11, 'Paulo Henrique', '11223344556', '1984-04-02', '21990011223', 'paulo.henrique@gmail.com', 'Rua do Campo, 808', NULL),  
(12, 'Amanda Freitas', '22334455667', '1996-12-15', '21998877665', 'amanda.freitas@gmail.com', 'Av. Brasil, 909', NULL),  
(13, 'Roberto Souza', '33445566778', '1991-07-07', '21997766554', 'roberto.souza@gmail.com', 'Rua do Comércio, 1010', NULL);

-- Inserindo os novos dentistas na tabela dentista
INSERT INTO dentista (nome_completo, cpf, registro_profissional, especialidade, hora_de_atendimento)
VALUES
('Dra Pâmela Reis', '11122334455', '12345RJ', 'Ortodontia', 'Segunda a Sexta, 08:00 - 17:00'),
('Dr João Costa', '22334455666', '23456RJ', 'Endodontia', 'Segunda a Quinta, 09:00 - 18:00'),
('Dra Carla Pereira', '33445566777', '34567RJ', 'Periodontia', 'Terça a Sexta, 10:00 - 19:00'),
('Dr Roberto Lima', '44556677888', '45678RJ', 'Implantodontia', 'Segunda a Sexta, 08:30 - 17:30'),
('Dra Juliana Oliveira', '55667788999', '56789RJ', 'Clínica Geral', 'Segunda a Sexta, 08:00 - 18:00'),
('Dr Fernando Souza', '66778899000', '67890SP', 'Odontopediatria', 'Segunda a Quinta, 09:00 - 17:00'),
('Dr Marcos Silva', '77889900111', '78901RJ', 'Estética Dentária', 'Segunda a Sexta, 08:00 - 18:00'),
('Dra Carolina Alves', '88990011222', '89012RJ', 'Cirurgia Bucomaxilofacial', 'Segunda a Sexta, 09:00 - 19:00'),
('Dr Luiz Rodrigues', '99001122333', '90123RJ', 'Próteses Dentárias', 'Segunda a Quinta, 08:30 - 17:00'),
('Dra Mariana Costa', '00112233444', '01234RJ', 'Clínica Geral', 'Segunda a Sexta, 10:00 - 19:00');

-- Inserindo as novas consultas na tabela consulta.
INSERT INTO consulta (idPaciente, idDentista, data_horario, descricao_do_atendimento, prescricao)
VALUES
(2, 1, '2025-03-10 09:00:00', 'Exame de rotina, avaliação geral da saúde bucal', NULL),
(10, 3, '2025-03-12 10:30:00', 'Limpeza dental e orientação sobre escovação correta', 'Uso de fio dental recomendado, retorno em 6 meses'),
(1, 2, '2025-03-15 14:00:00', 'Tratamento de canal do dente 24', 'Prescrição de analgésicos por 3 dias, retorno em 1 semana'),
(4, 5, '2025-03-18 11:30:00', 'Clareamento dental com aplicação de gel', 'Instruções de cuidados pós-clareamento: evitar alimentos com corantes por 48h'),
(9, 4, '2025-03-20 13:00:00', 'Extração do dente 18', 'Prescrição de antibiótico por 5 dias, retorno para revisão em 10 dias'),
(7, 6, '2025-03-22 08:30:00', 'Consulta de urgência para dor de dente, diagnóstico de cárie profunda', 'Prescrição de analgésicos e antibióticos, retornar para restauração após 5 dias'),
(5, 7, '2025-03-25 15:00:00', 'Restauração do dente 11', 'Evitar alimentos duros por 24h, retorno para avaliação em 6 meses'),
(8, 8, '2025-03-28 17:30:00', 'Tratamento ortodôntico, colocação de aparelho fixo', 'retorno em 30 dias'),
(3, 2, '2024-03-29 09:30:00', 'Exame de rotina e limpeza dental', NULL),
(6, 9, '2025-04-01 14:30:00', 'Consulta de avaliação para implante dental', 'Aguardando exames complementares, retorno após análise dos resultados');

-- Inserindo os relacionamentos entre procedimentos e as consultas realizadas, associando o procedimento a consulta através de seus IDs.
INSERT INTO procedimento_consulta (idProcedimento, idConsulta) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserindo os relacionamentos entre atendentes e as consultas realizadas, associando o atendente a consulta através de seus IDs.
INSERT INTO atendente_consulta (idAtendente, idConsulta) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

--Criação dos índices que pensamos serem mais utilizados
CREATE INDEX idx_consultas_data_horario ON Consulta (data_horario);

CREATE INDEX idx_consultas_id_paciente ON Consulta(idPaciente);

--Alteração dos nomes dos atendentes dado o id
UPDATE atendente SET nome = 'João lopes' 
WHERE idAtendente =1;

UPDATE atendente SET nome = 'Maria Oliveira' 
WHERE idAtendente = 2;

UPDATE atendente SET nome = 'Carlos Santos' 
WHERE idAtendente = 3;

--Deleção dos pacientes dado o id
DELETE FROM consulta 
WHERE idPaciente = 11;

DELETE FROM consulta 
WHERE idPaciente = 12;

DELETE FROM consulta 
WHERE idPaciente = 13;

--Consulta que retorna a quantidade de consultas por especialidade
SELECT 
    d.especialidade, 
    COUNT(c.idConsulta) AS total_consultas
FROM dentista AS d
JOIN consulta AS c  ON 
    d.idDentista = c.idDentista
GROUP BY d.especialidade
ORDER BY total_consultas DESC;

--Consulta que retorna a quantidade consultas realizadas por cada dentista
SELECT 
	d.nome_completo AS dentista, 
	COUNT(c.idConsulta) AS total_consultas
FROM dentista d
LEFT JOIN consulta c ON d.idDentista = c.idDentista
GROUP BY d.idDentista, d.nome_completo
ORDER BY total_consultas DESC;

--Consulta que retorna os pacientes com maior número de consultas
SELECT 
	p.nome_completo AS paciente, 
	COUNT(c.idConsulta) AS total_consultas
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
GROUP BY p.idPaciente, p.nome_completo
ORDER BY total_consultas DESC;

--Criação da View que consulta uma lista ordenadas por data
CREATE VIEW lista_consultas AS
SELECT 
    c.idConsulta AS id_consulta,
    p.nome_completo AS nome_paciente,
    d.nome_completo AS nome_dentista,
    c.data_horario AS data_consulta,
    STRING_AGG(po.nome, ', ') AS procedimentos_realizados
FROM consulta AS c
JOIN paciente AS p ON c.idPaciente = p.idPaciente
JOIN dentista AS d ON c.idDentista = d.idDentista
LEFT JOIN procedimento_consulta AS pc ON c.idConsulta = pc.idConsulta
LEFT JOIN procedimento_odontologico AS po ON pc.idProcedimento = po.idProcedimento
GROUP BY c.idConsulta, p.nome_completo, d.nome_completo, c.data_horario
ORDER BY c.data_horario DESC;

--Consulta que retorna a média de consulta por dentista
SELECT 
    d.nome_completo AS nome_dentista,
    COUNT(c.idConsulta) AS media_consultas
FROM consulta AS c
RIGHT JOIN dentista AS d ON c.idDentista = d.idDentista
GROUP BY d.idDentista, d.nome_completo
ORDER BY d.nome_completo;








 


