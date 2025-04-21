<div align="center">

  <div>
    <img height = "150" width = "150" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/oracle/oracle-original.svg" />
  </div>
          
</div>

<h1>MultiTenant</h1>

<p style="text-align: justify;">O conceito de Multitenant (introduzido no Oracle 12c) é um modelo moderno de arquitetura de banco de dados que traz mais flexibilidade, isolamento e facilidade de administração. Ele gira em torno de dois conceitos principais:</p>

<h3>CDB (Container Database)</h3>

<p style="text-align: justify;">É o banco de dados raiz, o "container" principal.</p>

<ul>

  <li style="text-align: justify;">Contém os metadados do Oracle, a estrutura de instância, usuários como SYS e SYSTEM, e o banco de dados semente (PDB$SEED).</li>

  <li style="text-align: justify;">Pode hospedar vários PDBs.</li>

  <li style="text-align: justify;">Possui apenas um conjunto de background processes e memória (SGA/PGA) compartilhados entre os PDBs.</li>

</ul>

<h3>PDB (Pluggable Database)</h3>

<p style="text-align: justify;">É um banco autônomo e independente, mas que vive dentro de um CDB.</p>

<ul>

  <li style="text-align: justify;">Contém seus próprios dados, objetos, usuários, tablespaces e configurações.</li>

  <li style="text-align: justify;">Pode ser plugado/desplugado de um CDB e movido para outro (facilitando migrações e upgrades).</li>

  <li style="text-align: justify;">Cada PDB é como um banco separado — inclusive com um PDBADMIN específico para administração local.</li>

</ul>

<p style="text-align: justify;">Analogia simples:</p>

<p style="text-align: justify;">Imagina um prédio empresarial:</p>

<ul>

  <li style="text-align: justify;">O CDB é o prédio: estrutura, recepção, segurança, energia, elevador.</li>

  <li style="text-align: justify;">Cada PDB é uma sala/empresa: tem seu próprio time, arquivos, móveis, dados... mas compartilha o prédio.</li>

  <li style="text-align: justify;">A sala "PDB$SEED" é uma sala modelo, usada para clonar novas salas (PDBs).</li>

</ul>

<p style="text-align: justify;">Vantagens da arquitetura Multitenant:</p>

<table border="1">
    <tr>
        <th>Benefício</th>
        <th>Descrição</th>
    </tr>
    <tr>
        <td>Isolamento</td>
        <td>Cada PDB é separado: um erro em um não afeta os outros.</td>
    </tr>
    <tr>
        <td>Consolidação</td>
        <td>Vários bancos em um só CDB, economizando recursos.</td>
    </tr>
    <tr>
        <td>Facilidade de migração</td>
        <td>PDBs podem ser movidos entre servidores facilmente.</td>
    </tr>
    <tr>
        <td>Backup e restore por PDB</td>
        <td>Você pode fazer backup e restore de um único PDB.</td>
    </tr>
    <tr>
        <td>Gerenciamento centralizado</td>
        <td>Um único Oracle instance para muitos bancos.</td>
    </tr>
</table>

<p style="text-align: justify;">Comandos práticos:</p>

<p style="text-align: justify;">Ver os PDBs:</p>

```bash
SELECT PDB_NAME, STATUS FROM DBA_PDBS;
```

<p style="text-align: justify;">Entrar em um PDB:</p>

```bash
ALTER SESSION SET CONTAINER=pdb_financeiro;
```

<p style="text-align: justify;">Criar um novo PDB (a partir do PDB$SEED):</p>

```bash
CREATE PLUGGABLE DATABASE novo_pdb ADMIN USER pdbadmin IDENTIFIED BY senha FILE_NAME_CONVERT=('/pdbseed/', '/novo_pdb/');
```

<p style="text-align: justify;">Resumo:</p>

<table border="1">
    <tr>
        <th>Termo</th>
        <th>Significado</th>
        <th>Contém o quê?</th>
    </tr>
    <tr>
        <td>CDB</td>
        <td>Container Database</td>
        <td>Estrutura principal e metadados</td>
    </tr>
    <tr>
        <td>PDB</td>
        <td>Pluggable Database</td>
        <td>Dados de um banco específico</td>
    </tr>
    <tr>
        <td>PDB$SEED</td>
        <td>Modelo de PDB</td>
        <td>Usado como base para criar novos PDBs</td>
    </tr>
</table>

<h1>Usuários LOCAL e Usuários COMMON</h1>

<p style="text-align: justify;">Essa distinção entre usuários LOCAL e usuários COMMON é essencial quando você trabalha com a arquitetura Multitenant (CDB e PDBs) no Oracle Database.</p>

<h3>O que são usuários COMMON?</h3>

<p style="text-align: justify;">São usuários que existem em todo o CDB e em todos os PDBs ao mesmo tempo.</p>

<p style="text-align: justify;">Características:</p>

<ul>

  <li style="text-align: justify;">Criados no CDB raiz (CDB$ROOT).</li>

  <li style="text-align: justify;">Nome sempre começa com "C##" (ex: C##DBA, C##APPUSER).</li>

  <li style="text-align: justify;">Mesmo nome, mesma senha e mesmos privilégios em todos os PDBs.</li>

  <li style="text-align: justify;">São usados principalmente por DBAs ou aplicações que precisam acessar múltiplos PDBs.</li>

</ul>

<p style="text-align: justify;">Exemplo:</p>

```bash
-- Conectado ao CDB
CREATE USER C##SUPORTE IDENTIFIED BY senha;
GRANT CONNECT, DBA TO C##SUPORTE;
```

<p style="text-align: justify;">Você pode verificar os usuários e seu tipo com a coluna COMMON:</p>

```bash
SELECT username, common FROM cdb_users;
```

<p style="text-align: justify;">Resultado:</p>

```bash
USERNAME      COMMON
------------  ------
C##SUPORTE    YES
APPUSER       NO
```

<h3>O que são usuários LOCAL?</h3>

<p style="text-align: justify;">São usuários específicos de um único PDB.</p>

<p style="text-align: justify;">Características:</p>

<ul>

  <li style="text-align: justify;">Criados dentro de um PDB.</li>

  <li style="text-align: justify;">Nome não precisa começar com "C##".</li>

  <li style="text-align: justify;">Só existem e funcionam dentro do PDB em que foram criados.</li>

  <li style="text-align: justify;">São ideais para usuários de aplicação, desenvolvedores, serviços específicos, etc.</li>

</ul>

<p style="text-align: justify;">Exemplo:</p>

```bash
-- Primeiro troca para o PDB
ALTER SESSION SET CONTAINER=pdb_financeiro;

-- Agora cria o usuário
CREATE USER analista IDENTIFIED BY senha;
GRANT CONNECT, RESOURCE TO analista;
```

<p style="text-align: justify;">Comparativo rápido:</p>

<table border="1">
    <tr>
        <th>Característica</th>
        <th>Usuário COMMON</th>
        <th>Usuário LOCAL</th>
    </tr>
    <tr>
        <td>Prefixo</td>
        <td>Deve ter C##</td>
        <td>Não precisa</td>
    </tr>
    <tr>
        <td>Visível em todos PDBs</td>
        <td>Sim</td>
        <td>Não</td>
    </tr>
    <tr>
        <td>Criado onde?</td>
        <td>No CDB$ROOT</td>
        <td>Dentro de um PDB</td>
    </tr>
    <tr>
        <td>Ideal para</td>
        <td>DBAs, aplicações globais</td>
        <td>Aplicações específicas</td>
    </tr>
    <tr>
        <td>Compartilha senha</td>
        <td>Sim (mesma senha em todos PDBs)</td>
        <td>Não</td>
    </tr>
</table>