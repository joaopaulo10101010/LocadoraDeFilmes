create database dblocadora;
use dblocadora;
drop table Filmes;



CREATE TABLE Filmes (
    filme_cod INT AUTO_INCREMENT PRIMARY KEY,
    filme_nome VARCHAR(50) NOT NULL,
    filme_produto VARCHAR(30) NOT NULL,
    filme_genero VARCHAR(30) NOT NULL,
    filme_preco DECIMAL(10,2),
    filme_pontos INT,
    filme_ano YEAR NOT NULL,
    filme_quantidade INT NOT NULL
);

CREATE TABLE Estados (
    estado_uf CHAR(2) NOT NULL,
    estado_nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (estado_uf)
);

CREATE TABLE Estabelecimentos (
    cod_es INT AUTO_INCREMENT PRIMARY KEY,
    nome_es VARCHAR(50),
    endereco_es VARCHAR(50),
    complemento VARCHAR(30),
    estado_uf CHAR(2),
    cnpj_es VARCHAR(14),
    servico_es VARCHAR(30),
    postosDeTrabalho INT,
    totalDosCustos DECIMAL(10,2),
    totalDasVendas DECIMAL(10,2),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf)
);

CREATE TABLE Clientes (
    cod_cli INT AUTO_INCREMENT PRIMARY KEY,
    nome_cli VARCHAR(100) NOT NULL,
    cpf_cli CHAR(11) NOT NULL,
    cep_cli CHAR(8) NOT NULL,
    endereco VARCHAR(50),
    complemento_cli VARCHAR(50),
    estado_uf CHAR(2) NOT NULL,
    observacao VARCHAR(500),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf)
);

CREATE TABLE NotaFiscal (
    nt_cod INT AUTO_INCREMENT PRIMARY KEY,
    cod_cli INT,
    cod_es INT,
    nt_valorTotal DECIMAL(10,2),
    nt_valorTributos DECIMAL(10,2),
    nt_datatime DATETIME,
    nt_seguimento VARCHAR(50),
    nt_outrasInformacoes VARCHAR(300),
    FOREIGN KEY (cod_cli) REFERENCES Clientes(cod_cli),
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es)
);

CREATE TABLE Carrinho (
    car_cod INT AUTO_INCREMENT PRIMARY KEY,
    cod_es INT NOT NULL,
    cod_cli INT NOT NULL,
    filme_cod INT NOT NULL,
    car_quantidade INT NOT NULL,
    car_datetime DATETIME,
    FOREIGN KEY (cod_cli) REFERENCES Clientes(cod_cli),
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es),
    FOREIGN KEY (filme_cod) REFERENCES Filmes(filme_cod));

CREATE TABLE Funcionarios (
    func_cod INT AUTO_INCREMENT PRIMARY KEY,
    cod_es INT NOT NULL,                         -- Estabelecimento a que pertence
    nome_func VARCHAR(100) NOT NULL,
    cpf_func CHAR(11) NOT NULL,
    cargo_func VARCHAR(50) NOT NULL,
    salario_func DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,                  -- Se o funcionário ainda está ativo
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es)
);
drop table Funcionarios;

/*------------------- Colocando dados na tabela ------------------*/


insert into Estados(estado_uf, estado_nome) values
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');

INSERT INTO Clientes (nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, observacao) VALUES
('Ana Beatriz Silva', '12345678901', '01001000', 'Rua das Flores, 123', 'Apto 21', 'SP', 'Cliente frequente'),
('Carlos Eduardo Souza', '98765432100', '30140071', 'Av. Afonso Pena, 1000', 'Sala 12', 'MG', 'Prefere contato por e-mail'),
('Juliana Lima Rocha', '45612378909', '20040002', 'Rua da Alfândega, 45', 'Loja 5', 'RJ', 'Solicitou nota fiscal'),
('Mateus Oliveira', '32165498712', '60060100', 'Av. Domingos Olímpio, 300', 'Casa', 'CE', 'Nenhuma observação'),
('Fernanda Alves', '85274196300', '70040900', 'SBN Quadra 1', 'Torre Norte', 'DF', 'VIP'),
('Lucas Martins', '74185296311', '88010001', 'Rua Felipe Schmidt, 200', NULL, 'SC', 'Cliente novo'),
('Patrícia Costa', '36925814733', '69005310', 'Av. Eduardo Ribeiro, 50', 'Cobertura', 'AM', 'Sempre compra combos'),
('Diego Ferreira', '14725836900', '40010000', 'Praça Castro Alves, 10', NULL, 'BA', 'Solicitou envio por transportadora'),
('Camila Mendes', '25836914788', '64000000', 'Rua São João, 222', 'Casa 1', 'PI', 'Cliente em análise'),
('Bruno Henrique', '96385274122', '50010010', 'Av. Conde da Boa Vista, 888', 'Loja 1', 'PE', 'Pagamento no boleto');

INSERT INTO Estabelecimentos (nome_es, endereco_es, complemento, estado_uf, cnpj_es, servico_es, postosDeTrabalho, totalDosCustos, totalDasVendas) VALUES
('Loja São Jorge', 'Rua das Palmeiras, 101', 'Loja 1', 'SP', '12345678000195', 'Varejo de Roupas', 12, 52000.00, 87000.00),
('Farmácia Vida', 'Av. Brasil, 2100', NULL, 'RJ', '23456789000104', 'Farmácia', 8, 30000.00, 55000.00),
('Mercado Popular', 'Rua João Paulo, 45', NULL, 'MG', '34567890000193', 'Supermercado', 20, 110000.00, 170000.00),
('Oficina do Zé', 'Rua do Motorista, 88', 'Fundos', 'RS', '45678900000172', 'Serviços Automotivos', 5, 15000.00, 32000.00),
('Papelaria Central', 'Av. das Letras, 120', 'Sala 2', 'BA', '56789000000161', 'Papelaria', 4, 10000.00, 18000.00),
('Padaria Pão Quente', 'Rua do Trigo, 55', NULL, 'PE', '67890000000150', 'Padaria', 6, 14000.00, 25000.00),
('Pet Shop Fofuxo', 'Av. dos Bichos, 777', 'Loja A', 'SC', '78900000000149', 'Serviços Veterinários', 7, 20000.00, 40000.00),
('Clínica Bem Estar', 'Rua da Saúde, 300', NULL, 'DF', '89000000000138', 'Consultório Médico', 10, 50000.00, 75000.00),
('Tech Center', 'Av. Tecnológica, 900', 'Andar 3', 'SP', '90000000000127', 'Suporte em TI', 15, 95000.00, 150000.00),
('Estúdio Criativo', 'Rua da Arte, 33', 'Sala 8', 'PR', '01234567000116', 'Design Gráfico', 3, 8000.00, 20000.00);

INSERT INTO Funcionarios (cod_es, nome_func, cpf_func, cargo_func, salario_func, data_admissao, ativo) VALUES
(1, 'João Pereira', '12345678901', 'Gerente', 5200.00, '2020-05-12', TRUE),
(2, 'Maria Santos', '23456789012', 'Atendente', 1800.00, '2021-03-08', TRUE),
(3, 'Paulo Oliveira', '34567890123', 'Estoquista', 2300.50, '2022-01-15', TRUE),
(4, 'Luciana Costa', '45678901234', 'Caixa', 2100.00, '2023-07-03', TRUE),
(5, 'Fernanda Lima', '56789012345', 'Gerente', 5500.00, '2019-10-01', TRUE),
(6, 'Bruno Martins', '67890123456', 'Atendente', 1850.00, '2022-11-22', TRUE),
(7, 'Carla Mendes', '78901234567', 'Recepcionista', 2000.00, '2021-04-05', FALSE),
(8, 'Felipe Rocha', '89012345678', 'Auxiliar Administrativo', 2500.00, '2020-09-17', TRUE),
(9, 'Aline Souza', '90123456789', 'Faxineira', 1600.00, '2018-06-28', TRUE),
(10, 'Rodrigo Neves', '01234567890', 'Supervisor', 3200.00, '2023-02-14', TRUE);




