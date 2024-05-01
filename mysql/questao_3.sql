CREATE TABLE `pessoa` (
    `cpf` int PRIMARY KEY,
    `nome` varchar(255),
    `nasc` date,
    `escol` varchar(255)
);

CREATE TABLE `cargo` (
    `id_cargo` int PRIMARY KEY,
    `nome` varchar(255),
    `inst` varchar(255),
    `vagas` int
);

CREATE TABLE `questao` (
    `id_questao` int PRIMARY KEY,
    `enunc` varchar(255),
    `a` varchar(255),
    `b` varchar(255),
    `c` varchar(255),
    `d` varchar(255),
    `e` varchar(255),
    `assunto` varchar(255),
    `resp` char,
    `dific` varchar(255)
);

CREATE TABLE `prova` (
    `id_prova` int PRIMARY KEY,
    `etapa` int
);

CREATE TABLE `candidato_a` (
    `id_candidatura` int PRIMARY KEY,
    `id_pessoa` int,
    `id_cargo` int,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(cpf),
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo)
);

CREATE TABLE `responde` (
    `resp` char,
    `id_pessoa` int,
    `id_questao` int,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(cpf),
    FOREIGN KEY (id_questao) REFERENCES questao(id_questao)
);

CREATE TABLE `composta_por` (
    `id_questao` int PRIMARY KEY,
    `id_prova` int,
    FOREIGN KEY (id_questao) REFERENCES questao(id_questao),
    FOREIGN KEY (id_prova) REFERENCES prova(id_prova)
);

CREATE TABLE `possui` (
    `id_cargo` int PRIMARY KEY,
    `id_prova` int,
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
    FOREIGN KEY (id_prova) REFERENCES prova(id_prova)
);