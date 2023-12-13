 -- DROP DATABASE controle_Estoque;
CREATE DATABASE controle_Estoque;
USE controle_Estoque;

CREATE TABLE Produto (
    idproduto INT NOT NULL COMMENT 'Identificador do produto',
    nome VARCHAR(255) NOT NULL COMMENT 'nome do produto',
	idmarca INT NOT NULL COMMENT 'ID da marca do produto',
    idmodelo INT COMMENT 'ID da modelo do produto',
    idtamanho INT COMMENT 'ID da tamanho do produto',
    idtipoUnidade INT NOT NULL COMMENT 'ID do tipo de unidade do produto',
    descricao TEXT COMMENT 'Descrição detalhada do produto',
    lucropercentual DECIMAL(8, 2) COMMENT 'Percentual de lucro do produto'
);

CREATE TABLE Marca (
    idmarca INT NOT NULL COMMENT 'Identificador da marca',
    marca VARCHAR(255) COMMENT 'Nome da marca'
);

CREATE TABLE Modelo (
    idmodelo INT NOT NULL COMMENT 'Identificador do modelo',
    modelo VARCHAR(255) COMMENT 'Nome modelo'
);
    
CREATE TABLE Tamanho (
    idtamanho INT NOT NULL COMMENT 'Identificador do tamanho',
    tamanho VARCHAR(50) COMMENT 'tamanho PP,P,M,L,XL,XXL'
);

CREATE TABLE TipoUnidade (
    idtipoUnidade INT NOT NULL COMMENT 'Identificador do tipo de unidade',
    tipoUnidade VARCHAR(20) COMMENT 'tipo de unidade'
    );
    
CREATE TABLE Foto (
    idfoto INT NOT NULL COMMENT 'Identificador da foto',
    idproduto INT NOT NULL COMMENT 'Identificador do produto',
    caminhoFoto VARCHAR(300) COMMENT 'caminho para a foto'
);

CREATE TABLE Usuario (
    idmatricula INT NOT NULL COMMENT 'Identificador de matricula do funcionário',
    Nome VARCHAR(255) COMMENT 'nome do funcionário',
    metavenda DECIMAL(8,2) COMMENT ' meta de venda do funcionário'
);

CREATE TABLE Preco (
    idpreco INT NOT NULL COMMENT 'Identificador do preço',
    idproduto INT NOT NULL COMMENT 'Identificador do produto',
    Valor DECIMAL(10, 2) NOT NULL COMMENT 'Identificador do preço do produto',
    DataInicioVigencia DATE NOT NULL COMMENT 'data de inicio da vigência',
    DataFimVigencia DATE COMMENT 'data final da  vigencia ',
    idmatricula INT NOT NULL COMMENT 'Identificador do funcionário'
);

CREATE TABLE Estoque (
    idestoque INT NOT NULL COMMENT 'Identificador do estoque',
    idproduto INT NOT NULL COMMENT 'Identificador do produto',
    idlote INT NOT NULL COMMENT 'Identificador do lote',
    QtdProdEstoque INT COMMENT 'quantidade de produto no estoque',
    DataValidade DATE COMMENT 'data de validade do produto',
    QtdProdEntregue INT COMMENT 'quantidade de produto entrgue',
    LocalArmazenamento VARCHAR(255) COMMENT 'local de armazenamento'
);

CREATE TABLE Lote (
    idlote INT NOT NULL COMMENT 'Identificador do lote',
    numeroLote VARCHAR(100) NOT NULL COMMENT 'numero do lote'
);

CREATE TABLE Compra (
    idcompra INT NOT NULL COMMENT 'Identificador da compra',
    idpagamento INT NOT NULL COMMENT 'Identificador do pagamento',
    idfornecedor INT NOT NULL COMMENT 'Identificador do fornecedor',
    dataCompra DATE COMMENT 'data da compra dos produtos do fornecedor',
    dataPrevistaEntrega DATE COMMENT 'data prevista para a chegada dos produtos do fornecedor',
    dataPagamento DATE COMMENT 'data que o pagamento foi realizado',
    valoregociado DECIMAL(8,2) COMMENT 'valor negociado'
);

CREATE TABLE TipoPagamento (
    idpagamento INT NOT NULL COMMENT 'Identificador do pagamento',
    pagamento VARCHAR(100) NOT NULL COMMENT 'pagamento'
);

CREATE TABLE ItemComprado (
    iditemComprado INT NOT NULL COMMENT 'Identificador do item que foi comprado ',
    idcompra INT NOT NULL COMMENT 'Identificador da compra',
	idproduto INT NOT NULL COMMENT 'Identificador do produto',
    quantidadeComprado INT NOT NULL COMMENT 'quantidade de produto comprada',
    valorUnitário DECIMAL(8,2)  NOT NULL COMMENT 'valor unitário',
    produtosVendidos VARCHAR(700) NOT NULL COMMENT 'os produtos comprados do fornecedor'
);

CREATE TABLE Fornecedor (
    idfornecedor INT NOT NULL COMMENT 'Identificador do fornecedor',
    nome VARCHAR(255) NOT NULL COMMENT 'nome do fornecedor',
	CNPJ VARCHAR (14) COMMENT 'somente números',
    CEP  VARCHAR(8) COMMENT 'somente números' ,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100) ,
    complemento VARCHAR(100)
    );
    
CREATE TABLE Telefonefor (
    idtelefone INT NOT NULL COMMENT 'Identificador do telefone fornecedor',
    idfornecedor INT NOT NULL COMMENT 'Identificador do fornecedor',
    numero INT (10) COMMENT ' numero do fornecedor'
);
CREATE TABLE Cliente (
    idcliente INT NOT NULL COMMENT 'Identificador do cliente',
    nome VARCHAR(255) NOT NULL COMMENT 'nome do cliente',
    email VARCHAR(255),
    CEP  VARCHAR(8) COMMENT 'somente números',
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100) ,
    complemento VARCHAR(100)
    );     
    CREATE TABLE Telefone (
    idtelefonecli INT NOT NULL COMMENT 'Identificador do telefone cliente',
    idcliente INT NOT NULL COMMENT 'Identificador do cliente',
    numero INT (10) COMMENT 'numero do cliente'
);

CREATE TABLE ProdutoFavorito (
    idfavorito INT NOT NULL COMMENT 'Identificador do produto favorito',
    idcliente INT NOT NULL COMMENT 'Identificador do cliente',
    idproduto INT NOT NULL COMMENT 'Identificador do produto'
);

CREATE TABLE Venda (
    idVenda INT NOT NULL COMMENT 'Identificador da venda para o cliente',
    idmatricula INT NOT NULL COMMENT 'Identificador do duncioário',
    idcliente INT NOT NULL COMMENT 'Identificador do cliente',
    dataVenda DATE COMMENT 'data da venda', 
    notaCliente INT COMMENT 'nota do cliente para a venda'
);

CREATE TABLE ItemVenda (
    iditemVenda  INT NOT NULL COMMENT 'Identificador dos itens da venda',
    idvenda INT NOT NULL COMMENT 'Identificador da venda',
	idproduto INT NOT NULL COMMENT 'Identificador do produto',
    quantidadeComprado INT NOT NULL COMMENT 'quantidade de produto comprada',
    valorUnitário DECIMAL(8,2)  NOT NULL COMMENT 'valor unitário',
    AvaliacaoProduto INT COMMENT 'avaliação do produto'
);


CREATE TABLE Entrega (
    identrega INT NOT NULL COMMENT 'Identificador da entrega',
    idvenda INT NOT NULL COMMENT 'Identificador da venda',
    previsaoEntrega DATE COMMENT 'previsão de entrega do produto',
    dataEnviVenda DATE COMMENT 'data do envio do produto',
    meioTransporte VARCHAR(70) COMMENT 'meio de transporte',
    referenciaTransporta VARCHAR(100) COMMENT 'referencia da transportadora'
);
CREATE TABLE PontoEntrega (
    idpontoEntrega INT NOT NULL COMMENT 'Identificador dos pontos de entrega',
    idvenda INT NOT NULL COMMENT 'Identificador da venda',
    idcliente INT NOT NULL COMMENT 'Identificador do cliente',
    localPacote VARCHAR(200) COMMENT 'local onde o pacote se encontra'
);
-- CREATE PRIMARY KEYS
ALTER TABLE Produto ADD constraint PK_Produto primary key (idproduto);
ALTER TABLE Marca ADD constraint PK_Marca primary key (idmarca);
ALTER TABLE Modelo ADD constraint PK_Modelo primary key (idmodelo);
ALTER TABLE TipoUnidade ADD constraint PK_TipoUnidade primary key (idtipoUnidade);
ALTER TABLE Tamanho ADD constraint PK_Tamanho primary key (idtamanho);
ALTER TABLE Foto ADD constraint PK_Foto primary key (idfoto);
ALTER TABLE Usuario ADD constraint PK_Usuario primary key (idmatricula);
ALTER TABLE Preco ADD constraint PK_Preco primary key (idpreco);
ALTER TABLE Estoque ADD constraint PK_Estoque primary key (idestoque);
ALTER TABLE Lote ADD constraint PK_Lote primary key (idlote);
ALTER TABLE Compra ADD constraint PK_Compra primary key (idcompra);
ALTER TABLE TipoPagamento ADD constraint PK_Pagamento primary key (idpagamento);
ALTER TABLE ItemComprado ADD constraint PK_ItemComprado primary key (iditemComprado);
ALTER TABLE Fornecedor ADD constraint PK_Fornecedor primary key (idfornecedor);
ALTER TABLE Telefonefor ADD constraint PK_Telefonefor primary key (idtelefone);
ALTER TABLE Cliente ADD constraint PK_Cliente primary key (idcliente);
ALTER TABLE Telefone ADD constraint PK_Telefone primary key (idtelefonecli);
ALTER TABLE Venda ADD constraint PK_Venda primary key (idvenda);
ALTER TABLE ItemVenda ADD constraint PK_ItemVenda primary key (iditemVenda);
ALTER TABLE Entrega ADD constraint PK_Entrega primary key (identrega);
ALTER TABLE PontoEntrega ADD constraint PK_PontoEntrega primary key (idpontoEntrega);
ALTER TABLE ProdutoFavorito ADD constraint PK_ProdutoFavorito primary key (idfavorito);


-- CREATE FOREIGN KEYS
ALTER TABLE Produto ADD constraint FK_MARCA_PRODUTO foreign key (idmarca) references Marca (idmarca);
ALTER TABLE Produto ADD constraint FK_MODELO_PRODUTO foreign key (idmodelo) references Modelo (idmodelo);
ALTER TABLE Produto ADD constraint FK_TIPOUNIDADE_PRODUTO foreign key (idtipoUnidade) references TipoUnidade (idtipoUnidade);
ALTER TABLE Produto ADD constraint FK_TAMANHO_PRODUTO foreign key (idtamanho) references Tamanho (idtamanho);
ALTER TABLE Foto ADD constraint FK_PRODUTO_FOTO foreign key (idproduto) references Produto (idproduto);
ALTER TABLE preco ADD constraint FK_USUARIO_PRECO foreign key (idmatricula) references Usuario (idmatricula);
ALTER TABLE Preco ADD constraint FK_PRODUTO_PRECO foreign key (idproduto) references Produto (idproduto);
ALTER TABLE Estoque ADD constraint FK_PRODUTO_ESTOQUE foreign key (idproduto) references Produto (idproduto);
ALTER TABLE Estoque ADD constraint FK_LOTE_ESTOQUE foreign key (idlote) references Lote (idlote);
ALTER TABLE Compra ADD constraint FK_PAGAMENTO_COMPRA foreign key (idpagamento) references TipoPagamento (idpagamento);
ALTER TABLE Compra ADD constraint FK_FORNECEDOR_COMPRA foreign key (idfornecedor) references Fornecedor (idfornecedor);
ALTER TABLE ItemComprado ADD constraint FK_produto_ItemComprado foreign key (idproduto) references Produto (idproduto);
ALTER TABLE ItemComprado ADD constraint FK__compra_ItemComprado foreign key (idcompra) references Compra (idcompra);
ALTER TABLE Telefonefor ADD constraint FK_FORNECEDOR_TELEFONE foreign key (idfornecedor) references Fornecedor (idfornecedor);
ALTER TABLE Telefone ADD constraint FK_CLIENTE_TELEFONE foreign key (idcliente) references Cliente (idcliente);
ALTER TABLE Venda ADD constraint FK_USUARIO_VENDA foreign key (idmatricula) references Usuario (idmatricula);
ALTER TABLE Venda ADD constraint FK_CLIENTE_VENDA foreign key (idcliente) references Cliente (idcliente);
ALTER TABLE ItemVenda ADD constraint FK_VENDA_ItemVenda foreign key (idvenda) references Venda (idvenda);
ALTER TABLE ItemVenda ADD constraint FK_PRODUTO_ItemVenda foreign key (idproduto) references Produto (idproduto);
ALTER TABLE Entrega ADD constraint FK_VENDA_ENTREGA foreign key (idvenda) references Venda (idvenda);
ALTER TABLE PontoEntrega ADD constraint FK_VENDA_PONTOENTREGA foreign key (idvenda) references Venda (idvenda);
ALTER TABLE PontoEntrega ADD constraint FK_Cliente_PontoEntrega foreign key (idcliente) references Cliente (idcliente);
ALTER TABLE ProdutoFavorito ADD constraint FK_Cliente_Produtoavorito foreign key (idcliente) references Cliente (idcliente);
ALTER TABLE ProdutoFavorito ADD constraint FK_produto_produtofavorito foreign key (idproduto) references Produto (idproduto);

-- scripts de carga de dados para possibilitar consultas
-- Marcas
INSERT INTO Marca (idmarca, marca) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Sony'),
(4, 'Samsung'),
(5, 'Apple');

-- Modelos
INSERT INTO Modelo (idmodelo, modelo) VALUES
(1, 'Air Max'),
(2, 'Ultra Boost'),
(3, 'PlayStation 5'),
(4, 'Galaxy S21'),
(5, 'iPhone 13');

-- Tamanhos
INSERT INTO Tamanho (idtamanho, tamanho) VALUES
(1, 'P'),
(2, 'M'),
(3, 'G');

-- Tipos de Unidade
INSERT INTO TipoUnidade (idtipoUnidade, tipoUnidade) VALUES
(1, 'Par'),
(2, 'Unidade'),
(3, 'Peça');

-- Produtos
INSERT INTO Produto (idproduto, nome, idmarca, idmodelo, idtamanho, idtipoUnidade, descricao, lucropercentual) VALUES
(1, 'Nike Air Max P', 1, 1, 1, 1, 'Tênis esportivo', 0.2),
(2, 'Adidas Ultra Boost M', 2, 2, 2, 1, 'Tênis de corrida', 0.15),
(3, 'Sony PlayStation 5', 3, 3, NULL, 2, 'Console de videogame', 0.1),
(4, 'Samsung Galaxy S21', 4, 4, NULL, 2, 'Smartphone Android', 0.18),
(5, 'Apple iPhone 13', 5, 5, NULL, 2, 'Smartphone iOS', 0.2);

-- Fotos
INSERT INTO Foto (idfoto, idproduto, caminhoFoto) VALUES
(1, 1, '/images/nike_air_max_p.jpg'),
(2, 2, '/images/adidas_ultra_boost_m.jpg'),
(3, 3, '/images/sony_ps5.jpg'),
(4, 4, '/images/samsung_galaxy_s21.jpg'),
(5, 5, '/images/apple_iphone_13.jpg');

-- Usuários
INSERT INTO Usuario (idmatricula, Nome, metavenda) VALUES
(1, 'João', 15000),
(2, 'Maria', 12000),
(3, 'Pedro', 5000);

-- Preços
INSERT INTO Preco (idpreco, idproduto, Valor, DataInicioVigencia, DataFimVigencia, idmatricula) VALUES
(1, 1, 200.00, '2023-01-01', NULL, 1),
(2, 2, 180.00, '2023-01-01', NULL, 2),
(3, 3, 2500.00, '2023-01-01', NULL, 3),
(4, 4, 1200.00, '2023-01-01', NULL, 1),
(5, 5, 1500.00, '2023-01-01', NULL, 2);

-- Lotes
INSERT INTO Lote (idlote, numeroLote) VALUES
(1, 'L12345'),
(2, 'L67890');

-- Estoque
INSERT INTO Estoque (idestoque, idproduto, idlote, QtdProdEstoque, DataValidade, QtdProdEntregue, LocalArmazenamento) VALUES
(1, 1, 1, 50, '2024-01-01', 0, 'Depósito A'),
(2, 2, 2, 30, '2024-01-01', 0, 'Depósito B'),
(3, 3, 2, 200, '2024-01-01', 20, 'Depósito A'),
(4, 4, 2, 30, '2024-01-01', 0, 'Depósito A'),
(5, 5, 2, 100, '2024-01-01', 0, 'Depósito A');

-- Tipo de Pagamento
INSERT INTO TipoPagamento (idpagamento, pagamento) VALUES
(1, 'Cartão de Crédito'),
(2, 'Boleto Bancário');

-- Fornecedores
INSERT INTO Fornecedor (idfornecedor, nome, CNPJ, CEP, rua, bairro, cidade, estado, complemento) VALUES
(1, 'Distribuidora XYZ', '12345678901234', '12345678', 'Rua A', 'Centro', 'Cidade A', 'UF A', 'Sala 101'),
(2, 'Atacado ABC', '98765432109876', '54321876', 'Rua B', 'Bairro B', 'Cidade B', 'UF B', 'Andar 2');

-- Telefones de Fornecedores
INSERT INTO Telefonefor (idtelefone, idfornecedor, numero) VALUES
(1, 1, '123456789'),
(2, 2, '987654321');

-- Compras
INSERT INTO Compra (idcompra, idpagamento, idfornecedor, dataCompra, dataPrevistaEntrega, dataPagamento, valoregociado) VALUES
(1, 1, 1, '2023-01-15', '2023-01-20', '2023-01-18', 15000.00),
(2, 2, 2, '2023-02-01', '2023-02-10', '2023-02-05', 20000.00);

-- Itens Comprados
INSERT INTO ItemComprado (iditemComprado, idcompra, idproduto, quantidadeComprado, valorUnitário, produtosVendidos) VALUES
(1, 1, 1, 30, 180.00, 20),
(2, 1, 2, 20, 150.00, 15),
(3, 2, 3, 5, 2400.00, 5),
(4, 2, 4, 10, 1100.00, 8);

-- Clientes
INSERT INTO Cliente (idcliente, nome, email, CEP, rua, bairro, cidade, estado, complemento) VALUES
(1, 'Ana Silva', 'ana@email.com', '12345678', 'Rua C', 'Bairro C', 'Cidade C', 'UF C', 'Apto 303'),
(2, 'Carlos Oliveira', 'carlos@email.com', '54321876', 'Rua D', 'Bairro D', 'Cidade D', 'UF D', 'Casa 102'),
(3, 'Maria Souza', 'maria@email.com', '87654321', 'Rua E', 'Bairro E', 'Cidade E', 'UF E', 'Sala 201'),
(4, 'José Pereira', 'jose@email.com', '90854421', 'Rua F', 'Bairro F', 'Cidade F', 'UF F', 'Sala 202');


INSERT INTO Telefone (idtelefonecli, idcliente, numero) VALUES
(1, 1, '987654321'),
(2, 2, '123456789'),
(3, 3, '111122223'),
(4, 4, '111122223');

-- Produtos Favoritos
INSERT INTO ProdutoFavorito (idfavorito, idcliente, idproduto) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 4, 5);

-- Vendas
INSERT INTO Venda (idVenda, idmatricula, idcliente, dataVenda, notaCliente) VALUES
(1, 1, 1, '2023-11-25', '4'),
(2, 2, 2, '2023-02-10', '3'),
(3, 3, 3, '2023-11-05', '4'),
(4, 3, 4, '2023-11-05', '1');

-- Itens de Venda
INSERT INTO ItemVenda (idItemVenda, idvenda, idproduto, quantidadeComprado, valorUnitário, AvaliacaoProduto) VALUES
(1, 1, 1, 2, 200.00, '1'),
(2, 1, 2, 1, 180.00, '3'),
(3, 2, 3, 1, 2500.00, '5'),
(4, 3, 1, 5, 1200.00, '1'),
(5, 3, 5, 2, 1500.00, '2');

-- Entregas
INSERT INTO Entrega (identrega, idvenda, previsaoEntrega, dataEnviVenda, meioTransporte, referenciaTransporta) VALUES
(1, 1, '2023-01-28', '2023-01-28', 'Transportadora A', 'Prédio Azul'),
(2, 2, '2023-02-15', '2023-02-12', 'Correios', 'Casa Branca'),
(3, 3, '2023-03-10', '2023-03-08', 'Transportadora B', 'Escritório 2'),
(4, 3, '2023-03-08', '2023-03-08', 'Transportadora B', 'Escritório 2');

-- Pontos de Entrega
INSERT INTO PontoEntrega (idpontoEntrega, idvenda, idcliente, localPacote) VALUES
(1, 1, 1, 'Portaria do prédio'),
(2, 2, 2, 'Recepção'),
(3, 3, 3, 'Caixa de correspondência'),
(4, 4, 3, 'Caixa de correspondência');

-- ESTOQUE DISPONÍVEL
SELECT
    P.idproduto,
    P.nome AS NomeProduto,
    COALESCE(E.QtdProdEstoque, 0) AS QuantidadeAnterior,
    COALESCE(SUM(IC.quantidadeComprado), 0) AS QuantidadeComprada,
    COALESCE(SUM(E.QtdProdEntregue), 0) AS QuantidadeEntregue,
    COALESCE(E.QtdProdEstoque, 0) + COALESCE(SUM(E.QtdProdEntregue), 0) - COALESCE(SUM(IC.quantidadeComprado), 0) AS QuantidadeRealDisponivel
FROM
    Produto P
LEFT JOIN Estoque E ON P.idproduto = E.idproduto
LEFT JOIN ItemComprado IC ON P.idproduto = IC.idproduto
GROUP BY
    P.idproduto, P.nome, E.QtdProdEstoque;



-- RELATÓRIO TOTAL DE VENDAS 
SELECT  u.nome AS vendedor,
        MONTH(NOW()) as mes,
        SUM(i.valorUnitário * i.quantidadeComprado) as TotalVenda,
        u.metaVenda as Meta,
        u.metaVenda - SUM(i.valorUnitário * i.quantidadeComprado) as quantoFaltaMeta,
        CASE
          WHEN u.metaVenda - SUM(i.valorUnitário * i.quantidadeComprado) <= 0 THEN 'Bateu a Meta'
        ELSE 'Não bateu a meta'
        END AS IndMeta        
FROM Venda v
INNER JOIN ItemVenda i ON (v.idvenda = i.idvenda) 
INNER JOIN Usuario u ON (u.idmatricula = v.idmatricula)
WHERE v.DataVenda BETWEEN DATE_FORMAT(NOW(), '%Y-%m-01') AND LAST_DAY(NOW())
GROUP BY u.nome, mes, u.metaVenda;

-- RASTREAMENTO ENTREGA PARA CLIENTE
SELECT
    V.idvenda,
    E.identrega,
    E.previsaoEntrega,
    E.dataEnviVenda,
    E.meioTransporte,
    E.referenciaTransporta,
    CASE
        WHEN DATEDIFF(E.previsaoEntrega, E.dataEnviVenda) >= 0 THEN DATEDIFF(E.previsaoEntrega, E.dataEnviVenda)
        ELSE 'Entrega Realizada'
    END AS DiasFaltando,
    CASE
        WHEN DATEDIFF(E.previsaoEntrega, E.dataEnviVenda) <= 0 THEN 'Entrega Realizada'
        ELSE 'Aguardando Entrega'
    END AS StatusEntrega,
    CASE
        WHEN DATEDIFF(E.previsaoEntrega, E.dataEnviVenda) <= 0 THEN C.nome
        ELSE NULL
    END AS NomeCliente
FROM
    Venda V
JOIN Entrega E ON V.idvenda = E.idvenda
LEFT JOIN PontoEntrega P ON E.idvenda = P.idvenda
LEFT JOIN Cliente C ON P.idcliente = C.idcliente
WHERE
    E.dataEnviVenda IS NOT NULL AND E.previsaoEntrega IS NOT NULL;


-- SATISFAÇÃO DOS CLIENTES
WITH SatisfacaoClientes AS (
    SELECT
        V.idvenda,
        C.nome AS NomeCliente,
        V.notaCliente AS Avaliacao
    FROM
        Venda V
    JOIN Cliente C ON V.idcliente = C.idcliente
    WHERE
        V.notaCliente BETWEEN 1 AND 5
)
, ContagemAvaliacoes AS (
    SELECT
        Avaliacao,
        COUNT(*) AS Quantidade
    FROM
        SatisfacaoClientes
    GROUP BY
        Avaliacao
)
SELECT
    CA.Avaliacao AS Nota,
    COALESCE(CA.Quantidade, 0) AS Quantidade
FROM
    ContagemAvaliacoes CA
ORDER BY
    CA.Avaliacao;
    
    -- AVALIAÇÃO PRODUTO
 SELECT
    IV.idproduto,
    P.nome AS NomeProduto,
    IV.AvaliacaoProduto,
    COUNT(*) AS QuantidadeAvaliacoes
FROM
    ItemVenda IV
JOIN Produto P ON IV.idproduto = P.idproduto
WHERE
    IV.AvaliacaoProduto IS NOT NULL
GROUP BY
    IV.idproduto, P.nome, IV.AvaliacaoProduto
ORDER BY
    IV.idproduto, IV.AvaliacaoProduto DESC;
