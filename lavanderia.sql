DROP DATABASE IF EXISTS lavanderia;
CREATE DATABASE lavanderia;
USE lavanderia;

CREATE TABLE clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(50)
);

CREATE TABLE servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(50) NOT NULL,
    preco FLOAT NOT NULL
);
    
CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    data_entrega DATE,
    id_cliente INT,
    id_servico INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_servico) REFERENCES servicos(id)
);

INSERT INTO clientes VALUES
 (DEFAULT, 'odair', '19-999999', 'rua cotrim'),
 (DEFAULT, 'hernane', '19-999998', 'rua do chaves'),
 (DEFAULT, 'luciano', '19-999997', 'popular');

INSERT INTO servicos VALUES
 (DEFAULT, 'lavar', 20.00),
 (DEFAULT, 'passar', 10.00),
 (DEFAULT, 'secar', 5.00);


INSERT INTO pedidos VALUES
 (DEFAULT, '2025-04-15', '2025-04-20', 1, 1),
 (DEFAULT, '2025-08-08', '2025-08-12', 2, 2),
 (DEFAULT, '2025-10-24', '2026-01-10', 3, 3),
 (DEFAULT, '2025-11-11', '2025-11-11', 1, 1);

SELECT * FROM pedidos ORDER BY data_entrega ASC;


SELECT * FROM pedidos WHERE data_pedido BETWEEN "2025-11-11" AND "2025-11-11";

SELECT nome_servico, SUM(preco) AS faturamento
FROM servicos, pedidos
WHERE pedidos.id_servico = servicos.id
GROUP BY nome_servico;

SELECT * 
FROM pedidos
WHERE data_entrega > NOW();


