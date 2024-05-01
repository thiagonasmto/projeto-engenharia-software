CREATE TABLE `playlist` (
    `id_play` int PRIMARY KEY,
    `nome` varchar(255),
    `publica` varchar(255)
);

CREATE TABLE `musica` (
    `id_musica` int PRIMARY KEY,
    `letra` varchar(255),
    `duracao` int,
    `nome` varchar(255),
    `cont` varchar(255),
    `img` BLOB,
    `album` varchar(255),
    `genero` varchar(255)
);

CREATE TABLE `usuario` (
    `email` varchar(255) PRIMARY KEY,
    `nome` varchar(255),
    `sobren` varchar(255),
    `nasc` date,
    `id_musica` int,
    `id_cartao` int,
    `id_playlist` int,
    FOREIGN KEY (id_musica) REFERENCES musica(id_musica),
    FOREIGN KEY (id_cartao) REFERENCES cartao(id_cartao),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_play)
);

CREATE TABLE `cartao` (
    `id_cartao` int PRIMARY KEY,
    `bandeira` varchar(255),
    `nome` varchar(255),
    `num` int,
    `cv` int,
    `id_pagamento` int,
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pag)
);

CREATE TABLE `pagamento` (
    `id_pag` int PRIMARY KEY,
    `dia` int,
    `mes` int,
    `ano` int,
    `valor` int
);

CREATE TABLE `composta_por` (
    `id_playlist` int,
    `id_musica` int,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_play),
    FOREIGN KEY (id_musica) REFERENCES musica(id_musica)
);

CREATE TABLE `artista` (
    `id_usuario` int PRIMARY KEY,
    FOREIGN KEY (id_usuario) REFERENCES usuario(email)
);

CREATE TABLE `autor_de` (
    `id_artista` int,
    `id_musica` int,
    PRIMARY KEY (id_artista, id_musica),
    FOREIGN KEY (id_artista) REFERENCES artista(id_usuario),
    FOREIGN KEY (id_musica) REFERENCES musica(id_musica)
);

CREATE TABLE `amigo_de` (
    `id_usuario_1` int,
    `id_usuario_2` int,
    PRIMARY KEY (id_usuario_1, id_usuario_2),
    FOREIGN KEY (id_usuario_1) REFERENCES usuario(email),
    FOREIGN KEY (id_usuario_2) REFERENCES usuario(email)
);