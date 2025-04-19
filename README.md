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