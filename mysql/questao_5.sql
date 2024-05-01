CREATE TABLE `filme` (
    `id_filme` int PRIMARY KEY,
    `descric` varchar(255),
    `titulo` varchar(255),
    `genero` varchar(255),
    `id_video` int,
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE `episodio` (
    `id_episodio` int PRIMARY KEY,
    `temp`int,
    `num` int,
    `id_serie` int,
    `id_video` int,
    FOREIGN KEY (id_serie) REFERENCES serie(id_serie),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE `serie` (
    `id_serie` int PRIMARY KEY,
    `genero` varchar(255),
    `titulo` varchar(255),
    `descricao` varchar(255),
    `qtd_temp` int
);

CREATE TABLE `video` (
    `id_video` int PRIMARY KEY,
    `titulo` varchar(255),
    `duracao` int,
    `ano` int,
    `cont` varchar(255)
);

CREATE TABLE `artista` (
    `cpf` int PRIMARY KEY,
    `nome` varchar(255),
    `data` date,
    `local`varchar(255)
);

CREATE TABLE `usuario` (
    `cpf` int PRIMARY KEY,
    `nome` varchar(255),
    `emai` varchar(255),
    `senha` varchar(255)
);

CREATE TABLE `pagamento` (
    `id_pagamento` int PRIMARY KEY,
    `ano_ref` int,
    `mes_ref` int,
    `valor` int
);

CREATE TABLE `cartao` (
    `numero` int PRIMARY KEY,
    `bandeira` varchar,
    `cv` int
);

CREATE TABLE `atuado_por` (
    `id_video` int,
    `id_artista` int,
    PRIMARY KEY (id_artista, id_video),
    FOREIGN KEY (id_artista) REFERENCES artista(cpf),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE `assite` (
    `id_usuario` int,
    `id_video` int,
    `nota` int,
    PRIMARY KEY(id_usuario, id_video),
    FOREIGN KEY(id_usuario) REFERENCES usuario(cpf),
    FOREIGN KEY(id_video) REFERENCES video(id_video)
);

CREATE TABLE `efetua` (
    `id_pagamento` int PRIMARY KEY,
    `id_usuario` int,
    `id_cartao` int,
    `data` date,
    FOREIGN KEY (id_usuario) REFERENCES usuario(cpf),
    FOREIGN KEY (id_cartao) REFERENCES cartao(numero),
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento)
);