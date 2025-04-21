-- Exibe o nome do container atual (CDB$ROOT ou uma PDB)
SHOW CON_NAME;

-- Altera a sessao para trabalhar dentro da PDB chamada ORCLPDB
ALTER SESSION SET CONTAINER=ORCLPDB;

-- Confirma novamente em qual container estamos
SHOW CON_NAME;

-- Abre a PDB ORCLPDB (necessario para uso-la caso esteja em modo MOUNT)
ALTER PLUGGABLE DATABASE ORCLPDB OPEN;

-- Criacao do usuario FINANCE com a senha 'fin123'
CREATE USER FINANCE IDENTIFIED BY fin123;

-- Concede todos os privilegios ao usuario FINANCE (cuidado em producao)
GRANT ALL PRIVILEGES TO FINANCE;

-- Consulta o status do usuario FINANCE
SELECT 
  USERNAME, 
  ACCOUNT_STATUS
FROM DBA_USERS
WHERE USERNAME = 'FINANCE';

-- Criacao do usuario ANHAS com a senha 'a123'
CREATE USER "ANHAS" IDENTIFIED BY "a123";

-- Concede o privilegio de conexao
GRANT "CONNECT" TO "ANHAS";

-- Define o tablespace padrao e tempororio para o usuurio ANHAS
ALTER USER "ANHAS" 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
QUOTA UNLIMITED ON "USERS";

-- Permite ao usuario ANHAS criar tabelas
GRANT CREATE TABLE TO "ANHAS";

-- Cria a tabela CLIENTE (mas aqui esta fora de um contexto de usuario)
-- Essa linha **deve ser executada conectado como FINANCE**
CREATE TABLE CLIENTE (
  MATRICULA NUMBER,
  NOME VARCHAR2(255)
);

-- Consulta todos os dados da tabela CLIENTE (deve ser feito por FINANCE ou alguem com privilegio)
SELECT * FROM CLIENTE;

-- Concede permissoes especificas ao usuario ANHAS sobre a tabela CLIENTE do schema FINANCE
GRANT SELECT, INSERT, ALTER, UPDATE, DELETE 
ON FINANCE.CLIENTE TO ANHAS;

-- Consulta a tabela do schema FINANCE a partir de outro usuario (ex: ANHAS)
SELECT * FROM FINANCE.CLIENTE;

-- Insere um registro na tabela CLIENTE no schema FINANCE
INSERT INTO FINANCE.CLIENTE (MATRICULA, NOME)
VALUES (1, 'TESTE');

-- Consulta final para verificar o registro inserido
SELECT * FROM FINANCE.CLIENTE;