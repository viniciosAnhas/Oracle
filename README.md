<div align="center">

  <div>
    <img height = "150" width = "150" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/oracle/oracle-original.svg" />
  </div>
          
</div>

<h1>Global Database Name (GDN)</h1>

<p style="text-align: justify;">O Global Database Name é o nome completo do banco de dados no Oracle. Ele segue o formato:</p>

```bash
<database_name>.<domain>
```

<p style="text-align: justify;">Se o nome do banco for MEUBANCO e o domínio for EXEMPLO.COM, então o GDN será:</p>

```bash
MEUBANCO.EXEMPLO.COM
```

<p style="text-align: justify;">Esse nome é importante porque permite identificar o banco de forma única dentro de uma rede corporativa.</p>

<h1>Oracle System Identifier (SID)</h1>

<p style="text-align: justify;">O SID (System Identifier) é um identificador único para a instância do banco de dados rodando no servidor.</p>

<p style="text-align: justify;">Se você tiver um banco chamado MEUBANCO, o SID pode ser simplesmente:</p>

```bash
MEUBANCO
```

<ul>

  <li style="text-align: justify;">O SID é usado, por exemplo, ao configurar um cliente Oracle para se conectar ao banco.</li>

  <li style="text-align: justify;">Ele não inclui o domínio, diferente do Global Database Name.</li>

</ul>

<h1>Pluggable Database Name (PDB Name)</h1>

<p style="text-align: justify;">O Pluggable Database Name refere-se ao nome de um banco de dados plugável dentro de um Container Database (CDB).</p>

<p style="text-align: justify;">Desde a versão Oracle 12c, o banco trabalha com a arquitetura Multitenant, onde um Container Database (CDB) pode conter vários Pluggable Databases (PDBs).</p>

<ul>

  <li style="text-align: justify;">Container Database (CDB): <b>CDB1</b></li>

  <li style="text-align: justify;">Pluggable Database (PDB): <b>PDB1, PDB2, PDB3</b></li>

</ul>

<p style="text-align: justify;">Ou seja, um único CDB pode conter vários bancos menores chamados PDBs, que funcionam como bancos independentes dentro do container.</p>

<table border="1">
    <tr>
        <th>Conceito</th>
        <th>Descrição</th>
        <th>Exemplo</th>
    </tr>
    <tr>
        <td>Global Database Name (GDN)</td>
        <td>Nome completo do banco na rede</td>
        <td>MEUBANCO.EXEMPLO.COM</td>
    </tr>
    <tr>
        <td>System Identifier (SID)</td>
        <td>Nome da instância do banco</td>
        <td>MEUBANCO</td>
    </tr>
    <tr>
        <td>Pluggable Database Name (PDB Name)</td>
        <td>Nome de um banco dentro de um CDB</td>
        <td>PDB1</td>
    </tr>
</table>

<h1>SGA – System Global Area</h1>

<p style="text-align: justify;">A SGA é uma área de memória compartilhada, alocada quando a instância do Oracle é iniciada.
Ela é acessada por todos os processos do Oracle, e guarda informações essenciais para o funcionamento do banco.</p>

<p style="text-align: justify;">O que é armazenado na SGA?</p>

<p style="text-align: justify;">Alguns dos principais componentes:</p>

<ul>

  <li style="text-align: justify;">Database Buffer Cache: guarda blocos de dados lidos do disco (evita ir ao disco toda hora).</li>

  <li style="text-align: justify;">Shared Pool: armazena SQLs já analisados e objetos de dicionário de dados.></li>

  <li style="text-align: justify;">Redo Log Buffer: guarda informações de transações ainda não gravadas nos redo logs.></li>

  <li style="text-align: justify;">Large Pool, Java Pool, Streams Pool (usados em situações específicas).></li>

</ul>

<p style="text-align: justify;">Resumo:</p>

<ul>

  <li style="text-align: justify;">Memória compartilhada</li>

  <li style="text-align: justify;">Usada por todos os processos</li>

  <li style="text-align: justify;">Guarda dados em cache, instruções SQL, metadados e informações de transação</li>

</ul>

<h1>PGA – Program Global Area</h1>

<p style="text-align: justify;">A PGA é uma área de memória privada, alocada individualmente para cada processo servidor ou background.</p>

<p style="text-align: justify;">Ela não é compartilhada entre processos.</p>

<p style="text-align: justify;">O que é armazenado na PGA?</p>

<ul>

  <li style="text-align: justify;">Dados temporários de sessões específicas (como ordenações, joins, cursores).</li>

  <li style="text-align: justify;">Informações sobre variáveis bind e contexto de execução.</li>

  <li style="text-align: justify;">Guarda dados em cache, instruções SQL, metadados e informações de transação</li>

  <li style="text-align: justify;">Área de trabalho para operações como sorts, hash joins, etc.</li>

</ul>

<p style="text-align: justify;">Resumo:</p>

<ul>

  <li style="text-align: justify;">Memória privada</li>

  <li style="text-align: justify;">Usada por cada processo separadamente</li>

  <li style="text-align: justify;">Crucial para performance de operações de SQL</li>

</ul>

<p style="text-align: justify;">Comparação Rápida</p>

<table border="1">
    <tr>
        <th>Característica</th>
        <th>SGA</th>
        <th>PGA</th>
    </tr>
    <tr>
        <td>Compartilhada?</td>
        <td>Sim</td>
        <td>Não</td>
    </tr>
    <tr>
        <td>Usada por</td>
        <td>Todos os processos</td>
        <td>Cada processo individual</td>
    </tr>
    <tr>
        <td>Armazena</td>
        <td>Cache de dados, SQL, metadados, redo log</td>
        <td>Dados temporários de uma sessão</td>
    </tr>
    <tr>
        <td>Alocada quando</td>
        <td>A instância é iniciada</td>
        <td>O processo é iniciado</td>
    </tr>
</table>

<h1>SYS – Usuário raiz do banco</h1>

<ul>

  <li style="text-align: justify;">É o usuário mais poderoso do Oracle.</li>

  <li style="text-align: justify;">Ele possui todos os privilégios possíveis e é o dono das tabelas internas do dicionário de dados (ex: USER$, OBJ$, etc).</li>

  <li style="text-align: justify;">É usado principalmente para tarefas críticas de administração (startup, shutdown, recovery, etc).</li>

</ul>

<p style="text-align: justify;">Observações:</p>

<ul>

  <li style="text-align: justify;">Não é recomendado usar o SYS no dia a dia, a menos que você esteja fazendo algo realmente essencial.</li>

  <li style="text-align: justify;">Quando se conecta com SYS, você normalmente faz isso com a cláusula AS SYSDBA.</li>

</ul>

<p style="text-align: justify;">Exemplo de conexão:</p>

```bash
sqlplus sys/sua_senha@SEUBANCO as sysdba
```

<h1>SYSTEM – Administrador padrão</h1>

<ul>

  <li style="text-align: justify;">Também é um usuário com altos privilégios, mas não tão poderoso quanto o SYS.</li>

  <li style="text-align: justify;">Usado para tarefas administrativas gerais, como:</li>

  <ul>

  <li style="text-align: justify;">Criar outros usuários</li>

  <li style="text-align: justify;">Conceder privilégios</li>

  <li style="text-align: justify;">Gerenciar tablespaces, etc.</li>
  
  </ul>

  <li style="text-align: justify;">Ele não possui as tabelas internas do Oracle, como o SYS.</li>

</ul>

<p style="text-align: justify;">Ideal para:</p>

<ul>

  <li style="text-align: justify;">Gerenciar o banco sem mexer em estruturas internas do Oracle.</li>

  <li style="text-align: justify;">Criar usuários, roles, alterar senhas.</li>

</ul>

<h1>PDBADMIN – Administrador do Pluggable Database (PDB)</h1>

<ul>

  <li style="text-align: justify;">Esse usuário existe dentro de cada PDB.</li>

  <li style="text-align: justify;">Tem privilégios administrativos somente dentro daquele PDB específico.</li>

  <li style="text-align: justify;">Serve para administrar a parte "isolada" do banco, dentro da arquitetura multitenant (CDB/PDB).</li>

</ul>

<p style="text-align: justify;">Exemplo de uso:</p>

<p style="text-align: justify;">Imagine que você tem o CDB CDB1 e um PDB chamado PDB_FINANCEIRO:</p>

<ul>

  <li style="text-align: justify;">O usuário PDBADMIN pode criar tabelas, usuários e fazer tudo dentro do PDB_FINANCEIRO, mas não tem acesso ao CDB.</li>

</ul>

<p style="text-align: justify;">Resumo</p>

<table border="1">
    <tr>
        <th>Usuário</th>
        <th>Papel</th>
        <th>Escopo</th>
        <th>Pode fazer o quê?</th>
    </tr>
    <tr>
        <td>SYS</td>
        <td>Superadministrador, dono do dicionário</td>
        <td>CDB (e PDB se acessar)</td>
        <td>Tudo, inclusive estrutura interna</td>
    </tr>
    <tr>
        <td>SYSTEM</td>
        <td>Administrador geral</td>
        <td>CDB e PDB</td>
        <td>Tarefas administrativas normais</td>
    </tr>
    <tr>
        <td>PDBADMIN</td>
        <td>Admin local do PDB</td>
        <td>Apenas no PDB</td>
        <td>Gerencia o PDB isoladamente</td>
    </tr>
</table>

<h1>Oracle Listener</h1>

<p style="text-align: justify;">O comando lsnrctl é fundamental na administração de rede do Oracle Database. Ele é usado para gerenciar o Oracle Listener, que é o processo responsável por aceitar conexões remotas ao banco de dados.</p>

<p style="text-align: justify;">O que é o Oracle Listener?</p>

<p style="text-align: justify;">O listener (gerenciado pelo utilitário lsnrctl) é como um "porteiro" do Oracle:</p>

<ul>

  <li style="text-align: justify;">Ele escuta requisições de conexão (normalmente na porta 1521).</li>

  <li style="text-align: justify;">Quando alguém (como o SQL Developer ou outro cliente) tenta se conectar ao banco, o listener encaminha essa solicitação para a instância Oracle apropriada.</li>

</ul>

<p style="text-align: justify;">Sem o listener rodando, nenhuma conexão externa ao banco pode ser feita (só conexões locais).</p>

<p style="text-align: justify;">O que é o comando lsnrctl?</p>

<p style="text-align: justify;">É o utilitário de linha de comando para controlar e monitorar o Listener.</p>

```bash
lsnrctl start     -- Inicia o listener
lsnrctl stop      -- Para o listener
lsnrctl status    -- Mostra o status atual
lsnrctl reload    -- Recarrega as configurações sem reiniciar
lsnrctl services  -- Mostra os serviços registrados
```

<p style="text-align: justify;">Exemplo real:</p>

```bash
$ lsnrctl status

LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 18-APR-2025

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                      LISTENER
Version                    TNSLSNR for Linux: Version 19.0.0.0.0
Start Date                18-APR-2025 08:10:00
Uptime                    0 days 0 hr. 25 min. 13 sec
Services Summary...
  Service "pdb1" has 1 instance(s).
    Instance "pdb1", status READY, has 1 handler(s) for this service...
```

<p style="text-align: justify;">Onde ficam as configurações do Listener?</p>

```bash
$ORACLE_HOME/network/admin/listener.ora
```

<p style="text-align: justify;">É ali que ficam informações como:</p>

<ul>

  <li style="text-align: justify;">Porta usada</li>

  <li style="text-align: justify;">Nome do listener</li>

  <li style="text-align: justify;">Protocolos</li>

  <li style="text-align: justify;">Endereços IP que ele escuta</li>

</ul>

<p style="text-align: justify;">Resumo</p>

<table border="1">
    <tr>
        <th>Comando</th>
        <th>Função</th>
    </tr>
    <tr>
        <td>lsnrctl start</td>
        <td>Inicia o listener</td>
    </tr>
    <tr>
        <td>lsnrctl stop</td>
        <td>Para o listener</td>
    </tr>
    <tr>
        <td>lsnrctl status</td>
        <td>Mostra status e serviços ativos</td>
    </tr>
    <tr>
        <td>lsnrctl reload</td>
        <td>Recarrega a configuração</td>
    </tr>
    <tr>
        <td>lsnrctl services</td>
        <td>Mostra os serviços registrados</td>
    </tr>
</table>

<h1>SQLPLUS</h1>

<p style="text-align: justify;">O sqlplus é um dos principais utilitários de linha de comando do Oracle Database — essencial para administradores e desenvolvedores Oracle.</p>

<p style="text-align: justify;">O que é o sqlplus?</p>

<p style="text-align: justify;">É uma interface de linha de comando usada para:</p>

<ul>

  <li style="text-align: justify;">Executar comandos SQL e PL/SQL</li>

  <li style="text-align: justify;">Executar scripts</li>

  <li style="text-align: justify;">Administrar a instância Oracle (iniciar, parar, criar usuários, etc.)</li>

  <li style="text-align: justify;">Consultar dados e objetos do banco</li>

  <li style="text-align: justify;">Realizar tarefas de backup, recovery, monitoramento, etc.</li>

</ul>

<p style="text-align: justify;">Como se conecta?</p>

<p style="text-align: justify;">Você pode usar sqlplus de duas formas principais:</p>

<p style="text-align: justify;">Conexão com usuário/senha:</p>

```bash
sqlplus usuario/senha@nome_da_conexao
```

<p style="text-align: justify;">Conexão como SYSDBA:</p>

```bash
sqlplus / as sysdba
```

<p style="text-align: justify;">Ou:</p>

```bash
sqlplus sys/senha@nomedb as sysdba
```

<p style="text-align: justify;">Exemplos de uso dentro do sqlplus:</p>

```bash
-- Ver tabelas do usuário
SELECT table_name FROM user_tables;

-- Criar usuário
CREATE USER teste IDENTIFIED BY senha;

-- Conceder permissão
GRANT CONNECT, RESOURCE TO teste;

-- Sair
EXIT;
```

<p style="text-align: justify;">Exemplo completo:</p>

```bash
$ sqlplus system@orcl

Enter password: *****

SQL*Plus: Release 19.0.0.0.0 - Production

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production

SQL> SELECT name FROM v$database;

NAME
---------
ORCL
```

<p style="text-align: justify;">Também é usado para rodar scripts .sql:</p>

<p style="text-align: justify;">Você pode criar um script chamado script.sql com vários comandos SQL e executá-lo assim:</p>

```bash
sqlplus usuario/senha@banco @script.sql
```

<p style="text-align: justify;">Resumo</p>

<table border="1">
    <tr>
        <th>Item</th>
        <th>Detalhe</th>
    </tr>
    <tr>
        <td>O que é?</td>
        <td>Cliente de linha de comando do Oracle</td>
    </tr>
    <tr>
        <td>Para que serve?</td>
        <td>Executar SQL/PLSQL, scripts, comandos administrativos</td>
    </tr>
    <tr>
        <td>Interface</td>
        <td>Linha de comando (CLI)</td>
    </tr>
    <tr>
        <td>Conexão</td>
        <td>Direta com usuário/senha ou via as sysdba</td>
    </tr>
</table>