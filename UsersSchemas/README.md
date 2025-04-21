<div align="center">

  <div>
    <img height = "150" width = "150" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/oracle/oracle-original.svg" />
  </div>
          
</div>

<h1>Usuarios e Schemas, conceitos iniciais</h1>

<p style="text-align: justify;">No Oracle Database, os conceitos de usuário e schema são muito próximos, mas não são exatamente a mesma coisa. Vamos ver o que cada um representa e quais são as principais diferenças.</p>

<h3>O que é um Usuário?</h3>

<p style="text-align: justify;">Um usuário no Oracle é uma conta criada no banco de dados que pode se conectar e interagir com ele.</p>

<p style="text-align: justify;">Características:</p>

<ul>

  <li style="text-align: justify;">Precisa de senha para se autenticar.</li>

  <li style="text-align: justify;">Pode ser concedido com privilégios (ex: CREATE SESSION, CREATE TABLE, etc).</li>

  <li style="text-align: justify;">Pode possuir objetos como tabelas, views, procedures, etc.</li>

</ul>

```bash
CREATE USER dev IDENTIFIED BY dev123;
GRANT CONNECT TO dev;
```

<h3>O que é um Schema?</h3>

<p style="text-align: justify;">Um schema é o conjunto de objetos (tabelas, views, índices, procedures, etc) que pertencem a um usuário.</p>

<p style="text-align: justify;">Características:</p>

<ul>

  <li style="text-align: justify;">É automaticamente criado com o usuário.</li>

  <li style="text-align: justify;">Tem o mesmo nome do usuário.</li>

  <li style="text-align: justify;">Você não cria schemas diretamente com comandos (como faz em outros SGBDs como PostgreSQL ou MySQL).</li>

  <li style="text-align: justify;">Você acessa objetos no schema com a notação usuario.objeto</li>

</ul>

<p style="text-align: justify;">Diferença fundamental:</p>

<table border="1">
    <tr>
        <th>Conceito</th>
        <th>Descrição</th>
    </tr>
    <tr>
        <td>Usuário</td>
        <td>É a conta que se autentica e interage com o banco.</td>
    </tr>
    <tr>
        <td>Schema</td>
        <td>É o "espaço de objetos" associado ao usuário.</td>
    </tr>
    <tr>
        <td>Ligação</td>
        <td>Cada usuário possui exatamente 1 schema, com o mesmo nome do usuário.</td>
    </tr>
</table>

<p style="text-align: justify;">Exemplo prático:</p>

```bash
-- Criação do usuário (e automaticamente do schema dele)
CREATE USER BIBLIOTECA IDENTIFIED BY "teste123";
GRANT CONNECT, RESOURCE TO BIBLIOTECA;

-- Conectando com o usuário
CONN BIBLIOTECA/teste123

-- Criando uma tabela: ela ficará no schema 'BIBLIOTECA'
CREATE TABLE clientes (
  id NUMBER,
  nome VARCHAR2(100)
);
```

<p style="text-align: justify;">Agora, um DBA conectado como SYS ou outro usuário pode acessar essa tabela assim:</p>

```bash
SELECT * FROM BIBLIOTECA.clientes;
```

<p style="text-align: justify;">Você não pode criar múltiplos schemas com o mesmo nome, pois eles estão amarrados diretamente aos nomes dos usuários.</p>