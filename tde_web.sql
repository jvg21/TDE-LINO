-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Nov-2022 às 21:25
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tde_web`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Seleções'),
(2, 'Brasil'),
(3, 'Internacional');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `preco` double NOT NULL,
  `imagem` varchar(45) NOT NULL DEFAULT '"erro"',
  `id_categoria` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome_produto`, `preco`, `imagem`, `id_categoria`) VALUES
(1, 'Camisa seleção Azerbaijão 2014', 189.74, 'azerbaijao2014.png', 1),
(2, 'Camisa ABC 1920', 250.56, 'camisaabc1920.png', 2),
(3, 'Camisa Remo', 100, 'remo.png', 2),
(4, 'Camisa Airdrie 2021', 150, 'airdrie2021.jpg', 3),
(5, 'Camisa Jacuipense', 200, 'jacuipense.webp', 2),
(6, 'Camisa As Mangasport', 200.52, 'asmangasport.jpg', 3),
(7, 'Camisa Bahia de Feira', 250, 'BahiadeFeira2020.png', 2),
(8, 'Camisa seleção Casaquistão', 300, 'casaquistao.jpg', 1),
(10, 'Camisa seleção Uganda', 120, 'uganda.jpg', 1),
(11, 'Camisa seleção Marrocos', 124, 'marrocos.jpg', 1),
(13, 'Camisa seleção Romenia', 134, 'romenia.jpg', 1),
(14, 'Camisa Al Jazira 2015', 147, 'aljazira2015.webp', 3),
(18, 'Camisa Brasiliense 2010', 666, 'brasiliense.jpeg', 2),
(19, 'Camisa Rio Branco ES', 50, 'riobranco.jpeg', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `id_tamanho` int(11) NOT NULL,
  `codigo_tamanho` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`id_tamanho`, `codigo_tamanho`) VALUES
(1, 'P'),
(2, 'M'),
(3, 'G'),
(4, 'PP'),
(5, 'GG'),
(6, 'XG'),
(7, 'XXG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho_produto`
--

CREATE TABLE `tamanho_produto` (
  `id_tamanho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(25) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `cpf`, `email`, `senha`) VALUES
(11, 'GIO', '17733584151', 'gio@21.com', '123456'),
(14, 'Jao', '26556465467', 'j@asdass', '123'),
(22, 'Lino Jordan', '01234567891', 'Teste@teste.com', 'abc'),
(24, 'Lucas', '01234567871', 'Teste@teste01.com', 'abc'),
(25, 'Lucas Gabriel', '12345678911', 'Teste@teste02.com', 'abc'),
(26, 'Jorge', '12345671971', 'Teste@teste07.com', 'abcd'),
(31, 'Lula', '13131313131', 'Companheiros@triplex.com', '9dedos'),
(36, 'Bolsonaro', '12547896542', 'Leite@Condensado.com', 'imbroxavel'),
(37, 'Bruno Guttervill', '12356545650', 'mengonaoetime@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `valor` double NOT NULL,
  `avaliacao` text DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `datap` date NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id_venda`, `id_produto`, `id_usuario`, `valor`, `avaliacao`, `quantidade`, `datap`, `forma_pagamento`, `endereco`) VALUES
(30, 1, 11, 189.74, NULL, 1, '2022-11-09', 'Pix', 'Rua das Flores'),
(31, 1, 11, 189.74, NULL, 1, '2022-11-09', 'Pix', 'Rua do Mengo 123'),
(32, 6, 11, 200.52, NULL, 4, '2022-11-09', 'Pix', 'Rua do Mengo 123'),
(33, 1, 11, 189.74, NULL, 1, '2022-11-09', 'Pix', 'Rua do Mengo teste'),
(34, 6, 11, 200.52, NULL, 4, '2022-11-09', 'Pix', 'Rua do Mengo teste'),
(35, 1, 14, 189.74, NULL, 1, '2022-11-09', 'Credito', 'Rua dos Santos 635'),
(36, 6, 14, 200.52, NULL, 4, '2022-11-09', 'Credito', 'Rua dos Santos 635'),
(37, 1, 14, 189.74, NULL, 1, '2022-11-09', 'Credito', 'Rua dos Santos 648'),
(38, 6, 14, 200.52, NULL, 4, '2022-11-09', 'Credito', 'Rua dos Santos 648'),
(39, 6, 36, 200.52, NULL, 1, '2022-11-09', 'Credito', 'Rua do exército 22'),
(40, 7, 37, 250, NULL, 1, '2022-11-09', 'Pix', 'Rua do Mengo 999'),
(41, 18, 37, 666, NULL, 1, '2022-11-09', 'Pix', 'Rua do Mengo 999');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`) USING BTREE;

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `produto_categoria` (`id_categoria`) USING BTREE;

--
-- Índices para tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`id_tamanho`);

--
-- Índices para tabela `tamanho_produto`
--
ALTER TABLE `tamanho_produto`
  ADD PRIMARY KEY (`id_tamanho`,`id_produto`),
  ADD KEY `fk_tamanho_has_produto_produto1_idx` (`id_produto`),
  ADD KEY `fk_tamanho_has_produto_tamanho_idx` (`id_tamanho`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_produto_has_usuario_usuario1_idx` (`id_usuario`),
  ADD KEY `fk_produto_has_usuario_produto1_idx` (`id_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `id_tamanho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_id_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tamanho_produto`
--
ALTER TABLE `tamanho_produto`
  ADD CONSTRAINT `fk_tamanho_has_produto_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tamanho_has_produto_tamanho` FOREIGN KEY (`id_tamanho`) REFERENCES `tamanho` (`id_tamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_produto_has_usuario_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produto_has_usuario_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
