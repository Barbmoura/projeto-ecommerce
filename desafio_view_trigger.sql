-- Parte 1: Personalizando acessos com views 
-- Criar VIEW para número de empregados por departamento e localidade
CREATE VIEW vw_empregados_por_departamento_localidade AS
SELECT 
    D.Nome AS Departamento,
    D.Localidade,
    COUNT(E.Id) AS TotalEmpregados
FROM Empregados E
JOIN Departamentos D ON E.IdDepartamento = D.IdDepartamento
GROUP BY D.Nome, D.Localidade;

-- Criar VIEW para lista de departamentos e seus gerentes
CREATE VIEW vw_departamentos_gerentes AS
SELECT 
    D.Nome AS Departamento,
    E.Nome AS Gerente
FROM Departamentos D
JOIN Empregados E ON D.IdGerente = E.Id;

-- Criar VIEW para projetos com maior número de empregados (ordenado decrescente)
CREATE VIEW vw_projetos_mais_empregados AS
SELECT 
    P.Nome AS Projeto,
    COUNT(E.Id) AS TotalEmpregados
FROM Projetos P
JOIN Empregados E ON P.IdProjeto = E.IdProjeto
GROUP BY P.Nome
ORDER BY TotalEmpregados DESC;

-- Criar VIEW para lista de projetos, departamentos e gerentes
CREATE VIEW vw_projetos_departamentos_gerentes AS
SELECT 
    P.Nome AS Projeto,
    D.Nome AS Departamento,
    E.Nome AS Gerente
FROM Projetos P
JOIN Departamentos D ON P.IdDepartamento = D.IdDepartamento
JOIN Empregados E ON D.IdGerente = E.Id;

-- Criar VIEW para empregados que possuem dependentes e se são gerentes
CREATE VIEW vw_empregados_com_dependentes_e_se_sao_gerentes AS
SELECT 
    E.Nome AS Empregado,
    CASE 
        WHEN D.IdEmpregado IS NOT NULL THEN 'SIM' 
        ELSE 'NÃO' 
    END AS PossuiDependentes,
    CASE 
        WHEN E.Id IN (SELECT IdGerente FROM Departamentos) THEN 'SIM'
        ELSE 'NÃO'
    END AS eh_gerente
FROM Empregados E
LEFT JOIN Dependentes D ON E.Id = D.IdEmpregado
GROUP BY E.Id;

-- Criar um usuário gerente
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'SenhaSegura';

-- Conceder acesso às informações de employees e departments
GRANT SELECT ON Company.Empregados TO 'gerente'@'localhost';
GRANT SELECT ON Company.Departamentos TO 'gerente'@'localhost';

-- Conceder acesso às VIEWs específicas
GRANT SELECT ON Company.vw_departamentos_gerentes TO 'gerente'@'localhost';
GRANT SELECT ON Company.vw_empregados_por_departamento_localidade TO 'gerente'@'localhost';

-- Aplicar os privilégios
FLUSH PRIVILEGES;

-- Parte 2: Criando gatilhos para cenário de e-commerce 
-- Criação da tabela
CREATE TABLE EmpregadosRemovidos (
    Id INT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataRemocao DATETIME
);

-- Trigger BEFORE DELETE
DELIMITER \\
CREATE TRIGGER before_delete_empregado
BEFORE DELETE ON Empregados
FOR EACH ROW
BEGIN
    INSERT INTO EmpregadosRemovidos (Id, Nome, Email, DataRemocao)
    VALUES (OLD.Id, OLD.Nome, OLD.Email, NOW());
END \\
DELIMITER ;

-- Criação da tabela
CREATE TABLE Empregados (
    Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Salario DECIMAL(10,2)
);

-- Trigger BEFORE UPDATE
-- Toda vez que o salário de um colaborador for atualizado ou houver uma inserção de novos colaboradores é necessário fazer a validação de salário para garantir que ele não seja menor que um valor mínimo, por exemplo R$1.500,00.
DELIMITER \\
CREATE TRIGGER before_update_salario
BEFORE UPDATE ON Empregados
FOR EACH ROW
BEGIN
    IF NEW.Salario < 1500 THEN
        SET NEW.Salario = 1500;
    END IF;
END \\
DELIMITER ;