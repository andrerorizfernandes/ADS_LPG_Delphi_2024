-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.22-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para ads
DROP DATABASE IF EXISTS `ads`;
CREATE DATABASE IF NOT EXISTS `ads` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ads`;

-- Copiando estrutura para tabela ads.aluno
DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `curso` varchar(30) NOT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aluno_usuario` (`idusuario`),
  CONSTRAINT `FK_aluno_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.aluno: ~14 rows (aproximadamente)
DELETE FROM `aluno`;
INSERT INTO `aluno` (`id`, `matricula`, `nome`, `curso`, `idusuario`) VALUES
	(1, '1010', 'Poliana', 'ads', 5),
	(3, '30309', '5555', '555', 3),
	(4, '3030', 'Augusto', 'ads', 4),
	(5, '2020', 'Raimundo', '200', 5),
	(6, '1010', 'Andrerson', '5405', 3),
	(7, '6060', 'Mariana', '54540', 3),
	(8, '30301', 'lucas', 'tstst', 3),
	(10, '101099', 'tyeyey', '54050', 3),
	(11, '66666', 'dfksjsd', 'dfsd', 3),
	(12, '55050', 'Andre', 'lllll', 3),
	(14, '4040', 'Rogerio', 'ADS', 9),
	(15, '1520', 'Mariana', 'BIO', 4),
	(16, '665', 'Francisco', 'HIS', 4),
	(17, '9090', 'Patricia', 'GEO', 4);

-- Copiando estrutura para tabela ads.banda
DROP TABLE IF EXISTS `banda`;
CREATE TABLE IF NOT EXISTS `banda` (
  `CodBanda` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `Uf` varchar(2) NOT NULL,
  `Vocalista` varchar(60) NOT NULL,
  PRIMARY KEY (`CodBanda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.banda: ~2 rows (aproximadamente)
DELETE FROM `banda`;
INSERT INTO `banda` (`CodBanda`, `Descricao`, `Cidade`, `Uf`, `Vocalista`) VALUES
	(3, 'capital inicial', 'Brasilia', 'DF', 'Dinho');

-- Copiando estrutura para tabela ads.carro
DROP TABLE IF EXISTS `carro`;
CREATE TABLE IF NOT EXISTS `carro` (
  `codcarro` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `marca` varchar(60) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `qtdeixos` int(11) NOT NULL,
  PRIMARY KEY (`codcarro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.carro: ~2 rows (aproximadamente)
DELETE FROM `carro`;
INSERT INTO `carro` (`codcarro`, `nome`, `marca`, `modelo`, `qtdeixos`) VALUES
	(1, 'Corolla', 'Toyota', 'Altis', 6);

-- Copiando estrutura para tabela ads.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `identidade` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.cliente: ~0 rows (aproximadamente)
DELETE FROM `cliente`;

-- Copiando estrutura para tabela ads.clube
DROP TABLE IF EXISTS `clube`;
CREATE TABLE IF NOT EXISTS `clube` (
  `codclube` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `fundacao` date NOT NULL,
  `mascote` varchar(30) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`codclube`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.clube: ~4 rows (aproximadamente)
DELETE FROM `clube`;
INSERT INTO `clube` (`codclube`, `descricao`, `fundacao`, `mascote`, `telefone`) VALUES
	(1, 'Cruzeiro', '1921-01-03', 'Raposa', '32988026843'),
	(3, 'juvelino', '2016-09-02', 'fio', 'odim'),
	(6, 'xxxx', '1999-01-01', 'rty', 'wweee'),
	(7, 'andre', '1988-07-18', 'raposao', '3456');

-- Copiando estrutura para tabela ads.colaborador
DROP TABLE IF EXISTS `colaborador`;
CREATE TABLE IF NOT EXISTS `colaborador` (
  `codcolaborador` varchar(10) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `idade` int(11) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codcolaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.colaborador: ~0 rows (aproximadamente)
DELETE FROM `colaborador`;

-- Copiando estrutura para tabela ads.empresa
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `codempresa` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `fantasia` varchar(80) DEFAULT NULL,
  `naturezajuridica` varchar(50) DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `municipio` varchar(70) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`codempresa`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.empresa: ~3 rows (aproximadamente)
DELETE FROM `empresa`;
INSERT INTO `empresa` (`codempresa`, `cnpj`, `nome`, `tipo`, `fantasia`, `naturezajuridica`, `logradouro`, `numero`, `bairro`, `municipio`, `uf`, `cep`) VALUES
	(1, '12345', 'Empresa A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, '653', 'Empresa B', 'ABC', 'TESTE', 'TR', 'RUA TESTE', '100', 'CIRCULO', 'UBA', 'MG', '3789032147'),
	(4, '789', 'Empresa C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Copiando estrutura para tabela ads.jogadores
DROP TABLE IF EXISTS `jogadores`;
CREATE TABLE IF NOT EXISTS `jogadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `posicao` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `clube` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.jogadores: ~0 rows (aproximadamente)
DELETE FROM `jogadores`;

-- Copiando estrutura para tabela ads.pessoa
DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  `nascimento` date NOT NULL,
  `endereco` varchar(99) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.pessoa: ~4 rows (aproximadamente)
DELETE FROM `pessoa`;
INSERT INTO `pessoa` (`id`, `nome`, `nascimento`, `endereco`, `telefone`) VALUES
	(2, 'Beatriz Souza ***', '1941-08-10', 'Rua Botoes de Ouro, 968', '(13) 5036-4135'),
	(3, 'Murilo Ferreira', '1986-09-20', 'Rua Juca LÃºcio, 1973', '(34) 3925-7363'),
	(5, 'Renan Azevedo', '1997-01-06', 'Rua JosÃ© Casemiro Correia', '(41) 9710-4845'),
	(6, 'Giovana Santos', '1991-01-02', 'Rodovia Washington Luiz, 70', '(83) 8607-6604');

-- Copiando estrutura para tabela ads.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `descricao` varchar(50) NOT NULL DEFAULT '',
  `cor` varchar(20) DEFAULT '',
  `marca` varchar(30) DEFAULT '',
  `quantidade` int(11) NOT NULL DEFAULT '0',
  `valor` float(12,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela ads.produto: 1 rows
DELETE FROM `produto`;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codigo`, `descricao`, `cor`, `marca`, `quantidade`, `valor`) VALUES
	('JKL1', 'mercedez', 'ff', 'ff', 5, 6.30);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela ads.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `identidade` varchar(18) DEFAULT NULL,
  `excluido` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.usuario: ~6 rows (aproximadamente)
DELETE FROM `usuario`;
INSERT INTO `usuario` (`id`, `nome`, `cpf`, `identidade`, `excluido`) VALUES
	(3, 'Supervisor', '25300019011', '3', 'N'),
	(4, 'Administrador', '41688040030', '4', 'N'),
	(5, 'Cliente', '52913745008', '5', 'N'),
	(8, 'jfhsdkhf', '08327102613', '540', 'N'),
	(9, 'Fornecedor', '09829984060', '5408', 'N'),
	(12, 'Teste', '82479709027', '555', 'N');

-- Copiando estrutura para tabela ads.veiculo
DROP TABLE IF EXISTS `veiculo`;
CREATE TABLE IF NOT EXISTS `veiculo` (
  `codCarro` int(11) NOT NULL,
  `Placa` varchar(7) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `Cor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codCarro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.veiculo: 1 rows
DELETE FROM `veiculo`;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` (`codCarro`, `Placa`, `Descricao`, `Cor`) VALUES
	(1, 'fdgdgd', 'dsds', 'ss');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
