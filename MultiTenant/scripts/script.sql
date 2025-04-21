-- Verifica informacoes sobre os containers do banco
SELECT con_id, dbid, name 
FROM V$CONTAINERS 
WHERE CON_ID = 1;

-- Mostra o nome do container atual
SHOW CON_NAME;

-- Lista os pluggable databases (PDBs) existentes
SELECT NAME FROM V$PDBS;

-- Criacao de usuario COMUM (common user) visivel em todos os PDBs
CREATE USER C##COMMONUSER IDENTIFIED BY "commonuser" CONTAINER=ALL;

-- Concede privilegios ao common user (em todos os containers)
GRANT CONNECT TO C##COMMONUSER CONTAINER=ALL;
GRANT CREATE TABLE TO C##COMMONUSER CONTAINER=CURRENT;

-- Verifica o usuario conectado
SHOW USER;

-- Conecta com o common user criado
CONN C##COMMONUSER/commonuser;

-- Confirma o usuario e container atual
SHOW USER;
SHOW CON_NAME;

-- Cria uma tabela no container atual
CREATE TABLE T1(A NUMBER);

-- Muda o container ativo para o PDB chamado ORCLPDB
ALTER SESSION SET CONTAINER=ORCLPDB;

-- Mostra o nome do container atual
SHOW CON_NAME;

-- Verifica o modo de abertura do banco e status da instancia
SELECT OPEN_MODE FROM V$DATABASE;
SELECT STATUS FROM V$INSTANCE;

-- Abre o PDB ORCLPDB (caso esteja fechado)
ALTER PLUGGABLE DATABASE ORCLPDB OPEN;

-- Criacao de usuario LOCAL (visivel apenas no PDB atual)
CREATE USER vinicios IDENTIFIED BY "teste123" CONTAINER=CURRENT;
GRANT CONNECT TO vinicios CONTAINER=CURRENT;

-- Retorna para o container raiz (CDB$ROOT)
ALTER SESSION SET CONTAINER=CDB$ROOT;

-- Lista novamente os PDBs disponiveis
SELECT NAME FROM V$PDBS;
SHOW CON_NAME;

-- Define o caminho padrao para criacao de datafiles (util para criar novos PDBs)
ALTER SYSTEM SET db_create_file_dest='C:\app\newpdbs' SCOPE=both;

-- Verifica a configuracao de caminhos automaticos de criacao de arquivos
SHOW PARAMETER CREATE;

-- Criacao de novo PDB (pluggable database) com usuario administrador
CREATE PLUGGABLE DATABASE pdb1 
  ADMIN USER admin IDENTIFIED BY 123 
  STORAGE (MAXSIZE 2G);

-- Verifica a criacao do novo PDB
SELECT NAME FROM V$PDBS;
SELECT * FROM V$PDBS;

-- Criacao de novo PDB (PDB2) a partir de um existente (PDB1)
CREATE PLUGGABLE DATABASE PDB2 FROM PDB1;

-- Remove o PDB2 completamente, incluindo seus datafiles
DROP PLUGGABLE DATABASE PDB2 INCLUDING DATAFILES;

-- Confirma quais PDBs ainda existem
SELECT NAME FROM V$PDBS;
SHOW PDBS;

-- Abre o PDB1
ALTER PLUGGABLE DATABASE PDB1 OPEN;

-- Alterna para o PDB1
ALTER SESSION SET CONTAINER=PDB1;
SHOW CON_NAME;

-- Cria usuario LOCAL no PDB1
CREATE USER usuario IDENTIFIED BY senha;
GRANT CONNECT, RESOURCE TO usuario;

-- Cria uma nova tabela no PDB1
CREATE TABLE minha_tabela(
    COLUNA1 VARCHAR2(50),
    COLUNA2 NUMBER
);

-- Insere dados na nova tabela
INSERT INTO minha_tabela (COLUNA1, COLUNA2)
VALUES ('VALOR1', 123);

-- Visualiza os dados inseridos
SELECT * FROM minha_tabela;

-- Retorna ao CDB$ROOT
ALTER SESSION SET CONTAINER=CDB$ROOT;

-- Fecha o PDB1
ALTER PLUGGABLE DATABASE PDB1 CLOSE;

-- Remove o PDB1, incluindo seus arquivos f�sicos
DROP PLUGGABLE DATABASE PDB1 INCLUDING DATAFILES;