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
  CONSTRAINT `FK_aluno_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.aluno: ~8 rows (aproximadamente)
INSERT IGNORE INTO `aluno` (`id`, `matricula`, `nome`, `curso`, `idusuario`) VALUES
	(1, '1010', 'teste', 'ads', 5),
	(3, '30309', '5555', '555', 3),
	(4, '3030', 'bom dia', 'ads', 4),
	(5, '2020', '2020', '200', 5),
	(6, '1010', 'gggg', '5405', 3),
	(7, '6060', '54540', '54540', 3),
	(8, '30301', 'lucas', 'tstst', 3),
	(10, '101099', 'tyeyey', '54050', 3);

-- Copiando estrutura para tabela ads.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `identidade` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela ads.usuario: ~4 rows (aproximadamente)
INSERT IGNORE INTO `usuario` (`id`, `nome`, `cpf`, `identidade`) VALUES
	(3, 'Administrador', '222', '3'),
	(4, 'Supervisor', '333', '4'),
	(5, 'Operario', '444', '5'),
	(6, 'Teste', '555', '6');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
