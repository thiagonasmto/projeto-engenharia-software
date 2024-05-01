CREATE TABLE `corretor` (
  `nome` varchar(255) PRIMARY KEY,
  `telefone` int
);

CREATE TABLE `imovel` (
  `codigo_cadastro` int PRIMARY KEY,
  `tipo_imovel` varchar(255),
  `localizacao` varchar(255),
  `objetivo` varchar(255),
  `situacao_atual` varchar(255),
  `id_iptu` int UNIQUE
);

CREATE TABLE `administra` (
  `id_corretor` int,
  `id_imovel` int,
  PRIMARY KEY (`id_corretor`, `id_imovel`)
);

CREATE TABLE `iptu` (
  `codigo_iptu` int PRIMARY KEY,
  `valor` int,
  `data_vencimento` date
);

CREATE TABLE `proprietario` (
  `id_imovel` int,
  `id_cliente` int,
  `valor_imovel` int,
  PRIMARY KEY (`id_imovel`, `id_cliente`)
);

CREATE TABLE `locatario` (
  `id_imovel` int,
  `id_cliente` int UNIQUE,
  `valor_aluguel` int,
  PRIMARY KEY (`id_imovel`, `id_cliente`)
);

CREATE TABLE `cliente` (
  `cpf` int PRIMARY KEY,
  `rg` int,
  `nome` varchar(255),
  `endereço` varchar(255)
);

CREATE TABLE `conjuge` (
  `id_cliente` int PRIMARY KEY,
  `cpf_marido` int,
  `cpf_esposa` int
);

ALTER TABLE `imovel` ADD FOREIGN KEY (`id_iptu`) REFERENCES `iptu` (`codigo_iptu`);

ALTER TABLE `administra` ADD FOREIGN KEY (`id_corretor`) REFERENCES `corretor` (`nome`);

ALTER TABLE `administra` ADD FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`codigo_cadastro`);

ALTER TABLE `proprietario` ADD FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`codigo_cadastro`);

ALTER TABLE `proprietario` ADD FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cpf`);

ALTER TABLE `locatario` ADD FOREIGN KEY (`id_imovel`) REFERENCES `imovel` (`codigo_cadastro`);

ALTER TABLE `locatario` ADD FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cpf`);

ALTER TABLE `conjuge` ADD FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cpf`);