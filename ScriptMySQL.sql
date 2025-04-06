
create database dblocadora;
use dblocadora;




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
    usuario_cli varchar(50),
    senha_cli varchar(50),
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
    cod_es INT NOT NULL,
    usuario_func varchar(50),
    senha_func varchar(50),
    nome_func VARCHAR(100) NOT NULL,
    cpf_func CHAR(11) NOT NULL,
    cargo_func VARCHAR(50) NOT NULL,
    salario_func DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,                 
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es)
);

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

INSERT INTO Clientes (usuario_cli, senha_cli, nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, observacao) VALUES
('joaosilva', 'senha123', 'João da Silva', '12345678900', '01001000', 'Rua das Flores, 123', 'Apto 101', 'SP', 'Cliente novo'),
('mariaoliveira', 'senha456', 'Maria Oliveira', '23456789011', '20040002', 'Avenida Central, 456', 'Casa', 'RJ', 'Prefere contato por e-mail'),
('pedrosouza', 'senha789', 'Pedro Souza', '34567890122', '30130010', 'Rua da Paz, 789', 'Fundos', 'MG', 'Verificar pendências'),
('anacosta', 'senha321', 'Ana Costa', '45678901233', '40010000', 'Travessa Alegre, 321', 'Cobertura', 'BA', 'Cliente VIP'),
('lucasmoura', 'senha654', 'Lucas Moura', '56789012344', '60060000', 'Rua dos Lírios, 222', 'Bloco B', 'CE', 'Pede nota fiscal'),
('fernandasilva', 'senha987', 'Fernanda Silva', '67890123455', '70040010', 'Quadra 5, Lote 10', 'Sem complemento', 'DF', 'Sempre paga em dia'),
('carlosalmeida', 'senha159', 'Carlos Almeida', '78901234566', '80010110', 'Rua XV de Novembro, 400', 'Loja 2', 'PR', 'Cliente recorrente'),
('julianasantos', 'senha753', 'Juliana Santos', '89012345677', '88010400', 'Rua da Praia, 98', 'Sala 4', 'SC', 'Solicita envio rápido'),
('andreluiz', 'senha852', 'André Luiz', '90123456788', '96010000', 'Rua do Comércio, 77', 'Apto 303', 'RS', 'Verificar cadastro'),
('laisrocha', 'senha741', 'Laís Rocha', '01234567899', '64000000', 'Rua das Palmeiras, 11', 'Casa térrea', 'PI', 'Cliente antiga');



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

INSERT INTO Funcionarios (cod_es, usuario_func, senha_func, nome_func, cpf_func, cargo_func, salario_func, data_admissao, ativo) VALUES
(1, 'mariarodrigues', 'func123', 'Maria Rodrigues', '12345678900', 'Gerente', 5200.00, '2022-03-15', 1),
(2, 'joaopereira', 'func456', 'João Pereira', '23456789011', 'Vendedor', 2500.00, '2023-01-10', 1),
(1, 'carlaalves', 'func789', 'Carla Alves', '34567890122', 'Auxiliar Administrativo', 2200.00, '2021-07-20', 1),
(3, 'rodrigosoares', 'func321', 'Rodrigo Soares', '45678901233', 'TI - Suporte', 3500.00, '2020-11-05', 1),
(2, 'fernandolima', 'func654', 'Fernando Lima', '56789012344', 'Financeiro', 4000.00, '2023-04-12', 1),
(1, 'priscilacosta', 'func987', 'Priscila Costa', '67890123455', 'RH', 3800.00, '2022-09-30', 1),
(3, 'andrehenrique', 'func159', 'André Henrique', '78901234566', 'Vendedor', 2400.00, '2021-01-25', 1),
(2, 'laisfigueiredo', 'func753', 'Laís Figueiredo', '89012345677', 'Marketing', 3600.00, '2020-06-18', 1),
(1, 'fabiosantos', 'func852', 'Fábio Santos', '90123456788', 'TI - Analista', 4200.00, '2022-12-01', 1),
(3, 'julianamendes', 'func741', 'Juliana Mendes', '01234567899', 'Limpeza', 1600.00, '2023-08-09', 1);


