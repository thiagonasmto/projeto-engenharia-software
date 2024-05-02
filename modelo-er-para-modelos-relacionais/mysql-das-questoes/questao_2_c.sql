CREATE TABLE `fornecedor` (
    `id_forn` int PRIMARY KEY,
    `nome` varchar(255),
    `cidade` varchar(255)
);

CREATE TABLE `projeto` (
    `id_proj` int PRIMARY KEY,
    `nome`varchar(255),
    `depto` varchar(255) 
);

CREATE TABLE `peca` (
    `id_peca` int PRIMARY KEY,
    `nome` varchar(255),
    `validade` varchar(255),
    `vetor` varchar(255) -- valor da peça
);

CREATE TABLE `fornece` (
    `id_fornecedor` int,
    `id_projeto` int,
    `id_peca` int,
    PRIMARY KEY (id_fornecedor),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_forn),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id_proj),
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca)
);