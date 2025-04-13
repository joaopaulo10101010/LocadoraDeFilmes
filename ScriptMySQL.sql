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
CREATE TABLE Funcionarios (
    usuario_fun VARCHAR(50),
    senha_fun VARCHAR(50),
    nome_fun VARCHAR(100) NOT NULL,
    cpf_fun CHAR(11) NOT NULL PRIMARY KEY,
    cep_fun CHAR(8) NOT NULL,
    endereco_fun VARCHAR(50),
    complemento_fun VARCHAR(50),
    estado_uf CHAR(2) NOT NULL,
    observacao_fun VARCHAR(500),
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
    observacao VARCHAR(500),
    FOREIGN KEY (estado_uf) REFERENCES Estados(estado_uf)
);

/* ------------------- 4 ------------------ */ 
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

/* ------------------- 5 ------------------ */ 
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

INSERT INTO Clientes (usuario_cli, senha_cli, nome_cli, cpf_cli, cep_cli, endereco, complemento_cli, estado_uf, observacao) VALUES
('joaosilva',   'senha123',  'João da Silva',           '12345678901', '01001000', 'Rua A, 123',      'Apto 1',    'SP', 'Cliente frequente.'),
('mariaolive',  'abc12345',  'Maria Oliveira',          '23456789012', '02002000', 'Av. B, 456',       '',         'RJ', 'Prefere filmes de ação.'),
('carlosm',     '123senha',  'Carlos Martins',          '34567890123', '03003000', 'Rua C, 789',       '',         'MG', 'Solicita notificações por SMS.'),
('anapaula99',  'senhaAna',  'Ana Paula Souza',         '45678901234', '04004000', 'Av. D, 321',       'Bloco B',  'BA', 'Cliente novo.'),
('felipetec',   'tec45678',  'Felipe Teixeira',         '56789012345', '05005000', 'Rua E, 654',       'Casa',     'SP', 'Assinante de plano mensal.'),
('beatriz.l',   'be@123',    'Beatriz Lima',            '67890123456', '06006000', 'Av. F, 987',       '',         'RJ', 'Sem observações.'),
('ricardop',    'rp2024',    'Ricardo Pereira',         '78901234567', '07007000', 'Rua G, 111',       '',         'MG', 'Prefere lançamentos.'),
('laisf',       'la12is34',  'Laís Ferreira',           '89012345678', '08008000', 'Av. H, 222',       'Apto 201', 'BA', 'Cliente VIP.'),
('thiago.sil',  'ts@pass',   'Thiago Silveira',         '90123456789', '09009000', 'Rua I, 333',       '',         'SP', 'Indicado por outro cliente.'),
('carolzinha',  'carol@321', 'Carolina Fernandes',      '01234567890', '10010000', 'Av. J, 444',       'Cobertura','RJ', 'Participou de promoções.');

INSERT INTO Funcionarios (usuario_fun, senha_fun, nome_fun, cpf_fun, cep_fun, endereco_fun, complemento_fun, estado_uf, observacao_fun) VALUES
('adminjoao',   'adm12345',   'João Batista',         '11122233344', '01001000', 'Rua Alfa, 100',     'Apto 2',     'SP', 'Gerente da unidade central.'),
('marianunes',  'm456789',    'Mariana Nunes',        '22233344455', '02002000', 'Av. Beta, 200',     '',           'RJ', 'Responsável pelo setor de vendas.'),
('cassiovieira','cas2024',    'Cássio Vieira',        '33344455566', '03003000', 'Rua Gama, 300',     'Casa 1',     'MG', 'Atendimento ao cliente.'),
('alinef',      'a12line34',  'Aline Ferreira',       '44455566677', '04004000', 'Av. Delta, 400',    'Bloco C',    'BA', 'Nova contratação.'),
('gustavob',    'gbpass2024', 'Gustavo Borges',       '55566677788', '05005000', 'Rua Épsilon, 500',  '',           'SP', 'RH e suporte técnico.'),
('lilianam',    'liM123456',  'Liliana Martins',      '66677788899', '06006000', 'Av. Zeta, 600',     '',           'RJ', 'Coordenadora de marketing.'),
('rodrigotp',   'rTp!321',    'Rodrigo Teixeira',     '77788899900', '07007000', 'Rua Eta, 700',      'Apto 5',     'MG', 'Líder de equipe.'),
('julianac',    'jul@123',    'Juliana Costa',        '88899900011', '08008000', 'Av. Teta, 800',     'Sala 12',    'BA', 'Auxiliar administrativo.'),
('pedrosilva',  'ps7890',     'Pedro da Silva',       '99900011122', '09009000', 'Rua Iota, 900',     '',           'SP', 'Funcionário do financeiro.'),
('fabianar',    'fabR@2025',  'Fabiana Ribeiro',      '00011122233', '10010000', 'Av. Kappa, 1000',   'Cobertura',  'RJ', 'Analista de dados.');





