-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 24-Nov-2017 às 03:55
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visitante_ads`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `morador`
--

CREATE TABLE `morador` (
  `id_morador` int(5) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(14) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cod_veiculo` int(5) NOT NULL,
  `cod_unidade` int(5) NOT NULL,
  `cod_reserva` datetime NOT NULL,
  `cod_ocorrencia` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencia`
--

CREATE TABLE `ocorrencia` (
  `id_ocorrencia` int(5) NOT NULL,
  `data_ocorrencia` datetime NOT NULL,
  `tipo_ocorrencia` int(5) NOT NULL,
  `cod_morador` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_data_evento` datetime NOT NULL,
  `cod_morador` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `salao_evento`
--

CREATE TABLE `salao_evento` (
  `id_reserva` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_identificacao`
--

CREATE TABLE `tipo_identificacao` (
  `id_tipo_identificacao` int(5) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_unidade`
--

CREATE TABLE `tipo_unidade` (
  `id_tipo_unidade` int(5) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidade`
--

CREATE TABLE `unidade` (
  `id_unidade` int(5) NOT NULL,
  `cod_tipo_unidade` int(5) NOT NULL,
  `cod_morador` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `id_veiculo` int(5) NOT NULL,
  `renavam` varchar(15) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `cor` varchar(50) NOT NULL,
  `cod_morador` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitante`
--

CREATE TABLE `visitante` (
  `id_visitante` int(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cod_tipo_identificacao` int(5) NOT NULL,
  `cod_veiculo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `morador`
--
ALTER TABLE `morador`
  ADD PRIMARY KEY (`id_morador`),
  ADD KEY `cod_ocorrencia` (`cod_ocorrencia`),
  ADD KEY `cod_unidade` (`cod_unidade`),
  ADD KEY `cod_veiculo` (`cod_veiculo`),
  ADD KEY `cod_reserva` (`cod_reserva`);

--
-- Indexes for table `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD PRIMARY KEY (`id_ocorrencia`),
  ADD KEY `cod_morador` (`cod_morador`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_data_evento`),
  ADD KEY `cod_morador` (`cod_morador`);

--
-- Indexes for table `salao_evento`
--
ALTER TABLE `salao_evento`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indexes for table `tipo_identificacao`
--
ALTER TABLE `tipo_identificacao`
  ADD PRIMARY KEY (`id_tipo_identificacao`);

--
-- Indexes for table `tipo_unidade`
--
ALTER TABLE `tipo_unidade`
  ADD PRIMARY KEY (`id_tipo_unidade`);

--
-- Indexes for table `unidade`
--
ALTER TABLE `unidade`
  ADD PRIMARY KEY (`id_unidade`),
  ADD KEY `cod_morador` (`cod_morador`),
  ADD KEY `cod_tipo_unidade` (`cod_tipo_unidade`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`id_veiculo`),
  ADD KEY `cod_morador` (`cod_morador`);

--
-- Indexes for table `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id_visitante`),
  ADD KEY `cod_veiculo` (`cod_veiculo`),
  ADD KEY `cod_tipo_identificacao` (`cod_tipo_identificacao`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `morador`
--
ALTER TABLE `morador`
  MODIFY `id_morador` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ocorrencia`
--
ALTER TABLE `ocorrencia`
  MODIFY `id_ocorrencia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salao_evento`
--
ALTER TABLE `salao_evento`
  MODIFY `id_reserva` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_identificacao`
--
ALTER TABLE `tipo_identificacao`
  MODIFY `id_tipo_identificacao` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_unidade`
--
ALTER TABLE `tipo_unidade`
  MODIFY `id_tipo_unidade` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unidade`
--
ALTER TABLE `unidade`
  MODIFY `id_unidade` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitante`
--
ALTER TABLE `visitante`
  MODIFY `id_visitante` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `morador`
--
ALTER TABLE `morador`
  ADD CONSTRAINT `morador_ibfk_1` FOREIGN KEY (`cod_ocorrencia`) REFERENCES `ocorrencia` (`id_ocorrencia`),
  ADD CONSTRAINT `morador_ibfk_2` FOREIGN KEY (`cod_unidade`) REFERENCES `unidade` (`id_unidade`),
  ADD CONSTRAINT `morador_ibfk_3` FOREIGN KEY (`cod_veiculo`) REFERENCES `veiculo` (`id_veiculo`),
  ADD CONSTRAINT `morador_ibfk_4` FOREIGN KEY (`cod_reserva`) REFERENCES `reserva` (`id_data_evento`);

--
-- Limitadores para a tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`cod_morador`) REFERENCES `morador` (`id_morador`);

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`cod_morador`) REFERENCES `morador` (`id_morador`);

--
-- Limitadores para a tabela `unidade`
--
ALTER TABLE `unidade`
  ADD CONSTRAINT `unidade_ibfk_1` FOREIGN KEY (`cod_morador`) REFERENCES `morador` (`id_morador`),
  ADD CONSTRAINT `unidade_ibfk_2` FOREIGN KEY (`cod_tipo_unidade`) REFERENCES `tipo_unidade` (`id_tipo_unidade`);

--
-- Limitadores para a tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cod_morador`) REFERENCES `morador` (`id_morador`);

--
-- Limitadores para a tabela `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `visitante_ibfk_1` FOREIGN KEY (`cod_veiculo`) REFERENCES `veiculo` (`id_veiculo`),
  ADD CONSTRAINT `visitante_ibfk_2` FOREIGN KEY (`cod_tipo_identificacao`) REFERENCES `tipo_identificacao` (`id_tipo_identificacao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
