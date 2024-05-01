CREATE TABLE `fornecedor` (
    `id_forn` int PRIMARY KEY,
    `nome` varchar(255),
    `cidade` varchar(255)
);

CREATE TABLE `projeto` (
    `id_proj` int PRIMARY KEY,
    `nome`varchar(255),
    `depto` varchar(255), 
    `id_fornecedor`int
);

CREATE TABLE `peca` (
    `id_peca` int PRIMARY KEY,
    `nome` varchar(255),
    `validade` varchar(255),
    `vetor` varchar(255),
    `id_fornecedor`int
);

ALTER TABLE projeto ADD FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_forn);
ALTER TABLE peca ADD FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_forn);