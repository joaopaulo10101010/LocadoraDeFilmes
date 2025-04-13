drop database dblocadora;
create database dblocadora;
use dblocadora;

/* ------------------- 1 ------------------ */ 
CREATE TABLE Estados (
    estado_uf CHAR(2) NOT NULL,
    estado_nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (estado_uf)
);

/* ------------------- 2 ------------------ */ 
CREATE TABLE Estabelecimentos (
    cod_es INT AUTO_INCREMENT PRIMARY KEY,
    nome_es VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(50),
    complemento VARCHAR(50),
    estado_uf CHAR(2) NOT NULL,
    valorArecadado decimal(20,2),
    valorGasto decimal(20,2),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf)
);
/* ------------------- 3 ------------------ */ 
CREATE TABLE Clientes (
    usuario_cli VARCHAR(50),
    senha_cli VARCHAR(50),
    nome_cli VARCHAR(100) NOT NULL,
    cpf_cli CHAR(11) NOT NULL PRIMARY KEY,
    cep_cli CHAR(8) NOT NULL,
    endereco VARCHAR(50),
    complemento_cli VARCHAR(50),
    estado_uf CHAR(2) NOT NULL,
    pontos_cli int,
    observacao VARCHAR(500),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf)
);

/* ------------------- 4 ------------------ */ 


CREATE TABLE Funcionarios (
	cod_es int,
    usuario_fun VARCHAR(50),
    senha_fun VARCHAR(50),
    nome_fun VARCHAR(100) NOT NULL,
    cpf_fun CHAR(11) NOT NULL PRIMARY KEY,
    cep_fun CHAR(8) NOT NULL,
    endereco_fun VARCHAR(50),
    complemento_fun VARCHAR(50),
    estado_uf CHAR(2) NOT NULL,
    cargo_fun VARCHAR(50),
    salario_fun decimal(20,2),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf),
    foreign key (cod_es) references Estabelecimentos(cod_es)
);


/* ------------------- 5 ------------------ */ 
CREATE TABLE Filmes (
    filme_cod INT AUTO_INCREMENT PRIMARY KEY,
    filme_nome VARCHAR(50) NOT NULL,
    filme_produto VARCHAR(30) NOT NULL,
    filme_genero VARCHAR(30) NOT NULL,
    filme_preco DECIMAL(10,2),
    filme_pontos INT,
    filme_ano YEAR NOT NULL,
    filme_desconto int,
    filme_quantidade INT NOT NULL
);

/* ------------------- 6 ------------------ */ 
CREATE TABLE NotaFiscal (
    nt_cod INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cli CHAR(11),
    cod_es INT,
    nt_valorTotal DECIMAL(10,2),
    nt_valorTributos DECIMAL(10,2),
    nt_datatime DATETIME,
    nt_seguimento VARCHAR(50),
    nt_outrasInformacoes VARCHAR(300),
    FOREIGN KEY (cpf_cli) REFERENCES Clientes(cpf_cli),
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es)
);

/* ------------------- 7 ------------------ */ 
CREATE TABLE Carrinho (
    car_cod INT AUTO_INCREMENT PRIMARY KEY,
    cod_es INT NOT NULL,
    cpf_cli CHAR(11) NOT NULL,
    filme_cod INT NOT NULL,
    car_quantidade INT NOT NULL,
    car_datetime DATETIME,
    FOREIGN KEY (cpf_cli) REFERENCES Clientes(cpf_cli),
    FOREIGN KEY (cod_es) REFERENCES Estabelecimentos(cod_es),
    FOREIGN KEY (filme_cod) REFERENCES Filmes(filme_cod)
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

INSERT INTO Estabelecimentos (nome_es, cnpj, cep, endereco, complemento, estado_uf, valorArecadado, valorGasto) VALUES
('Locadora Central',     '12345678000101', '01234000', 'Rua Alpha, 100',     'Sala 1',   'SP', 150000.00, 80000.00),
('Filmes & Cia',         '22345678000102', '01355000', 'Av. Paulista, 2000', '',        'SP', 125000.50, 60000.25),
('Video Mania',          '32345678000103', '01432000', 'Rua Augusta, 300',   '',        'RJ', 98000.00,  52000.00),
('Cinema Plus',          '42345678000104', '01567000', 'Av. Rio Branco, 400','Sala B',  'RJ', 134500.75, 70000.00),
('MovieTime',            '52345678000105', '01678000', 'Rua Minas, 500',     'Térreo',  'MG', 87000.00,  42000.00),
('CineShow',             '62345678000106', '01789000', 'Av. Amazonas, 600',  '',        'MG', 112000.20, 59000.30),
('Super Filmes',         '72345678000107', '01890000', 'Rua Bahia, 700',     '',        'BA', 102300.40, 47000.10),
('LocaFilmes',           '82345678000108', '01999000', 'Av. Salvador, 800',  '',        'BA', 97000.00,  48000.00),
('Mega Vídeo',           '92345678000109', '02000000', 'Rua Recife, 900',    '',        'SP', 158000.90, 87000.55),
('VideoLoc',             '10345678000110','02111000', 'Av. Campinas, 1000',  '',        'SP', 143500.00, 69300.75);

INSERT INTO Clientes (usuario_cli, senha_cli, nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, pontos_cli, observacao) VALUES
('ana.pereira', 'senhaAna2024', 'Ana Pereira', '12345678901', '11011000', 'Rua Paulista, 101', 'Apto 3', 'SP', 150, 'Cliente fiel, realiza compras com frequência.'),
('marcos.silva', 'marcos123', 'Marcos Silva', '23456789012', '22022000', 'Av. Rio Branco, 202', 'Sala 12', 'RJ', 200, 'Interessado em promoções de filmes de ação.'),
('carla.morais', 'carla@321', 'Carla Morais', '34567890123', '33033000', 'Rua XV de Novembro, 303', 'Casa 5', 'MG', 100, 'Cliente regular, gosta de comédias e dramas.'),
('luiz.oliveira', 'luiz9876', 'Luiz Oliveira', '45678901234', '44044000', 'Av. Brasil, 404', 'Bloco B', 'BA', 50, 'Cliente ocasional, comprou recentemente um filme de terror.'),
('daniela.souza', 'dani.souza', 'Daniela Souza', '56789012345', '55055000', 'Rua das Flores, 505', 'Apto 6', 'SP', 120, 'Compra filmes de aventura e animações com frequência.'),
('pedro.melo', 'pedro456', 'Pedro Melo', '67890123456', '66066000', 'Rua dos Três Irmãos, 606', 'Casa 2', 'RJ', 300, 'Cliente ativo, sempre faz compras de grande valor.'),
('marina.rodrigues', 'marina123', 'Marina Rodrigues', '78901234567', '77077000', 'Av. Luz, 707', 'Cobertura', 'MG', 250, 'Gosta de filmes românticos e drama.'),
('victor.nascimento', 'vitor2024', 'Victor Nascimento', '89012345678', '88088000', 'Rua Sete de Setembro, 808', '', 'BA', 180, 'Cliente regular, com boa quantidade de compras realizadas.'),
('lucas.gomes', 'lucas321', 'Lucas Gomes', '90123456789', '99099000', 'Av. Maré, 909', 'Apto 4', 'SP', 400, 'Comprador frequente, com destaque em filmes de ficção científica.'),
('julia.santos', 'julia@567', 'Julia Santos', '01234567890', '10010000', 'Rua São João, 1010', 'Bloco A', 'RJ', 50, 'Cliente esporádica, com poucas compras, principalmente de animações.');


INSERT INTO Funcionarios (cod_es, usuario_fun, senha_fun, nome_fun, cpf_fun, cep_fun, endereco_fun, complemento_fun, estado_uf, cargo_fun, salario_fun) VALUES
(1,  'joaobatista',  'senha123',  'João Batista',     '11122233344', '01001000', 'Rua Alfa, 100',     'Apto 2',     'SP', 'Gerente Geral',        8500.00),
(2,  'marianunes',   'mari456',   'Mariana Nunes',    '22233344455', '02002000', 'Av. Beta, 200',     '',           'RJ', 'Supervisora de Vendas', 6200.00),
(3,  'cassio.v',     'cas789',    'Cássio Vieira',    '33344455566', '03003000', 'Rua Gama, 300',     'Casa 1',     'MG', 'Atendente',            2800.00),
(4,  'aline.fer',    'aline2024', 'Aline Ferreira',   '44455566677', '04004000', 'Av. Delta, 400',    'Bloco C',    'BA', 'Caixa',                3200.00),
(5,  'gustavob',     'gbpass',    'Gustavo Borges',   '55566677788', '05005000', 'Rua Épsilon, 500',  '',           'SP', 'RH',                   4500.00),
(6,  'liliana.m',    'liMpass',   'Liliana Martins',  '66677788899', '06006000', 'Av. Zeta, 600',     '',           'RJ', 'Marketing',            5000.00),
(7,  'rodrigotp',    'rtp@2024',  'Rodrigo Teixeira', '77788899900', '07007000', 'Rua Eta, 700',      'Apto 5',     'MG', 'Supervisor',           5800.00),
(8,  'julianac',     'jul2025',   'Juliana Costa',    '88899900011', '08008000', 'Av. Teta, 800',     'Sala 12',    'BA', 'Administrativo',       4100.00),
(9,  'pedrosilva',   'pedro@123', 'Pedro da Silva',   '99900011122', '09009000', 'Rua Iota, 900',     '',           'SP', 'Financeiro',           6300.00),
(10, 'fabianar',     'fabR321',   'Fabiana Ribeiro',  '00011122233', '10010000', 'Av. Kappa, 1000',   'Cobertura',  'RJ', 'Analista de Dados',    7200.00);

INSERT INTO Filmes (filme_nome, filme_produto, filme_genero, filme_preco, filme_pontos, filme_ano, filme_desconto, filme_quantidade) VALUES
('Vingadores: Ultimato', 'Blu-ray', 'Ação', 89.90, 100, 2019, 15, 50),
('O Rei Leão', 'DVD', 'Animação', 49.90, 80, 2019, 10, 120),
('Parasita', 'Blu-ray', 'Drama', 69.90, 120, 2019, 20, 30),
('Toy Story 4', 'DVD', 'Animação', 59.90, 70, 2019, 10, 150),
('Coringa', 'Blu-ray', 'Ação', 79.90, 110, 2019, 5, 40),
('O Irlandês', 'DVD', 'Crime', 79.90, 90, 2019, 0, 25),
('Star Wars: A Ascensão Skywalker', 'Blu-ray', 'Aventura', 99.90, 150, 2019, 10, 60),
('O Farol', 'DVD', 'Terror', 59.90, 60, 2019, 25, 20),
('Aves de Rapina', 'Blu-ray', 'Ação', 79.90, 95, 2020, 10, 45),
('Mulher-Maravilha 1984', 'DVD', 'Ação', 69.90, 85, 2020, 15, 75);



select * from funcionarios;

